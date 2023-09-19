module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire \adc_out_0[0] ;
 wire \adc_out_0[10] ;
 wire \adc_out_0[11] ;
 wire \adc_out_0[12] ;
 wire \adc_out_0[13] ;
 wire \adc_out_0[14] ;
 wire \adc_out_0[15] ;
 wire \adc_out_0[16] ;
 wire \adc_out_0[17] ;
 wire \adc_out_0[18] ;
 wire \adc_out_0[19] ;
 wire \adc_out_0[1] ;
 wire \adc_out_0[20] ;
 wire \adc_out_0[21] ;
 wire \adc_out_0[22] ;
 wire \adc_out_0[23] ;
 wire \adc_out_0[24] ;
 wire \adc_out_0[25] ;
 wire \adc_out_0[26] ;
 wire \adc_out_0[27] ;
 wire \adc_out_0[28] ;
 wire \adc_out_0[29] ;
 wire \adc_out_0[2] ;
 wire \adc_out_0[30] ;
 wire \adc_out_0[31] ;
 wire \adc_out_0[3] ;
 wire \adc_out_0[4] ;
 wire \adc_out_0[5] ;
 wire \adc_out_0[6] ;
 wire \adc_out_0[7] ;
 wire \adc_out_0[8] ;
 wire \adc_out_0[9] ;
 wire \adc_out_1[0] ;
 wire \adc_out_1[10] ;
 wire \adc_out_1[11] ;
 wire \adc_out_1[12] ;
 wire \adc_out_1[13] ;
 wire \adc_out_1[14] ;
 wire \adc_out_1[15] ;
 wire \adc_out_1[16] ;
 wire \adc_out_1[17] ;
 wire \adc_out_1[18] ;
 wire \adc_out_1[19] ;
 wire \adc_out_1[1] ;
 wire \adc_out_1[20] ;
 wire \adc_out_1[21] ;
 wire \adc_out_1[22] ;
 wire \adc_out_1[23] ;
 wire \adc_out_1[24] ;
 wire \adc_out_1[25] ;
 wire \adc_out_1[26] ;
 wire \adc_out_1[27] ;
 wire \adc_out_1[28] ;
 wire \adc_out_1[29] ;
 wire \adc_out_1[2] ;
 wire \adc_out_1[30] ;
 wire \adc_out_1[31] ;
 wire \adc_out_1[3] ;
 wire \adc_out_1[4] ;
 wire \adc_out_1[5] ;
 wire \adc_out_1[6] ;
 wire \adc_out_1[7] ;
 wire \adc_out_1[8] ;
 wire \adc_out_1[9] ;
 wire \adc_out_2[0] ;
 wire \adc_out_2[10] ;
 wire \adc_out_2[11] ;
 wire \adc_out_2[12] ;
 wire \adc_out_2[13] ;
 wire \adc_out_2[14] ;
 wire \adc_out_2[15] ;
 wire \adc_out_2[16] ;
 wire \adc_out_2[17] ;
 wire \adc_out_2[18] ;
 wire \adc_out_2[19] ;
 wire \adc_out_2[1] ;
 wire \adc_out_2[20] ;
 wire \adc_out_2[21] ;
 wire \adc_out_2[22] ;
 wire \adc_out_2[23] ;
 wire \adc_out_2[24] ;
 wire \adc_out_2[25] ;
 wire \adc_out_2[26] ;
 wire \adc_out_2[27] ;
 wire \adc_out_2[28] ;
 wire \adc_out_2[29] ;
 wire \adc_out_2[2] ;
 wire \adc_out_2[30] ;
 wire \adc_out_2[31] ;
 wire \adc_out_2[3] ;
 wire \adc_out_2[4] ;
 wire \adc_out_2[5] ;
 wire \adc_out_2[6] ;
 wire \adc_out_2[7] ;
 wire \adc_out_2[8] ;
 wire \adc_out_2[9] ;
 wire \en[0] ;
 wire \en[1] ;
 wire \en[2] ;
 wire \m2w_data0[0] ;
 wire \m2w_data0[10] ;
 wire \m2w_data0[11] ;
 wire \m2w_data0[12] ;
 wire \m2w_data0[13] ;
 wire \m2w_data0[14] ;
 wire \m2w_data0[15] ;
 wire \m2w_data0[16] ;
 wire \m2w_data0[17] ;
 wire \m2w_data0[18] ;
 wire \m2w_data0[19] ;
 wire \m2w_data0[1] ;
 wire \m2w_data0[20] ;
 wire \m2w_data0[21] ;
 wire \m2w_data0[22] ;
 wire \m2w_data0[23] ;
 wire \m2w_data0[24] ;
 wire \m2w_data0[25] ;
 wire \m2w_data0[26] ;
 wire \m2w_data0[27] ;
 wire \m2w_data0[28] ;
 wire \m2w_data0[29] ;
 wire \m2w_data0[2] ;
 wire \m2w_data0[30] ;
 wire \m2w_data0[31] ;
 wire \m2w_data0[3] ;
 wire \m2w_data0[4] ;
 wire \m2w_data0[5] ;
 wire \m2w_data0[6] ;
 wire \m2w_data0[7] ;
 wire \m2w_data0[8] ;
 wire \m2w_data0[9] ;
 wire \m2w_data1[0] ;
 wire \m2w_data1[10] ;
 wire \m2w_data1[11] ;
 wire \m2w_data1[12] ;
 wire \m2w_data1[13] ;
 wire \m2w_data1[14] ;
 wire \m2w_data1[15] ;
 wire \m2w_data1[16] ;
 wire \m2w_data1[17] ;
 wire \m2w_data1[18] ;
 wire \m2w_data1[19] ;
 wire \m2w_data1[1] ;
 wire \m2w_data1[20] ;
 wire \m2w_data1[21] ;
 wire \m2w_data1[22] ;
 wire \m2w_data1[23] ;
 wire \m2w_data1[24] ;
 wire \m2w_data1[25] ;
 wire \m2w_data1[26] ;
 wire \m2w_data1[27] ;
 wire \m2w_data1[28] ;
 wire \m2w_data1[29] ;
 wire \m2w_data1[2] ;
 wire \m2w_data1[30] ;
 wire \m2w_data1[31] ;
 wire \m2w_data1[3] ;
 wire \m2w_data1[4] ;
 wire \m2w_data1[5] ;
 wire \m2w_data1[6] ;
 wire \m2w_data1[7] ;
 wire \m2w_data1[8] ;
 wire \m2w_data1[9] ;
 wire \m2w_data2[0] ;
 wire \m2w_data2[10] ;
 wire \m2w_data2[11] ;
 wire \m2w_data2[12] ;
 wire \m2w_data2[13] ;
 wire \m2w_data2[14] ;
 wire \m2w_data2[15] ;
 wire \m2w_data2[16] ;
 wire \m2w_data2[17] ;
 wire \m2w_data2[18] ;
 wire \m2w_data2[19] ;
 wire \m2w_data2[1] ;
 wire \m2w_data2[20] ;
 wire \m2w_data2[21] ;
 wire \m2w_data2[22] ;
 wire \m2w_data2[23] ;
 wire \m2w_data2[24] ;
 wire \m2w_data2[25] ;
 wire \m2w_data2[26] ;
 wire \m2w_data2[27] ;
 wire \m2w_data2[28] ;
 wire \m2w_data2[29] ;
 wire \m2w_data2[2] ;
 wire \m2w_data2[30] ;
 wire \m2w_data2[31] ;
 wire \m2w_data2[3] ;
 wire \m2w_data2[4] ;
 wire \m2w_data2[5] ;
 wire \m2w_data2[6] ;
 wire \m2w_data2[7] ;
 wire \m2w_data2[8] ;
 wire \m2w_data2[9] ;
 wire \m2w_data3[0] ;
 wire \m2w_data3[10] ;
 wire \m2w_data3[11] ;
 wire \m2w_data3[12] ;
 wire \m2w_data3[13] ;
 wire \m2w_data3[14] ;
 wire \m2w_data3[15] ;
 wire \m2w_data3[16] ;
 wire \m2w_data3[17] ;
 wire \m2w_data3[18] ;
 wire \m2w_data3[19] ;
 wire \m2w_data3[1] ;
 wire \m2w_data3[20] ;
 wire \m2w_data3[21] ;
 wire \m2w_data3[22] ;
 wire \m2w_data3[23] ;
 wire \m2w_data3[24] ;
 wire \m2w_data3[25] ;
 wire \m2w_data3[26] ;
 wire \m2w_data3[27] ;
 wire \m2w_data3[28] ;
 wire \m2w_data3[29] ;
 wire \m2w_data3[2] ;
 wire \m2w_data3[30] ;
 wire \m2w_data3[31] ;
 wire \m2w_data3[3] ;
 wire \m2w_data3[4] ;
 wire \m2w_data3[5] ;
 wire \m2w_data3[6] ;
 wire \m2w_data3[7] ;
 wire \m2w_data3[8] ;
 wire \m2w_data3[9] ;
 wire \oversample[0] ;
 wire \oversample[1] ;
 wire \oversample[2] ;
 wire \oversample[3] ;
 wire \oversample[4] ;
 wire \oversample[5] ;
 wire \oversample[6] ;
 wire \oversample[7] ;
 wire \oversample[8] ;
 wire \oversample[9] ;
 wire \phase0[0] ;
 wire \phase0[10] ;
 wire \phase0[1] ;
 wire \phase0[3] ;
 wire \phase0[4] ;
 wire \phase0[5] ;
 wire \phase0[6] ;
 wire \phase0[7] ;
 wire \phase0[8] ;
 wire \phase0[9] ;
 wire \phase1[0] ;
 wire \phase1[10] ;
 wire \phase1[1] ;
 wire \phase1[2] ;
 wire \phase1[3] ;
 wire \phase1[4] ;
 wire \phase1[5] ;
 wire \phase1[6] ;
 wire \phase1[7] ;
 wire \phase1[9] ;
 wire \phase2[0] ;
 wire \phase2[10] ;
 wire \phase2[1] ;
 wire \phase2[2] ;
 wire \phase2[3] ;
 wire \phase2[4] ;
 wire \phase2[5] ;
 wire \phase2[7] ;
 wire \phase2[8] ;
 wire \phase2[9] ;
 wire \raddr[0] ;
 wire \raddr[1] ;
 wire \raddr[2] ;
 wire \raddr[3] ;
 wire \raddr[4] ;
 wire \raddr[5] ;
 wire \raddr[6] ;
 wire \raddr[7] ;
 wire \raddr[8] ;
 wire \renb[0] ;
 wire \renb[1] ;
 wire \renb[2] ;
 wire \renb[3] ;
 wire \sinc3_dvalid[0] ;
 wire \sinc3_dvalid[1] ;
 wire \sinc3_dvalid[2] ;
 wire \vco_enb[0] ;
 wire \vco_enb[1] ;
 wire \vco_enb[2] ;
 wire \w2m_data[0] ;
 wire \w2m_data[10] ;
 wire \w2m_data[11] ;
 wire \w2m_data[12] ;
 wire \w2m_data[13] ;
 wire \w2m_data[14] ;
 wire \w2m_data[15] ;
 wire \w2m_data[16] ;
 wire \w2m_data[17] ;
 wire \w2m_data[18] ;
 wire \w2m_data[19] ;
 wire \w2m_data[1] ;
 wire \w2m_data[20] ;
 wire \w2m_data[21] ;
 wire \w2m_data[22] ;
 wire \w2m_data[23] ;
 wire \w2m_data[24] ;
 wire \w2m_data[25] ;
 wire \w2m_data[26] ;
 wire \w2m_data[27] ;
 wire \w2m_data[28] ;
 wire \w2m_data[29] ;
 wire \w2m_data[2] ;
 wire \w2m_data[30] ;
 wire \w2m_data[31] ;
 wire \w2m_data[3] ;
 wire \w2m_data[4] ;
 wire \w2m_data[5] ;
 wire \w2m_data[6] ;
 wire \w2m_data[7] ;
 wire \w2m_data[8] ;
 wire \w2m_data[9] ;
 wire \waddr[0] ;
 wire \waddr[1] ;
 wire \waddr[2] ;
 wire \waddr[3] ;
 wire \waddr[4] ;
 wire \waddr[5] ;
 wire \waddr[6] ;
 wire \waddr[7] ;
 wire \waddr[8] ;
 wire \wenb[0] ;
 wire \wenb[1] ;
 wire \wenb[2] ;
 wire \wenb[3] ;
 wire \wmask[0] ;
 wire \wmask[1] ;
 wire \wmask[2] ;
 wire \wmask[3] ;

 sky130_sram_2kbyte_1rw1r_32x512_8 mem_0 (.csb0(\wenb[0] ),
    .csb1(\renb[0] ),
    .web0(\wenb[0] ),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\waddr[8] ,
    \waddr[7] ,
    \waddr[6] ,
    \waddr[5] ,
    \waddr[4] ,
    \waddr[3] ,
    \waddr[2] ,
    \waddr[1] ,
    \waddr[0] }),
    .addr1({\raddr[8] ,
    \raddr[7] ,
    \raddr[6] ,
    \raddr[5] ,
    \raddr[4] ,
    \raddr[3] ,
    \raddr[2] ,
    \raddr[1] ,
    \raddr[0] }),
    .din0({\w2m_data[31] ,
    \w2m_data[30] ,
    \w2m_data[29] ,
    \w2m_data[28] ,
    \w2m_data[27] ,
    \w2m_data[26] ,
    \w2m_data[25] ,
    \w2m_data[24] ,
    \w2m_data[23] ,
    \w2m_data[22] ,
    \w2m_data[21] ,
    \w2m_data[20] ,
    \w2m_data[19] ,
    \w2m_data[18] ,
    \w2m_data[17] ,
    \w2m_data[16] ,
    \w2m_data[15] ,
    \w2m_data[14] ,
    \w2m_data[13] ,
    \w2m_data[12] ,
    \w2m_data[11] ,
    \w2m_data[10] ,
    \w2m_data[9] ,
    \w2m_data[8] ,
    \w2m_data[7] ,
    \w2m_data[6] ,
    \w2m_data[5] ,
    \w2m_data[4] ,
    \w2m_data[3] ,
    \w2m_data[2] ,
    \w2m_data[1] ,
    \w2m_data[0] }),
    .dout0({_NC1,
    _NC2,
    _NC3,
    _NC4,
    _NC5,
    _NC6,
    _NC7,
    _NC8,
    _NC9,
    _NC10,
    _NC11,
    _NC12,
    _NC13,
    _NC14,
    _NC15,
    _NC16,
    _NC17,
    _NC18,
    _NC19,
    _NC20,
    _NC21,
    _NC22,
    _NC23,
    _NC24,
    _NC25,
    _NC26,
    _NC27,
    _NC28,
    _NC29,
    _NC30,
    _NC31,
    _NC32}),
    .dout1({\m2w_data0[31] ,
    \m2w_data0[30] ,
    \m2w_data0[29] ,
    \m2w_data0[28] ,
    \m2w_data0[27] ,
    \m2w_data0[26] ,
    \m2w_data0[25] ,
    \m2w_data0[24] ,
    \m2w_data0[23] ,
    \m2w_data0[22] ,
    \m2w_data0[21] ,
    \m2w_data0[20] ,
    \m2w_data0[19] ,
    \m2w_data0[18] ,
    \m2w_data0[17] ,
    \m2w_data0[16] ,
    \m2w_data0[15] ,
    \m2w_data0[14] ,
    \m2w_data0[13] ,
    \m2w_data0[12] ,
    \m2w_data0[11] ,
    \m2w_data0[10] ,
    \m2w_data0[9] ,
    \m2w_data0[8] ,
    \m2w_data0[7] ,
    \m2w_data0[6] ,
    \m2w_data0[5] ,
    \m2w_data0[4] ,
    \m2w_data0[3] ,
    \m2w_data0[2] ,
    \m2w_data0[1] ,
    \m2w_data0[0] }),
    .wmask0({\wmask[3] ,
    \wmask[2] ,
    \wmask[1] ,
    \wmask[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 mem_1 (.csb0(\wenb[1] ),
    .csb1(\renb[1] ),
    .web0(\wenb[1] ),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\waddr[8] ,
    \waddr[7] ,
    \waddr[6] ,
    \waddr[5] ,
    \waddr[4] ,
    \waddr[3] ,
    \waddr[2] ,
    \waddr[1] ,
    \waddr[0] }),
    .addr1({\raddr[8] ,
    \raddr[7] ,
    \raddr[6] ,
    \raddr[5] ,
    \raddr[4] ,
    \raddr[3] ,
    \raddr[2] ,
    \raddr[1] ,
    \raddr[0] }),
    .din0({\w2m_data[31] ,
    \w2m_data[30] ,
    \w2m_data[29] ,
    \w2m_data[28] ,
    \w2m_data[27] ,
    \w2m_data[26] ,
    \w2m_data[25] ,
    \w2m_data[24] ,
    \w2m_data[23] ,
    \w2m_data[22] ,
    \w2m_data[21] ,
    \w2m_data[20] ,
    \w2m_data[19] ,
    \w2m_data[18] ,
    \w2m_data[17] ,
    \w2m_data[16] ,
    \w2m_data[15] ,
    \w2m_data[14] ,
    \w2m_data[13] ,
    \w2m_data[12] ,
    \w2m_data[11] ,
    \w2m_data[10] ,
    \w2m_data[9] ,
    \w2m_data[8] ,
    \w2m_data[7] ,
    \w2m_data[6] ,
    \w2m_data[5] ,
    \w2m_data[4] ,
    \w2m_data[3] ,
    \w2m_data[2] ,
    \w2m_data[1] ,
    \w2m_data[0] }),
    .dout0({_NC33,
    _NC34,
    _NC35,
    _NC36,
    _NC37,
    _NC38,
    _NC39,
    _NC40,
    _NC41,
    _NC42,
    _NC43,
    _NC44,
    _NC45,
    _NC46,
    _NC47,
    _NC48,
    _NC49,
    _NC50,
    _NC51,
    _NC52,
    _NC53,
    _NC54,
    _NC55,
    _NC56,
    _NC57,
    _NC58,
    _NC59,
    _NC60,
    _NC61,
    _NC62,
    _NC63,
    _NC64}),
    .dout1({\m2w_data1[31] ,
    \m2w_data1[30] ,
    \m2w_data1[29] ,
    \m2w_data1[28] ,
    \m2w_data1[27] ,
    \m2w_data1[26] ,
    \m2w_data1[25] ,
    \m2w_data1[24] ,
    \m2w_data1[23] ,
    \m2w_data1[22] ,
    \m2w_data1[21] ,
    \m2w_data1[20] ,
    \m2w_data1[19] ,
    \m2w_data1[18] ,
    \m2w_data1[17] ,
    \m2w_data1[16] ,
    \m2w_data1[15] ,
    \m2w_data1[14] ,
    \m2w_data1[13] ,
    \m2w_data1[12] ,
    \m2w_data1[11] ,
    \m2w_data1[10] ,
    \m2w_data1[9] ,
    \m2w_data1[8] ,
    \m2w_data1[7] ,
    \m2w_data1[6] ,
    \m2w_data1[5] ,
    \m2w_data1[4] ,
    \m2w_data1[3] ,
    \m2w_data1[2] ,
    \m2w_data1[1] ,
    \m2w_data1[0] }),
    .wmask0({\wmask[3] ,
    \wmask[2] ,
    \wmask[1] ,
    \wmask[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 mem_2 (.csb0(\wenb[2] ),
    .csb1(\renb[2] ),
    .web0(\wenb[2] ),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\waddr[8] ,
    \waddr[7] ,
    \waddr[6] ,
    \waddr[5] ,
    \waddr[4] ,
    \waddr[3] ,
    \waddr[2] ,
    \waddr[1] ,
    \waddr[0] }),
    .addr1({\raddr[8] ,
    \raddr[7] ,
    \raddr[6] ,
    \raddr[5] ,
    \raddr[4] ,
    \raddr[3] ,
    \raddr[2] ,
    \raddr[1] ,
    \raddr[0] }),
    .din0({\w2m_data[31] ,
    \w2m_data[30] ,
    \w2m_data[29] ,
    \w2m_data[28] ,
    \w2m_data[27] ,
    \w2m_data[26] ,
    \w2m_data[25] ,
    \w2m_data[24] ,
    \w2m_data[23] ,
    \w2m_data[22] ,
    \w2m_data[21] ,
    \w2m_data[20] ,
    \w2m_data[19] ,
    \w2m_data[18] ,
    \w2m_data[17] ,
    \w2m_data[16] ,
    \w2m_data[15] ,
    \w2m_data[14] ,
    \w2m_data[13] ,
    \w2m_data[12] ,
    \w2m_data[11] ,
    \w2m_data[10] ,
    \w2m_data[9] ,
    \w2m_data[8] ,
    \w2m_data[7] ,
    \w2m_data[6] ,
    \w2m_data[5] ,
    \w2m_data[4] ,
    \w2m_data[3] ,
    \w2m_data[2] ,
    \w2m_data[1] ,
    \w2m_data[0] }),
    .dout0({_NC65,
    _NC66,
    _NC67,
    _NC68,
    _NC69,
    _NC70,
    _NC71,
    _NC72,
    _NC73,
    _NC74,
    _NC75,
    _NC76,
    _NC77,
    _NC78,
    _NC79,
    _NC80,
    _NC81,
    _NC82,
    _NC83,
    _NC84,
    _NC85,
    _NC86,
    _NC87,
    _NC88,
    _NC89,
    _NC90,
    _NC91,
    _NC92,
    _NC93,
    _NC94,
    _NC95,
    _NC96}),
    .dout1({\m2w_data2[31] ,
    \m2w_data2[30] ,
    \m2w_data2[29] ,
    \m2w_data2[28] ,
    \m2w_data2[27] ,
    \m2w_data2[26] ,
    \m2w_data2[25] ,
    \m2w_data2[24] ,
    \m2w_data2[23] ,
    \m2w_data2[22] ,
    \m2w_data2[21] ,
    \m2w_data2[20] ,
    \m2w_data2[19] ,
    \m2w_data2[18] ,
    \m2w_data2[17] ,
    \m2w_data2[16] ,
    \m2w_data2[15] ,
    \m2w_data2[14] ,
    \m2w_data2[13] ,
    \m2w_data2[12] ,
    \m2w_data2[11] ,
    \m2w_data2[10] ,
    \m2w_data2[9] ,
    \m2w_data2[8] ,
    \m2w_data2[7] ,
    \m2w_data2[6] ,
    \m2w_data2[5] ,
    \m2w_data2[4] ,
    \m2w_data2[3] ,
    \m2w_data2[2] ,
    \m2w_data2[1] ,
    \m2w_data2[0] }),
    .wmask0({\wmask[3] ,
    \wmask[2] ,
    \wmask[1] ,
    \wmask[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 mem_3 (.csb0(\wenb[3] ),
    .csb1(\renb[3] ),
    .web0(\wenb[3] ),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\waddr[8] ,
    \waddr[7] ,
    \waddr[6] ,
    \waddr[5] ,
    \waddr[4] ,
    \waddr[3] ,
    \waddr[2] ,
    \waddr[1] ,
    \waddr[0] }),
    .addr1({\raddr[8] ,
    \raddr[7] ,
    \raddr[6] ,
    \raddr[5] ,
    \raddr[4] ,
    \raddr[3] ,
    \raddr[2] ,
    \raddr[1] ,
    \raddr[0] }),
    .din0({\w2m_data[31] ,
    \w2m_data[30] ,
    \w2m_data[29] ,
    \w2m_data[28] ,
    \w2m_data[27] ,
    \w2m_data[26] ,
    \w2m_data[25] ,
    \w2m_data[24] ,
    \w2m_data[23] ,
    \w2m_data[22] ,
    \w2m_data[21] ,
    \w2m_data[20] ,
    \w2m_data[19] ,
    \w2m_data[18] ,
    \w2m_data[17] ,
    \w2m_data[16] ,
    \w2m_data[15] ,
    \w2m_data[14] ,
    \w2m_data[13] ,
    \w2m_data[12] ,
    \w2m_data[11] ,
    \w2m_data[10] ,
    \w2m_data[9] ,
    \w2m_data[8] ,
    \w2m_data[7] ,
    \w2m_data[6] ,
    \w2m_data[5] ,
    \w2m_data[4] ,
    \w2m_data[3] ,
    \w2m_data[2] ,
    \w2m_data[1] ,
    \w2m_data[0] }),
    .dout0({_NC97,
    _NC98,
    _NC99,
    _NC100,
    _NC101,
    _NC102,
    _NC103,
    _NC104,
    _NC105,
    _NC106,
    _NC107,
    _NC108,
    _NC109,
    _NC110,
    _NC111,
    _NC112,
    _NC113,
    _NC114,
    _NC115,
    _NC116,
    _NC117,
    _NC118,
    _NC119,
    _NC120,
    _NC121,
    _NC122,
    _NC123,
    _NC124,
    _NC125,
    _NC126,
    _NC127,
    _NC128}),
    .dout1({\m2w_data3[31] ,
    \m2w_data3[30] ,
    \m2w_data3[29] ,
    \m2w_data3[28] ,
    \m2w_data3[27] ,
    \m2w_data3[26] ,
    \m2w_data3[25] ,
    \m2w_data3[24] ,
    \m2w_data3[23] ,
    \m2w_data3[22] ,
    \m2w_data3[21] ,
    \m2w_data3[20] ,
    \m2w_data3[19] ,
    \m2w_data3[18] ,
    \m2w_data3[17] ,
    \m2w_data3[16] ,
    \m2w_data3[15] ,
    \m2w_data3[14] ,
    \m2w_data3[13] ,
    \m2w_data3[12] ,
    \m2w_data3[11] ,
    \m2w_data3[10] ,
    \m2w_data3[9] ,
    \m2w_data3[8] ,
    \m2w_data3[7] ,
    \m2w_data3[6] ,
    \m2w_data3[5] ,
    \m2w_data3[4] ,
    \m2w_data3[3] ,
    \m2w_data3[2] ,
    \m2w_data3[1] ,
    \m2w_data3[0] }),
    .wmask0({\wmask[3] ,
    \wmask[2] ,
    \wmask[1] ,
    \wmask[0] }));
 vco_w6_r100 vco_0 (.enb(\vco_enb[0] ),
    .input_analog(analog_io[9]),
    .vccd2(vccd1),
    .vssd2(vssd1),
    .p({\phase0[10] ,
    \phase0[9] ,
    \phase0[8] ,
    \phase0[7] ,
    \phase0[6] ,
    \phase0[5] ,
    \phase0[4] ,
    \phase0[3] ,
    analog_io[10],
    \phase0[1] ,
    \phase0[0] }));
 vco vco_1 (.input_analog(analog_io[13]),
    .vccd2(vccd1),
    .vssd2(vssd1),
    .enb(\vco_enb[1] ),
    .p({\phase1[10] ,
    \phase1[9] ,
    analog_io[12],
    \phase1[7] ,
    \phase1[6] ,
    \phase1[5] ,
    \phase1[4] ,
    \phase1[3] ,
    \phase1[2] ,
    \phase1[1] ,
    \phase1[0] }));
 vco_r100 vco_2 (.input_analog(analog_io[15]),
    .vccd2(vccd1),
    .vssd2(vssd1),
    .enb(\vco_enb[2] ),
    .p({\phase2[10] ,
    \phase2[9] ,
    \phase2[8] ,
    \phase2[7] ,
    analog_io[16],
    \phase2[5] ,
    \phase2[4] ,
    \phase2[3] ,
    \phase2[2] ,
    \phase2[1] ,
    \phase2[0] }));
 vco_adc vco_adc_0 (.clk(wb_clk_i),
    .data_valid_out(\sinc3_dvalid[0] ),
    .enable_in(\en[0] ),
    .rst(wb_rst_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .data_out({\adc_out_0[31] ,
    \adc_out_0[30] ,
    \adc_out_0[29] ,
    \adc_out_0[28] ,
    \adc_out_0[27] ,
    \adc_out_0[26] ,
    \adc_out_0[25] ,
    \adc_out_0[24] ,
    \adc_out_0[23] ,
    \adc_out_0[22] ,
    \adc_out_0[21] ,
    \adc_out_0[20] ,
    \adc_out_0[19] ,
    \adc_out_0[18] ,
    \adc_out_0[17] ,
    \adc_out_0[16] ,
    \adc_out_0[15] ,
    \adc_out_0[14] ,
    \adc_out_0[13] ,
    \adc_out_0[12] ,
    \adc_out_0[11] ,
    \adc_out_0[10] ,
    \adc_out_0[9] ,
    \adc_out_0[8] ,
    \adc_out_0[7] ,
    \adc_out_0[6] ,
    \adc_out_0[5] ,
    \adc_out_0[4] ,
    \adc_out_0[3] ,
    \adc_out_0[2] ,
    \adc_out_0[1] ,
    \adc_out_0[0] }),
    .oversample_in({\oversample[9] ,
    \oversample[8] ,
    \oversample[7] ,
    \oversample[6] ,
    \oversample[5] ,
    \oversample[4] ,
    \oversample[3] ,
    \oversample[2] ,
    \oversample[1] ,
    \oversample[0] }),
    .phase_in({\phase0[10] ,
    \phase0[9] ,
    \phase0[8] ,
    \phase0[7] ,
    \phase0[6] ,
    \phase0[5] ,
    \phase0[4] ,
    \phase0[3] ,
    analog_io[10],
    \phase0[1] ,
    \phase0[0] }));
 vco_adc vco_adc_1 (.clk(wb_clk_i),
    .data_valid_out(\sinc3_dvalid[1] ),
    .enable_in(\en[1] ),
    .rst(wb_rst_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .data_out({\adc_out_1[31] ,
    \adc_out_1[30] ,
    \adc_out_1[29] ,
    \adc_out_1[28] ,
    \adc_out_1[27] ,
    \adc_out_1[26] ,
    \adc_out_1[25] ,
    \adc_out_1[24] ,
    \adc_out_1[23] ,
    \adc_out_1[22] ,
    \adc_out_1[21] ,
    \adc_out_1[20] ,
    \adc_out_1[19] ,
    \adc_out_1[18] ,
    \adc_out_1[17] ,
    \adc_out_1[16] ,
    \adc_out_1[15] ,
    \adc_out_1[14] ,
    \adc_out_1[13] ,
    \adc_out_1[12] ,
    \adc_out_1[11] ,
    \adc_out_1[10] ,
    \adc_out_1[9] ,
    \adc_out_1[8] ,
    \adc_out_1[7] ,
    \adc_out_1[6] ,
    \adc_out_1[5] ,
    \adc_out_1[4] ,
    \adc_out_1[3] ,
    \adc_out_1[2] ,
    \adc_out_1[1] ,
    \adc_out_1[0] }),
    .oversample_in({\oversample[9] ,
    \oversample[8] ,
    \oversample[7] ,
    \oversample[6] ,
    \oversample[5] ,
    \oversample[4] ,
    \oversample[3] ,
    \oversample[2] ,
    \oversample[1] ,
    \oversample[0] }),
    .phase_in({\phase1[10] ,
    \phase1[9] ,
    analog_io[12],
    \phase1[7] ,
    \phase1[6] ,
    \phase1[5] ,
    \phase1[4] ,
    \phase1[3] ,
    \phase1[2] ,
    \phase1[1] ,
    \phase1[0] }));
 vco_adc vco_adc_2 (.clk(wb_clk_i),
    .data_valid_out(\sinc3_dvalid[2] ),
    .enable_in(\en[2] ),
    .rst(wb_rst_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .data_out({\adc_out_2[31] ,
    \adc_out_2[30] ,
    \adc_out_2[29] ,
    \adc_out_2[28] ,
    \adc_out_2[27] ,
    \adc_out_2[26] ,
    \adc_out_2[25] ,
    \adc_out_2[24] ,
    \adc_out_2[23] ,
    \adc_out_2[22] ,
    \adc_out_2[21] ,
    \adc_out_2[20] ,
    \adc_out_2[19] ,
    \adc_out_2[18] ,
    \adc_out_2[17] ,
    \adc_out_2[16] ,
    \adc_out_2[15] ,
    \adc_out_2[14] ,
    \adc_out_2[13] ,
    \adc_out_2[12] ,
    \adc_out_2[11] ,
    \adc_out_2[10] ,
    \adc_out_2[9] ,
    \adc_out_2[8] ,
    \adc_out_2[7] ,
    \adc_out_2[6] ,
    \adc_out_2[5] ,
    \adc_out_2[4] ,
    \adc_out_2[3] ,
    \adc_out_2[2] ,
    \adc_out_2[1] ,
    \adc_out_2[0] }),
    .oversample_in({\oversample[9] ,
    \oversample[8] ,
    \oversample[7] ,
    \oversample[6] ,
    \oversample[5] ,
    \oversample[4] ,
    \oversample[3] ,
    \oversample[2] ,
    \oversample[1] ,
    \oversample[0] }),
    .phase_in({\phase2[10] ,
    \phase2[9] ,
    \phase2[8] ,
    \phase2[7] ,
    analog_io[16],
    \phase2[5] ,
    \phase2[4] ,
    \phase2[3] ,
    \phase2[2] ,
    \phase2[1] ,
    \phase2[0] }));
 vco_adc_wrapper vco_adc_wrapper_1 (.vccd1(vccd1),
    .vssd1(vssd1),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .adc0_dat_i({\adc_out_0[31] ,
    \adc_out_0[30] ,
    \adc_out_0[29] ,
    \adc_out_0[28] ,
    \adc_out_0[27] ,
    \adc_out_0[26] ,
    \adc_out_0[25] ,
    \adc_out_0[24] ,
    \adc_out_0[23] ,
    \adc_out_0[22] ,
    \adc_out_0[21] ,
    \adc_out_0[20] ,
    \adc_out_0[19] ,
    \adc_out_0[18] ,
    \adc_out_0[17] ,
    \adc_out_0[16] ,
    \adc_out_0[15] ,
    \adc_out_0[14] ,
    \adc_out_0[13] ,
    \adc_out_0[12] ,
    \adc_out_0[11] ,
    \adc_out_0[10] ,
    \adc_out_0[9] ,
    \adc_out_0[8] ,
    \adc_out_0[7] ,
    \adc_out_0[6] ,
    \adc_out_0[5] ,
    \adc_out_0[4] ,
    \adc_out_0[3] ,
    \adc_out_0[2] ,
    \adc_out_0[1] ,
    \adc_out_0[0] }),
    .adc1_dat_i({\adc_out_1[31] ,
    \adc_out_1[30] ,
    \adc_out_1[29] ,
    \adc_out_1[28] ,
    \adc_out_1[27] ,
    \adc_out_1[26] ,
    \adc_out_1[25] ,
    \adc_out_1[24] ,
    \adc_out_1[23] ,
    \adc_out_1[22] ,
    \adc_out_1[21] ,
    \adc_out_1[20] ,
    \adc_out_1[19] ,
    \adc_out_1[18] ,
    \adc_out_1[17] ,
    \adc_out_1[16] ,
    \adc_out_1[15] ,
    \adc_out_1[14] ,
    \adc_out_1[13] ,
    \adc_out_1[12] ,
    \adc_out_1[11] ,
    \adc_out_1[10] ,
    \adc_out_1[9] ,
    \adc_out_1[8] ,
    \adc_out_1[7] ,
    \adc_out_1[6] ,
    \adc_out_1[5] ,
    \adc_out_1[4] ,
    \adc_out_1[3] ,
    \adc_out_1[2] ,
    \adc_out_1[1] ,
    \adc_out_1[0] }),
    .adc2_dat_i({\adc_out_2[31] ,
    \adc_out_2[30] ,
    \adc_out_2[29] ,
    \adc_out_2[28] ,
    \adc_out_2[27] ,
    \adc_out_2[26] ,
    \adc_out_2[25] ,
    \adc_out_2[24] ,
    \adc_out_2[23] ,
    \adc_out_2[22] ,
    \adc_out_2[21] ,
    \adc_out_2[20] ,
    \adc_out_2[19] ,
    \adc_out_2[18] ,
    \adc_out_2[17] ,
    \adc_out_2[16] ,
    \adc_out_2[15] ,
    \adc_out_2[14] ,
    \adc_out_2[13] ,
    \adc_out_2[12] ,
    \adc_out_2[11] ,
    \adc_out_2[10] ,
    \adc_out_2[9] ,
    \adc_out_2[8] ,
    \adc_out_2[7] ,
    \adc_out_2[6] ,
    \adc_out_2[5] ,
    \adc_out_2[4] ,
    \adc_out_2[3] ,
    \adc_out_2[2] ,
    \adc_out_2[1] ,
    \adc_out_2[0] }),
    .adc_dvalid_i({\sinc3_dvalid[2] ,
    \sinc3_dvalid[1] ,
    \sinc3_dvalid[0] }),
    .io_oeb({io_oeb[37],
    io_oeb[36],
    io_oeb[35],
    io_oeb[34],
    io_oeb[33],
    io_oeb[32],
    io_oeb[31],
    io_oeb[30],
    io_oeb[7],
    io_oeb[6],
    io_oeb[5],
    io_oeb[4],
    io_oeb[3],
    io_oeb[2],
    io_oeb[1],
    io_oeb[0]}),
    .io_out({io_out[37],
    io_out[36],
    io_out[35],
    io_out[34],
    io_out[33],
    io_out[32],
    io_out[31],
    io_out[30],
    io_out[7],
    io_out[6],
    io_out[5],
    io_out[4],
    io_out[3],
    io_out[2],
    io_out[1],
    io_out[0]}),
    .mem0_data_i({\m2w_data0[31] ,
    \m2w_data0[30] ,
    \m2w_data0[29] ,
    \m2w_data0[28] ,
    \m2w_data0[27] ,
    \m2w_data0[26] ,
    \m2w_data0[25] ,
    \m2w_data0[24] ,
    \m2w_data0[23] ,
    \m2w_data0[22] ,
    \m2w_data0[21] ,
    \m2w_data0[20] ,
    \m2w_data0[19] ,
    \m2w_data0[18] ,
    \m2w_data0[17] ,
    \m2w_data0[16] ,
    \m2w_data0[15] ,
    \m2w_data0[14] ,
    \m2w_data0[13] ,
    \m2w_data0[12] ,
    \m2w_data0[11] ,
    \m2w_data0[10] ,
    \m2w_data0[9] ,
    \m2w_data0[8] ,
    \m2w_data0[7] ,
    \m2w_data0[6] ,
    \m2w_data0[5] ,
    \m2w_data0[4] ,
    \m2w_data0[3] ,
    \m2w_data0[2] ,
    \m2w_data0[1] ,
    \m2w_data0[0] }),
    .mem1_data_i({\m2w_data1[31] ,
    \m2w_data1[30] ,
    \m2w_data1[29] ,
    \m2w_data1[28] ,
    \m2w_data1[27] ,
    \m2w_data1[26] ,
    \m2w_data1[25] ,
    \m2w_data1[24] ,
    \m2w_data1[23] ,
    \m2w_data1[22] ,
    \m2w_data1[21] ,
    \m2w_data1[20] ,
    \m2w_data1[19] ,
    \m2w_data1[18] ,
    \m2w_data1[17] ,
    \m2w_data1[16] ,
    \m2w_data1[15] ,
    \m2w_data1[14] ,
    \m2w_data1[13] ,
    \m2w_data1[12] ,
    \m2w_data1[11] ,
    \m2w_data1[10] ,
    \m2w_data1[9] ,
    \m2w_data1[8] ,
    \m2w_data1[7] ,
    \m2w_data1[6] ,
    \m2w_data1[5] ,
    \m2w_data1[4] ,
    \m2w_data1[3] ,
    \m2w_data1[2] ,
    \m2w_data1[1] ,
    \m2w_data1[0] }),
    .mem2_data_i({\m2w_data2[31] ,
    \m2w_data2[30] ,
    \m2w_data2[29] ,
    \m2w_data2[28] ,
    \m2w_data2[27] ,
    \m2w_data2[26] ,
    \m2w_data2[25] ,
    \m2w_data2[24] ,
    \m2w_data2[23] ,
    \m2w_data2[22] ,
    \m2w_data2[21] ,
    \m2w_data2[20] ,
    \m2w_data2[19] ,
    \m2w_data2[18] ,
    \m2w_data2[17] ,
    \m2w_data2[16] ,
    \m2w_data2[15] ,
    \m2w_data2[14] ,
    \m2w_data2[13] ,
    \m2w_data2[12] ,
    \m2w_data2[11] ,
    \m2w_data2[10] ,
    \m2w_data2[9] ,
    \m2w_data2[8] ,
    \m2w_data2[7] ,
    \m2w_data2[6] ,
    \m2w_data2[5] ,
    \m2w_data2[4] ,
    \m2w_data2[3] ,
    \m2w_data2[2] ,
    \m2w_data2[1] ,
    \m2w_data2[0] }),
    .mem3_data_i({\m2w_data3[31] ,
    \m2w_data3[30] ,
    \m2w_data3[29] ,
    \m2w_data3[28] ,
    \m2w_data3[27] ,
    \m2w_data3[26] ,
    \m2w_data3[25] ,
    \m2w_data3[24] ,
    \m2w_data3[23] ,
    \m2w_data3[22] ,
    \m2w_data3[21] ,
    \m2w_data3[20] ,
    \m2w_data3[19] ,
    \m2w_data3[18] ,
    \m2w_data3[17] ,
    \m2w_data3[16] ,
    \m2w_data3[15] ,
    \m2w_data3[14] ,
    \m2w_data3[13] ,
    \m2w_data3[12] ,
    \m2w_data3[11] ,
    \m2w_data3[10] ,
    \m2w_data3[9] ,
    \m2w_data3[8] ,
    \m2w_data3[7] ,
    \m2w_data3[6] ,
    \m2w_data3[5] ,
    \m2w_data3[4] ,
    \m2w_data3[3] ,
    \m2w_data3[2] ,
    \m2w_data3[1] ,
    \m2w_data3[0] }),
    .mem_data_o({\w2m_data[31] ,
    \w2m_data[30] ,
    \w2m_data[29] ,
    \w2m_data[28] ,
    \w2m_data[27] ,
    \w2m_data[26] ,
    \w2m_data[25] ,
    \w2m_data[24] ,
    \w2m_data[23] ,
    \w2m_data[22] ,
    \w2m_data[21] ,
    \w2m_data[20] ,
    \w2m_data[19] ,
    \w2m_data[18] ,
    \w2m_data[17] ,
    \w2m_data[16] ,
    \w2m_data[15] ,
    \w2m_data[14] ,
    \w2m_data[13] ,
    \w2m_data[12] ,
    \w2m_data[11] ,
    \w2m_data[10] ,
    \w2m_data[9] ,
    \w2m_data[8] ,
    \w2m_data[7] ,
    \w2m_data[6] ,
    \w2m_data[5] ,
    \w2m_data[4] ,
    \w2m_data[3] ,
    \w2m_data[2] ,
    \w2m_data[1] ,
    \w2m_data[0] }),
    .mem_raddr_o({\raddr[8] ,
    \raddr[7] ,
    \raddr[6] ,
    \raddr[5] ,
    \raddr[4] ,
    \raddr[3] ,
    \raddr[2] ,
    \raddr[1] ,
    \raddr[0] }),
    .mem_renb_o({\renb[3] ,
    \renb[2] ,
    \renb[1] ,
    \renb[0] }),
    .mem_waddr_o({\waddr[8] ,
    \waddr[7] ,
    \waddr[6] ,
    \waddr[5] ,
    \waddr[4] ,
    \waddr[3] ,
    \waddr[2] ,
    \waddr[1] ,
    \waddr[0] }),
    .mem_wenb_o({\wenb[3] ,
    \wenb[2] ,
    \wenb[1] ,
    \wenb[0] }),
    .oversample_o({\oversample[9] ,
    \oversample[8] ,
    \oversample[7] ,
    \oversample[6] ,
    \oversample[5] ,
    \oversample[4] ,
    \oversample[3] ,
    \oversample[2] ,
    \oversample[1] ,
    \oversample[0] }),
    .sinc3_en_o({\en[2] ,
    \en[1] ,
    \en[0] }),
    .vco_enb_o({\vco_enb[2] ,
    \vco_enb[1] ,
    \vco_enb[0] }),
    .wbs_adr_i({wbs_adr_i[31],
    wbs_adr_i[30],
    wbs_adr_i[29],
    wbs_adr_i[28],
    wbs_adr_i[27],
    wbs_adr_i[26],
    wbs_adr_i[25],
    wbs_adr_i[24],
    wbs_adr_i[23],
    wbs_adr_i[22],
    wbs_adr_i[21],
    wbs_adr_i[20],
    wbs_adr_i[19],
    wbs_adr_i[18],
    wbs_adr_i[17],
    wbs_adr_i[16],
    wbs_adr_i[15],
    wbs_adr_i[14],
    wbs_adr_i[13],
    wbs_adr_i[12],
    wbs_adr_i[11],
    wbs_adr_i[10],
    wbs_adr_i[9],
    wbs_adr_i[8],
    wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .wbs_dat_i({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}),
    .wbs_dat_o({wbs_dat_o[31],
    wbs_dat_o[30],
    wbs_dat_o[29],
    wbs_dat_o[28],
    wbs_dat_o[27],
    wbs_dat_o[26],
    wbs_dat_o[25],
    wbs_dat_o[24],
    wbs_dat_o[23],
    wbs_dat_o[22],
    wbs_dat_o[21],
    wbs_dat_o[20],
    wbs_dat_o[19],
    wbs_dat_o[18],
    wbs_dat_o[17],
    wbs_dat_o[16],
    wbs_dat_o[15],
    wbs_dat_o[14],
    wbs_dat_o[13],
    wbs_dat_o[12],
    wbs_dat_o[11],
    wbs_dat_o[10],
    wbs_dat_o[9],
    wbs_dat_o[8],
    wbs_dat_o[7],
    wbs_dat_o[6],
    wbs_dat_o[5],
    wbs_dat_o[4],
    wbs_dat_o[3],
    wbs_dat_o[2],
    wbs_dat_o[1],
    wbs_dat_o[0]}),
    .wbs_sel_i({wbs_sel_i[3],
    wbs_sel_i[2],
    wbs_sel_i[1],
    wbs_sel_i[0]}),
    .wmask_o({\wmask[3] ,
    \wmask[2] ,
    \wmask[1] ,
    \wmask[0] }));
endmodule
