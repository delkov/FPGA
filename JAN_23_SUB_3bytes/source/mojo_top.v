module mojo_top(

  // GLOBAL
  input clk, // 50Mhz
  input rst_n,
  input SERIAL_IN,

  output f1_ENABLE,
  output f2_ENABLE,
  
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
  // INPUT
  input f1_TDC_INTB,
  input f2_TDC_INTB,
  
  input f1_TDC_DOUT,
  input f2_TDC_DOUT,
  
  // OUTPUT
  output f1_TDC_MOSI,
  output f2_TDC_MOSI,

  output f1_TDC_SPI_CLOCK,
  output f2_TDC_SPI_CLOCK,

  output f1_TDC_CS,
  output f2_TDC_CS,

  output f1_TDC_REF_CLOCK,
  output f2_TDC_REF_CLOCK,
  
  output f1_TDC_START_SIGNAL,
  output f2_TDC_START_SIGNAL,
  


  // MEMS
  output f1_MEMS_MOSI,
  output f2_MEMS_MOSI,

  output f1_MEMS_CS,
  output f2_MEMS_CS,

  output f1_MEMS_FCLK,
  output f2_MEMS_FCLK,

  output f1_MEMS_SPI_CLOCK,
  output f2_MEMS_SPI_CLOCK,

  // SERIAL
  output SERIAL_OUT_TDC

  // DEBUGGING
  // output f2_new_line,
  // output f2_new_frame
  // output f2_wr_en,
  // output f3_wr_en,

  // output f2_FIFO_writing_done,
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
  localparam FIFO_WIDTH=7; // 128 is fine means count of elements is 2^FIFO_WIDTH
  localparam BAUD_RATE_SPEED=1000000; // in Hz, CAN BE ANY

  // OTHER
  localparam SHOOTING_FREQUENCY=300; // in Hz, CAN BE ANY
    
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


  // wire f1_ENABLE; // enable both for TDC & MEMS
  // wire f2_ENABLE; // enable both for TDC & MEMS
  
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
  
  wire [7:0] f1_tdc_data_in;
  wire [7:0] f2_tdc_data_in;
  
  wire f1_tdc_SPI_busy;
  wire f2_tdc_SPI_busy;
  
  wire [7:0] f1_tdc_data_out;
  wire [7:0] f2_tdc_data_out;
  
  wire f1_CS_END;
  wire f2_CS_END;

  wire [31:0] f1_din;
  wire [31:0] f2_din;

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
  
  wire f1_mems_SPI_busy;
  wire f2_mems_SPI_busy;
  
  wire [23:0] f1_mems_data_in;
  wire [23:0] f2_mems_data_in;

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
    
    // OUTPUT
    .f1_tdc_enable(f1_ENABLE), // using from low to high
    .f2_tdc_enable(f2_ENABLE), // using from low to high
    .f1_soft_reset(f1_soft_reset),
    .f2_soft_reset(f2_soft_reset),
    .pause(pause) // global pause
  );

  fifo_manager #(.BAUD_RATE_PARAM(BAUD_RATE_PARAM), .FIFO_WIDTH(FIFO_WIDTH)) fifo_manager (
    // INPUT
    .clk(clk),
    .rst(rst),

    // TDC
    // INPUT
    .f1_din(f1_din),
    .f2_din(f2_din),

    .f1_wr_en(f1_wr_en),
    .f2_wr_en(f2_wr_en),
    .f3_wr_en(f3_wr_en),
    .f4_wr_en(f4_wr_en),
    .f5_wr_en(f5_wr_en),
    .f6_wr_en(f6_wr_en),

    // OUTPUT
    .f1_FIFO_writing_done(f1_FIFO_writing_done),
    .f2_FIFO_writing_done(f2_FIFO_writing_done),
    .f3_FIFO_writing_done(f3_FIFO_writing_done),
    .f4_FIFO_writing_done(f4_FIFO_writing_done),
    .f5_FIFO_writing_done(f5_FIFO_writing_done),
    .f6_FIFO_writing_done(f6_FIFO_writing_done),

    // MEMS
    // INPUT
    .f1_new_line(f1_new_line),
    .f2_new_line(f2_new_line),
    .f3_new_line(f3_new_line),
    .f4_new_line(f4_new_line),
    .f5_new_line(f5_new_line),
    .f6_new_line(f6_new_line),
    
    .f1_new_frame(f1_new_frame),
    .f2_new_frame(f2_new_frame),
    .f3_new_frame(f3_new_frame),
    .f4_new_frame(f4_new_frame),
    .f5_new_frame(f5_new_frame),
    .f6_new_frame(f6_new_frame),

    // OUTPUT
    .f1_new_line_FIFO_done(f1_new_line_FIFO_done),
    .f2_new_line_FIFO_done(f2_new_line_FIFO_done),
    .f3_new_line_FIFO_done(f3_new_line_FIFO_done),
    .f4_new_line_FIFO_done(f4_new_line_FIFO_done),
    .f5_new_line_FIFO_done(f5_new_line_FIFO_done),
    .f6_new_line_FIFO_done(f6_new_line_FIFO_done),
        
    .f1_new_frame_FIFO_done(f1_new_frame_FIFO_done),
    .f2_new_frame_FIFO_done(f2_new_frame_FIFO_done),
    .f3_new_frame_FIFO_done(f3_new_frame_FIFO_done),
    .f4_new_frame_FIFO_done(f4_new_frame_FIFO_done),
    .f5_new_frame_FIFO_done(f5_new_frame_FIFO_done),
    .f6_new_frame_FIFO_done(f6_new_frame_FIFO_done),

    // OTHERS
    .w_tx_OUT_TDC(SERIAL_OUT_TDC),

    .tx_busy_TDC(tx_busy_TDC), // debugging
    .new_data_FROM_FIFO_TO_SERIAL(t_new_data_FROM_FIFO_TO_SERIAL), // debugging

    // debug
    .w_empty(FIFO_EMPTY), // debugging
    .w_full(FIFO_FULL), // debugging
    .t_rd_en(t_rd_en) // debugging
  );


  tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) f1_tdc_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    // .tdc_SPI_new_data(tdc_SPI_new_data), // debugging
    .tdc_MISO(f1_tdc_data_out),
    .tdc_soft_reset(f1_soft_reset),
    .TDC_INTB(f1_TDC_INTB),
    .tdc_SPI_busy(f1_tdc_SPI_busy),
    .fifo_writing_done(f1_FIFO_writing_done), // FIFO feedback
    .pause(pause),

    // OUTPUT
    .start_signal(f1_TDC_START_SIGNAL),
    .CS_END(f1_CS_END),
    .start(f1_tdc_SPI_start),
    .tdc_MOSI(f1_tdc_data_in), 
    .w_wr_en(f1_wr_en), // ready to write to FIFO
    .data_TO_FIFO(f1_din)
  );


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
    .data_TO_FIFO(f2_din)
  );

  // 3 for 6 MHz
  tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) f1_tdc_spi_master(
    // INPUT
    .clk(clk),
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
    // .new_data(tdc_SPI_new_data), // debugging
    .CS(f1_TDC_CS)
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

  mems_control f1_mems_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    .pause(pause),
    .mems_SPI_busy(f1_mems_SPI_busy),
    .mems_soft_reset(f1_soft_reset),
    
    .new_line_FIFO_done(f1_new_line_FIFO_done),
    .new_frame_FIFO_done(f1_new_frame_FIFO_done),

    // OUTPUT
    .mems_SPI_start(f1_mems_SPI_start),
    .data_mosi(f1_mems_data_in),
    .new_line(f1_new_line),
    .new_frame(f1_new_frame)
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

    // OUTPUT
    .mems_SPI_start(f2_mems_SPI_start),
    .data_mosi(f2_mems_data_in),
    .new_line(f2_new_line),
    .new_frame(f2_new_frame)
  );

  // MEMS_1, 7 is 16 ms, 10 - 140ms, 4 is 2ms
  mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) f1_mems_spi_master(
    // INPUT
    .clk(clk),
    .rst(rst),
    // .miso(miso), // not needed, since mems has hooutput..
    .data_in(f1_mems_data_in),
    .start(f1_mems_SPI_start),

    // OUTPUT
    .mosi(f1_MEMS_MOSI),
    .sck(f1_MEMS_SPI_CLOCK),
    // .data_out(data_out),
    .busy(f1_mems_SPI_busy),
    // .new_data(f1_mems_SPI_new_data), // debugging
    .CS(f1_MEMS_CS)
  );

  // MEMS_2
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

  // TDC_1  REF_CLOCK, 12.5 MHz
  my_clk #(.CLK_DIV(TDC_REF_PARAM)) f1_tdc_ref_clk (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(f1_TDC_REF_CLOCK)
  ); 

  // TDC_2 REF_CLOCK
  my_clk #(.CLK_DIV(TDC_REF_PARAM)) f2_tdc_ref_clk (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(f2_TDC_REF_CLOCK)
  ); 

  // MEMS_1 FCLK, 10 KHz
  my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f1_FCLK (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(f1_MEMS_FCLK)
  ); 

  // MEMS_2, FLCK
  my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) f2_FCLK (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(f2_MEMS_FCLK)
  ); 


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