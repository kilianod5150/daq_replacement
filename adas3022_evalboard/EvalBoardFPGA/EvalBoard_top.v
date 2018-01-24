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
// FILE NAME :  EvalBoard_top.v
// MODULE NAME :EvalBoard_top
// AUTHOR : Adrian Costina
// AUTHOR’S EMAIL : Adrian.Costina@analog.com
// -----------------------------------------------------------------------------
// SVN REVISION: $WCREV$
// -----------------------------------------------------------------------------
// KEYWORDS : ADAS3022, EvalBoard
// -----------------------------------------------------------------------------
// PURPOSE : Top module used on the ADAS3022Evalo board to retrieve data from
// the ADAS3022 and sent it to the CED1Z board using a standard interface
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy      : reset active HIGH
// Clock Domains       : m_clk      100MHz on board clock
//                       dspclk_i   48/96 MHz CED1Z clock
//                       fpga_clock_s Output from the PLL, 50 MHz
// Critical Timing     :
// Test Features       :
// Asynchronous I/F    :
// Instantiations      :
// Synthesizable (y/n) : Y
// Target Device       : Cyclone II EP2C5F256C7N from ADAS3022 EvalBoard
// Other               :
// -----------------------------------------------------------------------------

`timescale 1 ns/ 100 ps

//------------------------------------------------------------------------------
//----------- Module Declaration -----------------------------------------------
//------------------------------------------------------------------------------

module EvalBoard_top(

//----------- Ports Declarations -----------------------------------------------
//CED1Z
    input           m_clk_i,        // 100Mhz clk
    input           dspclk_i,       // Not used
    input           breset_i,       // Reset pin from the CED1Z board, active high
    input           brd_n_i,        // READ signal from the CED1Z board
    input           bwr_n_i,        // WRITE signal from the CED1Z board
    input           control_i,      // Not used
    input   [4:0]   ad_i,           // ADDRESS signal from the CED1Z board

    output          b_busy_o,       // BUSY signal to the CED1Z board

    inout   [15:0]  bd_io,

//ADAS3022
    input           busy_i,         // BUSY signal from the ADAS3022
    input           sdo_i,          // SDO signal from the ADAS3022

    output          csb_o,          // CSB signal to the ADAS3022
    output          cnv_o,          // CNV signal to the ADAS3022
    output          din_o,          // DIN signal to the ADAS3022
    output          reset_o,        // RESET signal to the ADAS3022
    output          pd_o,           // PD signal to the ADAS3022
    output          sck_o,          // SCK signal to the ADAS3022

//EVALBOARD
    output          en_3p3v_n_o,    // Activate 3.3V supply
    output          en_5p0v_n_o,    // Activate 5V supply
    output          en_2p5v_n_o,    // Activate 2.5V supply
    output          adcok_o,        // CR2 LED
    output          pllok_o         // CR1 LED

);

//------------------------------------------------------------------------------
//----------- Wires Declarations -----------------------------------------------
//------------------------------------------------------------------------------
wire    [15:0]  data_i_adc_s;
wire    [127:0] data_channels_s;
wire            fpga_clock_s;
wire            wr_data_s;
wire            data_wr_ready_adc_s;
wire            data_rd_ready_adc_s;
wire            cms_o;
wire            cpha_o;

//------------------------------------------------------------------------------
//----------- Assign/Always Blocks ---------------------------------------------
//------------------------------------------------------------------------------
assign adcok_o  = cpha_o;
assign pllok_o  = cms_o;

//------------------------------------------------------------------------------
//----------- Modules Instantiations -------------------------------------------
//------------------------------------------------------------------------------

CED1Z_interface  CED1Z_interface_inst(
    .mclk_i(fpga_clock_s),
    .reset_i(breset_i),
    .brd_n_i(brd_n_i),
    .bwr_n_i(bwr_n_i),
    .addr_i(ad_i),
    .d_io(bd_io),
    .b_busy_o(b_busy_o),
    .data_channels_i(data_channels_s),
    .data_rd_ready_i(data_rd_ready_adc_s),
    .data_wr_ready_i(data_wr_ready_adc_s),
    .wr_data_n_o(wr_data_s),
    .data_o(data_i_adc_s),
    .en_2p5v_n_o(en_2p5v_n_o),
    .en_5p0v_n_o(en_5p0v_n_o),
    .en_3p3v_n_o(en_3p3v_n_o)
);

ADAS3022 ADAS3022_inst(
    .fpga_clk_i(fpga_clock_s),
    .adc_clk_i (fpga_clock_s),
    .reset_i(breset_i),
    .wr_data_n_i(wr_data_s),
    .data_i(data_i_adc_s),
    .data_channels_o(data_channels_s),
    .data_rd_ready_o(data_rd_ready_adc_s),
    .data_wr_ready_o(data_wr_ready_adc_s),
    .MISO_i(sdo_i),
    .BUSY_i(busy_i),

    .cpha_o(cpha_o),
    .cms_o(cms_o),

    .MOSI_o(din_o),
    .SCLK_o(sck_o),
    .SS_n_o(csb_o),
    .CNV_o(cnv_o),
    .RESET_o(reset_o),
    .PD_o (pd_o)
);

pll pll_inst(
    .inclk0(m_clk_i),
    .c0(fpga_clock_s),
    .locked()
);

endmodule
