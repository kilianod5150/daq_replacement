## Generated SDC file "ced1z.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 11.0 Build 157 04/27/2011 SJ Web Edition"

## DATE    "Mon Jul 23 10:42:19 2012"

##
## DEVICE  "EP1C4F400C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {ext_clk} -period 83.300 -waveform { 0.000 41.650 } [get_ports {USB_CLOCKOUT}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {uC_inst|the_pll|sd1|pll|clk[0]} -source [get_pins {uC_inst|the_pll|sd1|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -master_clock {ext_clk} [get_pins {uC_inst|the_pll|sd1|pll|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_write}] -to [get_registers {*|alt_jtag_atlantic:*|read_write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|td_shift[0]*}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|write_stalled*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}]
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_break:the_cpu_nios2_oci_break|break_readreg*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|*resetlatch}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr[33]}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|monitor_ready}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr[0]}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|monitor_error}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr[34]}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_ocimem:the_cpu_nios2_ocimem|*MonDReg*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_tck:the_cpu_jtag_debug_module_tck|*sr*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_sysclk:the_cpu_jtag_debug_module_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_sysclk:the_cpu_jtag_debug_module_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*cpu:*|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|monitor_go}]
set_false_path -from [get_registers {*altera_jtag_src_crosser:*|sink_data_buffer*}] -to [get_registers {*altera_jtag_src_crosser:*|src_data*}]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_writedata_d1*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_address*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_readdata_p1*}] -to [get_registers *]
set_false_path -from [get_keepers -nocase {*the*clock*|slave_readdata_p1*}] -to [get_registers *]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

