<?xml version="1.0" encoding="UTF-8"?>
<project name="FEB_23_300x4" board="Mojo V3" language="Verilog">
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
    <core name="clk_wiz_v3_6">
      <src>clk_wiz_v3_6.v</src>
    </core>
  </files>
</project>
