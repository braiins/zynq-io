####################################################################################################
# Control board initialization
####################################################################################################
connect arm hw
fpga -f build/results/system.bit
# fpga -f build/system.runs/impl_1/system_wrapper.bit
source build/results/system/ps7_init.tcl
ps7_init
ps7_post_config
