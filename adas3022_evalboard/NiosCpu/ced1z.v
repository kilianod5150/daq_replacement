// -----------------------------------------------------------------------------
//
// Copyright 2011(c) Analog Devices, Inc.
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//  - Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//  - Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//  - Neither the name of Analog Devices, Inc. nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//  - The use of this software may or may not infringe the patent rights
//    of one or more patent holders.  This license does not release you
//    from the requirement that you obtain separate licenses from these
//    patent holders to use this software.
//  - Use of the software either in source or binary form, must be run
//    on or directly connected to an Analog Devices Inc. component.
//
// THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT, MERCHANTABILITY
// AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// INTELLECTUAL PROPERTY RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// -----------------------------------------------------------------------------
// FILE NAME :      ced1z.v
// MODULE NAME :    ced1z
// AUTHOR :         Adrian Costina
// AUTHOR’S EMAIL : adrian.costina@analog.com
// -----------------------------------------------------------------------------
// SVN REVISION: $WCREV$
// -----------------------------------------------------------------------------
// KEYWORDS : AD7626, Avalon
// -----------------------------------------------------------------------------
// PURPOSE :This module is intended  as a wrapper to the AD7626 hdl driver and
// write master. Used to acquire data from the AD7626EDZ and store it in
// system memory
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy      :
// Clock Domains       : clk_i 48MHz
// Critical Timing     :
// Test Features       :
// Asynchronous I/F    :
// Instantiations      :
// Synthesizable (y/n) : y
// Target Device       : EP1C4F400C6
// Other               :
// -----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module ced1z (
    input   USB_CLOCKOUT,   // Clock
    input   RESET_N,        // Reset
// SRAM
    inout   SRAM_D0,
    inout   SRAM_D1,
    inout   SRAM_D2,
    inout   SRAM_D3,
    inout   SRAM_D4,
    inout   SRAM_D5,
    inout   SRAM_D6,
    inout   SRAM_D7,
    inout   SRAM_D8,
    inout   SRAM_D9,
    inout   SRAM_D10,
    inout   SRAM_D11,
    inout   SRAM_D12,
    inout   SRAM_D13,
    inout   SRAM_D14,
    inout   SRAM_D15,
    output  SRAM_A0,
    output  SRAM_A1,
    output  SRAM_A2,
    output  SRAM_A3,
    output  SRAM_A4,
    output  SRAM_A5,
    output  SRAM_A6,
    output  SRAM_A7,
    output  SRAM_A8,
    output  SRAM_A9,
    output  SRAM_A10,
    output  SRAM_A11,
    output  SRAM_A12,
    output  SRAM_A13,
    output  SRAM_A14,
    output  SRAM_A15,
    output  SRAM_A16,
    output  SRAM_A17,
    output  SRAM_A18,
    output  SRAM_A19,
    output  SRAM_A20,
    output  SRAM_WE_N,
    output  SRAM_OE_N,
    output  SRAM_CE1_N,
// LEDS
    output  LED_D15,
    output  LED_IO,
    output  LED_TRANSFER,

// Activation of the output power
    output  PWR_EN_REG_CLK,
    output  PWR_I2C_A1,
    output  PWR_I2C_A0,
    output  PWR_I2C_WR_N,
    output  PWR_I2C_RD_N,
    output  PWR_I2C_CS_N,

    inout  PWR_D7,
    inout  PWR_D6,
    inout  PWR_D5,
    inout  PWR_D4,
    inout  PWR_D3,
    inout  PWR_D2,
    inout  PWR_D1,
    inout  PWR_D0,

// ADAS3022 signals
    output  GPIO4,
    output  GPIO5,
    output  I2C_SCL,
    output  I2C_SDA,
    output  SPORT_DR0SEC,
    output   TMR0,

    input   RXINT,      //BBUSY_i
    output  PAR_RD,
    output  PAR_WR,

    inout   PAR_D0,
    inout   PAR_D1,
    inout   PAR_D2,
    inout   PAR_D3,
    inout   PAR_D4,
    inout   PAR_D5,
    inout   PAR_D6,
    inout   PAR_D7,
    inout   PAR_D8,
    inout   PAR_D9,
    inout   PAR_D10,
    inout   PAR_D11,
    inout   PAR_D12,
    inout   PAR_D13,
    inout   PAR_D14,
    inout   PAR_D15
);

uC uC_inst
    (
      .baddr_o_from_the_ADAS3022_0    ({SPORT_DR0SEC,I2C_SDA,I2C_SCL,GPIO5,GPIO4}),
      .bbusy_i_to_the_ADAS3022_0      (RXINT),
      .bdb_io_to_and_from_the_ADAS3022_0        ({PAR_D15,PAR_D14,PAR_D13,PAR_D12, PAR_D11, PAR_D10, PAR_D9, PAR_D8, PAR_D7, PAR_D6, PAR_D5, PAR_D4, PAR_D3, PAR_D2, PAR_D1, PAR_D0}),
      .brd_n_o_from_the_ADAS3022_0    (PAR_RD),
      .breset_o_from_the_ADAS3022_0   (TMR0),
      .bwr_n_o_from_the_ADAS3022_0    (PAR_WR),
      .areset_to_the_pll                 (~RESET_N),
      .bidir_port_to_and_from_the_pwr_data ({PWR_D7,PWR_D6,PWR_D5,PWR_D4,PWR_D3,PWR_D2,PWR_D1,PWR_D0}),
      .ext_clk                           (USB_CLOCKOUT),
      .locked_from_the_pll               (),
      .out_port_from_the_leds            ({LED_IO,LED_D15,LED_TRANSFER}),
      .out_port_from_the_i2c_int         ({ PWR_I2C_A1, PWR_I2C_A0, PWR_I2C_CS_N, PWR_I2C_RD_N, PWR_I2C_WR_N }),
      .out_port_from_the_pwr_en_clk      (PWR_EN_REG_CLK),
      .phasedone_from_the_pll            (),
      .reset_n                           (RESET_N),
      .select_n_to_the_sram              (SRAM_CE1_N),
      .sys_clk                           (),
      .tri_state_bridge_0_address        ({SRAM_A20,SRAM_A19,SRAM_A18,SRAM_A17,SRAM_A16,SRAM_A15,SRAM_A14,SRAM_A13,SRAM_A12,SRAM_A11,SRAM_A10,SRAM_A9,SRAM_A8,SRAM_A7,SRAM_A6,SRAM_A5,SRAM_A4,SRAM_A3,SRAM_A2,SRAM_A1,SRAM_A0}),
      .tri_state_bridge_0_data           ({SRAM_D15,SRAM_D14,SRAM_D13,SRAM_D12,SRAM_D11,SRAM_D10,SRAM_D9,SRAM_D8,SRAM_D7,SRAM_D6,SRAM_D5,SRAM_D4,SRAM_D3,SRAM_D2,SRAM_D1,SRAM_D0}),
      .tri_state_bridge_0_readn          (SRAM_OE_N),
      .tri_state_bridge_0_writen         (SRAM_WE_N)
    );

endmodule
