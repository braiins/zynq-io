###########################################################
# DEFAULTS
###########################################################
if {![info exists design]} {
    set design system
    puts "INFO: Setting design name to '${design}'"
}

###########################################################
# Save any gui changes
###########################################################
validate_bd_design
file copy -force ${design}_bd.tcl ${design}_bd.tcl.backup
write_bd_tcl -force ./${design}_bd.tcl
make_wrapper -files [get_files $projdir/${design}.srcs/sources_1/bd/${design}/${design}.bd] -top

###########################################################
# ADD GENERATED WRAPPER FILE
###########################################################
remove_files -fileset sources_1 $projdir/${design}.srcs/sources_1/bd/${design}/hdl/${design}_wrapper.v
add_files -fileset sources_1 -norecurse $projdir/${design}.srcs/sources_1/bd/${design}/hdl/${design}_wrapper.v
# replace generated wrapper by custom modified file
# add_files -fileset sources_1 -norecurse src/hdl/${design}_wrapper.v

###########################################################
# PREPARE FOR SYNTHESIS
###########################################################
if {[info exists oh_synthesis_options]} {
    puts "INFO: Synthesis with following options: $oh_synthesis_options"
    set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value $oh_synthesis_options -objects [get_runs synth_1]
}
# Newer Vivado doesn't seem to support the above
if {[info exists oh_verilog_define]} {
    puts "INFO: Adding following verilog defines to fileset: ${oh_verilog_define}"
    set_property verilog_define ${oh_verilog_define} [current_fileset]
}

###########################################################
# SYNTHESIS
###########################################################
launch_runs synth_1 -jobs $jobs
wait_on_run synth_1
open_run synth_1
report_timing_summary -file $projdir/reports/timing_synth.log

###########################################################
# CREATE HARDWARE DEFINITION FILE
###########################################################
write_hwdef -force -file $projdir/results/${design}.hwdef

###########################################################
# PLACE AND ROUTE
###########################################################
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE Explore [get_runs impl_1]
set_property STRATEGY "Performance_Explore" [get_runs impl_1]
launch_runs impl_1 -jobs $jobs
wait_on_run impl_1
open_run impl_1
report_timing_summary -file $projdir/reports/timing_impl.log

###########################################################
# CREATE NETLIST + REPORTS
###########################################################
#write_verilog ./${design}.v

###########################################################
# WRITE BITSTREAM
###########################################################
write_bitstream -force -bin_file -file $projdir/results/${design}.bit

###########################################################
# WRITE SYSTEM DEFINITION
###########################################################
write_sysdef -force \
	-hwdef $projdir/results/${design}.hwdef \
	-bitfile $projdir/results/${design}.bit \
	-file $projdir/results/${design}.hdf

# extract content of archive
exec unzip build/results/${design}.hdf -d build/results/system

