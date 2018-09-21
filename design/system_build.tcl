####################################################################################################
# Copyright (c) 2016 Andreas Olofsson
# Copyright (c) 2018 Braiins Systems s.r.o.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
####################################################################################################

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
# file copy -force ${design}_bd.tcl ${design}_bd.tcl.backup
write_bd_tcl -force ./${design}.backup.tcl
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
report_timing_summary -file $projdir/reports/timing_synth.rpt

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
report_timing_summary -file $projdir/reports/timing_impl.rpt
report_utilization -file $projdir/reports/utilization_placed.rpt
report_io -file $projdir/reports/io_placed.rpt
report_drc -file $projdir/reports/drc_routed.rpt

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
exec unzip $projdir/results/${design}.hdf -d $projdir/results/system
