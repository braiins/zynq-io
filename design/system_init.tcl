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
	set vid_width 4
} else {
	puts "Unknown board: $board"
	puts "Only supported boards are G9 and G19!"
	exit 1
}

puts "Board name: $board"

###########################################################
# CREATE PROJECT
###########################################################
create_project -force $design $projdir -part $partname
set_property target_language Verilog [current_project]

if {[info exists board_part]} {
    set_property board_part $board_part [current_project]
}

###########################################################
# Create Report/Results Directory
###########################################################
set report_dir  $projdir/reports
set results_dir $projdir/results
if ![file exists $report_dir]  {file mkdir $report_dir}
if ![file exists $results_dir] {file mkdir $results_dir}

###########################################################
# Add IP Repositories to search path
###########################################################

set other_repos [get_property ip_repo_paths [current_project]]
set_property  ip_repo_paths  "$ip_repos $other_repos" [current_project]

update_ip_catalog

###########################################################
# CREATE BLOCK DESIGN (GUI/TCL COMBO)
###########################################################

create_bd_design "system"

source "./system_bd.tcl"
make_wrapper -files [get_files $projdir/${design}.srcs/sources_1/bd/system/system.bd] -top

###########################################################
# ADD FILES
###########################################################

#HDL
if {[string equal [get_filesets -quiet sources_1] ""]} {
    create_fileset -srcset sources_1
}
set top_wrapper $projdir/${design}.srcs/sources_1/bd/system/hdl/system_wrapper.v
add_files -norecurse -fileset [get_filesets sources_1] $top_wrapper

if {[llength $hdl_files] != 0} {
    add_files -norecurse -fileset [get_filesets sources_1] $hdl_files
}

#CONSTRAINTS
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}
if {[llength $constraints_files] != 0} {
    add_files -norecurse -fileset [get_filesets constrs_1] $constraints_files
}



