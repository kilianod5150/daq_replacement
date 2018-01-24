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
// FILE NAME :   CED1Z_interface.v
// MODULE NAME : CED1Z_interface
// AUTHOR : Adrian Costina
// AUTHOR’S EMAIL : adrian.costina@analog.com
// -----------------------------------------------------------------------------
// SVN REVISION: $WCREV$
// -----------------------------------------------------------------------------
// KEYWORDS : CED1Z
// -----------------------------------------------------------------------------
// PURPOSE : Module used to implement communication to the CED1Z board.
// Registers:
// 0 AD_ADC_MSB - it is the same as AD_ADC_LSB
// 1 AD_ADC_LSB - it stores the last read ADC value
// 2 N/A        - not used
// 3 CONFIG2    - configuration register, not used in this revision
// 4 CONFIG1    - main configuration register
// 5 N/A        - not used
// 6 CONFIG3    - configuration register used to store the ration between the
//                input clock and sample rate of the AD7626
// 7 CONFIG4    - configuration register, not used in this revision
// 0x10-0x17    - Channels from the ADAS3022
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy      : reset active HIGH
// Clock Domains       : mclk_i 50MHz generated from the master clock of
//                       100MHz by a PLL
// Critical Timing     :
// Test Features       :
// Asynchronous I/F    :
// Instantiations      :
// Synthesizable (y/n) : y
// Target Device       : Cyclone II EP2C5F256C7N from ADAS3023 EvalBoard
// Other               :
// -----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

//------------------------------------------------------------------------------
//----------- Module Declaration -----------------------------------------------
//------------------------------------------------------------------------------

module CED1Z_interface(
// CED1Z
    input               mclk_i,
    input               reset_i,
    input       [4:0]   addr_i,
    input               brd_n_i,
    input               bwr_n_i,

    output reg          b_busy_o,

    inout       [15:0]  d_io,

// ADC
    input       [127:0] data_channels_i, // Data read from the ADC
    input               data_rd_ready_i, // When set to high the data read from the ADC is available on the data_o bus
    input               data_wr_ready_i, // Used to signal the status of an ADC write: 0 - write in progress, 1 - write complete

    output reg          wr_data_n_o,     // Active low signal to initiate a data write to the ADC
    output reg  [15:0]  data_o,          // Data to be written to the ADC

// EvalBoard
    output reg          en_2p5v_n_o,
    output reg          en_5p0v_n_o,
    output reg          en_3p3v_n_o
);

//-----------------------------------------------------------------------------
//----------- Local Parameters ------------------------------------------------
//-----------------------------------------------------------------------------

parameter HIGH =  1'b1;
parameter LOW  =  1'b0;

parameter AD_ADC_MSB    = 5'h0;
parameter AD_ADC_LSB    = 5'h1;
parameter APCONFIG      = 5'h2;
parameter COMMCFGR      = 5'h3;
parameter ADCCFG        = 5'h4;
parameter IDSTRING      = 5'h5;
parameter PSUDATA       = 5'h6; // NOT USED
parameter TRIMDATA      = 5'h7; // NOT USED
parameter TEST          = 5'h8;
parameter AUXCFG        = 5'h9; // NOT USED
parameter SAMPDIV       = 5'hA;
parameter SOCTIME       = 5'hB; // NOT USED
parameter SEQPROG       = 5'hC;
parameter CHANNEL0      = 5'h10;
parameter CHANNEL1      = 5'h11;
parameter CHANNEL2      = 5'h12;
parameter CHANNEL3      = 5'h13;
parameter CHANNEL4      = 5'h14;
parameter CHANNEL5      = 5'h15;
parameter CHANNEL6      = 5'h16;
parameter CHANNEL7      = 5'h17;

//------------------------------------------------------------------------------
//----------- Registers Declarations -------------------------------------------
//------------------------------------------------------------------------------

reg [15:0]  Dreg;
reg [15:0]  adc_msb;
reg [15:0]  adc_lsb;
reg [15:0]  apconfig;
reg [15:0]  commcfgr;
reg [15:0]  adccfg;
reg [15:0]  psudata;
reg [15:0]  trimdata;
reg [15:0]  test;
reg [15:0]  auxcfg;
reg [15:0]  sampdiv;
reg [15:0]  soctime;
reg [15:0]  seqprog;
reg [15:0]  channel0;
reg [15:0]  channel1;
reg [15:0]  channel2;
reg [15:0]  channel3;
reg [15:0]  channel4;
reg [15:0]  channel5;
reg [15:0]  channel6;
reg [15:0]  channel7;
reg         wr_en;
reg         b_busy_p1;

//------------------------------------------------------------------------------
//----------- Assign/Always Blocks ---------------------------------------------
//------------------------------------------------------------------------------

