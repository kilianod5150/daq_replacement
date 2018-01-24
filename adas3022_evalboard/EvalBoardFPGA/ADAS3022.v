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
// FILE NAME :      ADAS3022.v
// MODULE NAME :    ADAS3022
// AUTHOR : Adrian Costina
// AUTHOR’S EMAIL : Adrian.Costina@analog.com
// -----------------------------------------------------------------------------
// SVN REVISION: $WCREV$
// -----------------------------------------------------------------------------
// KEYWORDS : ADAS3022, EvalBoard
// -----------------------------------------------------------------------------
// PURPOSE : Module used to retrieve data from the ADAS3022
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy      : reset on '1'
// Clock Domains       : fpga_clk_i 50MHz generated from the master clock of
//                       100MHz by a PLL
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
module ADAS3022 (
//----------- Ports Declarations -----------------------------------------------
// Clock and reset signals
        input               fpga_clk_i,         // System clock
        input               adc_clk_i,          // Clock to be applied to ADC to drive the conversions
        input               reset_i,            // Active high reset signal

// IP control and data interface
        input               wr_data_n_i,        // Active low signal to initiate a data write to the ADC
        input      [15:0]   data_i,             // Data to be written to the ADC

        output reg [127:0]  data_channels_o,    // Data read from the ADC
        output reg          data_rd_ready_o,    // When set to high the data read from the ADC is available on the data bus
        output reg          data_wr_ready_o,    // Used to signal the status of an ADC write: 0 - write in progress, 1 - write complete
// Display signals
        output reg          cms_o,              // Signal used to display the configuration of the CMS bit
        output reg          cpha_o,             // Signal used to display the configuration of the CPHA bit
// External ADC connections
        input               MISO_i,             // Master Input Slave Output
        input               BUSY_i,             // BUSY Signal from ADI IC

        output              MOSI_o,             // Master Output Slave Input
        output              SCLK_o,             // Serial Data Clock
        output reg          SS_n_o,             // Slave Select pin
        output reg          CNV_o,              // Pin to control the Start of a new Conversion
        output              RESET_o,            // Active High
        output              PD_o                // Active high
);

//------------------------------------------------------------------------------
//----------- Local Parameters -------------------------------------------------
//------------------------------------------------------------------------------
// State Machine - State Names (parameters)
parameter IDLE              = 8'b00000001;  // state in which a write can be performed to ADAS3022
parameter START_CNV         = 8'b00000010;  // start the conversion process
parameter START_CS          = 8'b00000100;  // pull down CS
parameter READ_DATA         = 8'b00001000;  // perform read data, before busy is activated
parameter SELECT_CHANNEL    = 8'b00010000;  // depending on the configuration, selects the next state
parameter SYNCHRONIZE_COM   = 8'b00100000;  // state in which samples are referenced to COM pin
parameter SYNCHRONIZE_DIFF  = 8'b01000000;  // state in which samples are differential
parameter WAIT_CYCLE_END    = 8'b10000000;  // waits for the conversion time to pass

parameter real      FPGA_CLK                = 40; // MHz
parameter real      ADC_CYCLE_TIME_WARP     = 1;  // cycle time for warp speed / 500KSPS
parameter real      ADC_CYCLE_TIME_NORMAL   = 1.1;  // cycle time for normal speed / 500 KSPS

parameter [31:0]    CYCLE_CNT_WARP          = FPGA_CLK * ADC_CYCLE_TIME_WARP - 2;
parameter [31:0]    CYCLE_CNT_NORMAL        = FPGA_CLK * ADC_CYCLE_TIME_NORMAL - 2;

//------------------------------------------------------------------------------
//----------- Registers Declarations -------------------------------------------
//------------------------------------------------------------------------------
// State Machine Registers
reg [7:0]   present_state;  // Current State of the State Machine
reg [7:0]   next_state;     // Next State of the State Machine
reg         SCLK_en;        // Used to generate SCLK signal
reg [15:0]  tx_reg;         // Transmitted data
reg [16:0]  tx_reg_d;
reg [15:0]  rx_reg;
reg [31:0]  cycle_cnt;
reg [ 4:0]  sclk_cnt;
reg         reset_d1;
reg         com;
reg [1:0]   seq;
reg [2:0]   inx;
reg [2:0]   channel;
reg [2:0]   sync;

