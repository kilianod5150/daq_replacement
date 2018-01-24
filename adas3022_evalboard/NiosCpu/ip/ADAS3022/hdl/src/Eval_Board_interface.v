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
// FILE NAME :      Eval_Board_Interface.v
// MODULE NAME :    Eval_Board_Interface
// AUTHOR : Adrian Costina
// AUTHOR’S EMAIL : Adrian.Costina@analog.com
// -----------------------------------------------------------------------------
// SVN REVISION: $WCREV$
// -----------------------------------------------------------------------------
// KEYWORDS : ADAS3022
// -----------------------------------------------------------------------------
// PURPOSE :This module is intended to read data from the ADAS3022 ADC and send it
//          to a custom CED1Z core
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy      :
// Clock Domains       :
// Critical Timing     :
// Test Features       :
// Asynchronous I/F    :
// Instantiations      :
// Synthesizable (y/n) :
// Target Device       :
// Other               :
// -----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

//------------------------------------------------------------------------------
//----------- Module Declaration -----------------------------------------------
//------------------------------------------------------------------------------

module Eval_Board_Interface #(
//PARAMETERS
    parameter   IWIDTH  = 32,           // Interface bus width
    parameter   DWIDTH  = 16            // Data bus width
    )

//----------- Ports Declarations -----------------------------------------------
(
//generic signals
    input                   clk_i,
    input                   reset_i,

// ADAS3022 interface
    input                   bbusy_i,
    inout  [DWIDTH-1:0]     par_data_io,        // Use only as input at this time

//control intreface
    input                   wr_data_n_i,        // Signal used to write data to the component
    input   [IWIDTH-1:0]    data_i,             // 16 bits of data, 5 bits of address
    input                   write_complete_i,   // signals that a sample has been acquired to the top module
    input                   run_acquisition_i,  // signals acquisition in progress

    output  reg             data_rd_ready_o,    // Signals that data has been acquired from the Evaluation board, and can be read by the upper module
    output  reg             data_wr_ready_o,    // Signals that data written by the upper module has been acquired
    output  reg [DWIDTH-1:0]data_o,             // Bus used to send the data acquired from the Eval Board to the upper module
// ADAS3022 interface
    output reg              brd_n_o,
    output reg              bwr_n_o,
    output                  reset_adc_o,
    output  [4:0]           addr_o
);

//------------------------------------------------------------------------------
//----------- Local Parameters -------------------------------------------------
//------------------------------------------------------------------------------

localparam IDLE         = 18'b000000000000000001;
localparam DATAREADY    = 18'b000000000000000010;
localparam ACQ_CHAN_0   = 18'b000000000000000100;
localparam SEND_CHAN_0  = 18'b000000000000001000;
localparam ACQ_CHAN_1   = 18'b000000000000010000;
localparam SEND_CHAN_1  = 18'b000000000000100000;
localparam ACQ_CHAN_2   = 18'b000000000001000000;
localparam SEND_CHAN_2  = 18'b000000000010000000;
localparam ACQ_CHAN_3   = 18'b000000000100000000;
localparam SEND_CHAN_3  = 18'b000000001000000000;
localparam ACQ_CHAN_4   = 18'b000000010000000000;
localparam SEND_CHAN_4  = 18'b000000100000000000;
localparam ACQ_CHAN_5   = 18'b000001000000000000;
localparam SEND_CHAN_5  = 18'b000010000000000000;
localparam ACQ_CHAN_6   = 18'b000100000000000000;
localparam SEND_CHAN_6  = 18'b001000000000000000;
localparam ACQ_CHAN_7   = 18'b010000000000000000;
localparam END_ACQ      = 18'b100000000000000000;


//------------------------------------------------------------------------------
//----------- Registers Declarations -------------------------------------------
//------------------------------------------------------------------------------
reg [17:0]  next_state;
reg [17:0]  present_state;
reg         bbusy_d1;
reg         bbusy_d2;
reg         bwr_n_o_d1;
reg [15:0]  write_data;
reg [4:0]   address_read;
reg [4:0]   address_write;

//------------------------------------------------------------------------------
//----------- Assign/Always Blocks ---------------------------------------------
//------------------------------------------------------------------------------
assign reset_adc_o      = reset_i;
assign par_data_io      = bwr_n_o ? 16'bz : write_data;
assign addr_o           = bwr_n_o ? address_read : address_write;

