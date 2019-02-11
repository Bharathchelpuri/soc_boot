#============================================================
# IO PAD GENERATOR
#
# Input:
#   io_pad.csv
#   configure.svh
#
# Output:
#   top_io_pad.sv
#   gpio_io_pad.sv
#   digital_io_pad.sv
#   analog_io_pad.sv
#   power_io_pad.sv
#
#============================================================


#============================================================
# FILES
#============================================================

set csv_file        "io_pad.csv"
set config_file     "configure.svh"

set top_output      "top_io_pad.sv"
set gpio_output     "gpio_io_pad.sv"
set digital_output  "digital_io_pad.sv"
set analog_output   "analog_io_pad.sv"
set power_output    "power_io_pad.sv"


#============================================================
# UTILITY : Trim
#============================================================

proc trim_string {str} {
    return [string trim $str]
}


#============================================================
# UTILITY : Substitute configuration placeholders
#============================================================

proc substitute_connection {connection pin_name index core_signal} {

    #--------------------------------------------------------
    # INDEX
    #--------------------------------------------------------

    set connection [string map \
        [list "INDEX" $index] \
        $connection]


    #--------------------------------------------------------
    # PIN_PAD
    #--------------------------------------------------------

    set connection [string map \
        [list "PIN_PAD" $pin_name] \
        $connection]


    #--------------------------------------------------------
    # CORE_SIGNAL
    #--------------------------------------------------------

    set connection [string map \
        [list "CORE_SIGNAL" $core_signal] \
        $connection]


    #--------------------------------------------------------
    # PIN_PAD_XI
    # PIN_PAD_XO
    #
    # Used for crystal configuration
    #--------------------------------------------------------

    set connection [string map \
        [list "PIN_PAD_XI" $pin_name] \
        $connection]

    set connection [string map \
        [list "PIN_PAD_XO" $pin_name] \
        $connection]


    return $connection
}


#============================================================
# READ CSV
#============================================================

puts ""
puts "============================================================"
puts " Reading CSV"
puts "============================================================"
puts ""

if {![file exists $csv_file]} {
    puts "ERROR: CSV file not found: $csv_file"
    exit 1
}

set fp [open $csv_file r]
set csv_data [read $fp]
close $fp

set lines [split $csv_data "\n"]

set rows {}

#------------------------------------------------------------
# Header
#------------------------------------------------------------

set header [string trim [lindex $lines 0]]

puts "CSV Header:"
puts "$header"
puts ""


#------------------------------------------------------------
# Read rows
#------------------------------------------------------------

foreach line [lrange $lines 1 end] {

    set line [string trim $line]

    if {$line eq ""} {
        continue
    }

    set fields [split $line ","]

    #--------------------------------------------------------
    # Remove surrounding spaces
    #--------------------------------------------------------

    set clean_fields {}

    foreach field $fields {
        lappend clean_fields [string trim $field]
    }

    lappend rows $clean_fields
}


puts "Total CSV rows : [llength $rows]"
puts ""


#============================================================
# READ CONFIGURATION
#============================================================

puts "============================================================"
puts " Reading Configuration"
puts "============================================================"
puts ""

if {![file exists $config_file]} {
    puts "ERROR: Configuration file not found: $config_file"
    exit 1
}

set fp [open $config_file r]
set config_data [read $fp]
close $fp

set config_lines [split $config_data "\n"]


#============================================================
# PARSE CONFIGURATION
#============================================================

set cell_config {}

set current_macro ""
set current_cell ""
set current_ports {}

set in_cell_config 0


