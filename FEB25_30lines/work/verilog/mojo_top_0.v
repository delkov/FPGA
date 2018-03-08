module mojo_top_0(

  // GLOBAL
  input clk, // 50Mhz
  input rst_n,


  // AVR 
  //  input cclk,
  //input spi_ss,
  //input spi_mosi,
  //input spi_sck,
  //input avr_tx, // AVR Tx => FPGA Rx
  //input avr_rx_busy, // AVR Rx buffer full

  //output spi_miso,
  //output [3:0] spi_channel,
  //output avr_rx, // AVR Rx => FPGA Tx


  // F1
  output f1_ENABLE,
  // TDC
  input f1_TDC_INTB,
  input f1_TDC_DOUT,
  output f1_TDC_MOSI,
  output f1_TDC_SPI_CLOCK,
  output f1_TDC_CS,
  output f1_TDC_REF_CLOCK,
  output f1_TDC_START_SIGNAL,
  // MEMS
  output f1_MEMS_MOSI,
  output f1_MEMS_CS,
  output f1_MEMS_FCLK,
  output f1_MEMS_SPI_CLOCK,

  // F2
  output f2_ENABLE,
  // TDC
  input f2_TDC_INTB,
  input f2_TDC_DOUT,
  output f2_TDC_MOSI,
  output f2_TDC_SPI_CLOCK,
  output f2_TDC_CS,
  output f2_TDC_REF_CLOCK,
  output f2_TDC_START_SIGNAL,

  // MEMS
  output f2_MEMS_MOSI,
  output f2_MEMS_CS,
  output f2_MEMS_FCLK,
  output f2_MEMS_SPI_CLOCK,

  // F3
  output f3_ENABLE,
  // TDC
  input f3_TDC_INTB,
  input f3_TDC_DOUT,
  output f3_TDC_MOSI,
  output f3_TDC_SPI_CLOCK,
  output f3_TDC_CS,
  output f3_TDC_REF_CLOCK,
  output f3_TDC_START_SIGNAL,
  // MEMS
  output f3_MEMS_MOSI,
  output f3_MEMS_CS,
  output f3_MEMS_FCLK,
  output f3_MEMS_SPI_CLOCK,

  // F4
  output f4_ENABLE,
  // TDC
  input f4_TDC_INTB,
  input f4_TDC_DOUT,
  output f4_TDC_MOSI,
  output f4_TDC_SPI_CLOCK,
  output f4_TDC_CS,
  output f4_TDC_REF_CLOCK,
  output f4_TDC_START_SIGNAL,
  // MEMS
  output f4_MEMS_MOSI,
  output f4_MEMS_CS,
  output f4_MEMS_FCLK,
  output f4_MEMS_SPI_CLOCK,

  // F5
  output f5_ENABLE,
  // TDC
  input f5_TDC_INTB,
  input f5_TDC_DOUT,
  output f5_TDC_MOSI,
  output f5_TDC_SPI_CLOCK,
  output f5_TDC_CS,
  output f5_TDC_REF_CLOCK,
  output f5_TDC_START_SIGNAL,
  // MEMS
  output f5_MEMS_MOSI,
  output f5_MEMS_CS,
  output f5_MEMS_FCLK,
  output f5_MEMS_SPI_CLOCK,

  // F6
  output f6_ENABLE,
  // TDC
  input f6_TDC_INTB,
  input f6_TDC_DOUT,
  output f6_TDC_MOSI,
  output f6_TDC_SPI_CLOCK,
  output f6_TDC_CS,
  output f6_TDC_REF_CLOCK,
  output f6_TDC_START_SIGNAL,
  // MEMS
  output f6_MEMS_MOSI,
  output f6_MEMS_CS,
  output f6_MEMS_FCLK,
  output f6_MEMS_SPI_CLOCK,

  // SERIAL
  input SERIAL_IN,
  output SERIAL_OUT_TDC

  // DEBUGGING
  // output f2_new_line,
  // output f2_new_frame
  // output f2_wr_en,
  // output f3_wr_en,
  // output CHECK_DATA2

  // output f2_FIFO_writing_done
  // output f3_FIFO_writing_doneыdsd

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
 
  // assign fake_f2_TDC_START_SIGNAL = f2_TDC_START_SIGNAL;
  // assign fake_f2_TDC_INTB = f2_TDC_INTB;3


  // PARAMS
  // localparam MOJO_FREQUENCY=50000000; // constant
  localparam MOJO_FREQUENCY=64000000; // constant
  // must be MOJO_FREQ/2^n, since they are clock, otherwise will be rounded to closest minimum one. e.g 3.3kk->3.125kk
  // TDC
  localparam TDC_REF_CLOCK_FREQUENCY=12500000; // 12500000, range [1-16MHz]
  localparam TDC_SPI_SPEED=12500000; // 6250000, max is  20Mhz
  // MEMS
  localparam FCLK_FREQUENCY=16000; // 15.625kHz/2^n; 100:1 Hz, 150Hz recommend cut off for MEMS.
  localparam MEMS_SPI_SPEED=3200000;  // max is 50MHZcf
  // FIFO
  localparam FIFO_WIDTH=6; // ~128 is fine means count of elements(points=pixels) is 2^FIFO_WIDTH
  localparam BAUD_RATE_SPEED= 4000000; // in Hz,  will be rounded.
  // OTHER
  localparam SHOOTING_FREQUENCY= 12637; // 12715 for 39x240; 
    
  // CONVERTED PARAMS  
  localparam FCLK_FREQUENCY_PARAM=MOJO_FREQUENCY/FCLK_FREQUENCY; 
  localparam SHOOTING_PARAM=MOJO_FREQUENCY/SHOOTING_FREQUENCY;
  localparam BAUD_RATE_PARAM=MOJO_FREQUENCY/BAUD_RATE_SPEED;
  localparam TDC_REF_PARAM=MOJO_FREQUENCY/TDC_REF_CLOCK_FREQUENCY; 
  
  localparam TDC_SPI_SPEED_PARAM= MOJO_FREQUENCY/TDC_SPI_SPEED; 
  localparam MEMS_SPI_SPEED_PARAM= MOJO_FREQUENCY/MEMS_SPI_SPEED; 


  // GLOBAL
  wire rst = ~rst_n; // make reset active high
  wire [1:0] mode;
  wire pause; // to control play/pause
  wire exit; // go to bias voltage & stop shooting


  // // MY AVR
  // wire [7:0] tx_data;
  // wire new_tx_data;
  // wire tx_busy;
  // wire [7:0] rx_data;
  // wire new_rx_data;
  
  // F1
  wire f1_soft_reset;
  wire f1_wr_en;
  wire f1_tdc_SPI_start;
  wire f1_tdc_SPI_busy;
  wire f1_CS_END;
  wire [7:0] f1_tdc_data_in;
  wire [7:0] f1_tdc_data_out;
  wire [31:0] f1_din;
  wire f1_FIFO_writing_done;

  wire [17:0] f1_addr;
  wire f1_mems_SPI_start;
  wire f1_mems_SPI_busy;
  wire [23:0] f1_mems_data_in;
  wire f1_new_line;
  wire f1_new_frame;
  wire f1_new_line_FIFO_done;
  wire f1_new_frame_FIFO_done;

  // F2
  wire f2_soft_reset;
  wire f2_wr_en;
  wire f2_tdc_SPI_start;
  wire f2_tdc_SPI_busy;
  wire f2_CS_END;
  wire [7:0] f2_tdc_data_in;
  wire [7:0] f2_tdc_data_out;
  wire [31:0] f2_din;
  wire f2_FIFO_writing_done;
  
  wire [17:0] f2_addr;
  wire f2_mems_SPI_start;
  wire f2_mems_SPI_busy;
  wire [23:0] f2_mems_data_in;
  wire f2_new_line;
  wire f2_new_frame;
  wire f2_new_line_FIFO_done;
  wire f2_new_frame_FIFO_done;

  // F3
  wire f3_soft_reset;
  wire f3_wr_en;
  wire f3_tdc_SPI_start;
  wire f3_tdc_SPI_busy;
  wire f3_CS_END;
  wire [7:0] f3_tdc_data_in;
  wire [7:0] f3_tdc_data_out;
  wire [31:0] f3_din;
  wire f3_FIFO_writing_done;
  
  wire [17:0] f3_addr;
  wire f3_mems_SPI_start;
  wire f3_mems_SPI_busy;
  wire [23:0] f3_mems_data_in;
  wire f3_new_line;
  wire f3_new_frame;
  wire f3_new_line_FIFO_done;
  wire f3_new_frame_FIFO_done;

  // F4
  wire f4_soft_reset;
  wire f4_wr_en;
  wire f4_tdc_SPI_start;
  wire f4_tdc_SPI_busy;
  wire f4_CS_END;
  wire [7:0] f4_tdc_data_in;
  wire [7:0] f4_tdc_data_out;
  wire [31:0] f4_din;
  wire f4_FIFO_writing_done;
  
  wire [17:0] f4_addr;
  wire f4_mems_SPI_start;
  wire f4_mems_SPI_busy;
  wire [23:0] f4_mems_data_in;
  wire f4_new_line;
  wire f4_new_frame;
  wire f4_new_line_FIFO_done;
  wire f4_new_frame_FIFO_done;

  // F5
  wire f5_soft_reset;
  wire f5_wr_en;
  wire f5_tdc_SPI_start;
  wire f5_tdc_SPI_busy;
  wire f5_CS_END;
  wire [7:0] f5_tdc_data_in;
  wire [7:0] f5_tdc_data_out;
  wire [31:0] f5_din;
  wire f5_FIFO_writing_done;

  wire [17:0] f5_addr;
  wire f5_mems_SPI_start;
  wire f5_mems_SPI_busy;
  wire [23:0] f5_mems_data_in;
  wire f5_new_line;
  wire f5_new_frame;
  wire f5_new_line_FIFO_done;
  wire f5_new_frame_FIFO_done;

  // F6
  wire f6_soft_reset;
  wire f6_wr_en;
  wire f6_tdc_SPI_start;
  wire f6_tdc_SPI_busy;
  wire f6_CS_END;
  wire [7:0] f6_tdc_data_in;
  wire [7:0] f6_tdc_data_out;
  wire [31:0] f6_din;
  wire f6_FIFO_writing_done;
  
  wire [17:0] f6_addr;
  wire f6_mems_SPI_start;
  wire f6_mems_SPI_busy;
  wire [23:0] f6_mems_data_in;
  wire f6_new_line;
  wire f6_new_frame;  
  wire f6_new_line_FIFO_done;
  wire f6_new_frame_FIFO_done;

  assign f2_TDC_REF_CLOCK = f1_TDC_REF_CLOCK;
  assign f3_TDC_REF_CLOCK = f1_TDC_REF_CLOCK;
  assign f4_TDC_REF_CLOCK = f1_TDC_REF_CLOCK;
  assign f5_TDC_REF_CLOCK = f1_TDC_REF_CLOCK;
  assign f6_TDC_REF_CLOCK = f1_TDC_REF_CLOCK;

  assign f2_MEMS_FCLK = f1_MEMS_FCLK;
  assign f3_MEMS_FCLK = f1_MEMS_FCLK;
  assign f4_MEMS_FCLK = f1_MEMS_FCLK;
  assign f5_MEMS_FCLK = f1_MEMS_FCLK;
  assign f6_MEMS_FCLK = f1_MEMS_FCLK;

  // avr_interface avr_interface (
  //   .clk(clk),
  //   .rst(rst),
  //   .cclk(cclk),
  //   .spi_miso(spi_miso),
  //   .spi_mosi(spi_mosi),
  //   .spi_sck(spi_sck),
  //   .spi_ss(spi_ss),
  //   .spi_channel(spi_channel),
  //   .tx(avr_rx), // FPGA tx goes to AVR rx
  //   .rx(avr_tx),
  //   .channel(4'd15), // invalid channel disables the ADC
  //   .new_sample(),
  //   .sample(),
  //   .sample_channel(),
  //   .tx_data(tx_data),
  //   .new_tx_data(new_tx_data),
  //   .tx_busy(tx_busy),
  //   .tx_block(avr_rx_busy),
  //   .rx_data(rx_data),
  //   .new_rx_data(new_rx_data)
  // );

  main_control_1 #(.BAUD_RATE_PARAM(BAUD_RATE_PARAM)) main_control (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),

    // CONTROL WHICH MODULE TO ON/OFF.
    // OUTPUT
    .f1_tdc_enable(f1_ENABLE), // set 0 to OFF. Sholud be from low to high (for TDC this is needed). 
    .f1_soft_reset(f1_soft_reset), // set 0 to OFF (the TDC & MEMS will not be initialized -> will be not working)
    
    .f2_tdc_enable(f2_ENABLE),  
    .f2_soft_reset(f2_soft_reset),
    
    .f3_tdc_enable(f3_ENABLE), 
    .f3_soft_reset(f3_soft_reset),
    
    .f4_tdc_enable(f4_ENABLE), 
    .f4_soft_reset(f4_soft_reset),
    
    .f5_tdc_enable(f5_ENABLE), 
    .f5_soft_reset(f5_soft_reset),
    
    .f6_tdc_enable(f6_ENABLE), 
    .f6_soft_reset(f6_soft_reset),

    .SERIAL_IN(SERIAL_IN),
    .mode(mode),
    .pause(pause), // global pause
    .exit(exit)
  );

  fifo_manager_2 #(.BAUD_RATE_PARAM(BAUD_RATE_PARAM), .FIFO_WIDTH(FIFO_WIDTH)) fifo_manager (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),

    // F1
    .f1_wr_en(f1_wr_en),
    .f1_din(f1_din),
    .f1_FIFO_writing_done(f1_FIFO_writing_done),
    .f1_new_line(f1_new_line),
    .f1_new_frame(f1_new_frame),
    .f1_new_line_FIFO_done(f1_new_line_FIFO_done),
    .f1_new_frame_FIFO_done(f1_new_frame_FIFO_done),

    // F2
    .f2_wr_en(f2_wr_en),
    .f2_din(f2_din),
    .f2_FIFO_writing_done(f2_FIFO_writing_done),
    .f2_new_line(f2_new_line),
    .f2_new_frame(f2_new_frame),
    .f2_new_line_FIFO_done(f2_new_line_FIFO_done),
    .f2_new_frame_FIFO_done(f2_new_frame_FIFO_done),

    // F3
    .f3_wr_en(f3_wr_en),
    .f3_din(f3_din),
    .f3_FIFO_writing_done(f3_FIFO_writing_done),
    .f3_new_line(f3_new_line),
    .f3_new_frame(f3_new_frame),
    .f3_new_line_FIFO_done(f3_new_line_FIFO_done),
    .f3_new_frame_FIFO_done(f3_new_frame_FIFO_done),

    // F4
    .f4_wr_en(f4_wr_en),
    .f4_din(f4_din),
    .f4_FIFO_writing_done(f4_FIFO_writing_done),
    .f4_new_line(f4_new_line),
    .f4_new_frame(f4_new_frame),
    .f4_new_line_FIFO_done(f4_new_line_FIFO_done),
    .f4_new_frame_FIFO_done(f4_new_frame_FIFO_done),
    
    // F5
    .f5_wr_en(f5_wr_en),
    .f5_din(f5_din),
    .f5_FIFO_writing_done(f5_FIFO_writing_done),
    .f5_new_line(f5_new_line),
    .f5_new_frame(f5_new_frame),
    .f5_new_line_FIFO_done(f5_new_line_FIFO_done),
    .f5_new_frame_FIFO_done(f5_new_frame_FIFO_done),

    // F6
    .f6_wr_en(f6_wr_en),
    .f6_din(f6_din),
    .f6_FIFO_writing_done(f6_FIFO_writing_done),
    .f6_new_line(f6_new_line),
    .f6_new_frame(f6_new_frame),
    .f6_new_line_FIFO_done(f6_new_line_FIFO_done),
    .f6_new_frame_FIFO_done(f6_new_frame_FIFO_done),
    

    // OTHERS
    .w_tx_OUT_TDC(SERIAL_OUT_TDC),
    .tx_busy_TDC(tx_busy_TDC) // debugging
    // .new_data_FROM_FIFO_TO_SERIAL(t_new_data_FROM_FIFO_TO_SERIAL), // debugging

    // debug
    // .w_empty(FIFO_EMPTY), // debugging
    // .w_full(FIFO_FULL), // debugging
    // .t_rd_en(t_rd_en) // debugg2ing
  );

  // speed-up clock to make id divideble to get 4Mhz for serial
 new_clk new_clk (// Clock in ports
  .CLK_IN1(clk),
  .CLK_OUT1(clk_64mhz)
 );

 // SHARED
  mems_rom_3 mems_rom (
  // INPUT
  .rst(rst),
  .clk(clk_64mhz),
  .exit(exit),

  .f1_addr(f1_addr),  
  .f2_addr(f2_addr),
  .f3_addr(f3_addr),
  .f4_addr(f4_addr),
  .f5_addr(f5_addr),
  .f6_addr(f6_addr),

  // OUTPUT
  .f1_data(f1_mems_data_in),
  .f2_data(f2_mems_data_in),
  .f3_data(f3_mems_data_in),
  .f4_data(f4_mems_data_in),
  .f5_data(f5_mems_data_in),
  .f6_data(f6_mems_data_in)
  );

  // TDC  REF_CLOCK, 12.5 MHz
  my_clk_4 #(.CLK_DIV(TDC_REF_PARAM)) tdc_ref_clk (
   // INPUT
   .clk(clk_64mhz),
   .rst(rst),

   // OUTPUT
   .my_clk(f1_TDC_REF_CLOCK)
  ); 
  // MEMS FCLK, 10 KHz
  my_clk_5 #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) FCLK (
   // INPUT
   .clk(clk_64mhz),
   .rst(rst),

   // OUTPUT
   .my_clk(f1_MEMS_FCLK)
  );

