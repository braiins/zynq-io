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
# Fan procedures
####################################################################################################
set FAN_A 0x42800000
set FAN_B 0x42810000
set FAN_C 0x42820000

set DUTY_MAX 1997

proc fan_init {base_addr} {
	# set frequency to 25kHz
	mwr [expr $base_addr + 0x04] 1998
	# set duty cycle to 100%
	mwr [expr $base_addr + 0x14] 0
	# enable timers and PWM generations
	mwr [expr $base_addr + 0x00] 0x206
	mwr [expr $base_addr + 0x10] 0x606
}

proc fan_duty {base_addr percent} {
	global DUTY_MAX
	mwr [expr $base_addr + 0x14] [expr $DUTY_MAX * (100 - $percent) / 100]
}

# test of PWM module for fan - configure core and set different speed of fan
proc test_fan {name base_addr} {
	fan_init $base_addr

	puts -nonewline "Test of $name, speed set to 100%"
	flush stdout
	exec sleep 2

	# set duty cycle to 50%
	fan_duty $base_addr 50
	puts -nonewline "..50%"
	flush stdout
	exec sleep 2

	# set duty cycle to 25%
	fan_duty $base_addr 25
	puts -nonewline "..25%"
	flush stdout
	exec sleep 2

	# set duty cycle to 0%
	fan_duty $base_addr 0
	puts -nonewline "..0%"
	flush stdout
	exec sleep 2

	# set duty cycle to 100%
	fan_duty $base_addr 100
	puts "..100%"
}
