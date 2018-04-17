####################################################################################################
# Generate IP component io_driver
####################################################################################################
puts "Generating IP component io_driver ..."
ipx::infer_core -vendor braiins.cz -library ip -taxonomy /UserIP -root_dir $projdir/ip_repo/io_driver -files src/hdl/io_driver.vhd
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