// END SHARED

  // // // F1
  tdc_control_6 #(.SHOOTING_PARAM(SHOOTING_PARAM)) f1_tdc_control (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .tdc_MISO(f1_tdc_data_out),
    .tdc_soft_reset(f1_soft_reset),
    .TDC_INTB(f1_TDC_INTB),
    .tdc_SPI_busy(f1_tdc_SPI_busy),
    .fifo_writing_done(f1_FIFO_writing_done), // FIFO feedback
    .mode(mode),
    .pause(pause),
    .exit(exit),

    // OUTPUT
    .start_signal(f1_TDC_START_SIGNAL),
    .CS_END(f1_CS_END),
    .start(f1_tdc_SPI_start),
    .tdc_MOSI(f1_tdc_data_in), 
    .w_wr_en(f1_wr_en), // ready to write to FIFO
    .data_TO_FIFO(f1_din)
  );
  // 3 for 6 MHz
  tdc_spi_master_7 #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f1_tdc_spi_master(
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .miso(f1_TDC_DOUT), // data from TDC..
    .start(f1_tdc_SPI_start), // for SPI
    .data_in(f1_tdc_data_in),
    .CS_END(f1_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
    // OUTPUT
    .mosi(f1_TDC_MOSI),
    .sck(f1_TDC_SPI_CLOCK),
    .data_out(f1_tdc_data_out),
    .busy(f1_tdc_SPI_busy), 
    .CS(f1_TDC_CS)
  );
  mems_control_8 f1_mems_control (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .mode(mode),
    .pause(pause),
    // .exit(exit),
    .mems_SPI_busy(f1_mems_SPI_busy),
    .mems_soft_reset(f1_soft_reset),
    .new_line_FIFO_done(f1_new_line_FIFO_done),
    .new_frame_FIFO_done(f1_new_frame_FIFO_done),

    // OUTPUT
    .mems_SPI_start(f1_mems_SPI_start),
    .addr(f1_addr),
    .new_line(f1_new_line),
    .new_frame(f1_new_frame)
  );
  mems_spi_9 #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f1_mems_spi_master(
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .data_in(f1_mems_data_in),
    .start(f1_mems_SPI_start),

    // OUTPUT
    .mosi(f1_MEMS_MOSI),
    .sck(f1_MEMS_SPI_CLOCK),
    .busy(f1_mems_SPI_busy),
    .CS(f1_MEMS_CS)
  );


  // F2
  tdc_control_6 #(.SHOOTING_PARAM(SHOOTING_PARAM)) f2_tdc_control (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .tdc_MISO(f2_tdc_data_out),
    .tdc_soft_reset(f2_soft_reset),
    .TDC_INTB(f2_TDC_INTB),
    .tdc_SPI_busy(f2_tdc_SPI_busy),
    .fifo_writing_done(f2_FIFO_writing_done),
    .mode(mode),
    .pause(pause),
    .exit(exit),

    // OUTPUT
    .start_signal(f2_TDC_START_SIGNAL),
    .CS_END(f2_CS_END),
    .start(f2_tdc_SPI_start),
    .tdc_MOSI(f2_tdc_data_in),
    .w_wr_en(f2_wr_en),
    .data_TO_FIFO(f2_din)
  );
  tdc_spi_master_7 #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f2_tdc_spi_master(
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .miso(f2_TDC_DOUT),
    .start(f2_tdc_SPI_start), // for SPI
    .data_in(f2_tdc_data_in),
    .CS_END(f2_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
    // OUTPUT
    .mosi(f2_TDC_MOSI),
    .sck(f2_TDC_SPI_CLOCK),
    .data_out(f2_tdc_data_out),
    .busy(f2_tdc_SPI_busy),
    .CS(f2_TDC_CS)
  );
  mems_control_8 f2_mems_control (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .mode(mode),
    .pause(pause), 
    // .exit(exit),
    .mems_SPI_busy(f2_mems_SPI_busy),
    .mems_soft_reset(f2_soft_reset),
    .new_line_FIFO_done(f2_new_line_FIFO_done),
    .new_frame_FIFO_done(f2_new_frame_FIFO_done),

    // OUTPUT
    .mems_SPI_start(f2_mems_SPI_start),
    .addr(f2_addr),
    .new_line(f2_new_line),
    .new_frame(f2_new_frame)
  );
  mems_spi_9 #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f2_mems_spi_master(
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .data_in(f2_mems_data_in),
    .start(f2_mems_SPI_start),

    // OUTPUT
    .mosi(f2_MEMS_MOSI),
    .sck(f2_MEMS_SPI_CLOCK),
    .busy(f2_mems_SPI_busy),
    .CS(f2_MEMS_CS)
  );

  // F3
  tdc_control_6 #(.SHOOTING_PARAM(SHOOTING_PARAM)) f3_tdc_control (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .tdc_MISO(f3_tdc_data_out),
    .tdc_soft_reset(f3_soft_reset),
    .TDC_INTB(f3_TDC_INTB),
    .tdc_SPI_busy(f3_tdc_SPI_busy),
    .fifo_writing_done(f3_FIFO_writing_done),
    .mode(mode),
    .pause(pause),
    .exit(exit),


    // OUTPUT
    .start_signal(f3_TDC_START_SIGNAL),
    .CS_END(f3_CS_END),
    .start(f3_tdc_SPI_start),
    .tdc_MOSI(f3_tdc_data_in),
    .w_wr_en(f3_wr_en),
    .data_TO_FIFO(f3_din)
  );
  tdc_spi_master_7 #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f3_tdc_spi_master(
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .miso(f3_TDC_DOUT),
    .start(f3_tdc_SPI_start), // for SPI
    .data_in(f3_tdc_data_in),
    .CS_END(f3_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
    // OUTPUT
    .mosi(f3_TDC_MOSI),
    .sck(f3_TDC_SPI_CLOCK),
    .data_out(f3_tdc_data_out),
    .busy(f3_tdc_SPI_busy),
    .CS(f3_TDC_CS)
  );
  mems_control_8 f3_mems_control (
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .mode(mode),
    .pause(pause),
    // .exit(exit),
    .mems_SPI_busy(f3_mems_SPI_busy),
    .mems_soft_reset(f3_soft_reset),
    .new_line_FIFO_done(f3_new_line_FIFO_done),
    .new_frame_FIFO_done(f3_new_frame_FIFO_done),

    // OUTPUT
    .mems_SPI_start(f3_mems_SPI_start),
    .addr(f3_addr),
    .new_line(f3_new_line),
    .new_frame(f3_new_frame)
  );
  mems_spi_9 #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f3_mems_spi_master(
    // INPUT
    .clk(clk_64mhz),
    .rst(rst),
    .data_in(f3_mems_data_in),
    .start(f3_mems_SPI_start),

    // OUTPUT
    .mosi(f3_MEMS_MOSI),
    .sck(f3_MEMS_SPI_CLOCK),
    .busy(f3_mems_SPI_busy),
    .CS(f3_MEMS_CS)
  );
  
  // // // F4
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f4_tdc_control (
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .tdc_MISO(f4_tdc_data_out),
  //   .tdc_soft_reset(f4_soft_reset),
  //   .TDC_INTB(f4_TDC_INTB),
  //   .tdc_SPI_busy(f4_tdc_SPI_busy),
  //   .fifo_writing_done(f4_FIFO_writing_done),
        // .mode(mode),
  //   .pause(pause),
  //   .exit(exit),


  //   // OUTPUT
  //   .start_signal(f4_TDC_START_SIGNAL),
  //   .CS_END(f4_CS_END),
  //   .start(f4_tdc_SPI_start),
  //   .tdc_MOSI(f4_tdc_data_in),
  //   .w_wr_en(f4_wr_en),
  //   .data_TO_FIFO(f4_din)
  // );
  // tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f4_tdc_spi_master(
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .miso(f4_TDC_DOUT),
  //   .start(f4_tdc_SPI_start), // for SPI
  //   .data_in(f4_tdc_data_in),
  //   .CS_END(f4_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
  //   // OUTPUT
  //   .mosi(f4_TDC_MOSI),
  //   .sck(f4_TDC_SPI_CLOCK),
  //   .data_out(f4_tdc_data_out),
  //   .busy(f4_tdc_SPI_busy),
  //   .CS(f4_TDC_CS)
  // );
  // mems_control f4_mems_control (
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .mode(mode),
  //   .pause(pause),
  //   //.exit(exit),
  //   .mems_SPI_busy(f4_mems_SPI_busy),
  //   .mems_soft_reset(f4_soft_reset),
  //   .new_line_FIFO_done(f4_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f4_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f4_mems_SPI_start),
  //   .addr(f4_addr),

  //   .new_line(f4_new_line),
  //   .new_frame(f4_new_frame)
  // );
  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f4_mems_spi_master(
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .data_in(f4_mems_data_in),
  //   .start(f4_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f4_MEMS_MOSI),
  //   .sck(f4_MEMS_SPI_CLOCK),
  //   .busy(f4_mems_SPI_busy),
  //   .CS(f4_MEMS_CS)
  // );
  
  // // // F5
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f5_tdc_control (
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .tdc_MISO(f5_tdc_data_out),
  //   .tdc_soft_reset(f5_soft_reset),
  //   .TDC_INTB(f5_TDC_INTB),
  //   .tdc_SPI_busy(f5_tdc_SPI_busy),
  //   .fifo_writing_done(f5_FIFO_writing_done),
      // .mode(mode),
  //   .pause(pause),
  //   .exit(exit),


  //   // OUTPUT
  //   .start_signal(f5_TDC_START_SIGNAL),
  //   .CS_END(f5_CS_END),
  //   .start(f5_tdc_SPI_start),
  //   .tdc_MOSI(f5_tdc_data_in),
  //   .w_wr_en(f5_wr_en),
  //   .data_TO_FIFO(f5_din)
  // );
  // tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f5_tdc_spi_master(
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .miso(f5_TDC_DOUT),
  //   .start(f5_tdc_SPI_start), // for SPI
  //   .data_in(f5_tdc_data_in),
  //   .CS_END(f5_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
  //   // OUTPUT
  //   .mosi(f5_TDC_MOSI),
  //   .sck(f5_TDC_SPI_CLOCK),
  //   .data_out(f5_tdc_data_out),
  //   .busy(f5_tdc_SPI_busy),
  //   .CS(f5_TDC_CS)
  // );
  // mems_control f5_mems_control (
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .mode(mode),
  //   .pause(pause),
  //   // .exit(exit),
  //   .mems_SPI_busy(f5_mems_SPI_busy),
  //   .mems_soft_reset(f5_soft_reset),
  //   .new_line_FIFO_done(f5_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f5_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f5_mems_SPI_start),
  //   .addr(f5_addr),
  //   .new_line(f5_new_line),
  //   .new_frame(f5_new_frame)
  // );
  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f5_mems_spi_master(
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .data_in(f5_mems_data_in),
  //   .start(f5_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f5_MEMS_MOSI),
  //   .sck(f5_MEMS_SPI_CLOCK),
  //   .busy(f5_mems_SPI_busy),
  //   .CS(f5_MEMS_CS)
  // );
  
  // // F6
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f6_tdc_control (
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .tdc_MISO(f6_tdc_data_out),
  //   .tdc_soft_reset(f6_soft_reset),
  //   .TDC_INTB(f6_TDC_INTB),
  //   .tdc_SPI_busy(f6_tdc_SPI_busy),
  //   .fifo_writing_done(f6_FIFO_writing_done),
      // .mode(mode),
  //   .pause(pause),
  //   .exit(exit),


  //   // OUTPUT
  //   .start_signal(f6_TDC_START_SIGNAL),
  //   .CS_END(f6_CS_END),
  //   .start(f6_tdc_SPI_start),
  //   .tdc_MOSI(f6_tdc_data_in),
  //   .w_wr_en(f6_wr_en),
  //   .data_TO_FIFO(f6_din)
  // );
  // tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f6_tdc_spi_master(
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .miso(f6_TDC_DOUT),
  //   .start(f6_tdc_SPI_start), // for SPI
  //   .data_in(f6_tdc_data_in),
  //   .CS_END(f6_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
  //   // OUTPUT
  //   .mosi(f6_TDC_MOSI),
  //   .sck(f6_TDC_SPI_CLOCK),
  //   .data_out(f6_tdc_data_out),
  //   .busy(f6_tdc_SPI_busy),
  //   .CS(f6_TDC_CS)
  // );
  // mems_control f6_mems_control (
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .mode(mode),
  //   .pause(pause),
  //  //  .exit(exit),
  //   .mems_SPI_busy(f6_mems_SPI_busy),
  //   .mems_soft_reset(f6_soft_reset),
  //   .new_line_FIFO_done(f6_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f6_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f6_mems_SPI_start),
  //   .addr(f6_addr),
  //   .new_line(f6_new_line),
  //   .new_frame(f6_new_frame)
  // );
  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f6_mems_spi_master(
  //   // INPUT
  //   .clk(clk_64mhz),
  //   .rst(rst),
  //   .data_in(f6_mems_data_in),
  //   .start(f6_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f6_MEMS_MOSI),
  //   .sck(f6_MEMS_SPI_CLOCK),
  //   .busy(f6_mems_SPI_busy),
  //   .CS(f6_MEMS_CS)
  // );


  // // fake_tdc fake_tdc1 (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .f_FIFO_writing_done(f1_FIFO_writing_done),

  //   // OUTPUT
  //   .wr_en(f1_wr_en)
  // );
 
  // fake_mems fake_mems1 (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .new_line_FIFO_done(f1_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f1_new_frame_FIFO_done),
  //   // OUTPUT
  //   .new_line(f1_new_line),
  //   .new_frame(f1_new_frame)
  // );


endmodule