#Data acquisition for ADAS3022

puts "Running acquisition script"

set startacq 0
set mm [ lindex [ get_service_paths master ] 0 ]
# In case there is a previous opened connection, close the connection
close_service master $mm
open_service master $mm

# In case the previous executed script crashed, and the software is an intermediate state
# Allow the program to enter in the main while loop
master_write_memory $mm 0x4a0004 1
master_write_memory $mm 0x4a0008 1
master_write_memory $mm 0x4a000C 1

#   The following commands will set the configuration word to be sent to the ADAS3023
#Write
set configuration [ expr 1 << 15 ]
#INx [0-7]
set inx 1
set configuration [ expr $configuration + [expr $inx << 12 ] ]
#COM ( 0 = Channels are referenced in differenctial pairs, 1 = Channels are referenced to a common sense )
set com 1
set configuration [ expr $configuration + [expr $com << 11 ] ]
#BW (1 Full BW mode that allows up to 1MSPS aggregate throughput)
set bw 1
set configuration [ expr $configuration + [expr $bw << 10 ] ]
#PGA (0 = Not used, 1 = +-10.24Vpp, 2 = +-5.12Vpp, 3 = +-2.56Vpp, 
#     4 = +-1.28Vpp, 5 = +-0.64Vpp, 6= Not used, 7 = +-20.48Vpp )
set pga 7
set configuration [ expr $configuration + [expr $pga << 7 ] ]
#MUX ( 0 = Selects auxiliary channel on AUX +- inputs, 1 = Uses the multiplexers IN[7:0] and COM inputs )
# Do not modify
set configuration [ expr $configuration + [expr 1 << 6 ] ]
# SEQ ( 0 = disable , 1 = update configuration during basic sequence, 2 = init advanced sequencer, 3 = init basic sequencer )
# Only 0 or 3 have been implemented
set seq 0
set configuration [ expr $configuration + [expr $seq << 4 ] ]
# Temperature bit ( do not modify)
set configuration [expr $configuration + [ expr 1 << 3 ] ]
#REFS ( 0 = disable internal reference, 1 = enable internal reference)
set refs 1
set configuration [ expr $configuration + [expr $refs << 2 ] ]
#CMS (0 = uses the fastest mode for conversion with a time between conversions restriction, 1 = uses normal mode for conversions)
set cms 0
set configuration [ expr $configuration + [expr $cms << 1 ] ]
#CPHA 
set cpha 0
set configuration [ expr $configuration + [expr $cpha << 0 ] ]

master_write_32 $mm 0x4a0018 $configuration
after 1000

# Start the acquisition process
    set startacq [master_read_32 $mm 0x4a0000 1]
    set point [master_read_32 $mm 0x4a0014 1 ]
    master_write_32 $mm  $point 1

# Wait for the data to be acquired by the ADC and stored in the memory
    while { $startacq == 0 } {
        set startacq [master_read_32 $mm 0x4a0000 1]
    }
    puts "Acquisition has been started..."

# Read data from memory byte by byte
    set data [ master_read_memory $mm 0x4e0000 1048576 ]

# Signal to the application that data has been acquired
    master_write_32 $mm 0x4a0004 1

# Converts data from bytes to 16 bit values
    puts "Converting acquired data to 16 bit values"
    for { set i 0 } { $i < [ llength $data ] } { incr i 2} {
        set a [ lindex $data $i ]
        set b [ lindex $data [expr $i + 1 ] ]
        lappend newData [ expr  { ( $b << 8 ) + $a } ]
    }

    unset data

# Create 8 lists, one for each channel
set final0 "Vin0"
set final1 "Vin1"
set final2 "Vin2"
set final3 "Vin3"
set final4 "Vin4"
set final5 "Vin5"
set final6 "Vin6"
set final7 "Vin7"

set readData 0
    puts "Processing data as two's complement"
    for { set i 0 } { $i < [ llength $newData ] } { incr i} {
        set a [ lindex $newData $i ]
        set decimal [ expr $a ]
        if { $seq != 3 } {
        switch [ expr $inx ] {
            0   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final0 $decimal
            }
            1   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final1 $decimal
            }
            2   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                    }
                lappend final2 $decimal
            }
            3   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final3 $decimal
            }
            4   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final4 $decimal
            }
            5   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final5 $decimal
            }
            6   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final6 $decimal
            }
            7   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final7 $decimal
            }
            default {
                puts $decimal
                puts "ERR"
            }
        }
    } else {
    switch [ expr $readData] {
            0   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final0 $decimal
                set readData 1
            }
            1   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final1 $decimal
                set readData 2
            }
            2   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final2 $decimal
                set readData 3
            }
            3   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final3 $decimal
                if { $com == 1 } {
                    set readData 4
                } else { 
                    set readData 0
                }
            }
            4   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final4 $decimal
                set readData 5
            }
            5   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final5 $decimal
                set readData 6
            }
            6   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final6 $decimal
                set readData 7
            }
            7   {
                if { $decimal > 32767 } {
                    set decimal [ expr $decimal - 65535 ]
                }
                lappend final7 $decimal
                set readData 0
            }
            default {
                puts $decimal
                puts "ERR"
            }
        }
    }
}

puts "Arranging channels"
for { set i 0 } { $i < 1048586  } { incr i } {
    if { [ llength $final0 ] > [ expr {$i ? $i : 1} ] } {
        lappend final [ lindex $final0 $i ],
        set data_processed 1
    }

    if { [ llength $final1 ] >  [ expr {$i ? $i : 1} ] } {
        lappend final [ lindex $final1 $i ],
        set data_processed 1
    }

    if { [ llength $final2 ] > [ expr {$i ? $i : 1} ] } {
        lappend final [ lindex $final2 $i ],
        set data_processed 1
    }

    if { [llength $final3] > [ expr {$i ? $i : 1} ] } {
        lappend final [lindex $final3 $i],
        set data_processed 1
    }

    if { [llength $final4] > [ expr {$i ? $i : 1} ] } {
        lappend final [lindex $final4 $i],
        set data_processed 1
    }

    if { [llength $final5] > [ expr {$i ? $i : 1} ] } {
        lappend final [lindex $final5 $i],
        set data_processed 1
    }

    if { [llength $final6] > [ expr {$i ? $i : 1} ] } {
        lappend final [lindex $final6 $i],
        set data_processed 1
    }

    if { [llength $final7] > [ expr {$i ? $i : 1} ] } {
        lappend final [lindex $final7 $i],
        set data_processed 1
    }

    if { $data_processed == 0 } {
        break
    }
    lappend final \n
    set data_processed 0
}

    unset newData

    master_write_32 $mm 0x4a0008 1

    puts "Moving data into file Acquisition.csv"

   set openFile 0

   while { $openFile == 0 } {
    if [catch { open "Acquisition.csv" "a+" } fid ] {
        puts stderr "Error opening the file. Please make sure the file is not opened by another program"
        after 1000
        puts "Trying again..."
    } else {
        set fd $fid
        set openFile 1
    }
    }
    #fconfigure $fd -translation binary
    puts -nonewline $fd [ join $final ]
    close $fd
    master_write_32 $mm 0x4a000C 1
    unset final
    puts "Iteration complete"

close_service master $mm
