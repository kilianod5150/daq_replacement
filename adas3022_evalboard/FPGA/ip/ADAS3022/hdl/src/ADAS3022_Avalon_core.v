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
// FILE NAME :      ADAS3022_Avalon_core.v
// MODULE NAME :    ADAS3022_Avalon_core
// AUTHOR :         Adrian Costina
// AUTHOR’S EMAIL : Adrian.Costina@analog.com
// -----------------------------------------------------------------------------
// SVN REVISION: $WCREV$
// -----------------------------------------------------------------------------
// KEYWORDS : ADAS3022_Avalon_core
// -----------------------------------------------------------------------------
// PURPOSE :This module is intended to read data from ADCs, connected to a CED1Z
//          board
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

module ADAS3022_Avalon_core
#(
    // Data path width
    // Range : 8, 16, 32, 64, 128, 256, 512, 1024
    parameter DATAWIDTH = 32,

    // (DATAWIDTH)/8
    // Range: 1, 2, 4, 8, 16, 32, 64, 128
    parameter BYTEENABLEWIDTH = 4,

    // The number of address bits exposed to the system interconnect fabric.
    // Range: 1-32
    parameter ADDRESSWIDTH = 32,

    // FIFO depth of the internal buffer
    // Range: 4 ,8, 16, 62, 64, 128
    parameter FIFODEPTH = 32,

    // Log2(FIFODEPTH)
    // Range: 2-7
    parameter FIFODEPTH_LOG2 = 5,

    // Set to '1' to use on chip memory for the internal buffer
    // Set to '0' to use logical elements instead of memory
    // Range: 0/1
    parameter FIFOUSEMEMORY = 1
)

//----------- Ports Declarations -----------------------------------------------
(
    input                           clk_i,
    input                           reset_i,

     // Avalon ports slave
    input       [31:0]              avalon_writedata_i,
    input                           avalon_write_i,
    input                           avalon_read_i,
    input       [2:0]               avalon_address_i,

    output  reg [31:0]              avalon_readdata_o,

    // Avalon master ports
    input                           avalon_master_waitrequest_i,

    output  [ADDRESSWIDTH-1:0]         avalon_master_address_o,
    output                          avalon_master_write_o,
    output  [BYTEENABLEWIDTH-1:0]   avalon_master_byteenable_o,
    output  [DATAWIDTH-1:0]         avalon_master_writedata_o,

    // DUT control and data interface (this is device specific)
    input                           bbusy_i,
    inout  [15:0]                   bdb_io,

    output                          brd_n_o,
    output                          bwr_n_o,
    output                          breset_o,
    output  [4:0]                   baddr_o
);

//------------------------------------------------------------------------------
//----------- Registers Declarations -------------------------------------------
//------------------------------------------------------------------------------

//Avalon registers
reg [31:0] control_register;    // Address 0: bit 0 (1)start acquisition,
                                           // bit 1 (1)software reset,
                                           // bit 2 control_fixed_location
                                           // bit 3 write data to the DUT
reg [31:0] acq_count_register; // Address 1: counter to store the total number of
                               //            sample acquisitions requested by software
reg [31:0] base_register;      // Address 2: the base address where data will be written
reg [31:0] status_register;    // Address 3: status register
reg [31:0] dut_write_register; // Address 4: data to be written to the DUT

// Control inputs and outputs for write master
reg        control_go;                  // Strobe to initiate a write master transaction

// User logic inputs and outputs for write master
reg                     user_write_buffer;      // Signal to activate the WRReq signal on the memory subcomponent of the write master core
reg [DATAWIDTH-1:0]     user_buffer_data;       // Data to be written in the memory subcomponent of the write master core
reg [ADDRESSWIDTH-1:0]  control_write_base;     // Address of the start location where data will be written
reg [ADDRESSWIDTH-1:0]  control_write_length;   // Number of bytes to be written by the write master

//State machine
reg [5:0]   core_state;
reg [5:0]   core_next_state;

// Internal signals
reg [31:0]  committed_data;             // Integer used to keep track of the number of words already written in the system memory
reg [31:0]  dev_total_read_cnt;         // Counts the total number of samples received from the device
reg         acquisition_complete;       // Signals that the acquisition is complete
reg         buffer_overflow;            // Used to indicate that the buffer was overflown, and data is not contiguous
reg         write_addr_err;             // Used to signal that a write request on a wrong address has been performed

//IP control and data interface
reg         dut_wr_data_n;
reg [31:0]  dut_data_i;
reg         dut_write_complete;
reg         run_acquisition;

//------------------------------------------------------------------------------
//----------- Local Parameters -------------------------------------------------
//------------------------------------------------------------------------------
//CORE states
localparam IDLE             = 6'b000001;
localparam READY            = 6'b000010;
localparam ACQ_SAMPLE       = 6'b000100;
localparam TRANSFER_SAMPLE  = 6'b001000;
localparam WRITE_FIFO       = 6'b010000;
localparam DMA_WRITE        = 6'b100000;

