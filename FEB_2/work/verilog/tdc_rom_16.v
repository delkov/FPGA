module tdc_rom_16 (
    input clk,
    input [5:0] addr,
    output [7:0] data
  );
 
  reg [7:0] rom_data [31:0];
  reg [7:0] data_d, data_q;
 
  assign data = data_q;
 
  // LSB FIRST by time!! - > the same order like below {}. ie LEFT IS MSB on the oscilo screen
  // WRITING TO TDC WILL BE like right to left, LSB FIRST !!!
  always @(*) begin
    //SOFT_RESET, 4 (h4x) means we want to write. {adrees, data}
    rom_data[0] = 8'h41; // CONFIG2
    rom_data[1] = 8'h40; // CONFIG2
    
    rom_data[2] = 8'h42;
    rom_data[3] = 8'h00; // Interrupt status register.

    rom_data[4] = 8'h43;
    rom_data[5] = 8'h07; // Interrupt MASK register. NOT RECOMMENT TO POLLINT TO UNDERSTAND NEW MEASUREMTN IS DONE. INTB pin shoul be used instead.

    rom_data[6] = 8'h44; // Coarse counter overflow_H!! IMPORTANT -- address
    rom_data[7] = 8'h01; // FF is 200us, OF is 10us. 01 WAS  -- value
    // rom_data[7] = 8'h01; // FF is 200us, OF is 10us
    // rom_data[7] = 8'h03; // FF is 200us, OF is 10us
    

    rom_data[8] = 8'h45;
    rom_data[9] = 8'h8F; // 00,FF is 840ns, 018F (see at rom_data[7]) is  ~1.2 us (SHOUL BE bigger than 1.1 us) 180m  Coarse counter overflow_L -- > probably about 100m
    // rom_data[9] = 8'hAF; // 00,FF is 840ns, 018F (see at rom_data[7]) is  ~1.2 us (SHOUL BE bigger than 1.1 us) 180m  Coarse counter overflow_L -- > probably about 100m
    

    // not USED BEGIN, only COARSE COUNTER is used
    rom_data[10] = 8'h46;
    rom_data[11] = 8'hFF; // Clock counter overflow_H // not used

    rom_data[12] = 8'h47; // Clock counter overflow_L // not used
    rom_data[13] = 8'hFF;

    rom_data[14] = 8'h48; // Clock counter STOP MASK_H  // not used
    rom_data[15] = 8'h00; // not used

    rom_data[16] = 8'h49; // Clock counter STOP MASK_L // not used
    rom_data[17] = 8'h00; // Clock counter STOP MASK_L // not used
    // not used END


       
    // CONFIG1 -- NEW MEASUREMENT   
    rom_data[18] = 8'h40; // WILL RESET ALL REGISTERS & INTERRUPT REGISTER also + generate TRIG signal
    rom_data[19] = 8'h81; // 

    // READ TIME1
    rom_data[20] = 8'h10; // TIME1 address
    rom_data[21] = 8'h00; 
    rom_data[22] = 8'h00; 
    rom_data[23] = 8'h00; 


    // READ CALBIB1
    rom_data[24] = 8'h1B; // CALBIB1 address
    rom_data[25] = 8'h00; 
    rom_data[26] = 8'h00; 
    rom_data[27] = 8'h00; 


    // READ CALIB2
    rom_data[28] = 8'h1C; // CALBIB2 address
    rom_data[29] = 8'h00; 
    rom_data[30] = 8'h00; 
    rom_data[31] = 8'h00; 

    //rom_data[10] = 16'b1010101010101010;//{8'h,8'h81}; // Clock counter STOP MASK_L
          
    // rom_data[0] = 16'b10101010;//{8'h40,8'h03}; // Clock counter STOP MASK_L           
    // rom_data[1] = {8'h40,8'h01}; // Clock counter STOP MASK_L           
    // rom_data[2] = {8'h40,8'h01}; // Clock counter STOP MASK_L           
    // rom_data[3] = {8'h44,8'h13}; // Clock counter STOP MASK_L           


        

    // rom_data[1] = 24'b101000000000011100000001; // LDAC SETUP

  // reg [7:0] add = 8'b00010011;
    // rom_data[2] = {8'b00000000, delta_A, 8'b00000000}; // CH A
    // rom_data[3] = {8'b00010001, delta_B, 8'b00000000}; // CH D
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