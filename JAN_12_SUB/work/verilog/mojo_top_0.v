module mojo_top_0(

  // GLOBAL
  input clk, // 50Mhz
  input rst_n,
  input SERIAL_IN,

  output ENABLE,
  
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
  output TDC_REF_CLOCK,
  output TDC_START_SIGNAL,
  output SERIAL_OUT_TDC,

 // MEMS
  output MEMS_MOSI,
  output MEMS_SPI_CLOCK,
  output MEMS_CS,
  output MEMS_FCLK,




  // DEBUGGING
  output f2_wr_en,
  output f3_wr_en,

  output f2_FIFO_writing_done,
  output f3_FIFO_writing_done

  // input TDC_TRIG,
    // FIFO
  // output FIFO_FULL,
  // output FIFO_EMPTY,
  // output w_rd_en,
  // output w_wr_en,
    // SERIAL
  // output tx_busy_TDC,
  // output t_new_data_FROM_FIFO_TO_SERIAL
  // output play,
  // output pause,
  );
 
  // PARAMS
  localparam MOJO_FREQUENCY=50000000; // constant
  // must be 50/2^n, since they are clock, otherwise will be rounded to closest minimum one. e.g 3.3kk->3.125kk
  // TDC
  localparam TDC_REF_CLOCK_FREQUENCY=12500000; // 12500000, range [1-16MHz]
  localparam TDC_SPI_SPEED=6250000; // 6250000, max is  20Mhz
  // MEMS
  localparam FCLK_FREQUENCY=10000; // 10k -> 6k
  localparam MEMS_SPI_SPEED=25000;  // max is 50MHZ
  // FIFO
  localparam FIFO_WIDTH=5; // means count of elements is 2^5
  localparam BAUD_RATE_SPEED=4000000; // in Hz, CAN BE ANY

  // OTHER
  localparam SHOOTING_FREQUENCY=10; // in Hz, CAN BE ANY
    
  // CONVERTED PARAMS  
  localparam FCLK_FREQUENCY_PARAM=MOJO_FREQUENCY/FCLK_FREQUENCY; 
  localparam SHOOTING_PARAM=MOJO_FREQUENCY/SHOOTING_FREQUENCY;
  localparam BAUD_RATE_PARAM=MOJO_FREQUENCY/BAUD_RATE_SPEED;
  localparam TDC_REF_PARAM=MOJO_FREQUENCY/TDC_REF_CLOCK_FREQUENCY; 
  
  localparam TDC_SPI_SPEED_PARAM= MOJO_FREQUENCY/TDC_SPI_SPEED; 
  localparam MEMS_SPI_SPEED_PARAM= MOJO_FREQUENCY/MEMS_SPI_SPEED; 


  // GLOBAL
  wire rst = ~rst_n; // make reset active high
  wire soft_reset;
  wire ENABLE; // enable both for TDC & MEMS
  wire pause; // to control play/pause

  // MY AVR
  wire [7:0] tx_data;
  wire new_tx_data;
  wire tx_busy;

  // EXTERNAL SERIAL
  // wire [7:0] rx_data2;
  // wire new_rx_data2;
  
  wire [7:0] rx_data;
  wire new_rx_data;
  

  // MEMS
  wire mems_SPI_start;
  // wire mems_SPI_new_data; // debugging
  wire mems_SPI_busy;
  wire [23:0] data_miso;
  
  // TDC-SPI
  wire tdc_SPI_start;
  // wire tdc_SPI_new_data; // debugging
  wire [7:0] tdc_data_in;
  wire tdc_SPI_busy;
  wire [7:0] tdc_data_out;
  wire CS_END;

  // FIFO
  wire new_line_FIFO_done;
  wire new_frame_FIFO_done;
  wire new_line;
  wire new_frame;

  wire x1_wr_en;
  wire [47:0] x1_din;
  wire x1_fifo_writing_done;

  wire f2_wr_en;
  wire f2_FIFO_writing_done;

  wire f3_wr_en;
  wire f3_FIFO_writing_done;
  // wire s2_fifo_writing_done;

  // assign w_rd_en = t_rd_en;
  // assign w_wr_en = s1_wr_en;

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
 
  main_control_2 main_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    .rx_data(rx_data), // serial for communication
    .new_rx_data(new_rx_data), // serial for communication
    
    // OUTPUT
    .tdc_enable(ENABLE), // using from low to high
    .soft_reset(soft_reset),
    .pause(pause) // global pause
  );


  tdc_control_3 #(.SHOOTING_PARAM(SHOOTING_PARAM)) tdc_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    // .tdc_SPI_new_data(tdc_SPI_new_data),
    .tdc_MISO(tdc_data_out),
    .tdc_soft_reset(soft_reset),
    .TDC_INTB(TDC_INTB),
    .tdc_SPI_busy(tdc_SPI_busy),
    .fifo_writing_done(x1_FIFO_writing_done),
    .pause(pause),

    // OUTPUT
    .start_signal(TDC_START_SIGNAL),
    .CS_END(CS_END),
    .start(tdc_SPI_start),
    .tdc_MOSI(tdc_data_in),
    .w_wr_en(x1_wr_en),
    // .w_wr_en2(s2_wr_en),
    .data_TO_FIFO(x1_din)
    // .fifo_writing_done2(s2_fifo_writing_done),
    // .laser_trig(laser_trig)
  );
 

   fake_tdc_4 fake_tdc2 (
    // INPUT
    .clk(clk),
    .rst(rst),
    .f_FIFO_writing_done(f2_FIFO_writing_done),

    // OUTPUT
    .wr_en(f2_wr_en)

  );

   fake_tdc_4 fake_tdc3 (
    // INPUT
    .clk(clk),
    .rst(rst),
    .f_FIFO_writing_done(f3_FIFO_writing_done),

    // OUTPUT
    .wr_en(f3_wr_en)

  );
  
  fifo_manager_5 #(.BAUD_RATE_PARAM(BAUD_RATE_PARAM), .FIFO_WIDTH(FIFO_WIDTH)) fifo_manager (
    // INPUT
    .clk(clk),
    .rst(rst),
    .x1_wr_en(x1_wr_en),
    // .x2_wr_en(x2_wr_en),
    .x1_din(x1_din),
    .new_line(new_line),
    .new_frame(new_frame),
    
    // fake
    .f2_wr_en(f2_wr_en),

    .f3_wr_en(f3_wr_en),



    // OUTPUT
    .new_line_FIFO_done(new_line_FIFO_done),
    .new_frame_FIFO_done(new_frame_FIFO_done),

    .x1_FIFO_writing_done(x1_FIFO_writing_done),

    .f2_FIFO_writing_done(f2_FIFO_writing_done),
    .f3_FIFO_writing_done(f3_FIFO_writing_done),

    // .w_s2_fifo_writing_done(s2_fifo_writing_done),
    .tx_busy_TDC(tx_busy_TDC),
    .new_data_FROM_FIFO_TO_SERIAL(t_new_data_FROM_FIFO_TO_SERIAL),
    .w_tx_OUT_TDC(SERIAL_OUT_TDC),
    // debug
    .w_empty(FIFO_EMPTY),
    .w_full(FIFO_FULL),
    .t_rd_en(t_rd_en)
  );


  // 3 for 6 MHz
  tdc_spi_master_6 #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) tdc_spi_master(
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
    .busy(tdc_SPI_busy),
    .new_data(tdc_SPI_new_data),
    .CS(TDC_CS)
  );
   
  
  mems_control_7 mems_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    .pause(pause),
    .mems_SPI_busy(mems_SPI_busy),
    .mems_soft_reset(soft_reset),
    
    .new_line_FIFO_done(new_line_FIFO_done),
    .new_frame_FIFO_done(new_frame_FIFO_done),

    // OUTPUT
    .mems_SPI_start(mems_SPI_start),
    .data_miso(data_miso),
    .new_line(new_line),
    .new_frame(new_frame)
  );


  // 7 is 16 ms, 10 - 140ms, 4 is 2ms
  mems_spi_8 #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) mems_spi_master(
    // INPUT
    .clk(clk),
    .rst(rst),
    .miso(miso),
    .data_in(data_miso),
    .start(mems_SPI_start),

    // OUTPUT
    .mosi(MEMS_MOSI),
    .sck(MEMS_SPI_CLOCK),
    .data_out(data_out),
    .busy(mems_SPI_busy),
    .new_data(mems_SPI_new_data),
    .CS(MEMS_CS)
  );

  // TDC REF clock, 12.5 MHz
  my_clk_9 #(.CLK_DIV(TDC_REF_PARAM)) tdc_ref_clk (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(TDC_REF_CLOCK)
  ); 

  // MEMS FCLK, 10 KHz
  my_clk_10 #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) FCLK (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(MEMS_FCLK)
  ); 


  // UNCOMMENT TO MAKE COMMUNICATIONS VIA SERIAL
  // serial_rx #(.CLK_PER_BIT(17)) serial_rx2 (
  //   .clk(clk),
  //   .rst(n_rdy),
  //   .rx(SERIAL_IN),

  //   .data(rx_data2),
  //   .new_data(new_rx_data2)
  // );

endmodule