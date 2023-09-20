`default_nettype none

`timescale 1 ns / 1 ps

// `include "uprj_netlists.v"
// `include "caravel_netlists.v"
// `include "spiflash.v"

module vco_adc_wrapper_tb;
   reg clock;
   reg power1;
   reg power2;
   reg RSTB;

   wire [7:0] checkbits;
   wire [7:0]  spivalue;
   wire        gpio;
   wire        flash_csb;
   wire        flash_clk;
   wire        flash_io0;
   wire        flash_io1;
   wire [37:0] mprj_io;
   wire        SDO;

   assign checkbits = mprj_io[31:24];
   assign spivalue  = mprj_io[15:0];

   always #10 clock <= (clock === 1'b0);

   initial begin
      clock = 0;
   end

   initial begin
      $dumpfile("vco_adc_wrapper.vcd");
      // $dumpvars(0, vco_adc_wrapper_tb.uut.mprj.vco_adc_wrapper_1);
      // $dumpvars(0, vco_adc_wrapper_tb.uut.mprj.vco_adc_0);
      // $dumpvars(0, vco_adc_wrapper_tb.uut.mprj.vco_adc_1);
      // $dumpvars(0, vco_adc_wrapper_tb.uut.mprj.vco_adc_2);
      // $dumpvars(0, vco_adc_wrapper_tb.uut.mprj.vco_0);
      // $dumpvars(0, vco_adc_wrapper_tb.uut.mprj.vco_1);
      // $dumpvars(0, vco_adc_wrapper_tb.uut.mprj.vco_2);
      $dumpvars(0, vco_adc_wrapper_tb);
      // $dumpvars(0, vco_adc_wrapper_tb.uut);

      repeat (200) begin
      // repeat (5) begin
	 repeat (10000) @(posedge clock);
	 $display("+10000 cycles");
      end

      $display("%c[1;31m",27);
      $display ("Monitor: Timeout, Test MPRJ (RTL) Failed");
      $display("%c[0m",27);
      $finish;
   end

   //Monitor
   initial begin
      wait(checkbits == 8'hB4);
      $display("Monitor: Test MPRJ (RTL) Started!");
      wait(checkbits == 8'hB9);
      $display("Monitor: Test MPRJ (RTL) Passed!");
      $finish;
   end
   
   initial begin
      RSTB <= 1'b0;
      #1000;
      RSTB <= 1'b1;
      #2000;
   end

   initial begin
      power1 <= 1'b0;
      power2 <= 1'b0;
      #200;
      power1 <= 1'b1;
      #200;
      power2 <= 1'b1;
   end

   always @(checkbits) begin
      #1 $display("GPIO State = %b ", checkbits);
   end
   
   wire VDD3V3;
   wire VDD1V8;
   wire VSS;

   assign VDD3V3 = power1;
   assign VDD1V8 = power2;
   assign VSS = 1'b0;

   assign mprj_io[3] = 1'b1;  // Force CSB high.

   caravel uut (
                .vddio    (VDD3V3),
                .vssio    (VSS),
                .vdda     (VDD3V3),
                .vssa     (VSS),
                .vccd     (VDD1V8),
                .vssd     (VSS),
                .vdda1    (VDD3V3),
                .vdda2    (VDD3V3),
                .vssa1    (VSS),
                .vssa2    (VSS),
                .vccd1    (VDD1V8),
                .vccd2    (VDD1V8),
                .vssd1    (VSS),
                .vssd2    (VSS),
                .clock    (clock),
                .gpio     (gpio),
                .mprj_io  (mprj_io),
                .flash_csb(flash_csb),
                .flash_clk(flash_clk),
                .flash_io0(flash_io0),
                .flash_io1(flash_io1),
                .resetb   (RSTB)
		);

   spiflash #(
              .FILENAME("vco_adc_wrapper.hex")
              ) spiflash (
			  .csb(flash_csb),
			  .clk(flash_clk),
			  .io0(flash_io0),
			  .io1(flash_io1),
			  .io2(),                 // not used
			  .io3()                  // not used
			  );

   
endmodule // mprj_tb

  