foreach line $config_lines {

    set line [string trim $line]

    #--------------------------------------------------------
    # Ignore blank lines
    #--------------------------------------------------------

    if {$line eq ""} {
        continue
    }


    #--------------------------------------------------------
    # Ignore // comments
    #--------------------------------------------------------

    if {[string match {//*} $line]} {
        continue
    }


    #========================================================
    # CELL_CONFIG
    #========================================================

    if {[regexp {^CELL_CONFIG\s+(\S+)} $line -> macro]} {

        set current_macro $macro
        set current_cell ""
        set current_ports {}

        set in_cell_config 1

        continue
    }


    #========================================================
    # END_CELL_CONFIG
    #========================================================

    if {[regexp {^END_CELL_CONFIG} $line]} {

        if {$current_macro eq ""} {
            puts "ERROR: END_CELL_CONFIG without CELL_CONFIG"
            exit 1
        }

        if {$current_cell eq ""} {
            puts "ERROR: No CELL_NAME for $current_macro"
            exit 1
        }

        if {[llength $current_ports] == 0} {
            puts "ERROR: No PORT definitions for $current_macro"
            exit 1
        }

        dict set cell_config $current_macro cell  $current_cell
        dict set cell_config $current_macro ports $current_ports

        set in_cell_config 0

        continue
    }


    if {!$in_cell_config} {
        continue
    }


    #========================================================
    # CELL_NAME
    #========================================================

    if {[regexp {^CELL_NAME\s+(\S+)} $line -> cell]} {

        set current_cell $cell

        continue
    }


    #========================================================
    # PORT
    #
    # PORT I = gpio_pad_out[INDEX]
    # PORT PAD = PIN_PAD
    #========================================================

    if {[regexp {^PORT\s+(\S+)\s*=\s*(.+)$} \
        $line -> port_name connection]} {

        set connection [string trim $connection]

        lappend current_ports \
            [list $port_name $connection]

        continue
    }
}


#============================================================
# CONFIGURATION SUMMARY
#============================================================

puts "Configured cell interfaces:"
puts ""

foreach macro [dict keys $cell_config] {

    set cell_name [dict get $cell_config $macro cell]
    set ports     [dict get $cell_config $macro ports]

    puts "  $macro -> $cell_name"

    foreach port $ports {

        set port_name  [lindex $port 0]
        set connection [lindex $port 1]

        puts "       .$port_name -> $connection"
    }

    puts ""
}


#============================================================
# CHECK CSV MACROS
#============================================================

puts "============================================================"
puts " Checking CSV Configuration"
puts "============================================================"
puts ""

set error_count 0

foreach row $rows {

    if {[llength $row] < 8} {

        puts "ERROR: Invalid CSV row:"
        puts "       $row"

        incr error_count

        continue
    }

    set pin_no      [lindex $row 0]
    set pin_name    [lindex $row 1]
    set pdk_cell    [lindex $row 2]
    set pin_type    [lindex $row 3]
    set core_signal [lindex $row 4]
    set index       [lindex $row 5]
    set cell_macro  [lindex $row 6]
    set module_name [lindex $row 7]


    #--------------------------------------------------------
    # Check macro exists
    #--------------------------------------------------------

    if {![dict exists $cell_config $cell_macro]} {

        puts "ERROR:"
        puts "  Pin       : $pin_name"
        puts "  Cell Macro: $cell_macro"
        puts "  Reason    : Macro not found in configure.svh"

        incr error_count

        continue
    }


    #--------------------------------------------------------
    # Check PDK cell against configuration
    #--------------------------------------------------------

    set configured_cell \
        [dict get $cell_config $cell_macro cell]

    if {$pdk_cell ne $configured_cell} {

        puts "ERROR:"
        puts "  Pin             : $pin_name"
        puts "  CSV PDK Cell    : $pdk_cell"
        puts "  Configured Cell : $configured_cell"

        incr error_count
    }
}


if {$error_count > 0} {

    puts ""
    puts "ERROR: Configuration check failed."
    puts "       Errors = $error_count"
    puts ""

    exit 1
}


puts "Configuration check PASSED."
puts ""


#============================================================
# CREATE MODULE ROW GROUPS
#============================================================

set gpio_rows    {}
set digital_rows {}
set analog_rows  {}
set power_rows   {}


foreach row $rows {

    set module_name [lindex $row 7]

    switch -- $module_name {

        gpio_io_pad {
            lappend gpio_rows $row
        }

        digital_io_pad {
            lappend digital_rows $row
        }

        analog_io_pad {
            lappend analog_rows $row
        }

        power_io_pad {
            lappend power_rows $row
        }

        default {
            puts "WARNING: Unknown module '$module_name'"
        }
    }
}


#============================================================
# GENERIC INSTANCE GENERATOR
#============================================================

proc generate_instance {row cell_config} {

    set pin_no      [lindex $row 0]
    set pin_name    [lindex $row 1]
    set pdk_cell    [lindex $row 2]
    set pin_type    [lindex $row 3]
    set core_signal [lindex $row 4]
    set index       [lindex $row 5]
    set cell_macro  [lindex $row 6]
    set module_name [lindex $row 7]


    #--------------------------------------------------------
    # Get cell configuration
    #--------------------------------------------------------

    set cell_name \
        [dict get $cell_config $cell_macro cell]

    set ports \
        [dict get $cell_config $cell_macro ports]


    #--------------------------------------------------------
    # Instance name
    #--------------------------------------------------------

    set pin_lower [string tolower $pin_name]

    set rtl ""

    append rtl "$cell_name u_${pin_lower} (\n"


    #--------------------------------------------------------
    # Generate ports
    #--------------------------------------------------------

    set port_count [llength $ports]
    set port_index 0

    foreach port $ports {

        set port_name  [lindex $port 0]
        set connection [lindex $port 1]


        #----------------------------------------------------
        # Substitute placeholders
        #----------------------------------------------------

        set connection \
            [substitute_connection \
                $connection \
                $pin_name \
                $index \
                $core_signal]


        #----------------------------------------------------
        # Port connection
        #----------------------------------------------------

        append rtl "    .$port_name ($connection)"


        if {$port_index < ($port_count - 1)} {
            append rtl ","
        }

        append rtl "\n"

        incr port_index
    }


    append rtl ");\n"

    return $rtl
}


#============================================================
# GPIO MODULE
#============================================================

puts "============================================================"
puts " Generating gpio_io_pad"
puts "============================================================"

set gpio_rtl ""

append gpio_rtl \
"module gpio_io_pad (\n"

append gpio_rtl \
"    input  logic \[22:0\] gpio_pad_dir,\n"

append gpio_rtl \
"    output logic \[22:0\] gpio_pad_in,\n"

append gpio_rtl \
"    input  logic \[22:0\] gpio_pad_out,\n"

append gpio_rtl \
"    input  logic \[22:0\] gpio_pad_pull_en,\n"


#------------------------------------------------------------
# GPIO ports
#------------------------------------------------------------

set gpio_count [llength $gpio_rows]

for {set i 0} {$i < $gpio_count} {incr i} {

    set row [lindex $gpio_rows $i]

    set pin_name [lindex $row 1]

    append gpio_rtl \
        "    inout  wire $pin_name"

    if {$i < ($gpio_count - 1)} {
        append gpio_rtl ","
    }

    append gpio_rtl "\n"
}

append gpio_rtl ");\n\n"


#------------------------------------------------------------
# GPIO instances
#------------------------------------------------------------

foreach row $gpio_rows {

    append gpio_rtl \
        [generate_instance $row $cell_config]

    append gpio_rtl "\n"
}


append gpio_rtl "endmodule\n"


#============================================================
# DIGITAL MODULE
#============================================================

puts "============================================================"
puts " Generating digital_io_pad"
puts "============================================================"

set digital_rtl ""

append digital_rtl \
"module digital_io_pad (\n"

#------------------------------------------------------------
# Digital physical ports
#------------------------------------------------------------

set digital_count [llength $digital_rows]

for {set i 0} {$i < $digital_count} {incr i} {

    set row [lindex $digital_rows $i]

    set pin_name [lindex $row 1]

    append digital_rtl \
        "    inout wire $pin_name"

    if {$i < ($digital_count - 1)} {
        append digital_rtl ","
    }

    append digital_rtl "\n"
}


#------------------------------------------------------------
# Core JTAG signals
#------------------------------------------------------------

append digital_rtl ",\n"
append digital_rtl "    output wire tck_jtag_btc,\n"
append digital_rtl "    output wire tms_jtag_btc,\n"
append digital_rtl "    output wire tdi_jtag_btc,\n"
append digital_rtl "    output wire trst_jtag_btc,\n"
append digital_rtl "    input  wire tdo_jtag_bto\n"

append digital_rtl ");\n\n"


#------------------------------------------------------------
# Digital instances
#------------------------------------------------------------

foreach row $digital_rows {

    append digital_rtl \
        [generate_instance $row $cell_config]

    append digital_rtl "\n"
}


append digital_rtl "endmodule\n"


#============================================================
# ANALOG MODULE
#============================================================

puts "============================================================"
puts " Generating analog_io_pad"
puts "============================================================"

set analog_rtl ""

append analog_rtl \
"module analog_io_pad (\n"

set analog_count [llength $analog_rows]

for {set i 0} {$i < $analog_count} {incr i} {

    set row [lindex $analog_rows $i]

    set pin_name [lindex $row 1]

    append analog_rtl \
        "    inout wire $pin_name"

    if {$i < ($analog_count - 1)} {
        append analog_rtl ","
    }

    append analog_rtl "\n"
}

append analog_rtl ");\n\n"


#------------------------------------------------------------
# Analog instances
#------------------------------------------------------------

foreach row $analog_rows {

    append analog_rtl \
        [generate_instance $row $cell_config]

    append analog_rtl "\n"
}


append analog_rtl "endmodule\n"


#============================================================
# POWER MODULE
#============================================================

puts "============================================================"
puts " Generating power_io_pad"
puts "============================================================"

set power_rtl ""

append power_rtl \
"module power_io_pad (\n"

set power_count [llength $power_rows]

for {set i 0} {$i < $power_count} {incr i} {

    set row [lindex $power_rows $i]

    set pin_name [lindex $row 1]

    append power_rtl \
        "    inout wire $pin_name"

    if {$i < ($power_count - 1)} {
        append power_rtl ","
    }

    append power_rtl "\n"
}


#------------------------------------------------------------
# Core clock/reset outputs
#------------------------------------------------------------

append power_rtl ",\n"
append power_rtl "    output wire xtal_in_btc,\n"
append power_rtl "    output wire reset_n_btc,\n"
append power_rtl "    input  wire xtal_out_btc\n"

append power_rtl ");\n\n"


#------------------------------------------------------------
# Power instances
#------------------------------------------------------------

foreach row $power_rows {

    append power_rtl \
        [generate_instance $row $cell_config]

    append power_rtl "\n"
}


append power_rtl "endmodule\n"


#============================================================
# TOP MODULE
#============================================================

puts "============================================================"
puts " Generating top_io_pad"
puts "============================================================"

set top_rtl ""

append top_rtl "module top_io_pad (\n\n"


#============================================================
# TOP PHYSICAL PORTS
#============================================================

append top_rtl "    //========================================================\n"
append top_rtl "    // POWER\n"
append top_rtl "    //========================================================\n"

append top_rtl "    inout wire VDDPST,\n"
append top_rtl "    inout wire VSSPST,\n"
append top_rtl "    inout wire VDD_1_2,\n\n"


#------------------------------------------------------------
# Clock / Reset
#------------------------------------------------------------

append top_rtl "    // CLK/RST\n"
append top_rtl "    inout  wire RESET_N,\n"
append top_rtl "    input  wire XTAL_IN,\n"
append top_rtl "    output wire XTAL_OUT,\n\n"


#============================================================
# ANALOG
#============================================================

append top_rtl "    // ANALOG\n"

set top_analog_ports {}

foreach row $rows {

    set pin_type [lindex $row 3]

    if {$pin_type eq "Analog"} {

        set pin_name [lindex $row 1]

        lappend top_analog_ports $pin_name
    }
}

set top_analog_count [llength $top_analog_ports]

for {set i 0} {$i < $top_analog_count} {incr i} {

    set pin_name [lindex $top_analog_ports $i]

    append top_rtl \
        "    inout wire $pin_name,\n"
}


#============================================================
# DIGITAL
#============================================================

append top_rtl "    // DIGITAL\n"

foreach row $digital_rows {

    set pin_name [lindex $row 1]

    append top_rtl \
        "    inout wire $pin_name,\n"
}


#============================================================
# GPIO
#============================================================

append top_rtl "    // GPIO\n"

set top_gpio_count [llength $gpio_rows]

for {set i 0} {$i < $top_gpio_count} {incr i} {

    set row [lindex $gpio_rows $i]

    set pin_name [lindex $row 1]

    append top_rtl \
        "    inout wire $pin_name,\n"
}


#============================================================
# CLOCK / RESET CORE INTERFACE
#============================================================

append top_rtl "\n"
append top_rtl "    // CLOCK / RESET\n"
append top_rtl "    output wire xtal_in_btc,\n"
append top_rtl "    output wire reset_n_btc,\n\n"


#============================================================
# GPIO CORE INTERFACE
#============================================================

append top_rtl "    // GPIO CORE INTERFACE\n"
append top_rtl "    input  logic \[22:0\] gpio_pad_dir,\n"
append top_rtl "    output logic \[22:0\] gpio_pad_in,\n"
append top_rtl "    input  logic \[22:0\] gpio_pad_out,\n"
append top_rtl "    input  logic \[22:0\] gpio_pad_pull_en,\n\n"


#============================================================
# JTAG CORE INTERFACE
#============================================================

append top_rtl "    // JTAG\n"
append top_rtl "    output wire tck_jtag_btc,\n"
append top_rtl "    output wire tms_jtag_btc,\n"
append top_rtl "    output wire tdi_jtag_btc,\n"
append top_rtl "    output wire trst_jtag_btc,\n"
append top_rtl "    input  wire tdo_jtag_bto\n"

append top_rtl ");\n\n"


#============================================================
# GPIO INSTANCE
#============================================================

append top_rtl \
"    gpio_io_pad u_gpio_io_pad (\n"

append top_rtl \
"        .gpio_pad_dir       (gpio_pad_dir),\n"

append top_rtl \
"        .gpio_pad_in        (gpio_pad_in),\n"

append top_rtl \
"        .gpio_pad_out       (gpio_pad_out),\n"

append top_rtl \
"        .gpio_pad_pull_en   (gpio_pad_pull_en),\n"


set top_gpio_count [llength $gpio_rows]

for {set i 0} {$i < $top_gpio_count} {incr i} {

    set row [lindex $gpio_rows $i]

    set pin_name [lindex $row 1]

    append top_rtl \
        "        .${pin_name} (${pin_name})"

    if {$i < ($top_gpio_count - 1)} {
        append top_rtl ","
    }

    append top_rtl "\n"
}

append top_rtl "    );\n\n"


#============================================================
# DIGITAL INSTANCE
#============================================================

append top_rtl \
"    digital_io_pad u_digital_io_pad (\n"

append top_rtl \
"        .tck_jtag_btc   (tck_jtag_btc),\n"

append top_rtl \
"        .tms_jtag_btc   (tms_jtag_btc),\n"

append top_rtl \
"        .tdi_jtag_btc   (tdi_jtag_btc),\n"

append top_rtl \
"        .trst_jtag_btc  (trst_jtag_btc),\n"

append top_rtl \
"        .tdo_jtag_bto   (tdo_jtag_bto),\n"


set digital_count [llength $digital_rows]

for {set i 0} {$i < $digital_count} {incr i} {

    set row [lindex $digital_rows $i]

    set pin_name [lindex $row 1]

    append top_rtl \
        "        .${pin_name} (${pin_name})"

    if {$i < ($digital_count - 1)} {
        append top_rtl ","
    }

    append top_rtl "\n"
}

append top_rtl "    );\n\n"


#============================================================
# ANALOG INSTANCE
#============================================================

append top_rtl \
"    analog_io_pad u_analog_io_pad (\n"

set top_analog_count [llength $top_analog_ports]

for {set i 0} {$i < $top_analog_count} {incr i} {

    set pin_name [lindex $top_analog_ports $i]

    append top_rtl \
        "        .${pin_name} (${pin_name})"

    if {$i < ($top_analog_count - 1)} {
        append top_rtl ","
    }

    append top_rtl "\n"
}

append top_rtl "    );\n\n"


#============================================================
# POWER INSTANCE
#============================================================

append top_rtl \
"    power_io_pad u_power_io_pad (\n"

append top_rtl \
"        .xtal_in_btc  (xtal_in_btc),\n"

append top_rtl \
"        .reset_n_btc  (reset_n_btc),\n"

append top_rtl \
"        .xtal_out_btc (XTAL_OUT),\n"


set power_count [llength $power_rows]

for {set i 0} {$i < $power_count} {incr i} {

    set row [lindex $power_rows $i]

    set pin_name [lindex $row 1]

    append top_rtl \
        "        .${pin_name} (${pin_name})"

    if {$i < ($power_count - 1)} {
        append top_rtl ","
    }

    append top_rtl "\n"
}

append top_rtl "    );\n\n"


#============================================================
# END TOP MODULE
#============================================================

append top_rtl "endmodule\n"


#============================================================
# WRITE OUTPUT FILES
#============================================================

puts "============================================================"
puts " Writing Output Files"
puts "============================================================"
puts ""


set fp [open $gpio_output w]
puts $fp $gpio_rtl
close $fp

puts "Generated: $gpio_output"


set fp [open $digital_output w]
puts $fp $digital_rtl
close $fp

puts "Generated: $digital_output"


set fp [open $analog_output w]
puts $fp $analog_rtl
close $fp


puts "Generated: $analog_output"


set fp [open $power_output w]
puts $fp $power_rtl
close $fp


puts "Generated: $power_output"


set fp [open $top_output w]
puts $fp $top_rtl
close $fp


puts "Generated: $top_output"


#============================================================
# FINAL SUMMARY
#============================================================

puts ""
puts "============================================================"
puts " IO PAD GENERATION COMPLETED"
puts "============================================================"
puts ""
puts "Total pins     : [llength $rows]"
puts "GPIO pins      : [llength $gpio_rows]"
puts "Digital pins   : [llength $digital_rows]"
puts "Analog pins    : [llength $analog_rows]"
puts "Power pins     : [llength $power_rows]"
puts ""
puts "Output files:"
puts "  $top_output"
puts "  $gpio_output"
puts "  $digital_output"
puts "  $analog_output"
puts "  $power_output"
puts ""
puts "============================================================"
