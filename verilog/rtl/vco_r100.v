/// sta-blackbox
// behavior model of the vco
module vco_r100
  #(
    parameter PHASE_WIDTH = 11)
  (
`ifdef USE_POWER_PINS
    inout vccd2,	// User area 1 1.8V supply
    inout vssd2,	// User area 1 analog ground
`endif

   // input 		    clk,
   // input 		    rst,
   input 		    enb,
   inout 		    input_analog, 
   output [PHASE_WIDTH-1:0] p
   );
`ifdef FUNCTIONAL
   reg [14:0] 		     counter_reg;
   reg [PHASE_WIDTH-1:0]     vco_val[0:9999];
   reg 			     clk;
   reg 			     rst;
   
   initial begin
      $display("Load vco-phase");
      $readmemb("testcase_f10khz_oversample_512_fs25Mhz.txt", vco_val);
   end
   // set the frequency to 50MHz to match the system freq
   always #20 clk <= (clk === 1'b0);
   
   initial begin
      clk = 0;
   end

   initial begin
      rst <= 1'b1;
      #2000;
      rst <= 1'b0;
   end

   always @(posedge clk) begin
      if (rst == 1'b1) begin
	 counter_reg <= 15'h0;
      end else begin
	 if (enb == 1'b0) begin
	    if (counter_reg == 9999)
	      counter_reg <= 15'h0;
	    else
	      counter_reg <= counter_reg + 1;
	 end
      end
   end

   assign p = (enb == 1'b0) ? vco_val[counter_reg] : 0;
`endif
endmodule // vco

