module message_rom (
    input clk,
    input [3:0] addr,
    input [7:0] delta_A,
    input [7:0] delta_B,
    input [7:0] delta_C,
    input [7:0] delta_D,
    output [23:0] data
  );
 
  reg [23:0] rom_data [5:0];
 
  // assign rom_data[0] = 24'b100000000011000000000000;//101000000000000000000011;
  // assign rom_data[1] = 24'b101000000000011100000001;
 
  reg [23:0] data_d, data_q;
 
  assign data = data_q;
 
  always @(*) begin

// // // OLDVI STYLE
    // rom_data[0] = 24'b001010000000000000000001; // SOFT_RESET;
    // rom_data[1] = 24'b001101110011111111111111;//1111; // LDAC SETUP
// //
  // NEW
    rom_data[0] = 24'b001010000000000000000001; // SOFT_RESET;
    rom_data[1] = 24'b001101110011111111110000;//1111; // LDAC SETUP
//
  // OLD
    // rom_data[2] = {8'b00010000, delta_A, 8'b00011111}; // CH A
    // rom_data[3] = {8'b00010001, delta_B, 8'b00000000}; // CH B
    // rom_data[4] = {8'b00010010, delta_C, 8'b00011111}; // CH C
    // rom_data[5] = {8'b00010011, delta_D, 8'b00000000}; // CH D
// NEW
    rom_data[2] = {8'b00000000, delta_A, 8'b00000000}; // CH A
    rom_data[3] = {8'b00000001, delta_B, 8'b00000000}; // CH B
    rom_data[4] = {8'b00000010, delta_C, 8'b00000000}; // CH C
    rom_data[5] = {8'b00010011, delta_D, 8'b00000000}; // CH D


 // MINE
    // rom_data[0] = 24'b001010000000000000000001; // SOFT_RESET;
    // rom_data[1] = 24'b001010000000000000000001; // SOFT_RESET;
    // // rom_data[1] = 24'b001101110011111111110000;//1111; // LDAC SETUP

    // rom_data[2] = {8'b00000000, delta_A, 8'b00011111}; // CH A
    // rom_data[3] = {8'b000001, delta_B, 8'b00000000}; // CH B





  // reg [7:0] add = 8'b00010011;
    // rom_data[2] = {8'b00010000, delta_A, 8'b00011111}; // CH A
    // rom_data[3] = {8'b00010001, delta_B, 8'b00000000}; // CH B



    

    // rom_data[4] = {8'b00010010, delta_C, 8'b00000000}; // CH A
    // rom_data[5] = {8'b00010011, delta_D, 8'b00000000}; // CH B

    // rom_data[4] = {8'b00010001, add, 8'b00000000}; // CH B
    // rom_data[5] = {8'b00010010, add, 8'b00000000}; // CH C

    // if (addr > 4'd13)
      // data_d = " ";
    // else
      // add_
      data_d = rom_data[addr];
  end
 

  always @(posedge clk) begin
    data_q <= data_d;
  end
 
endmodule