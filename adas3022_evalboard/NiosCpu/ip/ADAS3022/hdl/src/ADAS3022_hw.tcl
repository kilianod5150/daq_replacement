# TCL File Generated by Component Editor 11.0
# Wed Feb 01 11:40:45 EET 2012
# DO NOT MODIFY


# +-----------------------------------
# | 
# | ADAS3022 "ADAS3022" v1.0
# | null 2012.02.01.11:40:45
# | 
# | 
# | D:/AD/AnalogSVN/CED1Z/ADAS3022/NiosCpu/IP/ADAS3022/hdl/src/ADAS3022_Avalon_core.v
# | 
# |    ./ADAS3022_Avalon_core.v syn, sim
# |    ./Eval_Board_interface.v syn, sim
# |    ./write_master.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 11.0
# | 
package require -exact sopc 11.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module ADAS3022
# | 
set_module_property NAME ADAS3022
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME ADAS3022
set_module_property TOP_LEVEL_HDL_FILE ADAS3022_Avalon_core.v
set_module_property TOP_LEVEL_HDL_MODULE ADAS3022_Avalon_core
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL TRUE
set_module_property STATIC_TOP_LEVEL_MODULE_NAME "ADAS3022_Avalon_core"
set_module_property FIX_110_VIP_PATH false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file ADAS3022_Avalon_core.v {SYNTHESIS SIMULATION}
add_file Eval_Board_interface.v {SYNTHESIS SIMULATION}
add_file write_master.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter DATAWIDTH INTEGER 32
set_parameter_property DATAWIDTH DEFAULT_VALUE 32
set_parameter_property DATAWIDTH DISPLAY_NAME DATAWIDTH
set_parameter_property DATAWIDTH TYPE INTEGER
set_parameter_property DATAWIDTH ENABLED false
set_parameter_property DATAWIDTH UNITS None
set_parameter_property DATAWIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DATAWIDTH AFFECTS_GENERATION false
set_parameter_property DATAWIDTH HDL_PARAMETER true
add_parameter BYTEENABLEWIDTH INTEGER 4
set_parameter_property BYTEENABLEWIDTH DEFAULT_VALUE 4
set_parameter_property BYTEENABLEWIDTH DISPLAY_NAME BYTEENABLEWIDTH
set_parameter_property BYTEENABLEWIDTH TYPE INTEGER
set_parameter_property BYTEENABLEWIDTH ENABLED false
set_parameter_property BYTEENABLEWIDTH UNITS None
set_parameter_property BYTEENABLEWIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BYTEENABLEWIDTH AFFECTS_GENERATION false
set_parameter_property BYTEENABLEWIDTH HDL_PARAMETER true
add_parameter ADDRESSWIDTH INTEGER 32
set_parameter_property ADDRESSWIDTH DEFAULT_VALUE 32
set_parameter_property ADDRESSWIDTH DISPLAY_NAME ADDRESSWIDTH
set_parameter_property ADDRESSWIDTH TYPE INTEGER
set_parameter_property ADDRESSWIDTH ENABLED false
set_parameter_property ADDRESSWIDTH UNITS None
set_parameter_property ADDRESSWIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ADDRESSWIDTH AFFECTS_GENERATION false
set_parameter_property ADDRESSWIDTH HDL_PARAMETER true
add_parameter FIFODEPTH INTEGER 32
set_parameter_property FIFODEPTH DEFAULT_VALUE 32
set_parameter_property FIFODEPTH DISPLAY_NAME FIFODEPTH
set_parameter_property FIFODEPTH TYPE INTEGER
set_parameter_property FIFODEPTH UNITS None
set_parameter_property FIFODEPTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property FIFODEPTH AFFECTS_GENERATION false
set_parameter_property FIFODEPTH HDL_PARAMETER true
add_parameter FIFODEPTH_LOG2 INTEGER 5
set_parameter_property FIFODEPTH_LOG2 DEFAULT_VALUE 5
set_parameter_property FIFODEPTH_LOG2 DISPLAY_NAME FIFODEPTH_LOG2
set_parameter_property FIFODEPTH_LOG2 TYPE INTEGER
set_parameter_property FIFODEPTH_LOG2 UNITS None
set_parameter_property FIFODEPTH_LOG2 ALLOWED_RANGES -2147483648:2147483647
set_parameter_property FIFODEPTH_LOG2 AFFECTS_GENERATION false
set_parameter_property FIFODEPTH_LOG2 HDL_PARAMETER true
add_parameter FIFOUSEMEMORY INTEGER 1
set_parameter_property FIFOUSEMEMORY DEFAULT_VALUE 1
set_parameter_property FIFOUSEMEMORY DISPLAY_NAME FIFOUSEMEMORY
set_parameter_property FIFOUSEMEMORY TYPE INTEGER
set_parameter_property FIFOUSEMEMORY ENABLED false
set_parameter_property FIFOUSEMEMORY UNITS None
set_parameter_property FIFOUSEMEMORY ALLOWED_RANGES -2147483648:2147483647
set_parameter_property FIFOUSEMEMORY AFFECTS_GENERATION false
set_parameter_property FIFOUSEMEMORY HDL_PARAMETER true
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon
# | 
add_interface avalon avalon end
set_interface_property avalon addressAlignment DYNAMIC
set_interface_property avalon addressUnits WORDS
set_interface_property avalon associatedClock clock_sink
set_interface_property avalon associatedReset reset_sink
set_interface_property avalon burstOnBurstBoundariesOnly false
set_interface_property avalon explicitAddressSpan 0
set_interface_property avalon holdTime 0
set_interface_property avalon isMemoryDevice false
set_interface_property avalon isNonVolatileStorage false
set_interface_property avalon linewrapBursts false
set_interface_property avalon maximumPendingReadTransactions 0
set_interface_property avalon printableDevice false
set_interface_property avalon readLatency 0
set_interface_property avalon readWaitTime 1
set_interface_property avalon setupTime 0
set_interface_property avalon timingUnits Cycles
set_interface_property avalon writeWaitTime 0