//------------------------------------------------------------------------------
//----------- Wire Declarations ------------------------------------------------
//------------------------------------------------------------------------------
wire reset;                                     // Used to concate the software/hardware reset signals in a single signal

// Write master wires
wire          control_fixed_location; // This only makes sense to enable when MAXBURSTCOUNT = 1
wire          control_done;
wire          user_buffer_full;       // Signal from the write master core, active in case the memory subcomponent is full

// IP control and data interfaces
wire          dut_data_rd_ready;
wire          dut_data_wr_ready;
wire [15:0]   dut_data_o;

//------------------------------------------------------------------------------
//----------- Assign/Always Blocks ---------------------------------------------
//------------------------------------------------------------------------------
assign reset                    = reset_i | control_register[1];    // Merge software reset and hardware reset in the same signal
assign control_fixed_location   = control_register[2];              // 1 if data will be written to the same address

// Process to update the avalon registers
always @(posedge clk_i)
begin
    control_register[0] <= 1'b0;
    control_register[1] <= 1'b0;
    control_register[3] <= 1'b0;
    status_register[0]  <= acquisition_complete;
    status_register[1]  <= buffer_overflow;
    status_register[2]  <= write_addr_err;
    if (reset == 1'b1)
    begin
        control_register    <= 32'b0;
        acq_count_register  <= 32'b0;
        base_register       <= 32'b0;
        status_register     <= 32'b0;
        dut_write_register  <= 32'b0;
        write_addr_err      <= 1'b0;
    end
    else if (avalon_write_i == 1'b1)
    begin
        case (avalon_address_i)
            3'b000:
            begin
                control_register    <= avalon_writedata_i;
            end
            3'b001:
            begin
                acq_count_register  <= avalon_writedata_i;
            end
            3'b010:
            begin
                base_register       <= avalon_writedata_i;
            end
            3'b100:
            begin
                dut_write_register  <= avalon_writedata_i;
            end
            default:
            begin
                write_addr_err     <= 1'b1;
            end
        endcase
    end
    else if (avalon_read_i == 1'b1)
    begin
        case (avalon_address_i)
            3'b000:
            begin
                avalon_readdata_o   <= control_register;
            end
            3'b001:
            begin
                avalon_readdata_o   <= acq_count_register;
            end
            3'b010:
            begin
                avalon_readdata_o   <= base_register;
            end
            3'b011:
            begin
                avalon_readdata_o   <= status_register;
            end
            3'b100:
            begin
                avalon_readdata_o   <= dut_write_register;
            end
            default:
            begin
                avalon_readdata_o   <= status_register;
            end
        endcase
    end
end

// Process to write data to the DUT
always @(posedge clk_i)
begin
    if(reset == 1'b1)
    begin
        dut_wr_data_n    <= 1'b1;
        dut_data_i       <= 31'b0;
    end
    else
    begin
        dut_data_i       <= dut_write_register;
        if ( control_register[3] == 1 )
        begin
            dut_wr_data_n <= 1'b0;
        end
        else if (dut_data_wr_ready == 1'b1 )
        begin
            dut_wr_data_n <= 1'b1;
        end
    end
end

//update the CORE current state and the control signals
// After the acquisition has started, the state machine waits for the
// dut_data_rd_ready signal. After that, data is copied from the sub module, 
// is transfered to a FIFO memory and after that it is written in the system
// memory. After data is transfered to the FIFO memory, the dut_write_complete
// is asserted. In IDLE state, dut_write_complete is asserted so that the Eval
// Board can go through all eight acquisitions, in case the number of
// acquisitions selected is not a multiple of 8
always @(posedge clk_i)
begin
    if(reset_i == 1'b1 || bwr_n_o == 1'b0)
    begin
        core_state      <= IDLE;
        buffer_overflow <= 1'b0;
    end
    else
    begin
        core_state <= core_next_state;
        case (core_state)
            IDLE:
            begin
                control_go              <= 1'b0;
                control_write_length    <= 1'b0;
                user_write_buffer       <= 1'b0;
                user_buffer_data        <= 16'h0;
                dev_total_read_cnt      <= acq_count_register;
                committed_data          <= 1'b0;
                dut_write_complete      <= 1'b1;
                run_acquisition         <= 1'b0;
            end
            READY:
            begin
                acquisition_complete    <= 1'b0;
                control_go              <= 1'b0;
                user_write_buffer       <= 1'b0;
                dut_write_complete      <= 1'b0;
                run_acquisition         <= 1'b1;
            end
            ACQ_SAMPLE:
            begin
                control_go              <= 1'b0;
                user_write_buffer       <= 1'b0;
                user_buffer_data        <= dut_data_o[15:0];
                dut_write_complete      <= 1'b0;
                run_acquisition         <= 1'b1;
            end
            TRANSFER_SAMPLE:// transfer sample to the FIFO
            begin
                run_acquisition         <= 1'b1;
                control_go              <= 1'b0;
                dut_write_complete      <= 1'b1;
                if (user_buffer_full == 1'b1)
                begin
                    user_write_buffer   <= 1'b0;
                    buffer_overflow     <= 1'b1;
                end
                else
                begin
                    user_write_buffer       <= 1'b1 ;
                    control_write_length    <= control_write_length + BYTEENABLEWIDTH;
                    control_write_base      <= base_register + committed_data;
                    if (dev_total_read_cnt  == 0)
                    begin
                        dev_total_read_cnt <= 0;
                    end
                    else
                    begin
                        dev_total_read_cnt   <= dev_total_read_cnt - 32'b1;
                    end
                end
            end
            WRITE_FIFO:
            begin
                run_acquisition         <= 1'b1;
                dut_write_complete      <= 1'b0;
                user_write_buffer       <= 1'b0;
                if (control_done ==1'b1)
                begin
                    control_go          <= 1'b1;
                end
                else
                begin
                    control_go          <= 1'b0;
                end
            end
            DMA_WRITE:
            begin
                run_acquisition             <= 1'b1;
                dut_write_complete          <= 1'b0;
                committed_data              <= committed_data + control_write_length ;
                control_write_length        <= 32'h0;
                control_go                  <= 1'b0;
                if(dev_total_read_cnt == 0)
                begin
                    acquisition_complete    <= 1'b1;
                end
                else
                begin
                    acquisition_complete    <= 1'b0;
                end
            end
        endcase
    end
end

//update the ADC next state
always @(core_state,  control_register, dut_data_rd_ready, dev_total_read_cnt, control_done)
begin
    core_next_state <= core_state;
    case (core_state)
        IDLE:
        begin
            if ( control_register[0]== 1'b1 )
            begin
                core_next_state <= READY;
            end
            else
            begin
                core_next_state <= IDLE;
            end
        end
        READY:
        begin
            core_next_state <= ACQ_SAMPLE;
        end
        ACQ_SAMPLE:
        begin
            if(dut_data_rd_ready == 1'b1)
            begin
                core_next_state <= TRANSFER_SAMPLE;
            end
            else
            begin
                core_next_state <= ACQ_SAMPLE;
            end
        end
        TRANSFER_SAMPLE:
        begin
            core_next_state <= WRITE_FIFO;
        end
        WRITE_FIFO:
        begin
            if (control_done == 1'b1)
            begin
                core_next_state <= DMA_WRITE;
            end
            else
            begin
                core_next_state <= READY;
            end
        end
        DMA_WRITE:
        begin
            if (dev_total_read_cnt == 0)
            begin
                core_next_state <= IDLE;
            end
            else
            begin
                core_next_state <= READY;
            end
        end
        default:
        begin
            core_next_state <= IDLE;
        end
    endcase
end

//------------------------------------------------------------------------------
//----------- Modules Instantiations -------------------------------------------
//------------------------------------------------------------------------------

// Write master module
write_master #(
    .DATAWIDTH(DATAWIDTH),
    .BYTEENABLEWIDTH(BYTEENABLEWIDTH),
    .ADDRESSWIDTH(ADDRESSWIDTH),
    .FIFODEPTH(FIFODEPTH),
    .FIFODEPTH_LOG2(FIFODEPTH_LOG2),
    .FIFOUSEMEMORY(FIFOUSEMEMORY)
    ) w_m_i1(
    .clk(clk_i),
    .reset (reset | control_register[0]),
    .control_fixed_location(control_fixed_location),
    .control_write_base(control_write_base),
    .control_write_length (control_write_length),
    .control_go(control_go),
    .control_done(control_done),
    .user_write_buffer(user_write_buffer),
    .user_buffer_data(user_buffer_data),
    .user_buffer_full(user_buffer_full),
    .master_address(avalon_master_address_o),
    .master_write(avalon_master_write_o),
    .master_byteenable(avalon_master_byteenable_o),
    .master_writedata(avalon_master_writedata_o),
    .master_waitrequest(avalon_master_waitrequest_i)
);

// ADAS3022_Avalon_core Core module
Eval_Board_Interface #(
    .DWIDTH(16),
    .IWIDTH(32)
)
Eval_Board_Interface_i1(
    // Clock and reset signals
    .clk_i(clk_i),
    .reset_i(reset),

    // IP control and data interface
    .wr_data_n_i(dut_wr_data_n),
    .data_i(dut_data_i),
    .write_complete_i(dut_write_complete),
    .data_rd_ready_o(dut_data_rd_ready),
    .data_wr_ready_o (dut_data_wr_ready),
    .data_o(dut_data_o),
    .run_acquisition_i(run_acquisition),

    // ADAS3022 control and data interface
    .par_data_io(bdb_io),
    .bbusy_i(bbusy_i),
    .brd_n_o(brd_n_o),
    .bwr_n_o(bwr_n_o),
    .reset_adc_o(breset_o),
    .addr_o(baddr_o)
);

endmodule
