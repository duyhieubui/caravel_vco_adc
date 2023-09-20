//                              -*- Mode: Verilog -*-
// Filename        : vco_adc.v
// Description     : VCO-Based ADC
// Author          : Duy-Hieu Bui <hieubd@vnu.edu.vn>
// Created On      : Sat May 15 00:37:39 2021
// Last Modified By: 
// Last Modified On: Sat May 15 00:37:39 2021
// Update Count    : 0
// Status          : done
//`include "../../rtl/phase_readout.v"
//`include "../../rtl/phase_sum.v"
//`include "../../rtl/sinc_sync.v"

module vco_adc
  (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 3.3V supply
    inout vssd1,	// User area 1 digital ground
`endif
   input 	 clk,
   input 	 rst,
   // input 	 analog_in,
   input [9:0] 	 oversample_in,
   input 	 enable_in,
   input [10:0]  phase_in,
   output [31:0] data_out,
   output 	 data_valid_out);

   wire [10:0] 	 sum_in;
   wire [3:0] 	 sum_out;
   wire 	 data_valid;
   reg [2:0] 	 startup_cnt_reg;
   reg 		 output_en_reg;
   reg [9:0] 	 oversample_reg;
   reg 		 enable_reg;

   // vco #(.PHASE_WIDTH(11)) dut 
   //   (.clk(clk),
   //    .rst(rst),
   //    // .enable_in(1'b1),
   //    .analog_in(analog_in),
   //    .data_o(phase_out));
   always @(posedge clk) begin
      if (rst == 1'b1) begin
	 enable_reg <= 0;
	 oversample_reg <= 10'hff;
      end
      else begin
	 enable_reg <= enable_in;
	 oversample_reg <= oversample_in;
      end
   end

   always @(posedge clk) begin
      if (rst == 1'b1) begin
	 startup_cnt_reg <= 3'h0;
	 output_en_reg <= 1'b0;
      end
      else begin
	 if (enable_reg == 1'b1
	     && startup_cnt_reg != 3'h4) begin
	    if (data_valid == 1'b1)
	      startup_cnt_reg <= startup_cnt_reg + 3'h1;
	    output_en_reg <= 1'b0;
	 end
	 else if (enable_reg == 1'b1
		  && startup_cnt_reg == 3'h4) begin
	    output_en_reg <= 1'b1;
	 end
	 else begin
	    startup_cnt_reg <= 2'h0;
	    output_en_reg <= 1'b0;
	 end
      end
   end

   phase_readout
     #(.PHASE_WIDTH(11))
   pr (.clk(clk),
       .data_i(phase_in),
       .data_o(sum_in));

   phase_sum
     #(.PHASE_WIDTH(11),
       .SUM_WIDTH(4))
   ps (.phase_i(sum_in),
       .sum_o(sum_out));

   sinc_sync #(.DATA_WIDTH(32))
   scs (.clk(clk),
	.rst(rst),
	.data_in(sum_out),
	.enable_in(enable_reg),
	.oversample_in(oversample_reg),
	.data_valid_out(data_valid),
	.data_out(data_out));
   assign data_valid_out = data_valid & output_en_reg;

endmodule // vco_adc
