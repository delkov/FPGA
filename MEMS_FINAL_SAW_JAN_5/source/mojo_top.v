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
  assign led = 8'b0;
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
    .mems_busy(mems_busy)
  );

// 7 is 16 ms, 10 - 140ms, 4 is 2ms
  mems_spi #(.CLK_DIV(9)) mems_spi_master(
    .clk(clk),
    .rst(rst),
    .miso(miso),
    .mosi(probe_mosi),
    .sck(probe_spi_clock),
    .start(start),
    .data_in(data_miso),
    .data_out(data_out),
    .busy(mems_busy),
    .new_data(new_data),
    .CS(probe_CS)
  );
   
  // FCLK for mems
   my_clk #(.CLK_DIV(5000)) FCLK (
   .clk(clk),
   .rst(rst),
   .my_clk(probe_FCLK)
   ); 

endmodule