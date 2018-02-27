set projDir "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/planAhead"
set projName "FEB_16_140x11"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/mojo_top_0.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/avr_interface_1.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/main_control_2.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/fifo_manager_3.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/mems_rom_4.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/tdc_control_5.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/tdc_spi_master_6.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/mems_control_7.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/mems_spi_8.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/my_clk_9.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/my_clk_10.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/cclk_detector_11.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/spi_slave_12.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/serial_rx_13.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/serial_tx_14.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/serial_tx2_15.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/FIFO_16.v" "/home/delkov/mojo/SIMPLE/FEB_16_140x11/work/verilog/tdc_rom_17.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/delkov/mojo/SIMPLE/FEB_16_140x11/constraint/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
