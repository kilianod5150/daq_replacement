#
# AD7671_sw.tcl
#

# Create a new driver
create_driver ADAS3022

# Associate it with some hardware known as "ADAS3022"
set_sw_property hw_class_name ADAS3022

# The version of this driver
set_sw_property version 1.0

# This driver may be incompatible with versions of hardware less
# than specified below. Updates to hardware and device drivers
# rendering the driver incompatible with older versions of
# hardware are noted with this property assignment.
#
# This version of the software driver is compatible with hardware 
# version 1.0 and greater.
set_sw_property min_compatible_hw_version 1.0

# Do not initialize the driver in alt_sys_init() since we do not
# have a HAL version of the driver
set_sw_property auto_initialize false

# Location in generated BSP that above sources will be copied into
set_sw_property bsp_subdirectory drivers

# Use enhanced interrupt API 
set_sw_property supported_interrupt_apis  enhanced_interrupt_api
#
# Source file listings...
#

# C/C++ source files
add_sw_property c_source HAL/src/ADAS3022.c

# Include files
add_sw_property include_source inc/ADAS3022_regs.h
add_sw_property include_source HAL/inc/ADAS3022.h

# This driver supports HAL BSP (OS) type
add_sw_property supported_bsp_type HAL
add_sw_property supported_bsp_type UCOSII

# End of file
