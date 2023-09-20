module sinc_sync
  #( parameter DATA_WIDTH = 32)
   (input 		    clk,
    input 		    rst,
    input [3:0] 	    data_in,
    input 		    enable_in,
    input [9:0] 	    oversample_in,
    output 		    data_valid_out,
    output [DATA_WIDTH-1:0] data_out);
   
   wire [DATA_WIDTH-1:0]   ip_data1;
   reg signed [DATA_WIDTH-1:0] acc1;
   reg signed [DATA_WIDTH-1:0] acc2;
   reg signed [DATA_WIDTH-1:0] acc3;
   reg signed [DATA_WIDTH-1:0] acc3_d2;
   reg signed [DATA_WIDTH-1:0] diff1;
   reg signed [DATA_WIDTH-1:0] diff2;
   reg signed [DATA_WIDTH-1:0] diff3;
   reg signed [DATA_WIDTH-1:0] diff1_d;
   reg signed [DATA_WIDTH-1:0] diff2_d;
   reg [9:0] 		       word_count;
   reg 			       decimation_en;
   reg 			       data_valid_reg;

   assign ip_data1 = data_in;

   always @(posedge clk)
     if (rst == 1'b1)
	begin 	/*initialize acc registers on reset*/
	   acc1 <= 0;
	   acc2 <= 0;
	   acc3 <= 0;
	end
     else
       begin		/*perform accumulation process*/
	  if (enable_in == 1'b1) begin
	     acc1 <= acc1 + ip_data1;
	     acc2 <= acc2 + acc1;
	     acc3 <= acc3 + acc2;
	  end
	end 	
/*DECIMATION STAGE (MCLKIN/ WORD_CLK)*/

   always @(posedge clk)
     if (rst == 1'b1) begin
	word_count <= 0;
	decimation_en <= 1'b0;
   end
     else begin
	if (enable_in == 1'b1) begin
	   if (word_count == oversample_in[9:1]) begin
	      decimation_en <= 1'b1;
	      word_count <= word_count +1;
	   end
	   else if (word_count == oversample_in) begin
	      word_count <= 0;
	      decimation_en <= 1'b0;
	   end
	   else begin
	      decimation_en <= 1'b0;
	      word_count <= word_count + 1;
	   end
	end // if (enable_in = 1'b1)
     end
   
   always @(posedge clk)
     if(rst == 1'b1)
       begin
	  acc3_d2 <= 0;
	  diff1_d <= 0;
	  diff2_d <= 0;
	  diff1 <= 0;
	  diff2 <= 0;
	  diff3 <= 0;
       end
     else
       begin
	  if (enable_in == 1'b1 && decimation_en == 1'b1) begin
	     acc3_d2 <= acc3;
	     diff1 <= acc3 - acc3_d2;
	     diff2 <= diff1 - diff1_d;
	     diff3 <= diff2 - diff2_d;
	     diff1_d <= diff1;
	     diff2_d <= diff2;
	  end
       end

   always @(posedge clk)
     if (rst == 1'b1)
       data_valid_reg <= 1'b0;
     else
       data_valid_reg <= decimation_en;


   assign data_out = diff3;
   assign data_valid_out = data_valid_reg;
endmodule