always @(posedge clk_i)
begin
    if(reset_i  == 1'b1)
    begin
        bbusy_d1        <= 1'b0;
        bwr_n_o         <= 1'b1;
        bwr_n_o_d1      <= 1'b1;
        data_wr_ready_o <= 1'b0;
        write_data      <= 16'b0;
        address_write   <= 5'h0;
    end
    else if(wr_data_n_i == 1'b1)    // if there is no need to write data to the Evaluation Board
    begin
        bbusy_d1        <= bbusy_i; // monitor the bbusy signal
        bbusy_d2        <= bbusy_d1;
        bwr_n_o         <= 1'b1;
    end
    else                            // write data to Evaluation Board
    begin
        bwr_n_o_d1      <= bwr_n_o;
        address_write   <= data_i[20:16];
        write_data      <= data_i[15:0];
        if (bwr_n_o_d1 == 1'b0)
        begin
            data_wr_ready_o   <= 1'b1;
        end
        else
        begin
            data_wr_ready_o <= 1'b0;
            bwr_n_o         <= 1'b0;
        end
    end
end

// State machine for reading data from the Evaluation Board
// On the risedge of bbusy, all the eight channels are read. For each channel,
// the state machine waits for confirmation from the upper module before
// acquiring the next channel
// The state machine runs only when run_acquisition_i signal is activated from
// the upper module
always @( present_state, bbusy_d1, bbusy_d2, write_complete_i, run_acquisition_i )
begin
    next_state <= present_state;
    case( present_state )
        IDLE:
        begin
            if ( run_acquisition_i == 1'b1)
            begin
                next_state <= DATAREADY;
            end
        end
        DATAREADY:
        begin
            if(bbusy_d1 == 1'b1 && bbusy_d2 == 1'b0)
            begin
                next_state  <= ACQ_CHAN_0;
            end
        end
        ACQ_CHAN_0:
        begin
            next_state      <= SEND_CHAN_0;
        end
        SEND_CHAN_0:
        begin
            if (write_complete_i == 1'b1)
            begin
                next_state  <= ACQ_CHAN_1;
            end
        end
        ACQ_CHAN_1:
        begin
            next_state      <= SEND_CHAN_1;
        end
        SEND_CHAN_1:
        begin
            if (write_complete_i == 1'b1)
            begin
                next_state  <= ACQ_CHAN_2;
            end
        end
        ACQ_CHAN_2:
        begin
            next_state      <= SEND_CHAN_2;
        end
        SEND_CHAN_2:
        begin
            if (write_complete_i == 1'b1)
            begin
                next_state  <= ACQ_CHAN_3;
            end
        end
        ACQ_CHAN_3:
        begin
            next_state      <= SEND_CHAN_3;
        end
        SEND_CHAN_3:
        begin
            if (write_complete_i == 1'b1)
            begin
                next_state  <= ACQ_CHAN_4;
            end
        end
        ACQ_CHAN_4:
        begin
            next_state      <= SEND_CHAN_4;
        end
        SEND_CHAN_4:
        begin
            if (write_complete_i == 1'b1)
            begin
                next_state  <= ACQ_CHAN_5;
            end
        end
        ACQ_CHAN_5:
        begin
            next_state      <= SEND_CHAN_5;
        end
        SEND_CHAN_5:
        begin
            if (write_complete_i == 1'b1)
            begin
                next_state  <= ACQ_CHAN_6;
            end
        end
        ACQ_CHAN_6:
        begin
            next_state      <= SEND_CHAN_6;
        end
        SEND_CHAN_6:
        begin
            if (write_complete_i == 1'b1)
            begin
                next_state  <= ACQ_CHAN_7;
            end
        end
        ACQ_CHAN_7:
        begin
            next_state      <= END_ACQ;
        end
        END_ACQ:
        begin
            if (write_complete_i == 1'b1)
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

// ACQ_CHAN_X is used to read data from the Evaluation Board
// SEND_CHAN_X  is used to change the address set on Evaluation Board and
//              to send the acquired data to the upper module
always @( posedge clk_i )
begin
    if(reset_i == 1'b1 || bwr_n_o == 1'b0)
    begin
        present_state   <= IDLE;
    end
    else
    begin
        present_state       <= next_state;
        case( present_state )
            IDLE:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b1;
                address_read    <= 5'h0;
            end
            DATAREADY:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h10;
            end
            ACQ_CHAN_0:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h10;
                data_o          <= par_data_io;
            end
            SEND_CHAN_0:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h11;
            end
            ACQ_CHAN_1:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h11;
                data_o          <= par_data_io;
            end
            SEND_CHAN_1:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h12;
            end
            ACQ_CHAN_2:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h12;
                data_o          <= par_data_io;
            end
            SEND_CHAN_2:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h13;
            end
            ACQ_CHAN_3:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h13;
                data_o          <= par_data_io;
            end
            SEND_CHAN_3:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h14;
            end
            ACQ_CHAN_4:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h14;
                data_o          <= par_data_io;
            end
            SEND_CHAN_4:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h15;
            end
            ACQ_CHAN_5:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h15;
                data_o          <= par_data_io;
            end
            SEND_CHAN_5:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h16;
            end
            ACQ_CHAN_6:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h16;
                data_o          <= par_data_io;
            end
            SEND_CHAN_6:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h17;
            end
            ACQ_CHAN_7:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h17;
                data_o          <= par_data_io;
            end
            END_ACQ:
            begin
                data_rd_ready_o <= 1'b1;
                brd_n_o         <= 1'b0;
                address_read    <= 5'h10;
            end
            default:
            begin
                data_rd_ready_o <= 1'b0;
                brd_n_o         <= 1'b1;
                address_read    <= 5'h10;
            end
        endcase
    end
end

endmodule
