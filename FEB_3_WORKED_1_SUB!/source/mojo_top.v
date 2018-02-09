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


  // // F1
  // output f1_ENABLE,
  // // TDC
  // input f1_TDC_INTB,
  // input f1_TDC_DOUT,
  // output f1_TDC_MOSI,
  // output f1_TDC_SPI_CLOCK,
  // output f1_TDC_CS,
  // output f1_TDC_REF_CLOCK,
  // output f1_TDC_START_SIGNAL,
  // // MEMS
  // output f1_MEMS_MOSI,
  // output f1_MEMS_CS,
  // output f1_MEMS_FCLK,
  // output f1_MEMS_SPI_CLOCK,
  

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

  // output fake_f2_TDC_START_SIGNAL,
  // output fake_f2_TDC_INTB,

  // MEMS
  output f2_MEMS_MOSI,
  output f2_MEMS_CS,
  output f2_MEMS_FCLK,
  output f2_MEMS_SPI_CLOCK,

  // output f2_new_line,
  // output f2_new_line_FIFO_done,
  // output f2_new_frame,
  // output f2_new_frame_FIFO_done,
  // // F3
  // output f3_ENABLE,
  // // TDC
  // input f3_TDC_INTB,
  // input f3_TDC_DOUT,
  // output f3_TDC_MOSI,
  // output f3_TDC_SPI_CLOCK,
  // output f3_TDC_CS,
  // output f3_TDC_REF_CLOCK,
  // output f3_TDC_START_SIGNAL,
  // // MEMS
  // output f3_MEMS_MOSI,
  // output f3_MEMS_CS,
  // output f3_MEMS_FCLK,
  // output f3_MEMS_SPI_CLOCK,


  // // F4
  // output f4_ENABLE,
  // // TDC
  // input f4_TDC_INTB,
  // input f4_TDC_DOUT,
  // output f4_TDC_MOSI,
  // output f4_TDC_SPI_CLOCK,
  // output f4_TDC_CS,
  // output f4_TDC_REF_CLOCK,
  // output f4_TDC_START_SIGNAL,
  // // MEMS
  // output f4_MEMS_MOSI,
  // output f4_MEMS_CS,
  // output f4_MEMS_FCLK,
  // output f4_MEMS_SPI_CLOCK,


  // // F5
  // output f5_ENABLE,
  // // TDC
  // input f5_TDC_INTB,
  // input f5_TDC_DOUT,
  // output f5_TDC_MOSI,
  // output f5_TDC_SPI_CLOCK,
  // output f5_TDC_CS,
  // output f5_TDC_REF_CLOCK,
  // output f5_TDC_START_SIGNAL,
  // // MEMS
  // output f5_MEMS_MOSI,
  // output f5_MEMS_CS,
  // output f5_MEMS_FCLK,
  // output f5_MEMS_SPI_CLOCK,


  // // F6
  // output f6_ENABLE,
  // // TDC
  // input f6_TDC_INTB,
  // input f6_TDC_DOUT,
  // output f6_TDC_MOSI,
  // output f6_TDC_SPI_CLOCK,
  // output f6_TDC_CS,
  // output f6_TDC_REF_CLOCK,
  // output f6_TDC_START_SIGNAL,
  // // MEMS
  // output f6_MEMS_MOSI,
  // output f6_MEMS_CS,
  // output f6_MEMS_FCLK,
  // output f6_MEMS_SPI_CLOCK,

  // SERIAL
  output SERIAL_OUT_TDC

  // DEBUGGING
  // output f2_new_line,
  // output f2_new_frame
  // output f2_wr_en,
  // output f3_wr_en,
  // output CHECK_DATA

  // output f2_FIFO_writing_done
  // output f3_FIFO_writing_done

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
 
  assign fake_f2_TDC_START_SIGNAL = f2_TDC_START_SIGNAL;
  // assign fake_f2_TDC_INTB = f2_TDC_INTB;


  // PARAMS
  localparam MOJO_FREQUENCY=50000000; // constant
  // must be 50/2^n, since they are clock, otherwise will be rounded to closest minimum one. e.g 3.3kk->3.125kk
  // TDC
  localparam TDC_REF_CLOCK_FREQUENCY=12500000; // 12500000, range [1-16MHz]
  localparam TDC_SPI_SPEED=6250000; // 6250000, max is  20Mhz
  // MEMS
  localparam FCLK_FREQUENCY=52000; // 10k -> 6k -> available 6k*2^n;
  localparam MEMS_SPI_SPEED=100000;  // max is 50MHZ
  

  // FIFO
  localparam FIFO_WIDTH=6; // 128 is fine means count of elements is 2^FIFO_WIDTH
  localparam BAUD_RATE_SPEED= 1000000; // in Hz, CAN BE ANY

  // OTHER
  localparam SHOOTING_FREQUENCY=7000; // in Hz, CAN BE ANY. PAY ATTENTION, THAT AT 70khz, the real speed will be only 36 at TDC SPI SPEED 12.5kk. since after couner we have others deals. 
    
  // CONVERTED PARAMS  
  localparam FCLK_FREQUENCY_PARAM=MOJO_FREQUENCY/FCLK_FREQUENCY; 
  localparam SHOOTING_PARAM=MOJO_FREQUENCY/SHOOTING_FREQUENCY;
  localparam BAUD_RATE_PARAM=MOJO_FREQUENCY/BAUD_RATE_SPEED;
  localparam TDC_REF_PARAM=MOJO_FREQUENCY/TDC_REF_CLOCK_FREQUENCY; 
  
  localparam TDC_SPI_SPEED_PARAM= MOJO_FREQUENCY/TDC_SPI_SPEED; 
  localparam MEMS_SPI_SPEED_PARAM= MOJO_FREQUENCY/MEMS_SPI_SPEED; 


  // GLOBAL
  wire rst = ~rst_n; // make reset active high
  wire f1_soft_reset;
  wire f2_soft_reset;
  wire f3_soft_reset;
  wire f4_soft_reset;
  wire f5_soft_reset;
  wire f6_soft_reset;


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
  
  // TDC
  wire f1_tdc_SPI_start;


  wire f2_tdc_SPI_start;
  wire f3_tdc_SPI_start;
  wire f4_tdc_SPI_start;
  wire f5_tdc_SPI_start;
  wire f6_tdc_SPI_start;
  
  wire [7:0] f1_tdc_data_in;
  wire [7:0] f2_tdc_data_in;
  wire [7:0] f3_tdc_data_in;
  wire [7:0] f4_tdc_data_in;
  wire [7:0] f5_tdc_data_in;
  wire [7:0] f6_tdc_data_in;

  wire f1_tdc_SPI_busy;
  wire f2_tdc_SPI_busy;
  wire f3_tdc_SPI_busy;
  wire f4_tdc_SPI_busy;
  wire f5_tdc_SPI_busy;
  wire f6_tdc_SPI_busy;
  
  wire [7:0] f1_tdc_data_out;
  wire [7:0] f2_tdc_data_out;
  wire [7:0] f3_tdc_data_out;
  wire [7:0] f4_tdc_data_out;
  wire [7:0] f5_tdc_data_out;
  wire [7:0] f6_tdc_data_out;
  
  wire f1_CS_END;
  wire f2_CS_END;
  wire f3_CS_END;
  wire f4_CS_END;
  wire f5_CS_END;
  wire f6_CS_END;

  wire [31:0] f1_din;
  wire [31:0] f2_din;
  wire [31:0] f3_din;
  wire [31:0] f4_din;
  wire [31:0] f5_din;
  wire [31:0] f6_din;

  wire f1_wr_en;
  wire f2_wr_en;
  wire f3_wr_en;
  wire f4_wr_en;
  wire f5_wr_en;
  wire f6_wr_en;

  wire f1_FIFO_writing_done;
  wire f2_FIFO_writing_done;
  wire f3_FIFO_writing_done;
  wire f4_FIFO_writing_done;
  wire f5_FIFO_writing_done;
  wire f6_FIFO_writing_done;

  // MEMS - SPI
  wire f1_mems_SPI_start;
  wire f2_mems_SPI_start;
  wire f3_mems_SPI_start;
  wire f4_mems_SPI_start;
  wire f5_mems_SPI_start;
  wire f6_mems_SPI_start;
  
  wire f1_mems_SPI_busy;
  wire f2_mems_SPI_busy;
  wire f3_mems_SPI_busy;
  wire f4_mems_SPI_busy;
  wire f5_mems_SPI_busy;
  wire f6_mems_SPI_busy;
  
  wire [23:0] f1_mems_data_in;
  wire [23:0] f2_mems_data_in;
  wire [23:0] f3_mems_data_in;
  wire [23:0] f4_mems_data_in;
  wire [23:0] f5_mems_data_in;
  wire [23:0] f6_mems_data_in;

  // MEMS -- FRAME/LINE
  wire f1_new_line;
  wire f2_new_line;
  wire f3_new_line;
  wire f4_new_line;
  wire f5_new_line;
  wire f6_new_line;

  wire f1_new_frame;
  wire f2_new_frame;
  wire f3_new_frame;
  wire f4_new_frame;
  wire f5_new_frame;
  wire f6_new_frame;
  
  wire f1_new_line_FIFO_done;
  wire f2_new_line_FIFO_done;
  wire f3_new_line_FIFO_done;
  wire f4_new_line_FIFO_done;
  wire f5_new_line_FIFO_done;
  wire f6_new_line_FIFO_done;
  
  wire f1_new_frame_FIFO_done;
  wire f2_new_frame_FIFO_done;
  wire f3_new_frame_FIFO_done;
  wire f4_new_frame_FIFO_done;
  wire f5_new_frame_FIFO_done;
  wire f6_new_frame_FIFO_done;

  wire go_home;

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
    .rx_data(rx_data), // serial for communication
    .new_rx_data(new_rx_data), // serial for communication

    // CONTROL WHICH MODULE TO ON/OFF.
    // OUTPUT
    .f1_tdc_enable(f1_ENABLE), // set 0 to OFF. Sholud be from low to high (for TDC this is needed). 
    .f2_tdc_enable(f2_ENABLE),  
    .f3_tdc_enable(f3_ENABLE), 
    .f4_tdc_enable(f4_ENABLE), 
    .f5_tdc_enable(f5_ENABLE), 
    .f6_tdc_enable(f6_ENABLE), 

    .f1_soft_reset(f1_soft_reset), // set 0 to OFF (the TDC & MEMS will not be initialized -> will be not working)
    .f2_soft_reset(f2_soft_reset),
    .f3_soft_reset(f3_soft_reset),
    .f4_soft_reset(f4_soft_reset),
    .f5_soft_reset(f5_soft_reset),
    .f6_soft_reset(f6_soft_reset),

    .go_home(go_home),
    .pause(pause) // global pause
  );

  fifo_manager #(.BAUD_RATE_PARAM(BAUD_RATE_PARAM), .FIFO_WIDTH(FIFO_WIDTH)) fifo_manager (
    // INPUT
    .clk(clk),
    .rst(rst),

    // TDC
    // INPUT
    // .f1_din(f1_din),
    .f2_din(f2_din),
    // .f3_din(f3_din),
    // .f4_din(f4_din),
    // .f5_din(f5_din),
    // .f6_din(f6_din),
    
    // .f1_wr_en(f1_wr_en),
    .f2_wr_en(f2_wr_en),
    // .f3_wr_en(f3_wr_en),
    // .f4_wr_en(f4_wr_en),
    // .f5_wr_en(f5_wr_en),
    // .f6_wr_en(f6_wr_en),

    // OUTPUT
    // .f1_FIFO_writing_done(f1_FIFO_writing_done),
    .f2_FIFO_writing_done(f2_FIFO_writing_done),
    // .f3_FIFO_writing_done(f3_FIFO_writing_done),
    // .f4_FIFO_writing_done(f4_FIFO_writing_done),
    // .f5_FIFO_writing_done(f5_FIFO_writing_done),
    // .f6_FIFO_writing_done(f6_FIFO_writing_done),

    // MEMS
    // INPUT
    // .f1_new_line(f1_new_line),
    .f2_new_line(f2_new_line),
    // .f3_new_line(f3_new_line),
    // .f4_new_line(f4_new_line),
    // .f5_new_line(f5_new_line),
    // .f6_new_line(f6_new_line),
    
    // .f1_new_frame(f1_new_frame),
    .f2_new_frame(f2_new_frame),
    // .f3_new_frame(f3_new_frame),
    // .f4_new_frame(f4_new_frame),
    // .f5_new_frame(f5_new_frame),
    // .f6_new_frame(f6_new_frame),

    // OUTPUT
    // .f1_new_line_FIFO_done(f1_new_line_FIFO_done),
    .f2_new_line_FIFO_done(f2_new_line_FIFO_done),
    // .f3_new_line_FIFO_done(f3_new_line_FIFO_done),
    // .f4_new_line_FIFO_done(f4_new_line_FIFO_done),
    // .f5_new_line_FIFO_done(f5_new_line_FIFO_done),
    // .f6_new_line_FIFO_done(f6_new_line_FIFO_done),
        
    // .f1_new_frame_FIFO_done(f1_new_frame_FIFO_done),
    .f2_new_frame_FIFO_done(f2_new_frame_FIFO_done),
    // .f3_new_frame_FIFO_done(f3_new_frame_FIFO_done),
    // .f4_new_frame_FIFO_done(f4_new_frame_FIFO_done),
    // .f5_new_frame_FIFO_done(f5_new_frame_FIFO_done),
    // .f6_new_frame_FIFO_done(f6_new_frame_FIFO_done),

    // OTHERS
    .w_tx_OUT_TDC(SERIAL_OUT_TDC),
    .tx_busy_TDC(tx_busy_TDC) // debugging
    // .new_data_FROM_FIFO_TO_SERIAL(t_new_data_FROM_FIFO_TO_SERIAL), // debugging

    // debug
    // .w_empty(FIFO_EMPTY), // debugging
    // .w_full(FIFO_FULL), // debugging
    // .t_rd_en(t_rd_en) // debugging
  );







  // // F1
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f1_tdc_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   // .tdc_SPI_new_data(tdc_SPI_new_data), // debugging
  //   .tdc_MISO(f1_tdc_data_out),
  //   .tdc_soft_reset(f1_soft_reset),
  //   .TDC_INTB(f1_TDC_INTB),
  //   .tdc_SPI_busy(f1_tdc_SPI_busy),
  //   .fifo_writing_done(f1_FIFO_writing_done), // FIFO feedback
  //   .pause(pause),

  //   // OUTPUT
  //   .start_signal(f1_TDC_START_SIGNAL),
  //   .CS_END(f1_CS_END),
  //   .start(f1_tdc_SPI_start),
  //   .tdc_MOSI(f1_tdc_data_in), 
  //   .w_wr_en(f1_wr_en), // ready to write to FIFO
  //   .data_TO_FIFO(f1_din)
  // );

  // // 3 for 6 MHz
  // tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f1_tdc_spi_master(
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .miso(f1_TDC_DOUT), // data from TDC..
  //   .start(f1_tdc_SPI_start), // for SPI
  //   .data_in(f1_tdc_data_in),
  //   .CS_END(f1_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
  //   // OUTPUT
  //   .mosi(f1_TDC_MOSI),
  //   .sck(f1_TDC_SPI_CLOCK),
  //   .data_out(f1_tdc_data_out),
  //   .busy(f1_tdc_SPI_busy), 
  //   // .new_data(tdc_SPI_new_data), // debugging
  //   .CS(f1_TDC_CS)
  // );

  // mems_control f1_mems_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .pause(pause),
  //   .mems_SPI_busy(f1_mems_SPI_busy),
  //   .mems_soft_reset(f1_soft_reset),
  
  //   .new_line_FIFO_done(f1_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f1_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f1_mems_SPI_start),
  //   .data_mosi(f1_mems_data_in),
  //   .new_line(f1_new_line),
  //   .new_frame(f1_new_frame)
  // );

  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f1_mems_spi_master(
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .data_in(f1_mems_data_in),
  //   .start(f1_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f1_MEMS_MOSI),
  //   .sck(f1_MEMS_SPI_CLOCK),
  //   .busy(f1_mems_SPI_busy),
  //   // .new_data(f1_mems_SPI_new_data), // debugging
  //   .CS(f1_MEMS_CS)
  // );

  // // TDC  REF_CLOCK, 12.5 MHz
  // my_clk #(.CLK_DIV(TDC_REF_PARAM)) f1_tdc_ref_clk (
  //  // INPUT
  //  .clk(clk),
  //  .rst(rst),

  //  // OUTPUT
  //  .my_clk(f1_TDC_REF_CLOCK)
  // ); 

  // // MEMS FCLK, 10 KHz
  // my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f1_FCLK (
  //  // INPUT
  //  .clk(clk),
  //  .rst(rst),

  //  // OUTPUT
  //  .my_clk(f1_MEMS_FCLK)
  // ); 




  // F2
  tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f2_tdc_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    // .tdc_SPI_new_data(tdc_SPI_new_data), // debugging
    .tdc_MISO(f2_tdc_data_out),
    .tdc_soft_reset(f2_soft_reset),
    .TDC_INTB(f2_TDC_INTB),
    .tdc_SPI_busy(f2_tdc_SPI_busy),
    .fifo_writing_done(f2_FIFO_writing_done),
    .pause(pause),

    // OUTPUT
    .start_signal(f2_TDC_START_SIGNAL),
    .CS_END(f2_CS_END),
    .start(f2_tdc_SPI_start),
    .tdc_MOSI(f2_tdc_data_in),
    .w_wr_en(f2_wr_en),
    .data_TO_FIFO(f2_din),
    .CHECK_DATA(CHECK_DATA)
  );

  tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f2_tdc_spi_master(
    // INPUT
    .clk(clk),
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
    // .new_data(f2_tdc_SPI_new_data),
    .CS(f2_TDC_CS)
  );

  mems_control f2_mems_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    .pause(pause),
    .mems_SPI_busy(f2_mems_SPI_busy),
    .mems_soft_reset(f2_soft_reset),
    
    .new_line_FIFO_done(f2_new_line_FIFO_done),
    .new_frame_FIFO_done(f2_new_frame_FIFO_done),
    .go_home(go_home),

    // OUTPUT
    .mems_SPI_start(f2_mems_SPI_start),
    .data_mosi(f2_mems_data_in),
    .new_line(f2_new_line),
    .new_frame(f2_new_frame)
  );

  mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f2_mems_spi_master(
    // INPUT
    .clk(clk),
    .rst(rst),
    // .miso(f2_miso),
    .data_in(f2_mems_data_in),
    .start(f2_mems_SPI_start),

    // OUTPUT
    .mosi(f2_MEMS_MOSI),
    .sck(f2_MEMS_SPI_CLOCK),
    // .data_out(f2_data_out),
    .busy(f2_mems_SPI_busy),
    // .new_data(f2_mems_SPI_new_data), //debugging
    .CS(f2_MEMS_CS)
  );

  // TDC REF_CLOCK
  my_clk #(.CLK_DIV(TDC_REF_PARAM)) f2_tdc_ref_clk (
    // INPUT
    .clk(clk),
    .rst(rst),

    // OUTPUT
    .my_clk(f2_TDC_REF_CLOCK)
  ); 

  my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f2_FCLK (
    // INPUT
    .clk(clk),
    .rst(rst),

    // OUTPUT
    .my_clk(f2_MEMS_FCLK)
  ); 




  // // F3
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f3_tdc_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   // .tdc_SPI_new_data(tdc_SPI_new_data), // debugging
  //   .tdc_MISO(f3_tdc_data_out),
  //   .tdc_soft_reset(f3_soft_reset),
  //   .TDC_INTB(f3_TDC_INTB),
  //   .tdc_SPI_busy(f3_tdc_SPI_busy),
  //   .fifo_writing_done(f3_FIFO_writing_done),
  //   .pause(pause),

  //   // OUTPUT
  //   .start_signal(f3_TDC_START_SIGNAL),
  //   .CS_END(f3_CS_END),
  //   .start(f3_tdc_SPI_start),
  //   .tdc_MOSI(f3_tdc_data_in),
  //   .w_wr_en(f3_wr_en),
  //   .data_TO_FIFO(f3_din)
  // );

  // tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f3_tdc_spi_master(
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .miso(f3_TDC_DOUT),
  //   .start(f3_tdc_SPI_start), // for SPI
  //   .data_in(f3_tdc_data_in),
  //   .CS_END(f3_CS_END), // manage up/down real CS pin -- f1_TDC_CS
    
  //   // OUTPUT
  //   .mosi(f3_TDC_MOSI),
  //   .sck(f3_TDC_SPI_CLOCK),
  //   .data_out(f3_tdc_data_out),
  //   .busy(f3_tdc_SPI_busy),
  //   // .new_data(f2_tdc_SPI_new_data),
  //   .CS(f3_TDC_CS)
  // );

  // mems_control f3_mems_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .pause(pause),
  //   .mems_SPI_busy(f3_mems_SPI_busy),
  //   .mems_soft_reset(f3_soft_reset),
    
  //   .new_line_FIFO_done(f3_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f3_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f3_mems_SPI_start),
  //   .data_mosi(f3_mems_data_in),
  //   .new_line(f3_new_line),
  //   .new_frame(f3_new_frame)
  // );

  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f3_mems_spi_master(
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .data_in(f3_mems_data_in),
  //   .start(f3_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f3_MEMS_MOSI),
  //   .sck(f3_MEMS_SPI_CLOCK),
  //   .busy(f3_mems_SPI_busy),
  //   // .new_data(f2_mems_SPI_new_data), //debugging
  //   .CS(f3_MEMS_CS)
  // );

  // // TDC REF CLOCK
  // my_clk #(.CLK_DIV(TDC_REF_PARAM)) f3_tdc_ref_clk (
  //  // INPUT
  //  .clk(clk),
  //  .rst(rst),

  //  // OUTPUT
  //  .my_clk(f3_TDC_REF_CLOCK)
  // ); 

  // // MEMS FILTER CLK
  // my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f3_FCLK (
  //  // INPUT
  //  .clk(clk),
  //  .rst(rst),

  //  // OUTPUT
  //  .my_clk(f3_MEMS_FCLK)
  // ); 




  // // F4
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f4_tdc_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   // .tdc_SPI_new_data(tdc_SPI_new_data), // debugging
  //   .tdc_MISO(f4_tdc_data_out),
  //   .tdc_soft_reset(f4_soft_reset),
  //   .TDC_INTB(f4_TDC_INTB),
  //   .tdc_SPI_busy(f4_tdc_SPI_busy),
  //   .fifo_writing_done(f4_FIFO_writing_done),
  //   .pause(pause),

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
  //   .clk(clk),
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
  //   // .new_data(f2_tdc_SPI_new_data),
  //   .CS(f4_TDC_CS)
  // );

  // mems_control f4_mems_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .pause(pause),
  //   .mems_SPI_busy(f4_mems_SPI_busy),
  //   .mems_soft_reset(f4_soft_reset),
    
  //   .new_line_FIFO_done(f4_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f4_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f4_mems_SPI_start),
  //   .data_mosi(f4_mems_data_in),
  //   .new_line(f4_new_line),
  //   .new_frame(f4_new_frame)
  // );

  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f4_mems_spi_master(
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .data_in(f4_mems_data_in),
  //   .start(f4_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f4_MEMS_MOSI),
  //   .sck(f4_MEMS_SPI_CLOCK),
  //   .busy(f4_mems_SPI_busy),
  //   // .new_data(f2_mems_SPI_new_data), //debugging
  //   .CS(f4_MEMS_CS)
  // );

  // // TDC REF CLOCK
  // my_clk #(.CLK_DIV(TDC_REF_PARAM)) f4_tdc_ref_clk (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),

  //   // OUTPUT
  //   .my_clk(f4_TDC_REF_CLOCK)
  // ); 

  // // MEMS FILTER CLOCK
  // my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f4_FCLK (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),

  //   // OUTPUT
  //   .my_clk(f4_MEMS_FCLK)
  // ); 





  // // F5
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f5_tdc_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   // .tdc_SPI_new_data(tdc_SPI_new_data), // debugging
  //   .tdc_MISO(f5_tdc_data_out),
  //   .tdc_soft_reset(f5_soft_reset),
  //   .TDC_INTB(f5_TDC_INTB),
  //   .tdc_SPI_busy(f5_tdc_SPI_busy),
  //   .fifo_writing_done(f5_FIFO_writing_done),
  //   .pause(pause),

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
  //   .clk(clk),
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
  //   // .new_data(f2_tdc_SPI_new_data),
  //   .CS(f5_TDC_CS)
  // );

  // mems_control f5_mems_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .pause(pause),
  //   .mems_SPI_busy(f5_mems_SPI_busy),
  //   .mems_soft_reset(f5_soft_reset),
    
  //   .new_line_FIFO_done(f5_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f5_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f5_mems_SPI_start),
  //   .data_mosi(f5_mems_data_in),
  //   .new_line(f5_new_line),
  //   .new_frame(f5_new_frame)
  // );

  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f5_mems_spi_master(
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .data_in(f5_mems_data_in),
  //   .start(f5_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f5_MEMS_MOSI),
  //   .sck(f5_MEMS_SPI_CLOCK),
  //   .busy(f5_mems_SPI_busy),
  //   // .new_data(f2_mems_SPI_new_data), //debugging
  //   .CS(f5_MEMS_CS)
  // );

  // // TDC REF CLOCK
  // my_clk #(.CLK_DIV(TDC_REF_PARAM)) f5_tdc_ref_clk (
  //  // INPUT
  //   .clk(clk),
  //   .rst(rst),

  //   // OUTPUT
  //   .my_clk(f5_TDC_REF_CLOCK)
  // ); 

  // // MEMS FILTER CLOCK
  // my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f5_FCLK (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),

  //   // OUTPUT
  //   .my_clk(f5_MEMS_FCLK)
  // ); 




  // // F6
  // tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f6_tdc_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   // .tdc_SPI_new_data(tdc_SPI_new_data), // debugging
  //   .tdc_MISO(f6_tdc_data_out),
  //   .tdc_soft_reset(f6_soft_reset),
  //   .TDC_INTB(f6_TDC_INTB),
  //   .tdc_SPI_busy(f6_tdc_SPI_busy),
  //   .fifo_writing_done(f6_FIFO_writing_done),
  //   .pause(pause),

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
  //   .clk(clk),
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
  //   // .new_data(f2_tdc_SPI_new_data),
  //   .CS(f6_TDC_CS)
  // );
  
  // mems_control f6_mems_control (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .pause(pause),
  //   .mems_SPI_busy(f6_mems_SPI_busy),
  //   .mems_soft_reset(f6_soft_reset),
    
  //   .new_line_FIFO_done(f6_new_line_FIFO_done),
  //   .new_frame_FIFO_done(f6_new_frame_FIFO_done),

  //   // OUTPUT
  //   .mems_SPI_start(f6_mems_SPI_start),
  //   .data_mosi(f6_mems_data_in),
  //   .new_line(f6_new_line),
  //   .new_frame(f6_new_frame)
  // );

  // mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f6_mems_spi_master(
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),
  //   .data_in(f6_mems_data_in),
  //   .start(f6_mems_SPI_start),

  //   // OUTPUT
  //   .mosi(f6_MEMS_MOSI),
  //   .sck(f6_MEMS_SPI_CLOCK),
  //   .busy(f6_mems_SPI_busy),
  //   // .new_data(f2_mems_SPI_new_data), //debugging
  //   .CS(f6_MEMS_CS)
  // );

  // // TDC REF CLOCK
  // my_clk #(.CLK_DIV(TDC_REF_PARAM)) f6_tdc_ref_clk (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),

  //   // OUTPUT
  //   .my_clk(f6_TDC_REF_CLOCK)
  // ); 

  // // MEMS FILTER CLOCK
  // my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f6_FCLK (
  //   // INPUT
  //   .clk(clk),
  //   .rst(rst),

  //   // OUTPUT
  //   .my_clk(f6_MEMS_FCLK)
  // ); 


  // fake_tdc fake_tdc1 (
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

  // UNCOMMENT TO MAKE COMMUNICATIONS VIA SERIAL
  // serial_rx #(.CLK_PER_BIT(17)) serial_rx2 (
  //   .clk(clk),
  //   .rst(n_rdy),
  //   .rx(SERIAL_IN),

  //   .data(rx_data2),
  //   .new_data(new_rx_data2)
  // );

endmodule