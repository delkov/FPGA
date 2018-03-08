set projDir "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/planAhead"
set projName "FEB25_30lines"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/mojo_top_0.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/main_control_1.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/fifo_manager_2.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/mems_rom_3.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/my_clk_4.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/my_clk_5.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/tdc_control_6.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/tdc_spi_master_7.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/mems_control_8.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/mems_spi_9.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/serial_rx_10.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/serial_tx2_11.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/FIFO_12.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/work/verilog/tdc_rom_13.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/delkov/mojo/SIMPLE/FEB25_30lines/constraint/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set coreSources [list "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/new_clk.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x390_N0_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x390_N0_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_31x362_N20_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_31x362_N20_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_COMBO.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_COMBO.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x120_min2.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x120_min2.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x420_min2.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x420_min2.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S12_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S12_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x220_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x220_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S8_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S8_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_110V_N0.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_110V_N0.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_19x272_N20_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_19x272_N20_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_59x120_16b.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_59x120_16b.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x240_NN0_S13_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x240_NN0_S13_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_70Vx110V_N20.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_70Vx110V_N20.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S12_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S12_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/UPD_ROM_39x240_min2.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/UPD_ROM_39x240_min2.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S8_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S8_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x240_70Vx110V_N0.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x240_70Vx110V_N0.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x420_N0_S11_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x420_N0_S11_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x160_16b.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x160_16b.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM6.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM6.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM7.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM7.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM4.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM4.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM2.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM2.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM3.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM3.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x272_N20_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x272_N20_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_31x362_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_31x362_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S13_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S13_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_59x160_16b.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_59x160_16b.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_59x160_min7.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_59x160_min7.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x90_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x90_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x272_N20_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x272_N20_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x286_N0_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x286_N0_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S13_65Vx85V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S13_65Vx85V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x220_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x220_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x286_N0_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x286_N0_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x70_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x70_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_N20_85V_110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_N20_85V_110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_39x240_N_20_100V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_39x240_N_20_100V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_39x240_N_20_120V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_39x240_N_20_120V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x560_N0_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x160_min0.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x160_min0.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x420_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x420_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x368_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x368_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x120.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x120.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x120.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x120_16b.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x120_16b.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x120.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x272_N20_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x272_N20_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/MEMS_ROM.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/MEMS_ROM.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_4x272_N20_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_4x272_N20_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x272_N20_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x272_N20_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_19x544_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_19x544_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x240_N0_39x240_N20_70Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x240_N0_39x240_N20_70Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S20_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S20_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x270_N0_S13_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x270_N0_S13_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_9x240_N_25.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_9x240_N_25.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x120_16b.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x120_16b.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x270_NN0_S13_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x270_NN0_S13_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S14_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S14_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S13_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S13_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x210_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x210_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x200_NN0_S13_65Vx100V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_7x200_NN0_S13_65Vx100V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/FFF_COMBO.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/FFF_COMBO.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x210_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S10_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S10_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_70V_N20.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_70V_N20.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S4_65Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_5x420_N0_S4_65Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_110V_N20.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_110V_N20.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/clk_wiz_v3_6.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x272_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x272_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x480_min2.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x480_min2.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x362_N20_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_29x362_N20_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x120_16b.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x120_16b.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x220_N0_S4_85Vx110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_3x220_N0_S4_85Vx110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_min2.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_min2.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_39x240_N_20.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/CUT_39x240_N_20.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x270_N20_85V_110V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_9x270_N20_85V_110V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/NEW_ROM_39x120.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/NEW_ROM_39x120.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x140.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x140.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_N20_70Vx100V.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_N20_70Vx100V.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_70V_N_0.v" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_70V_N_0.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_min2_N_25.ngc" "/home/delkov/mojo/SIMPLE/FEB25_30lines/coreGen/ROM_39x240_min2_N_25.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $coreSources
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
