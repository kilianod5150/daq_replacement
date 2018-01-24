// ADAS3022_0.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

`timescale 1 ps / 1 ps
module ADAS3022_0 (
		input  wire        avalon_write_i,              //        avalon.write
		input  wire        avalon_read_i,               //              .read
		input  wire [2:0]  avalon_address_i,            //              .address
		output wire [31:0] avalon_readdata_o,           //              .readdata
		input  wire [31:0] avalon_writedata_i,          //              .writedata
		input  wire        reset_i,                     //    reset_sink.reset
		input  wire        clk_i,                       //    clock_sink.clk
		input  wire        avalon_master_waitrequest_i, // avalon_master.waitrequest
		output wire [31:0] avalon_master_address_o,     //              .address
		output wire        avalon_master_write_o,       //              .write
		output wire [1:0]  avalon_master_byteenable_o,  //              .byteenable
		output wire [15:0] avalon_master_writedata_o,   //              .writedata
		inout  wire [15:0] bdb_io,                      // conduit_end_1.export
		output wire        brd_n_o,                     //              .export
		output wire        bwr_n_o,                     //              .export
		output wire        breset_o,                    //              .export
		output wire [4:0]  baddr_o,                     //              .export
		input  wire        bbusy_i                      //              .export
	);

	ADAS3022_Avalon_core #(
		.DATAWIDTH       (16),
		.BYTEENABLEWIDTH (2),
		.ADDRESSWIDTH    (32),
		.FIFODEPTH       (32),
		.FIFODEPTH_LOG2  (5),
		.FIFOUSEMEMORY   (1)
	) adas3022_0 (
		.avalon_write_i              (avalon_write_i),              //        avalon.write
		.avalon_read_i               (avalon_read_i),               //              .read
		.avalon_address_i            (avalon_address_i),            //              .address
		.avalon_readdata_o           (avalon_readdata_o),           //              .readdata
		.avalon_writedata_i          (avalon_writedata_i),          //              .writedata
		.reset_i                     (reset_i),                     //    reset_sink.reset
		.clk_i                       (clk_i),                       //    clock_sink.clk
		.avalon_master_waitrequest_i (avalon_master_waitrequest_i), // avalon_master.waitrequest
		.avalon_master_address_o     (avalon_master_address_o),     //              .address
		.avalon_master_write_o       (avalon_master_write_o),       //              .write
		.avalon_master_byteenable_o  (avalon_master_byteenable_o),  //              .byteenable
		.avalon_master_writedata_o   (avalon_master_writedata_o),   //              .writedata
		.bdb_io                      (bdb_io),                      // conduit_end_1.export
		.brd_n_o                     (brd_n_o),                     //              .export
		.bwr_n_o                     (bwr_n_o),                     //              .export
		.breset_o                    (breset_o),                    //              .export
		.baddr_o                     (baddr_o),                     //              .export
		.bbusy_i                     (bbusy_i)                      //              .export
	);

endmodule
