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
