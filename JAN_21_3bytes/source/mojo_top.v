module mojo_top(

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

  // TDC_1
  input TDC_INTB,
  input TDC_DOUT,

  // OUTPUT
  output TDC_MOSI,
  output TDC_SPI_CLOCK,
  output TDC_CS,
  output TDC_REF_CLOCK,
  output TDC_START_SIGNAL,
  output SERIAL_OUT_TDC,
  
  // TDC_2
  input f2_TDC_INTB,
  input f2_TDC_DOUT,

  // OUTPUT
  output f2_TDC_MOSI,
  output f2_TDC_SPI_CLOCK,
  output f2_TDC_CS,
  output f2_TDC_REF_CLOCK,
  output f2_TDC_START_SIGNAL,
  output f2_SERIAL_OUT_TDC,


  // MEMS_1
  output MEMS_MOSI,
  output MEMS_SPI_CLOCK,
  output MEMS_CS,
  output MEMS_FCLK,
  // MEMS_2
  output f2_MEMS_MOSI,
  output f2_MEMS_SPI_CLOCK,
  output f2_MEMS_CS,
  output f2_MEMS_FCLK


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
  localparam BAUD_RATE_SPEED=4000000; // in Hz, CAN BE ANY

  // OTHER
  localparam SHOOTING_FREQUENCY=50; // in Hz, CAN BE ANY
    
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
  
  // MEMS_1
  wire mems_SPI_start;
  wire mems_SPI_busy;
  wire [23:0] data_miso;
  // MEMS_2
  wire f2_mems_SPI_start;
  wire f2_mems_SPI_busy;
  wire [23:0] f2_data_miso;
  
  // TDC_1
  wire tdc_SPI_start;
  wire [7:0] tdc_data_in;
  wire tdc_SPI_busy;
  wire [7:0] tdc_data_out;
  wire CS_END;
  // TDC_2
  wire f2_tdc_SPI_start;
  wire [7:0] f2_tdc_data_in;
  wire f2_tdc_SPI_busy;
  wire [7:0] f2_tdc_data_out;
  wire f2_CS_END;

  // TDC
  wire [31:0] f1_din;
  wire [31:0] f2_din;

  wire f1_wr_en;
  wire f2_wr_en;
  wire f3_wr_en;
  wire f4_wr_en;
  wire f5_wr_en;
  wire f6_wr_en;

  // wire x1_fifo_writing_done;
  wire f1_FIFO_writing_done;
  wire f2_FIFO_writing_done;
  wire f3_FIFO_writing_done;
  wire f4_FIFO_writing_done;
  wire f5_FIFO_writing_done;
  wire f6_FIFO_writing_done;

  // fake MEMS
  // wire new_line;
  wire f1_new_line;
  wire f2_new_line;
  wire f3_new_line;
  wire f4_new_line;
  wire f5_new_line;
  wire f6_new_line;

  // wire new_frame;
  wire f1_new_frame;
  wire f2_new_frame;
  wire f3_new_frame;
  wire f4_new_frame;
  wire f5_new_frame;
  wire f6_new_frame;
  
  // wire new_line_FIFO_done;
  wire f1_new_line_FIFO_done;
  wire f2_new_line_FIFO_done;
  wire f3_new_line_FIFO_done;
  wire f4_new_line_FIFO_done;
  wire f5_new_line_FIFO_done;
  wire f6_new_line_FIFO_done;
  
  // wire new_frame_FIFO_done;
  wire f1_new_frame_FIFO_done;
  wire f2_new_frame_FIFO_done;
  wire f3_new_frame_FIFO_done;
  wire f4_new_frame_FIFO_done;
  wire f5_new_frame_FIFO_done;
  wire f6_new_frame_FIFO_done;

  // assign w_rd_en = t_rd_en;
  // assign w_wr_en = s1_wr_en;

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
    .tdc_enable(ENABLE), // using from low to high
    .soft_reset(soft_reset),
    .pause(pause) // global pause
  );

  fifo_manager #(.BAUD_RATE_PARAM(BAUD_RATE_PARAM), .FIFO_WIDTH(FIFO_WIDTH)) fifo_manager (
    // INPUT
    .clk(clk),
    .rst(rst),

    // TDC
    .f1_din(f1_din),
    .f2_din(f2_din),

    .f1_wr_en(f1_wr_en),
    .f2_wr_en(f2_wr_en),
    .f3_wr_en(f3_wr_en),
    .f4_wr_en(f4_wr_en),
    .f5_wr_en(f5_wr_en),
    .f6_wr_en(f6_wr_en),

    // MEMS
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
    // TDC
    .f1_FIFO_writing_done(f1_FIFO_writing_done),
    .f2_FIFO_writing_done(f2_FIFO_writing_done),
    .f3_FIFO_writing_done(f3_FIFO_writing_done),
    .f4_FIFO_writing_done(f4_FIFO_writing_done),
    .f5_FIFO_writing_done(f5_FIFO_writing_done),
    .f6_FIFO_writing_done(f6_FIFO_writing_done),

    // MEMS
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
    .tx_busy_TDC(tx_busy_TDC),
    .new_data_FROM_FIFO_TO_SERIAL(t_new_data_FROM_FIFO_TO_SERIAL),
    .w_tx_OUT_TDC(SERIAL_OUT_TDC),

    // debug
    .w_empty(FIFO_EMPTY),
    .w_full(FIFO_FULL),
    .t_rd_en(t_rd_en)
  );


  tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) tdc_control_1 (
    // INPUT
    .clk(clk),
    .rst(rst),
    // .tdc_SPI_new_data(tdc_SPI_new_data),
    .tdc_MISO(tdc_data_out),
    .tdc_soft_reset(soft_reset),
    .TDC_INTB(TDC_INTB),
    .tdc_SPI_busy(tdc_SPI_busy),
    .fifo_writing_done(f1_FIFO_writing_done),
    .pause(pause),

    // OUTPUT
    .start_signal(TDC_START_SIGNAL),
    .CS_END(CS_END),
    .start(tdc_SPI_start),
    .tdc_MOSI(tdc_data_in),
    .w_wr_en(f1_wr_en),
    .data_TO_FIFO(f1_din)
  );


  tdc_control #(.SHOOTING_PARAM(SHOOTING_PARAM)) tdc_control_2 (
    // INPUT
    .clk(clk),
    .rst(rst),
    // .tdc_SPI_new_data(tdc_SPI_new_data),
    .tdc_MISO(f2_tdc_data_out),
    .tdc_soft_reset(soft_reset),
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
  tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) tdc_spi_master(
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
    .new_data(tdc_SPI_new_data), // no need in fact..
    .CS(TDC_CS)
  );
  
  tdc_spi_master #(.CLK_DIV(TDC_SPI_SPEED_PARAM)) tdc_spi_master_2(
    // INPUT
    .clk(clk),
    .rst(rst),
    .miso(f2_TDC_DOUT),
    .start(f2_tdc_SPI_start), // for SPI
    .data_in(f2_tdc_data_in),
    .CS_END(f2_CS_END), // manage up/down real CS pin -- TDC_CS
    
    // OUTPUT
    .mosi(f2_TDC_MOSI),
    .sck(f2_TDC_SPI_CLOCK),
    .data_out(f2_tdc_data_out),
    .busy(f2_tdc_SPI_busy),
    .new_data(f2_tdc_SPI_new_data),
    .CS(f2_TDC_CS)
  );

  mems_control mems_control (
    // INPUT
    .clk(clk),
    .rst(rst),
    .pause(pause),
    .mems_SPI_busy(mems_SPI_busy),
    .mems_soft_reset(soft_reset),
    
    .new_line_FIFO_done(f1_new_line_FIFO_done),
    .new_frame_FIFO_done(f1_new_frame_FIFO_done),

    // OUTPUT
    .mems_SPI_start(mems_SPI_start),
    .data_miso(data_miso),
    .new_line(f1_new_line),
    .new_frame(f1_new_frame)
  );

  mems_control mems_control_2 (
    // INPUT
    .clk(clk),
    .rst(rst),
    .pause(pause),
    .mems_SPI_busy(f2_mems_SPI_busy),
    .mems_soft_reset(soft_reset),
    
    .new_line_FIFO_done(f2_new_line_FIFO_done),
    .new_frame_FIFO_done(f2_new_frame_FIFO_done),

    // OUTPUT
    .mems_SPI_start(f2_mems_SPI_start),
    .data_miso(f2_data_miso),
    .new_line(f2_new_line),
    .new_frame(f2_new_frame)
  );

  // MEMS_1, 7 is 16 ms, 10 - 140ms, 4 is 2ms
  mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) mems_spi_master(
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

  // MEMS_2
  mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) mems_spi_master_2(
    // INPUT
    .clk(clk),
    .rst(rst),
    .miso(f2_miso),
    .data_in(f2_data_miso),
    .start(f2_mems_SPI_start),

    // OUTPUT
    .mosi(f2_MEMS_MOSI),
    .sck(f2_MEMS_SPI_CLOCK),
    .data_out(f2_data_out),
    .busy(f2_mems_SPI_busy),
    .new_data(f2_mems_SPI_new_data),
    .CS(f2_MEMS_CS)
  );

  // TDC_1  REF_CLOCK, 12.5 MHz
  my_clk #(.CLK_DIV(TDC_REF_PARAM)) tdc_ref_clk (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(TDC_REF_CLOCK)
  ); 

  // TDC_2 REF_CLOCK
  my_clk #(.CLK_DIV(TDC_REF_PARAM)) tdc_ref_clk_2 (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(f2_TDC_REF_CLOCK)
  ); 

  // MEMS_1 FCLK, 10 KHz
  my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) FCLK (
   // INPUT
   .clk(clk),
   .rst(rst),

   // OUTPUT
   .my_clk(MEMS_FCLK)
  ); 

  // MEMS_2, FLCK
  my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) FCLK_2 (
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