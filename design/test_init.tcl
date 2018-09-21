####################################################################################################
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

####################################################################################################
# Check input arguments
####################################################################################################
# check number of arguments
if {$argc == 1} {
    set board [lindex $argv 0]
} else {
    puts "Wrong number of TCL arguments! Expected 1 argument, get $argc"
    puts "List of arguments: $argv"
    exit 1
}

# check name of the board
if { !(($board == "G9") || ($board == "G19")) } {
    puts "Unknown board: $board"
    puts "Only supported boards are G9 and G19!"
    exit 1
}

puts "Board name: $board"

# Project directory
set projdir "./build_$board"

####################################################################################################
# Control board initialization
####################################################################################################
connect arm hw
fpga -f ${projdir}/results/system.bit
source ${projdir}/results/system/ps7_init.tcl
ps7_init
ps7_post_config
