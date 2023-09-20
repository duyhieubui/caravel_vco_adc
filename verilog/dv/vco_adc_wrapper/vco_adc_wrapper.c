/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

#define reg_mprj_slave (*(volatile uint32_t*)0x30000000)

// --------------------------------------------------------
#define reg_mprj_vco_adc (*(volatile uint32_t*)0x30000004)
#define reg_mprj_status  (*(volatile uint32_t*)0x30000008)
#define reg_mprj_no_data (*(volatile uint32_t*)0x3000000C)

#define FILTER_2_EN	(1 << 31)
#define FILTER_1_EN	(1 << 30)
#define FILTER_0_EN	(1 << 29)
#define VCO_2_EN	(1 << 28)
#define VCO_1_EN	(1 << 27)
#define VCO_0_EN	(1 << 26)
#define ADC_SEL(a)      ((a & 0x3) << 24)
#define CLEAR_WPTR	(1 << 23)
#define CLEAR_RPTR	(1 << 22)
#define IO_EN		(1 << 21)
#define NUM_SAMPLES(a)  (((a-1) & 0x7FF) << 10)
#define OVERSAMPLE(a)   (((a-1) & 0x3FF))
#define VCO_ADC0_EN	(FILTER_0_EN | VCO_0_EN | ADC_SEL(0))
#define VCO_ADC1_EN	(FILTER_1_EN | VCO_1_EN | ADC_SEL(1))
#define VCO_ADC2_EN	(FILTER_2_EN | VCO_2_EN | ADC_SEL(2))

#define VCO_IDLE    0x0
#define VCO_WORKING 0x1
#define VCO_EMPTY   0x2
#define VCO_FULL    0x3

static uint32_t mprj_set_config(uint32_t enable, uint32_t ovs) {
  // enable sinc3
  uint32_t cfg = (enable << 31);
  cfg |= 1 << 26;
  cfg |= ovs & 0x3FF;
  // enable vco0

  return cfg;
}

static uint32_t read_data(uint32_t* data, int len) {
  for (int i = 0; i < len; ++i)
    data[i] = reg_mprj_vco_adc;
}
static uint32_t vco_data[32];

void main()
{
    // The upper GPIO pins are configured to be output
    // and accessble to the management SoC.
    // Used to flag the start/end of a test
    // The lower GPIO pins are configured to be output
    // and accessible to the user project.  They show
    // the project count value, although this test is
    // designed to read the project count through the
    // logic analyzer probes.
    // I/O 6 is configured for the UART Tx line
    reg_spi_enable = 1;
    reg_wb_enable = 1;
    
/*     reg_spimaster_config = 0xb002;      // Apply stream mode */

/* #ifdef USE_PLL */
/*     reg_spimaster_data = 0x80;          // Write 0x80 (write mode) */
/*     reg_spimaster_data = 0x08;          // Write 0x18 (start address) */
/*     reg_spimaster_data = 0x01;          // Write 0x01 to PLL enable, no DCO mode */
/*     reg_spimaster_config = 0xa102;      // Release CSB (ends stream mode) */

/*     reg_spimaster_config = 0xb002;      // Apply stream mode */
/*     reg_spimaster_data = 0x80;          // Write 0x80 (write mode) */
/*     reg_spimaster_data = 0x11;          // Write 0x11 (start address) */
/*     reg_spimaster_data = 0x06;          // Write 0x03 to PLL output divider */
/*     reg_spimaster_config = 0xa102;      // Release CSB (ends stream mode) */

/*     reg_spimaster_config = 0xb002;      // Apply stream mode */
/*     reg_spimaster_data = 0x80;          // Write 0x80 (write mode) */
/*     reg_spimaster_data = 0x09;          // Write 0x09 (start address) */
/*     reg_spimaster_data = 0x00;          // Write 0x00 to clock from PLL (no bypass) */
/*     reg_spimaster_config = 0xa102;      // Release CSB (ends stream mode) */

/*     reg_spimaster_config = 0xb002;      // Apply stream mode */
/*     reg_spimaster_data = 0x80;          // Write 0x80 (write mode) */
/*     reg_spimaster_data = 0x12;          // Write 0x12 (start address) */
/*     reg_spimaster_data = 0x03;          // Write 0x03 to feedback divider (was 0x04) */
/*     reg_spimaster_config = 0xa102;      // Release CSB (ends stream mode) */
/* #endif */

    reg_mprj_datal = 0x00000000;
    reg_mprj_datah = 0x00000000;

    reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_36 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_35 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_34 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_33 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_32 = GPIO_MODE_MGMT_STD_OUTPUT;

    reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_29 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_28 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_26 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_25 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_24 = GPIO_MODE_MGMT_STD_OUTPUT;

    // analog_io 9-10
    reg_mprj_io_16 = GPIO_MODE_USER_STD_ANALOG;
    reg_mprj_io_17 = GPIO_MODE_USER_STD_ANALOG;
    // analog_io 12-13
    reg_mprj_io_20 = GPIO_MODE_USER_STD_ANALOG;
    reg_mprj_io_19 = GPIO_MODE_USER_STD_ANALOG;
    // analog_io 15-16
    reg_mprj_io_23 = GPIO_MODE_USER_STD_ANALOG;
    reg_mprj_io_22 = GPIO_MODE_USER_STD_ANALOG;

    /* Apply configuration */
    reg_mprj_xfer = 1;
    while (reg_mprj_xfer == 1);

    reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]

    // Flag start of the test
    reg_mprj_datal = 0xB4000000;

    reg_mprj_slave = VCO_ADC0_EN | NUM_SAMPLES(2048) | OVERSAMPLE(16);
    while(((reg_mprj_status >> 1) & 0x1) == 0);
    // read until empty
    for (int i = 0; i < 2048; ++i)
      vco_data[0] = reg_mprj_vco_adc;
    // reread the data memory
    //reg_mprj_slave = CLEAR_RPTR | NUM_SAMPLES(64) | OVERSAMPLE(16);
    //reg_mprj_slave = NUM_SAMPLES(64) | OVERSAMPLE(16);
    //for (int i = 0; i < 64; ++i)
    //  vco_data[0] = reg_mprj_vco_adc;

    /*
    // reset wptr & rptr
    reg_mprj_slave = (1<< 30) | (1 << 29) | (1 << 26) | 255;
    // sample again
    reg_mprj_slave = mprj_set_config(1, 255);
    while(((reg_mprj_status >> 1) & 0x1) == 0);
    // read until empty
    for (int i = 0; i < 16; ++i)
      vco_data[0] = reg_mprj_vco_adc;
    */
    // Flag end of the test
    reg_mprj_datal = 0xB9000000;
}