set_interface_property avalon ENABLED true

add_interface_port avalon avalon_write_i write Input 1
add_interface_port avalon avalon_read_i read Input 1
add_interface_port avalon avalon_address_i address Input 3
add_interface_port avalon avalon_readdata_o readdata Output 32
add_interface_port avalon avalon_writedata_i writedata Input 32
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset_sink
# | 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges DEASSERT

set_interface_property reset_sink ENABLED true

add_interface_port reset_sink reset_i reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock_sink
# | 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0

set_interface_property clock_sink ENABLED true

add_interface_port clock_sink clk_i clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_master
# | 
add_interface avalon_master avalon start
set_interface_property avalon_master addressUnits SYMBOLS
set_interface_property avalon_master associatedClock clock_sink
set_interface_property avalon_master associatedReset reset_sink
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master readLatency 0

set_interface_property avalon_master ENABLED true

add_interface_port avalon_master avalon_master_waitrequest_i waitrequest Input 1
add_interface_port avalon_master avalon_master_address_o address Output DATAWIDTH
add_interface_port avalon_master avalon_master_write_o write Output 1
add_interface_port avalon_master avalon_master_byteenable_o byteenable Output BYTEENABLEWIDTH
add_interface_port avalon_master avalon_master_writedata_o writedata Output DATAWIDTH
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end_1
# | 
add_interface conduit_end_1 conduit end

set_interface_property conduit_end_1 ENABLED true

add_interface_port conduit_end_1 bdb_io export Bidir 16
add_interface_port conduit_end_1 brd_n_o export Output 1
add_interface_port conduit_end_1 bwr_n_o export Output 1
add_interface_port conduit_end_1 breset_o export Output 1
add_interface_port conduit_end_1 baddr_o export Output 5
add_interface_port conduit_end_1 bbusy_i export Input 1
# | 
# +-----------------------------------