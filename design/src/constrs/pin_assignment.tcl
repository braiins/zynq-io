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
# Pin assignment for GPIO
####################################################################################################
# GPIO 0, all inputs
set_property PACKAGE_PIN W20 [get_ports {gpio_0_tri_i[0]}]
set_property PACKAGE_PIN W16 [get_ports {gpio_0_tri_i[1]}]
set_property PACKAGE_PIN R18 [get_ports {gpio_0_tri_i[2]}]
set_property PACKAGE_PIN W19 [get_ports {gpio_0_tri_i[3]}]
set_property PACKAGE_PIN P15 [get_ports {gpio_0_tri_i[4]}]
set_property PACKAGE_PIN U15 [get_ports {gpio_0_tri_i[5]}]
set_property PACKAGE_PIN Y19 [get_ports {gpio_0_tri_i[6]}]
set_property PACKAGE_PIN T16 [get_ports {gpio_0_tri_i[7]}]
set_property PACKAGE_PIN V18 [get_ports {gpio_0_tri_i[8]}]
set_property PACKAGE_PIN Y16 [get_ports {gpio_0_tri_i[9]}]

# GPIO 1, all outputs
# for gpio_1_tri_o[0] also U19 was defined in excell sheet
set_property PACKAGE_PIN R19 [get_ports {gpio_1_tri_o[0]}]
set_property PACKAGE_PIN T19 [get_ports {gpio_1_tri_o[1]}]
set_property PACKAGE_PIN N18 [get_ports {gpio_1_tri_o[2]}]
set_property PACKAGE_PIN P19 [get_ports {gpio_1_tri_o[3]}]
set_property PACKAGE_PIN N20 [get_ports {gpio_1_tri_o[4]}]
set_property PACKAGE_PIN V20 [get_ports {gpio_1_tri_o[5]}]
set_property PACKAGE_PIN V16 [get_ports {gpio_1_tri_o[6]}]
set_property PACKAGE_PIN T17 [get_ports {gpio_1_tri_o[7]}]
set_property PACKAGE_PIN W18 [get_ports {gpio_1_tri_o[8]}]
set_property PACKAGE_PIN P18 [get_ports {gpio_1_tri_o[9]}]
set_property PACKAGE_PIN U14 [get_ports {gpio_1_tri_o[10]}]
set_property PACKAGE_PIN U20 [get_ports {gpio_1_tri_o[11]}]
set_property PACKAGE_PIN Y17 [get_ports {gpio_1_tri_o[12]}]
set_property PACKAGE_PIN P14 [get_ports {gpio_1_tri_o[13]}]
set_property PACKAGE_PIN Y18 [get_ports {gpio_1_tri_o[14]}]
set_property PACKAGE_PIN R16 [get_ports {gpio_1_tri_o[15]}]
set_property PACKAGE_PIN V17 [get_ports {gpio_1_tri_o[16]}]
set_property PACKAGE_PIN N17 [get_ports {gpio_1_tri_o[17]}]
set_property PACKAGE_PIN P16 [get_ports {gpio_1_tri_o[18]}]
set_property PACKAGE_PIN P20 [get_ports {gpio_1_tri_o[19]}]
set_property PACKAGE_PIN R17 [get_ports {gpio_1_tri_o[20]}]
set_property PACKAGE_PIN U17 [get_ports {gpio_1_tri_o[21]}]
set_property PACKAGE_PIN R14 [get_ports {gpio_1_tri_o[22]}]
set_property PACKAGE_PIN T11 [get_ports {gpio_1_tri_o[23]}]
set_property PACKAGE_PIN T10 [get_ports {gpio_1_tri_o[24]}]
set_property PACKAGE_PIN T12 [get_ports {gpio_1_tri_o[25]}]
set_property PACKAGE_PIN U12 [get_ports {gpio_1_tri_o[26]}]
set_property PACKAGE_PIN U13 [get_ports {gpio_1_tri_o[27]}]

# GPIO 2, all outputs
set_property PACKAGE_PIN C20 [get_ports {gpio_2_tri_o[0]}]
set_property PACKAGE_PIN B20 [get_ports {gpio_2_tri_o[1]}]
set_property PACKAGE_PIN D19 [get_ports {gpio_2_tri_o[2]}]
set_property PACKAGE_PIN D20 [get_ports {gpio_2_tri_o[3]}]
set_property PACKAGE_PIN M19 [get_ports {gpio_2_tri_o[4]}]
set_property PACKAGE_PIN M20 [get_ports {gpio_2_tri_o[5]}]
set_property PACKAGE_PIN K19 [get_ports {gpio_2_tri_o[6]}]
set_property PACKAGE_PIN J19 [get_ports {gpio_2_tri_o[7]}]
set_property PACKAGE_PIN F19 [get_ports {gpio_2_tri_o[8]}]
set_property PACKAGE_PIN G17 [get_ports {gpio_2_tri_o[9]}]
set_property PACKAGE_PIN G14 [get_ports {gpio_2_tri_o[10]}]
set_property PACKAGE_PIN J15 [get_ports {gpio_2_tri_o[11]}]
set_property PACKAGE_PIN J16 [get_ports {gpio_2_tri_o[12]}]

# GPIO 3, all inputs
set_property PACKAGE_PIN F20 [get_ports {gpio_3_tri_i[0]}]

