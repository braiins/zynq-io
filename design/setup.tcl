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
	"build" \
]

# Set source files
set hdl_files [ \
]

# Set synthesis and implementation constraints files
set constraints_files [list \
	"src/constrs/system.xdc" \
]

# Project directory
set projdir "./build"

####################################################################################################
# Run synthesis, P&R and bitstream generation
####################################################################################################
source "./system_init.tcl"
source "./system_build.tcl"

####################################################################################################
# Exit Vivado
####################################################################################################
exit
