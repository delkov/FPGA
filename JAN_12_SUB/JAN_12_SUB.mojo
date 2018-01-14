<?xml version="1.0" encoding="UTF-8"?>
<project name="JAN_12_SUB" board="Mojo V3" language="Verilog">
  <files>
    <src>my_clk.v</src>
    <src>mems_spi.v</src>
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
    <core name="fifo_coregen">
      <src>fifo_coregen.ngc</src>
      <src>fifo_coregen.v</src>
    </core>
  </files>
</project>
