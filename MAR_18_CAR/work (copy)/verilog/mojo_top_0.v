module mojo_top_0_0(
    input clk, // 50Mhz
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections

    // TDC
    output tdc_mosi,
    output tdc_spi_clock,
    output tdc_CS,
    output tdc_new_data,
    output tdc_start,
    output tdc_busy,
    output tdc_enable,
    output TDC_REF_CLOCK,
    output TDC_START_SIGNAL,
    output TDC_STOP_SIGNAL, // just for now
    input TDC_TRIG,
    input TDC_INTB,
    input w_TDC_DOUT,
    output w_tx_OUT_TDC,
    output play,
    output pause,
    output laser_trig,
    // END TDC

    // FIFO
    output FIFO_FULL,
    output FIFO_EMPTY,
    output w_rd_en,
    output w_wr_en,
    // END FIFO

    // SERIAL
    output tx_busy_TDC,
    output t_new_data_FROM_FIFO_TO_SERIAL,
    // END SERIAL

    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy // AVR Rx buffer full
  );
 
  wire rst = ~rst_n; // make reset active high

  assign tdc_new_data = tdc_new_data;
  assign tdc_start = tdc_start;

  assign w_rd_en = t_rd_en;
  assign w_wr_en = s1_wr_en;

  wire [7:0] tx_data;
  wire new_tx_data;
  wire tx_busy;
  wire [7:0] rx_data;
  wire new_rx_data;
  

  wire tdc_busy;
  wire tdc_start;
  wire tdc_new_data;

  wire [7:0] tdc_data_in;
  wire [7:0] tdc_data_out;

  wire w_CS_END;

  avr_interface_1 avr_interface (
    .clk(clk),
    .rst(rst),
    .cclk(cclk),
    .spi_miso(spi_miso),
    .spi_mosi(spi_mosi),
    .spi_sck(spi_sck),
    .spi_ss(spi_ss),
    .spi_channel(spi_channel),
    .tx(avr_rx), // FPGA tx goes to AVR rx
    .rx(avr_tx),
    .channel(4'd15), // invalid channel disables the ADC
    .new_sample(),
    .sample(),
    .sample_channel(),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .tx_block(avr_rx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data)
  );
 
  wire s1_wr_en;
  wire [47:0] s1_din;
  wire s1_fifo_writing_done;
  // wire s2_fifo_writing_done;

  wire w_soft_reset;
  wire tdc_enable;
  wire play, pause;

  
  tdc_control_2_1 tdc_control (
    .clk(clk),
    .rst(rst),
    // .tx_data(tx_data),
    // .new_tx_data(new_tx_data),
    // .tx_busy(tx_busy),
    // .rx_data(rx_data),
    // .new_rx_data(new_rx_data),
    .start(tdc_start),
    .new_data(tdc_new_data),
    .tdc_busy(tdc_busy),
    .tdc_MOSI(tdc_data_in),
    .tdc_MISO(tdc_data_out),
    .enable(tdc_enable),
    .start_signal(TDC_START_SIGNAL),
    .stop_signal(TDC_STOP_SIGNAL),
    .tdc_trig(TDC_TRIG),
    .w_TDC_INTB(TDC_INTB),
    .CS_END(w_CS_END),
    .w_wr_en(s1_wr_en),
    // .w_wr_en2(s2_wr_en),
    .data_TO_FIFO(s1_din),
    .fifo_writing_done(s1_fifo_writing_done),
    // .fifo_writing_done2(s2_fifo_writing_done),
    .soft_reset(w_soft_reset),
    .play(play),
    .pause(pause),
    .laser_trig(laser_trig)
  );
 

  main_control_3 main_control (
    .clk(clk),
    .rst(rst),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data),
    .enable(tdc_enable),
    .soft_reset(w_soft_reset),
    .play(play),
    .pause(pause)
  );

  fifo_manager_4 fifo_manager (
    // input
    .clk(clk),
    .rst(rst),
    .s1_wr_en(s1_wr_en),
    .s2_wr_en(s2_wr_en),
    .s1_din(s1_din),
    .w_s1_fifo_writing_done(s1_fifo_writing_done),
    // .w_s2_fifo_writing_done(s2_fifo_writing_done),
    // output
    .tx_busy_TDC(tx_busy_TDC),
    .new_data_FROM_FIFO_TO_SERIAL(t_new_data_FROM_FIFO_TO_SERIAL),
    .w_tx_OUT_TDC(w_tx_OUT_TDC),
    .w_empty(FIFO_EMPTY),
    .w_full(FIFO_FULL),
    .t_rd_en(t_rd_en)
  );


  // 3 for 6 MHz
  tdc_spi_master2_5 #(.CLK_DIV(3)) tdc_spi_master(
    .clk(clk),
    .rst(rst),
    .miso(w_TDC_DOUT),
    .mosi(tdc_mosi),
    .sck(tdc_spi_clock),
    .start(tdc_start), // for SPI
    .data_in(tdc_data_in),
    .data_out(tdc_data_out),
    .busy(tdc_busy),
    .new_data(tdc_new_data),
    .CS(tdc_CS),
    .CS_END(w_CS_END)
  );
   

   my_clk_6 #(.CLK_DIV(4)) tdc_ref_clk (
   .clk(clk),
   .rst(rst),
   .my_clk(TDC_REF_CLOCK)
   ); 

endmodule