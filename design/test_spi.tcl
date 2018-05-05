####################################################################################################
# SPI procedures
####################################################################################################
# test of SPI module - configure core and send one byte
proc test_spi {name base_addr data} {
	puts "Test of $name"
	# reset of SPI core
	mwr [expr $base_addr + 0x40] 0x0A
	# enable SPI core
	mwr [expr $base_addr + 0x60] 0x086
	# select CS (set to 0)
	mwr [expr $base_addr + 0x70] 0x0
	# sent data (1 byte)
	mwr [expr $base_addr + 0x68] $data
	# deselect CS (set to 1)
	mwr [expr $base_addr + 0x70] 0x1
}