####################################################################################################
# IO standard for GPIO pins
####################################################################################################
# GPIO 0, all inputs, LVCMOS33
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_0_tri_i[9]}]

# GPIO 1, all outputs, LVCMOS33
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_1_tri_o[27]}]

# GPIO 2, all outputs, LVCMOS18
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_2_tri_o[12]}]

# GPIO 3, all inputs, LVCMOS18
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_3_tri_i[0]}]


####################################################################################################
# Pin assignment for SPI
####################################################################################################
# SPI 0
# io0 -> MOSI, io1 -> MISO
set_property PACKAGE_PIN B19 [get_ports {spi_0_io0_io}]
set_property PACKAGE_PIN A20 [get_ports {spi_0_io1_io}]
set_property PACKAGE_PIN E17 [get_ports {spi_0_sck_io}]
set_property PACKAGE_PIN D18 [get_ports {spi_0_ss_io[0]}]

# SPI 1
set_property PACKAGE_PIN E18 [get_ports {spi_1_io0_io}]
set_property PACKAGE_PIN E19 [get_ports {spi_1_io1_io}]
set_property PACKAGE_PIN F16 [get_ports {spi_1_sck_io}]
set_property PACKAGE_PIN F17 [get_ports {spi_1_ss_io[0]}]

# SPI 2
set_property PACKAGE_PIN M17 [get_ports {spi_2_io0_io}]
set_property PACKAGE_PIN M18 [get_ports {spi_2_io1_io}]
set_property PACKAGE_PIN L19 [get_ports {spi_2_sck_io}]
set_property PACKAGE_PIN L20 [get_ports {spi_2_ss_io[0]}]

# SPI 3
set_property PACKAGE_PIN L16 [get_ports {spi_3_io0_io}]
set_property PACKAGE_PIN L17 [get_ports {spi_3_io1_io}]
set_property PACKAGE_PIN K17 [get_ports {spi_3_sck_io}]
set_property PACKAGE_PIN K18 [get_ports {spi_3_ss_io[0]}]

# SPI 4
set_property PACKAGE_PIN H16 [get_ports {spi_4_io0_io}]
set_property PACKAGE_PIN H17 [get_ports {spi_4_io1_io}]
set_property PACKAGE_PIN J18 [get_ports {spi_4_sck_io}]
set_property PACKAGE_PIN H18 [get_ports {spi_4_ss_io[0]}]

# SPI 5
set_property PACKAGE_PIN G18 [get_ports {spi_5_io0_io}]
set_property PACKAGE_PIN J20 [get_ports {spi_5_io1_io}]
set_property PACKAGE_PIN H20 [get_ports {spi_5_sck_io}]
set_property PACKAGE_PIN G19 [get_ports {spi_5_ss_io[0]}]

####################################################################################################
# IO standard for GPIO pins
####################################################################################################
# SPI 0
set_property IOSTANDARD LVCMOS18 [get_ports {spi_0_io0_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_0_io1_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_0_sck_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_0_ss_io[0]}]

# SPI 1
set_property IOSTANDARD LVCMOS18 [get_ports {spi_1_io0_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_1_io1_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_1_sck_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_1_ss_io[0]}]

# SPI 2
set_property IOSTANDARD LVCMOS18 [get_ports {spi_2_io0_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_2_io1_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_2_sck_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_2_ss_io[0]}]

# SPI 3
set_property IOSTANDARD LVCMOS18 [get_ports {spi_3_io0_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_3_io1_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_3_sck_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_3_ss_io[0]}]

# SPI 4
set_property IOSTANDARD LVCMOS18 [get_ports {spi_4_io0_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_4_io1_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_4_sck_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_4_ss_io[0]}]

# SPI 5
set_property IOSTANDARD LVCMOS18 [get_ports {spi_5_io0_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_5_io1_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_5_sck_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_5_ss_io[0]}]

####################################################################################################
# PWM assignment and IO standard definition
####################################################################################################
set_property PACKAGE_PIN W13 [get_ports {pwm0}]
set_property PACKAGE_PIN V12 [get_ports {pwm1}]
set_property PACKAGE_PIN V13 [get_ports {pwm2}]
set_property IOSTANDARD LVCMOS33 [get_ports {pwm0}]
set_property IOSTANDARD LVCMOS33 [get_ports {pwm1}]
set_property IOSTANDARD LVCMOS33 [get_ports {pwm2}]


####################################################################################################
# VID_GEN assignment and IO standard definition
####################################################################################################
set_property PACKAGE_PIN T20 [get_ports {vid_output[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_output[0]}]

if {[info exists vid_width] && $vid_width > 1} {
	puts "Using extended ports for VIDGEN (number of ports: $vid_width)"
	set_property PACKAGE_PIN T14 [get_ports {vid_output[1]}]
	set_property PACKAGE_PIN T15 [get_ports {vid_output[2]}]
	set_property PACKAGE_PIN V15 [get_ports {vid_output[3]}]
	set_property PACKAGE_PIN Y14 [get_ports {vid_output[4]}]
	set_property PACKAGE_PIN W14 [get_ports {vid_output[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {vid_output[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {vid_output[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {vid_output[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {vid_output[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {vid_output[5]}]
}
