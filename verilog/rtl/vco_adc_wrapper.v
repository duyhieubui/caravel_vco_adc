// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */
`define SKY130A_SRAM

`define REG_MPRJ_SLAVE       24'h300000 // VCO Based address
`define REG_MPRJ_VCO_CONFIG  8'h00
`define REG_MPRJ_FIFO_DATA   8'h04 // VCO read data from the fifo
`define REG_MPRJ_STATUS      8'h08 // VCO status
`define REG_MPRJ_NUM_DATA    8'h0C // VCO number of data writen into the fifo

module vco_adc_wrapper #(
    parameter BITS = 32,
    parameter MEM_ADDR_W = 9
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    // input  [127:0] la_data_in,
    // output [127:0] la_data_out,
    // input  [127:0] la_oenb,

    // IOs
    // input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    //output [2:0] irq,
  // memory interface
  output [3:0] mem_renb_o,
  output [MEM_ADDR_W-1:0] mem_raddr_o,
  output [3:0] mem_wenb_o,
  output [MEM_ADDR_W-1:0] mem_waddr_o,
  output [31:0] mem_data_o,
  input [31:0] mem0_data_i,
  input [31:0] mem1_data_i,
  input [31:0] mem2_data_i,
  input [31:0] mem3_data_i,
  output [3:0] wmask_o,

  output [9:0] oversample_o,
  output [2:0] sinc3_en_o,
  // output [1:0] adc_sel_o,
  input [2:0] adc_dvalid_i,
  input [31:0] adc0_dat_i,
  input [31:0] adc1_dat_i,
  input [31:0] adc2_dat_i,
  output [2:0] vco_enb_o
);

   // localparam MAX_SIZE=2048;
   // localparam MEMSIZE = 1024;

   reg [9:0] oversample_reg;
   reg [2:0] ena_reg;
   reg [1:0] adc_sel_reg;
   reg 	     wbs_ack_reg;

   reg [MEM_ADDR_W+1:0] wptr_reg;
   reg [MEM_ADDR_W+1:0] rptr_reg;

   reg [1:0] 	 status_reg;
   reg [31:0] 	 num_data_reg;
   reg [31:0] 	 data_o;
   reg [31:0] 	 mem_rdata_reg;
   reg [31:0] 	 mem_wdata_reg;
   reg [3:0] 	 mem_wenb_reg;
   reg [3:0] 	 mem_wenb;
   reg [3:0] 	 mem_renb;
   reg [3:0] 	 mem_renb_reg;
   reg 		 full_reg;
   reg 		 full_1d_reg;
   reg 		 empty_reg;
   reg 		 empty_1d_reg;
   reg 		 clear_wptr_reg;
   reg 		 clear_rptr_reg;
   reg 		 ren_1d_reg, ren_2d_reg, ren_3d_reg;
   reg [2:0] 	 vco_en_reg;
   reg [10:0] 	 num_samples_reg;
   reg 		 adc_dvalid_1d_reg, adc_dvalid_2d_reg;
   reg 		 io_en_reg;
   reg 		 first_read_reg;
   reg 		 first_read_1d_reg;

   reg [BITS-1:0] 	  adc_out;
   reg 			  adc_dvalid_tmp;
   wire 		  adc_dvalid;
   wire 		  valid_w;
   wire 		  wen_w;
   wire [BITS-1:0] 	  fifo_out_w;
   wire                   ren_w;
   reg 			  ren_reg;
   wire 		  rst;
   wire 		  slave_sel;
   wire 		  mem_write;
   wire 		  mem_read;
   // synthesis translate_off
   integer 		  rdat_file;
   integer 		  wdat_file;
   // synthesis translate_on
   assign oversample_o = oversample_reg;
   // assign adc_sel_o = adc_sel_reg;
   assign sinc3_en_o = ena_reg;
   // assign adc_out = adc_dat_i;
   
   assign rst = wb_rst_i;
   assign slave_sel = (wbs_adr_i[31:8] == `REG_MPRJ_SLAVE);
   
   assign valid_w = wbs_cyc_i & wbs_stb_i;
   assign wen_w   = wbs_we_i & (valid_w & wbs_sel_i[0]);
   assign ren_w   = ((wbs_we_i == 1'b0) & valid_w & ~wbs_ack_reg);   
   assign mem_write = adc_dvalid_1d_reg & (!full_1d_reg);
   assign mem_read = ren_w && (wbs_adr_i[7:0] == 8'h4);
   assign adc_dvalid = adc_dvalid_tmp;

   always @* begin
      case (adc_sel_reg)
   	2'b00: begin
   	   adc_dvalid_tmp <= adc_dvalid_i[0];
   	   adc_out <= adc0_dat_i;
   	end
   	2'b01: begin
   	   adc_dvalid_tmp <= adc_dvalid_i[1];
   	   adc_out <= adc1_dat_i;
   	end
   	2'b10: begin
   	   adc_dvalid_tmp <= adc_dvalid_i[2];
   	   adc_out <= adc2_dat_i;
   	end
   	default: begin 
   	   adc_dvalid_tmp <= adc_dvalid_i[0];
   	   adc_out <= adc0_dat_i;
   	end
      endcase // case (adc_sel)
   end

   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 status_reg <= 2'b0;
      end else begin
	 status_reg <= {full_reg, empty_reg};
     end
   end

   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 num_data_reg <= {32{1'b0}};
      end else begin
	 if (adc_dvalid)
	   num_data_reg <= num_data_reg + 1;
      end
   end
   
   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 wbs_ack_reg <= 1'b0;
      end else begin
	 wbs_ack_reg <= ((valid_w & (wbs_ack_o == 1'b0))
			 & (wbs_ack_reg == 1'b0));
      end
   end

   assign wbs_ack_o = (valid_w & (wbs_ack_reg == 1'b0)) ? wbs_we_i : wbs_ack_reg;
   
   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 oversample_reg		<= 10'b0;
	 ena_reg		<= 3'b0;
	 clear_wptr_reg		<= 1'b0;
	 clear_rptr_reg		<= 1'b0;
	 vco_en_reg		<= 3'h0;
	 num_samples_reg	<= 1024;
	 adc_sel_reg		<= 2'h0;
	 io_en_reg		<= 1'b0;
      end else begin
	 if (slave_sel && wen_w && wbs_adr_i[7:0] == 8'h00) begin
	    ena_reg		<= wbs_dat_i[31:29];
	    vco_en_reg		<= wbs_dat_i[28:26];
	    adc_sel_reg         <= wbs_dat_i[25:24];
	    clear_wptr_reg	<= wbs_dat_i[23];
	    clear_rptr_reg	<= wbs_dat_i[22];
	    io_en_reg <= wbs_dat_i[21];
	    num_samples_reg     <= wbs_dat_i[20:10];
	    oversample_reg	<= wbs_dat_i[9:0];
	 end
      end
   end

   always @* begin
      case (wbs_adr_i[7:0]) 
	`REG_MPRJ_VCO_CONFIG: data_o <= {ena_reg, vco_en_reg, adc_sel_reg,
					 clear_wptr_reg, clear_rptr_reg,
					 io_en_reg, num_samples_reg,
					 oversample_reg};
	`REG_MPRJ_FIFO_DATA:  data_o <= fifo_out_w;
	`REG_MPRJ_STATUS:     data_o <= {30'h0, status_reg};
	`REG_MPRJ_NUM_DATA:   data_o <= num_data_reg;
	default:              data_o <= 32'h0;
      endcase // case (wbs_adr_i[7:0])
      
   end // always @ *

   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 adc_dvalid_1d_reg <= 1'b0;
	 adc_dvalid_2d_reg <= 1'b0;
      end
      else begin
	 adc_dvalid_1d_reg <= adc_dvalid;
	 adc_dvalid_2d_reg <= adc_dvalid_1d_reg;
      end
   end
   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 first_read_reg <= 1'b0;
      end
      else if (!empty_reg && empty_1d_reg) begin
	 first_read_reg <= 1'b1;
      end
      else begin
	first_read_reg <= 1'b0;
      end
      first_read_1d_reg <= first_read_reg;
   end

   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 full_reg <= 1'b0;
	 full_1d_reg <= 1'b0;
	 empty_reg <= 1'b1;
	 empty_1d_reg <= 1'b1;
      end
      else begin
	 if ((wptr_reg == num_samples_reg)) full_reg <= 1'b1;
	 else full_reg <= 1'b0;

	 if (rptr_reg == wptr_reg || clear_rptr_reg) empty_reg <= 1'b1;
	 else empty_reg <= 1'b0;
	 
	 if (adc_dvalid_2d_reg) full_1d_reg <= full_reg;
	 else if (clear_wptr_reg) full_1d_reg <= 1'b0;

	 empty_1d_reg <= empty_reg;

      end
   end // always @ (posedge wb_clk_i)

   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 wptr_reg <= 0;
	 rptr_reg <= 0;
      end
      else begin

	 if (!full_reg && adc_dvalid_2d_reg) begin
	    wptr_reg <= wptr_reg + 1;
	 end else if (clear_wptr_reg) begin
	    wptr_reg <= 0;
	 end

	 if (!empty_reg && ren_reg && !first_read_1d_reg) begin
	    rptr_reg <= rptr_reg + 1;
	 end else if (clear_rptr_reg) begin
	    rptr_reg <= 0;
	 end

      end
   end

   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 ren_1d_reg <= 1'b0;
	 ren_2d_reg <= 1'b0;
	 ren_3d_reg <= 1'b0;
	 ren_reg <= 1'b0;
      end
      else begin
	 if (first_read_reg) begin
	    ren_reg <= 1'b1;
	 end
	 else begin
	    ren_reg <= mem_read;
	 end
	 ren_1d_reg <= ren_reg;
	 ren_2d_reg <= ren_1d_reg;
	 ren_3d_reg <= ren_2d_reg;
      end

      if (ren_3d_reg == 1'b1) begin
	 case(rptr_reg[MEM_ADDR_W+1:MEM_ADDR_W])
	   2'b00: mem_rdata_reg <= mem0_data_i;
	   2'b01: mem_rdata_reg <= mem1_data_i;
	   2'b10: mem_rdata_reg <= mem2_data_i;
	   2'b11: mem_rdata_reg <= mem3_data_i;
	   default: mem_rdata_reg <= mem0_data_i;
	 endcase // case (rptr_reg[MEM_ADDR_W+1:MEM_ADDR_W])
      end
   end // always @ (posedge wb_clk_i)

   always @(posedge wb_clk_i) begin
      if (rst == 1'b1) begin
	 mem_wenb_reg <= 4'b1111;
	 mem_renb_reg <= 4'b1111;
	 mem_wdata_reg <= 0;
      end
      else begin
	 mem_wenb_reg <= mem_wenb;
	 mem_renb_reg <= mem_renb;
	 mem_wdata_reg <= adc_out;
      end
   end
   always @(*) begin
      case(rptr_reg[MEM_ADDR_W+1:MEM_ADDR_W])
	 2'b00: mem_renb <= {3'b111, ~ren_1d_reg};
	 2'b01: mem_renb <= {2'b11, ~ren_1d_reg, 1'b1};
	 2'b10: mem_renb <= {1'b1, ~ren_1d_reg, 2'b11};
	 2'b11: mem_renb <= {~ren_1d_reg, 3'b111};
	 default: mem_renb <= 4'b1111;
      endcase // case (rptr_reg[MEM_ADDR_W+1:MEM_ADDR_W])
   end
   always @(*) begin
      case(wptr_reg[MEM_ADDR_W+1:MEM_ADDR_W])
	 2'b00: mem_wenb <= {3'b111, ~mem_write};
	 2'b01: mem_wenb <= {2'b11, ~mem_write, 1'b1};
	 2'b10: mem_wenb <= {1'b1, ~mem_write, 2'b11};
	 2'b11: mem_wenb <= {~mem_write, 3'b111};
	 default: mem_wenb <= 4'b1111;
      endcase // case (rptr_reg[MEM_ADDR_W+1:MEM_ADDR_W])
   end
   assign mem_waddr_o = wptr_reg[MEM_ADDR_W-1:0];
   assign mem_raddr_o = rptr_reg[MEM_ADDR_W-1:0];
   assign mem_renb_o = mem_renb_reg;
   assign mem_wenb_o = mem_wenb_reg;
   assign mem_data_o = mem_wdata_reg;
   assign fifo_out_w = mem_rdata_reg;

   // IO
   assign io_out    = fifo_out_w;
   assign io_oeb = {(`MPRJ_IO_PADS-1){~io_en_reg}};
   //assign irq  = 3'b000;
   assign wbs_dat_o = data_o;
   assign vco_enb_o = ~vco_en_reg;
   assign wmask_o = 4'hF;

`ifdef FUNCTIONAL
   // this is for debug only
   initial begin
      rdat_file = $fopen("wb_read_data.txt");
      wdat_file = $fopen("wb_write_data.txt");
   end

   always @(posedge full_reg) begin
      $display("Mem is full: wptr: %04X rptr: %04X", wptr_reg, rptr_reg);
   end

   always @(posedge empty_reg) begin
      $display("Mem is empty: wptr: %04X rptr: %04X", wptr_reg, rptr_reg);
   end

   always @(posedge wb_clk_i) begin
      if ((!mem_wenb_o[0]) || (!mem_wenb_o[1]) || (!mem_wenb_o[2]) || (!mem_wenb_o[3])) begin
	 $display("Mem write: addr: %04X %08X", wptr_reg, mem_data_o);
	 $fwrite(wdat_file, "%04X %08X\n", wptr_reg, mem_data_o);
      end
      if (wbs_ack_o && wbs_adr_i == 32'h30000004) begin
	 $display("Interface read: addr: %08X %08X", rptr_reg, wbs_dat_o);
	 $fwrite(rdat_file, "%04X %08X\n", rptr_reg, mem_rdata_reg);
      end
      
   end
`endif
endmodule
`default_nettype wire
