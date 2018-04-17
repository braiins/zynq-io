# Add path to Vivado executables if necessary
# export PATH=$PATH:
# Set license file
# export XILINXD_LICENSE_FILE=

WORK="build"

rm -rf $WORK
mkdir $WORK
vivado -mode batch -source setup.tcl -journal $WORK/vivado.jou -log $WORK/vivado.log
rm -rf .Xil
