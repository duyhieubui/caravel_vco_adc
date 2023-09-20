//                              -*- Mode: Verilog -*-
// Filename        : phase_readout.v
// Description     : Phase Readout
// Author          : Duy-Hieu Bui <hieubd@vnu.edu.vn>
// Created On      : Sat May 15 00:45:24 2021
// Last Modified By: 
// Last Modified On: Sat May 15 00:45:24 2021
// Update Count    : 0
// Status          : Unknown, Use with caution!
//`include "phase_diff.v"
module phase_readout
  #(
    parameter PHASE_WIDTH = 11)
   (
    input 		     clk,
    input [PHASE_WIDTH-1:0]  data_i,
    output [PHASE_WIDTH-1:0] data_o
    );

   genvar i;
   generate
      for (i = 0; i < PHASE_WIDTH; i = i+1) begin
      phase_diff pd (
		     .clk(clk),
		     .data_i(data_i[i]),
		     .data_o(data_o[i])
		     );
   end
   endgenerate
endmodule // multi_phase_read_out
