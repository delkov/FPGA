module mojo_top(

  // GLOBAL
  input clk, // 50Mhz
  input rst_n,

  input SERIAL_IN,
  // AVR 
  input cclk,
  input spi_ss,
  input spi_mosi,
  input spi_sck,
  input avr_tx, // AVR Tx => FPGA Rx
  input avr_rx_busy, // AVR Rx buffer full

  output spi_miso,
  output [3:0] spi_channel,
  output avr_rx, // AVR Rx => FPGA Tx

  // TDC
  input TDC_INTB,
  input TDC_DOUT,

  output TDC_MOSI,
  output TDC_SPI_CLOCK,
  output TDC_CS,
  output TDC_ENABLE,
  output TDC_REF_CLOCK,
  output TDC_START_SIGNAL,
  output SERIAL_OUT_TDC,


  // DEBUGGING
  // input TDC_TRIG,
    // FIFO
  output FIFO_FULL,
  output FIFO_EMPTY,
  output w_rd_en,
  output w_wr_en,
    // SERIAL
  output tx_busy_TDC,
  output t_new_data_FROM_FIFO_TO_SERIAL
  // output play,
  // output pause,
  );
 

  // GLOBAL
  wire rst = ~rst_n; // make reset active high
  wire soft_reset;
  wire play, pause;

  // MY AVR
  wire [7:0] tx_data;
  wire new_tx_data;
  wire tx_busy;

  // EXTERNAL SERIAL
  // wire [7:0] rx_data2;
  // wire new_rx_data2;
  
  wire [7:0] rx_data;
  wire new_rx_data;
  

  // TDC
  wire TDC_ENABLE; 

  
  // TDC-SPI
  wire tdc_busy;
  wire [7:0] tdc_data_in;
  wire [7:0] tdc_data_out;
  wire tdc_SPI_start, tdc_SPI_new_data;
  wire CS_END;

  // FIFO
  wire s1_wr_en;
  wire [47:0] s1_din;
  wire s1_fifo_writing_done;
  // wire s2_fifo_writing_done;

  assign w_rd_en = t_rd_en;
  assign w_wr_en = s1_wr_en;

  avr_interface avr_interface (
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
 
  main_control main_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    // .tx_busy(tx_busy), // serial for communication
    .rx_data(rx_data), // serial for communication
    .new_rx_data(new_rx_data), // serial for communication
    
    // OUTPUT
    .tdc_enable(TDC_ENABLE), // using from low to high
    .soft_reset(soft_reset),
    .play(play), // global play
    .pause(pause) // global pause
  );

  
  tdc_control tdc_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    .new_data(tdc_SPI_new_data),
    .tdc_MISO(tdc_data_out),
    .soft_reset(soft_reset),
    .TDC_INTB(TDC_INTB),
    .tdc_busy(tdc_busy),
    .fifo_writing_done(s1_fifo_writing_done),
    .play(play), 
    .pause(pause),

    // OUTPUT
    .start_signal(TDC_START_SIGNAL),
    .CS_END(CS_END),
    .start(tdc_SPI_start),
    .tdc_MOSI(tdc_data_in),
    .w_wr_en(s1_wr_en),
    // .w_wr_en2(s2_wr_en),
    .data_TO_FIFO(s1_din)
    // .fifo_writing_done2(s2_fifo_writing_done),
    // .laser_trig(laser_trig)
  );
 
  
  fifo_manager fifo_manager (
    // INPUT
    .clk(clk),
    .rst(rst),
    .s1_wr_en(s1_wr_en),
    .s2_wr_en(s2_wr_en),
    .s1_din(s1_din),
    
    // OUTPUT
    .w_s1_fifo_writing_done(s1_fifo_writing_done),
    // .w_s2_fifo_writing_done(s2_fifo_writing_done),
    .tx_busy_TDC(tx_busy_TDC),
    .new_data_FROM_FIFO_TO_SERIAL(t_new_data_FROM_FIFO_TO_SERIAL),
    .w_tx_OUT_TDC(SERIAL_OUT_TDC),
    .w_empty(FIFO_EMPTY),
    .w_full(FIFO_FULL),
    .t_rd_en(t_rd_en)
  );


  // 3 for 6 MHz
  tdc_spi_master #(.CLK_DIV(3)) tdc_spi_master(
    // INPUT
    .clk(clk),
    .rst(rst),
    .miso(TDC_DOUT),
    .start(tdc_SPI_start), // for SPI
    .data_in(tdc_data_in),
    .CS_END(CS_END), // manage up/down real CS pin -- TDC_CS
    
    // OUTPUT
    .mosi(TDC_MOSI),
    .sck(TDC_SPI_CLOCK),
    .data_out(tdc_data_out),
    .busy(tdc_busy),
    .new_data(tdc_SPI_new_data),
    .CS(TDC_CS)
  );
   


  // UNCOMMENT TO MAKE COMMUNICATIONS VIA SERIAL
  // serial_rx #(.CLK_PER_BIT(17)) serial_rx2 (
  //   .clk(clk),
  //   .rst(n_rdy),
  //   .rx(SERIAL_IN),

  //   .data(rx_data2),
  //   .new_data(new_rx_data2)
  // );
  



   my_clk #(.CLK_DIV(4)) tdc_ref_clk (
   .clk(clk),
   .rst(rst),
   .my_clk(TDC_REF_CLOCK)
   ); 

endmodule