module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections

    output probe_mosi,
    output probe_new_data,
    output probe_start,
    output probe_spi_clock,
    output probe_CS,
    output probe_FCLK,
    output ENABLE,

    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy // AVR Rx buffer full
  );
 
  wire rst = ~rst_n; // make reset active high
 
  assign mojo_clk=clk;
  assign led[7:2] = 6'b111_111;
  assign probe_new_data = new_data;
  assign probe_start= start;
  assign ENABLE = 1'b1; // CONSTANT 3.3V FOR MEMS

  wire [7:0] tx_data;
  wire new_tx_data;
  wire tx_busy;
  wire [7:0] rx_data;
  wire new_rx_data;

  wire start;
  wire new_data;
  wire [23:0] data_miso;
  // wire [23:0] data_in = 24'b101000000000000000000011;//101010101010101010101010;

  wire mems_busy;

  localparam MOJO_FREQUENCY=50000000; // constant

  localparam MEMS_SPI_SPEED=1600000;  // max is 50MHZ. 6k*2^n;
  localparam FCLK_FREQUENCY=52000; // 10k -> 6k -> available 6k*2^n;

  localparam MEMS_SPI_SPEED_PARAM= MOJO_FREQUENCY/MEMS_SPI_SPEED; 
  localparam FCLK_FREQUENCY_PARAM=MOJO_FREQUENCY/FCLK_FREQUENCY; 

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
 
  mems_control mems_control (
    .clk(clk),
    .rst(rst),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data),
    // .data_in(data_in),
    .start(start),
    .new_data(new_data),
    .data_miso(data_miso),
    .mems_busy(mems_busy),
	.new_frame(led[0]),
	.new_line(led[1])
  );

  mems_spi #(.CLK_DIV(MEMS_SPI_SPEED_PARAM)) mems_spi_master( //7
    .clk(clk),
    .rst(rst),
    .mosi(probe_mosi),
    // .mosi(probe_mosi),
    .sck(probe_spi_clock),
    .start(start),
    .data_in(data_miso),
    // .data_out(data_out),
    .busy(mems_busy),
    .new_data(new_data),
    .CS(probe_CS)
  );
   
  // FCLK for mems
 //  my_clk #(.CLK_DIV(5000)) FCLK (  // 5000 give 6 Khz
  my_clk #(.CLK_DIV(FCLK_FREQUENCY_PARAM)) FCLK ( //1000 = 48 KHz
   .clk(clk),
   .rst(rst),
   .my_clk(probe_FCLK)
   ); 

endmodule