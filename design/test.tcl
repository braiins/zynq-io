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
# Connection to FPGA, loading bitstream and initialization
####################################################################################################
source test_init.tcl

####################################################################################################
# Test of GPIO LEDs
####################################################################################################
# LEDs are on GPIO_1, pin 2 - PL_LED1 (green on panel)
mwr 0x41210000 4
puts "Set PL_LED1 on"
exec sleep 5
# LEDs are on GPIO_1, pin 3 - PL_LED2 (red on panel)
mwr 0x41210000 8
puts "Set PL_LED2 on"
exec sleep 5
# LEDs are on GPIO_1, pin 4 - PL_LED3 (red on board)
mwr 0x41210000 16
puts "Set PL_LED3 on"
exec sleep 5
# turn off all LEDs
mwr 0x41210000 0
puts "Set all LEDs off"

####################################################################################################
# Test of VID generator
####################################################################################################
puts "Test of VID generator"
# send value of 0x23 and enable generation (mask 0x100)
mwr 0x43C50000 0x123
# wait some time or check if all data are sent
exec sleep 5
# disable generation
mwr 0x43C50000 0x0

####################################################################################################
# Test of FANs
####################################################################################################
source test_fan.tcl

# Timer 0 - FAN1 and FAN2
test_fan "FAN 1&2" $FAN_A
# Timer 1 - FAN3 and FAN4
test_fan "FAN 3&4" $FAN_B
# Timer 2 - FAN5 and FAN6
test_fan "FAN 5&6" $FAN_C

####################################################################################################
# Test of SPI modules
####################################################################################################
source test_spi.tcl

# SPI module 0
test_spi "SPI 0, high speed" 0x41E00000 0x12
# SPI module 1
test_spi "SPI 1, high speed" 0x41E10000 0x34
# SPI module 2
test_spi "SPI 2, high speed" 0x41E20000 0x56
# SPI module 3
test_spi "SPI 3, high speed" 0x41E30000 0x78
exec sleep 5

####################################################################################################
# Test of change FCLK1 frequency
####################################################################################################
# unlock access to  System Level Control Registers (SCLR)
mwr 0xF8000008 0xDF0D
# change frequency of FCLK1 to 1/4 (original value is 0x00400500)
mwr 0xF8000180 0x01000500

# SPI module 0
test_spi "SPI 0, low speed" 0x41E00000 0x12
# SPI module 1
test_spi "SPI 1, low speed" 0x41E10000 0x34
# SPI module 2
test_spi "SPI 2, low speed" 0x41E20000 0x56
# SPI module 3
test_spi "SPI 3, low speed" 0x41E30000 0x78

# change frequency of FCLK1 back to 3.125 MHz
mwr 0xF8000180 0x00400500
# lock access to  System Level Control Registers (SCLR)
mwr 0xF8000004 0x767B