/* Tri-state Buffer for Databus */
assign d_io = (brd_n_i == 1'b0) ? Dreg : 16'hZZZZ;

/* Register clk enable signals on falling edge */
always @ (negedge mclk_i)
begin
   wr_en    <= ~bwr_n_i;
end

/* Write from CED board */
always @ (posedge mclk_i)
begin
    if (data_wr_ready_i == 1'b1)
    begin
        wr_data_n_o     <= 1'b1;
    end
    if (reset_i == 1'b1)
    begin
        apconfig    <= 16'b0;
        commcfgr    <= 16'b0;
        adccfg      <= 16'b0;
        psudata     <= 16'b0;
        trimdata    <= 16'b0;
        test        <= 16'b0;
        auxcfg      <= 16'b0;
        sampdiv     <= 16'b0;
        seqprog     <= 16'b0;
        wr_data_n_o <= 1'b1;
    end
    else if (wr_en == 1'b1)
    begin
        case (addr_i[4:0])
            APCONFIG      :
            begin
                apconfig  <= d_io;
            end
            COMMCFGR      :
            begin
                commcfgr  <= d_io;
            end
            ADCCFG        :
            begin
                adccfg      <= d_io;
                wr_data_n_o <= 1'b0;
                data_o      <= d_io;
            end
            PSUDATA       :
            begin
                psudata   <= d_io;
            end
            TRIMDATA      :
            begin
                trimdata  <= d_io;
            end
            TEST          :
            begin
                test      <= d_io;
            end
            AUXCFG        :
            begin
                auxcfg    <= d_io;
            end
            SAMPDIV       :
            begin
                sampdiv   <= d_io;
            end
            SOCTIME       :
            begin
                soctime   <= d_io;
            end
            SEQPROG       :
            begin
                seqprog   <= d_io;
            end
            default       :  soctime      <= d_io;
        endcase
    end
end

/* CED board reads databus */
always @ (brd_n_i, adc_msb, adc_lsb, apconfig, commcfgr, adccfg, psudata, trimdata, test, auxcfg, sampdiv, soctime, seqprog, addr_i, channel0, channel1, channel2, channel3, channel4, channel5, channel6, channel7 )
begin
      case (addr_i[4:0])
         AD_ADC_MSB :  Dreg     <= adc_msb;
         AD_ADC_LSB :  Dreg     <= adc_lsb;
         APCONFIG   :  Dreg     <= apconfig;
         COMMCFGR   :  Dreg     <= commcfgr;
         ADCCFG     :  Dreg     <= adccfg;
         PSUDATA    :  Dreg     <= psudata;
         TRIMDATA   :  Dreg     <= trimdata;
         TEST       :  Dreg     <= test;
         AUXCFG     :  Dreg     <= auxcfg;
         SAMPDIV    :  Dreg     <= sampdiv;
         SOCTIME    :  Dreg     <= soctime;
         SEQPROG    :  Dreg     <= seqprog;
         CHANNEL0   :  Dreg     <= channel0;
         CHANNEL1   :  Dreg     <= channel1;
         CHANNEL2   :  Dreg     <= channel2;
         CHANNEL3   :  Dreg     <= channel3;
         CHANNEL4   :  Dreg     <= channel4;
         CHANNEL5   :  Dreg     <= channel5;
         CHANNEL6   :  Dreg     <= channel6;
         CHANNEL7   :  Dreg     <= channel7;
         default    :  Dreg     <= adc_msb;

      endcase
end

always @(apconfig)
begin
    //PLACEHOLDER  <= config1 [15];
    //PLACEHOLDER  <= config1 [14];
    //PLACEHOLDER  <= config1 [13];
    //PLACEHOLDER  <= apconfig [12];
    en_5p0v_n_o    <= apconfig[10];    //activates the on board 5V supply
    en_3p3v_n_o    <= apconfig[11];    //activates the on board 7V supply
    en_2p5v_n_o    <= apconfig[9];     //activates the on board 2.5V supply
    //PLACEHOLDER  <= config1_i [8];
    //PLACEHOLDER  <= config1_i [7];
    //PLACEHOLDER  <= config1_i [6];
    //PLACEHOLDER  <= config1_i [5];
    //PLACEHOLDER  <= config1_i [4];
    //PLACEHOLDER  <= config1_i [3];
    //PLACEHOLDER  <= ~config1_i [2];
    //PLACEHOLDER  <= ~config1_i [1];
    //PLACEHOLDER  <= config1_i[0];
end

always @(posedge mclk_i)
begin
    if (reset_i == 1'b1)
    begin
        b_busy_o    <= 1'b1;
        b_busy_p1   <= 1'b1;
        adc_lsb     <= 16'b0;
        adc_msb     <= 16'b0;
        channel0    <= 16'h0;
        channel1    <= 16'h0;
        channel2    <= 16'h0;
        channel3    <= 16'h0;
        channel4    <= 16'h0;
        channel5    <= 16'h0;
        channel6    <= 16'h0;
        channel7    <= 16'h0;
    end
    else
    begin
        b_busy_p1   <= data_rd_ready_i;
        b_busy_o    <= b_busy_p1;
        if(data_rd_ready_i == 1'b1 && b_busy_p1 == 1'b0)
        begin
            adc_lsb     <= data_channels_i[127:112];
            adc_msb     <= data_channels_i[127:112];
            channel7    <= data_channels_i[15:0];
            channel6    <= data_channels_i[31:16];
            channel5    <= data_channels_i[47:32];
            channel4    <= data_channels_i[63:48];
            channel3    <= data_channels_i[79:64];
            channel2    <= data_channels_i[95:80];
            channel1    <= data_channels_i[111:96];
            channel0    <= data_channels_i[127:112];
        end
    end
end

endmodule