//------------------------------------------------------------------------------
//----------- Assign/Always Blocks ---------------------------------------------
//------------------------------------------------------------------------------
assign SCLK_o           = SCLK_en ? adc_clk_i : 1'b1;       // clock is iddle HIGH
assign MOSI_o           = tx_reg_d[16];
assign RESET_o          = reset_i | reset_d1;
assign PD_o             = 1'b0;                             // PD is constantly LOW, not used

always @(negedge adc_clk_i)                                 // Process for receiving data from ADAS3022
begin
    if (reset_i == 1'b1)
    begin
        rx_reg      <= 16'h0;
    end
    else if(SCLK_en == 1'b1)
    begin
        rx_reg      <= { rx_reg[14:0], MISO_i };
    end
end

always @(negedge adc_clk_i)                                 // Process for transmitting data to ADAS3022
begin
    if (reset_i == 1'b1)
    begin
        tx_reg_d    <= 16'h0;
    end
    else if(SCLK_en == 1'b1)
    begin
        tx_reg_d    <= { tx_reg_d[15:0], 1'b0 };
    end
    else
    begin
        tx_reg_d    <= tx_reg;
        tx_reg_d[16]<= tx_reg[15];
    end
end

always @(posedge fpga_clk_i)                // Process for timing the conversion time. In the current silicon, maximum sample frequency is 500KHz
begin
    if (present_state == IDLE)
    begin
        if (cms_o == 1'b1)
        begin
            cycle_cnt   <= CYCLE_CNT_NORMAL; // For default mode the acquisition time is 1.1 us
        end
        else
        begin
            cycle_cnt   <=  CYCLE_CNT_WARP;  // WARP mode, acquisition time is 1 us.
        end
    end
    else if (cycle_cnt > 0)
    begin
        cycle_cnt   <= cycle_cnt - 32'h1;
    end
end

// State Machine - Select State
always @( present_state, sclk_cnt, cycle_cnt, sync, com )
begin
    next_state <= present_state;

    case(present_state)
        IDLE:
        begin
            next_state      <= START_CNV;
        end
        START_CNV:
        begin
            next_state      <= START_CS;
        end
        START_CS:
        begin
            next_state      <= READ_DATA;
        end
        READ_DATA:
        begin
            if(sclk_cnt == 5'b0)
            begin
                next_state  <= SELECT_CHANNEL;
            end
        end
        SELECT_CHANNEL:
        begin
            if (sync == 3'h0)       // only acquire data after the two SOC EOC pass from the last command word written
            begin
                if(com == 1'b1)     // selects between single ended and differential acquisition
                begin
                    next_state  <= SYNCHRONIZE_COM;
                end
                else
                begin
                    next_state  <= SYNCHRONIZE_DIFF;
                end
            end
            else
            begin
                next_state  <= WAIT_CYCLE_END;
            end
        end
        SYNCHRONIZE_COM:            // adds new data to the channel
        begin
            next_state  <= WAIT_CYCLE_END;
        end
        SYNCHRONIZE_DIFF:           // adds new data to the channel
        begin
            next_state  <= WAIT_CYCLE_END;
        end
        WAIT_CYCLE_END:             // wait for cycle time to pass
        begin
            if (cycle_cnt == 32'b0)
            begin
                next_state  <= IDLE;
            end
        end
        default:
        begin
            next_state      <= IDLE;
        end
    endcase
end

// State Machine - Select Output
always @(posedge fpga_clk_i)
begin
    reset_d1        <= reset_i;

    if(reset_i == 1'b1)
    begin
        present_state               <= IDLE;
        tx_reg                      <= 16'h0000;
        data_channels_o [ 127:0]    <= 128'h0;
        channel                     <= 3'h0;
        inx                         <= 3'h0;
        com                         <= 1'b1;
        seq                         <= 2'h0;
        cpha_o                      <= 1'h0;
        cms_o                       <= 1'h1;
    end
    else
    begin
        present_state           <= next_state;
        case(present_state)
            IDLE:
            begin
                if (wr_data_n_i == 0)   // if a write has been performed from  CED1Z to ADCCFG register, update the configuration register on ADAS3022
                begin
                    tx_reg                      <= data_i;
                    data_wr_ready_o             <= 1'b1;
                    sync                        <= 3'h4;
                    channel                     <= 3'h7;
                    inx                         <= data_i[14:12];
                    cpha_o                      <= data_i[0];
                    cms_o                       <= data_i[1];
                    com                         <= data_i[11];
                    seq                         <= data_i[5:4];
                    data_channels_o [ 127:0]    <= 128'h0;
                end
                else
                begin                   // if no write has been performed, keep DIN low
                    tx_reg      <= 16'h0;
                end
                SCLK_en         <= 1'b0;
                CNV_o           <= 1'b0;
                SS_n_o          <= 1'b1;
                data_rd_ready_o <= 1'b0;
                sclk_cnt        <= 5'h0f;
            end
            START_CNV:                  // start the conversion process. if sync > 0 decrement, for synchronization of the channels
            begin
                if (sync > 0)
                begin
                    sync        <= sync - 3'h1;
                end
                data_wr_ready_o <= 1'b0;
                SCLK_en         <= 1'b0;
                CNV_o           <= 1'b1;
                SS_n_o          <= 1'b1;
                data_rd_ready_o <= 1'b0;
            end
            START_CS:
            begin
                data_wr_ready_o <= 1'b0;
                SCLK_en         <= 1'b0;
                CNV_o           <= 1'b1;
                SS_n_o          <= 1'b0;
                data_rd_ready_o <= 1'b0;
            end
            READ_DATA:
            begin
                data_wr_ready_o <= 1'b0;
                SCLK_en         <= 1'b1;
                CNV_o           <= 1'b0;
                SS_n_o          <= 1'b0;
                data_rd_ready_o <= 1'b0;
                if( sclk_cnt > 0 )
                begin
                    sclk_cnt    <= sclk_cnt - 5'h1;
                end
            end
            SELECT_CHANNEL:             // increase the channel number
            begin
                if ( sync == 0 )
                begin
                    channel     <= channel + 3'h1;
                end
                data_wr_ready_o <= 1'b0;
                SCLK_en         <= 1'b0;
                CNV_o           <= 1'b0;
                SS_n_o          <= 1'b0;
            end
            SYNCHRONIZE_COM:
            begin
                case( channel )
                    3'h0:
                    begin
                        data_channels_o[127:112] <= rx_reg;
                        if (seq == 2'h3 && inx == 3'h0)
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h1:
                    begin
                        data_channels_o[111:96]  <= rx_reg;
                        if ( seq == 2'h3 && inx == 3'h1)
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h2:
                    begin
                        data_channels_o[95:80]  <= rx_reg;
                        if (seq == 2'h3 && inx == 3'h2)
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h3:
                    begin
                        data_channels_o[79:64]  <= rx_reg;
                        if (seq == 2'h3 && inx == 3'h3)
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h4:
                    begin
                        data_channels_o[63:48]  <= rx_reg;
                        if (seq == 2'h3 && inx == 3'h4)
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h5:
                    begin
                        data_channels_o[47:32]  <= rx_reg;
                        if (seq == 2'h3 && inx == 3'h5)
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h6:
                    begin
                        data_channels_o[31:16]  <= rx_reg;
                        if (seq == 2'h3 && inx == 3'h6)
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h7:
                    begin
                        data_channels_o[15:0]   <= rx_reg;
                        data_rd_ready_o         <= 1'b1;
                    end
                endcase
                data_wr_ready_o <= 1'b0;
                SCLK_en         <= 1'b0;
                CNV_o           <= 1'b0;
                SS_n_o          <= 1'b1;
            end
            SYNCHRONIZE_DIFF:
            begin
                case( channel )
                    3'h0:
                    begin
                        data_channels_o[127:112] <= rx_reg;
                        if (seq == 2'h3 && (inx == 3'h0 || inx == 3'h1))
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h1:
                    begin
                        data_channels_o[111:96]  <= rx_reg;
                        if ( seq == 2'h3 && (inx == 3'h2 || inx == 3'h3))
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    3'h2:
                    begin
                        data_channels_o[95:80]  <= rx_reg;
                        if (seq == 2'h3 && (inx == 3'h4 || inx == 3'h5))
                        begin
                            data_rd_ready_o <= 1'b1;
                            channel         <= 3'h7;
                        end
                    end
                    default:
                    begin
                        data_channels_o[79:64]  <= rx_reg;
                        data_rd_ready_o         <= 1'b1;
                        channel                 <= 3'h7;
                    end
                endcase
                data_wr_ready_o <= 1'b0;
                SCLK_en         <= 1'b0;
                CNV_o           <= 1'b0;
                SS_n_o          <= 1'b1;
            end
            WAIT_CYCLE_END:
            begin
                data_wr_ready_o <= 1'b0;
                SCLK_en         <= 1'b0;
                CNV_o           <= 1'b0;
                SS_n_o          <= 1'b1;
                data_rd_ready_o <= 1'b0;
            end
        endcase
    end
end

endmodule
