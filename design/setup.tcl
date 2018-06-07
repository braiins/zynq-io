###########################################################
# CHECK INPUT ARGUMENTS
###########################################################
# check number of arguments
if {$argc == 1} {
	set board [lindex $argv 0]
} else {
	puts "Wrong number of TCL arguments! Expected 1 argument, get $argc"
	puts "List of arguments: $argv"
	exit 1
}

# check name of the board
if {$board == "G9"} {
	set vid_width 1
} elseif {$board == "G19"} {
	set vid_width 6
} else {
	puts "Unknown board: $board"
	puts "Only supported boards are G9 and G19!"
	exit 1
}

puts "Board name: $board"

####################################################################################################
# Preset global variables and attributes
####################################################################################################
# Design name ("system" recommended)
set design "system"

# Device name
set partname "xc7z010clg400-1"

# define number of parallel jobs
set jobs 2

# Paths to all IP blocks to use in Vivado "system.bd"
set ip_repos [ list \
	"ip_repository" \
	"build_$board" \
]

# Set source files
set hdl_files [ \
]

# Set synthesis and implementation constraints files
set constraints_files [list \
	"src/constrs/system.tcl" \
]

# Project directory
set projdir "./build_$board"

####################################################################################################
# Run synthesis, P&R and bitstream generation
####################################################################################################
source "./system_init.tcl"
source "./system_build.tcl"

####################################################################################################
# Exit Vivado
####################################################################################################
exit
