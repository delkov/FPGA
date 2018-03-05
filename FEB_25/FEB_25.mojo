<?xml version="1.0" encoding="UTF-8"?>
<project name="FEB_25" board="Mojo V3" language="Verilog">
  <files>
    <src>my_clk.v</src>
    <src>fake_tdc.v</src>
    <src>mems_spi.v</src>
    <src>fake_mems.v</src>
    <src>spi_slave.v</src>
    <src>FIFO.v</src>
    <src>avr_interface.v</src>
    <src>tdc_control.v</src>
    <src>fifo_manager.v</src>
    <src>mems_control.v</src>
    <src top="true">mojo_top.v</src>
    <src>serial_tx.v</src>
    <src>main_control.v</src>
    <src>cclk_detector.v</src>
    <src>tdc_spi_master.v</src>
    <src>serial_rx.v</src>
    <src>tdc_rom.v</src>
    <src>serial_tx2.v</src>
    <src>mems_rom.v</src>
    <ucf>mojo.ucf</ucf>
    <core name="new_clk">
      <src>new_clk.v</src>
    </core>
    <core name="MEMS_ROM">
      <src>MEMS_ROM.ngc</src>
      <src>MEMS_ROM.v</src>
    </core>
    <core name="ROM_39x120_min2">
      <src>ROM_39x120_min2.v</src>
      <src>ROM_39x120_min2.ngc</src>
    </core>
    <core name="ROM_39x420_min2">
      <src>ROM_39x420_min2.ngc</src>
      <src>ROM_39x420_min2.v</src>
    </core>
    <core name="CUT_9x240_N_25">
      <src>CUT_9x240_N_25.ngc</src>
      <src>CUT_9x240_N_25.v</src>
    </core>
    <core name="ROM_39x240_110V_N0">
      <src>ROM_39x240_110V_N0.ngc</src>
      <src>ROM_39x240_110V_N0.v</src>
    </core>
    <core name="ROM_39x120_16b">
      <src>ROM_39x120_16b.v</src>
      <src>ROM_39x120_16b.ngc</src>
    </core>
    <core name="ROM_59x120_16b">
      <src>ROM_59x120_16b.ngc</src>
      <src>ROM_59x120_16b.v</src>
    </core>
    <core name="ROM_39x240_70Vx110V_N20">
      <src>ROM_39x240_70Vx110V_N20.ngc</src>
      <src>ROM_39x240_70Vx110V_N20.v</src>
    </core>
    <core name="UPD_ROM_39x240_min2">
      <src>UPD_ROM_39x240_min2.ngc</src>
      <src>UPD_ROM_39x240_min2.v</src>
    </core>
    <core name="blk_mem_gen_v7_3" />
    <core name="ROM_9x160_16b">
      <src>ROM_9x160_16b.v</src>
      <src>ROM_9x160_16b.ngc</src>
    </core>
    <core name="ROM6">
      <src>ROM6.v</src>
      <src>ROM6.ngc</src>
    </core>
    <core name="ROM7">
      <src>ROM7.ngc</src>
      <src>ROM7.v</src>
    </core>
    <core name="ROM4">
      <src>ROM4.v</src>
      <src>ROM4.ngc</src>
    </core>
    <core name="ROM_39x240_70V_N20">
      <src>ROM_39x240_70V_N20.v</src>
      <src>ROM_39x240_70V_N20.ngc</src>
    </core>
    <core name="ROM2">
      <src>ROM2.ngc</src>
      <src>ROM2.v</src>
    </core>
    <core name="ROM3">
      <src>ROM3.v</src>
      <src>ROM3.ngc</src>
    </core>
    <core name="ROM_39x240_110V_N20">
      <src>ROM_39x240_110V_N20.ngc</src>
      <src>ROM_39x240_110V_N20.v</src>
    </core>
    <core name="clk_wiz_v3_6">
      <src>clk_wiz_v3_6.v</src>
    </core>
    <core name="ROM_59x160_16b">
      <src>ROM_59x160_16b.ngc</src>
      <src>ROM_59x160_16b.v</src>
    </core>
    <core name="ROM_59x160_min7">
      <src>ROM_59x160_min7.v</src>
      <src>ROM_59x160_min7.ngc</src>
    </core>
    <core name="ROM_39x480_min2">
      <src>ROM_39x480_min2.v</src>
      <src>ROM_39x480_min2.ngc</src>
    </core>
    <core name="ROM_9x120_16b">
      <src>ROM_9x120_16b.v</src>
      <src>ROM_9x120_16b.ngc</src>
    </core>
    <core name="CUT_39x240_N_20_100V">
      <src>CUT_39x240_N_20_100V.v</src>
      <src>CUT_39x240_N_20_100V.ngc</src>
    </core>
    <core name="CUT_39x240_N_20_120V">
      <src>CUT_39x240_N_20_120V.v</src>
      <src>CUT_39x240_N_20_120V.ngc</src>
    </core>
    <core name="ROM_9x160_min0">
      <src>ROM_9x160_min0.ngc</src>
      <src>ROM_9x160_min0.v</src>
    </core>
    <core name="ROM_39x240_min2">
      <src>ROM_39x240_min2.v</src>
      <src>ROM_39x240_min2.ngc</src>
    </core>
    <core name="CUT_39x240_N_20">
      <src>CUT_39x240_N_20.ngc</src>
      <src>CUT_39x240_N_20.v</src>
    </core>
    <core name="NEW_ROM_39x120">
      <src>NEW_ROM_39x120.ngc</src>
      <src>NEW_ROM_39x120.v</src>
    </core>
    <core name="ROM_39x140">
      <src>ROM_39x140.v</src>
      <src>ROM_39x140.ngc</src>
    </core>
    <core name="ROM_39x120">
      <src>ROM_39x120.v</src>
      <src>ROM_39x120.ngc</src>
    </core>
    <core name="ROM_39x240_70V_N_0">
      <src>ROM_39x240_70V_N_0.v</src>
      <src>ROM_39x240_70V_N_0.ngc</src>
    </core>
    <core name="ROM_39x240_min2_N_25">
      <src>ROM_39x240_min2_N_25.ngc</src>
      <src>ROM_39x240_min2_N_25.v</src>
    </core>
    <core name="ROM_9x120">
      <src>ROM_9x120.v</src>
      <src>ROM_9x120_16b.v</src>
      <src>ROM_9x120_16b.ngc</src>
      <src>ROM_9x120.ngc</src>
    </core>
  </files>
</project>
