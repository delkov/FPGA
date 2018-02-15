module mems_rom (
    // INPUT
    input rst,
    input clk,
    input [15:0] f1_addr,
    input [15:0] f2_addr,
    input [15:0] f3_addr,
    input [15:0] f4_addr,
    input [15:0] f5_addr,
    input [15:0] f6_addr,

    input go_home,
    // OUTPUT
    output [23:0] f1_data,
    output [23:0] f2_data,
    output [23:0] f3_data,
    output [23:0] f4_data,
    output [23:0] f5_data,
    output [23:0] f6_data
    // output rom_scan_is_done
  );
  
parameter rom_size = 1441;

reg [15:0] rom_data [rom_size:0];

reg [23:0] f1_data_d, f1_data_q;
wire[13:0] f1_addrs;
reg [15:0] f1_antidata;

reg [23:0] f2_data_d, f2_data_q;
wire[13:0] f2_addrs;
reg [15:0] f2_antidata;

reg [23:0] f3_data_d, f3_data_q;
wire[13:0] f3_addrs;
reg [15:0] f3_antidata;

reg [23:0] f4_data_d, f4_data_q;
wire[13:0] f4_addrs;
reg [15:0] f4_antidata;

reg [23:0] f5_data_d, f5_data_q;
wire[13:0] f5_addrs;
reg [15:0] f5_antidata;

reg [23:0] f6_data_d, f6_data_q;
wire[13:0] f6_addrs;
reg [15:0] f6_antidata;

reg done;

reg [4:0] home_step=5'd30;
reg [15:0] home_bias=16'd23250;

reg [15:0] f1_CH_A_d, f1_CH_A_q;
reg [15:0] f1_CH_B_d, f1_CH_B_q;
reg [15:0] f1_CH_C_d, f1_CH_C_q;
reg [15:0] f1_CH_D_d, f1_CH_D_q;

reg [15:0] f2_CH_A_d, f2_CH_A_q;
reg [15:0] f2_CH_B_d, f2_CH_B_q;
reg [15:0] f2_CH_C_d, f2_CH_C_q;
reg [15:0] f2_CH_D_d, f2_CH_D_q;

reg [15:0] f3_CH_A_d, f3_CH_A_q;
reg [15:0] f3_CH_B_d, f3_CH_B_q;
reg [15:0] f3_CH_C_d, f3_CH_C_q;
reg [15:0] f3_CH_D_d, f3_CH_D_q;

reg [15:0] f4_CH_A_d, f4_CH_A_q;
reg [15:0] f4_CH_B_d, f4_CH_B_q;
reg [15:0] f4_CH_C_d, f4_CH_C_q;
reg [15:0] f4_CH_D_d, f4_CH_D_q;

reg [15:0] f5_CH_A_d, f5_CH_A_q;
reg [15:0] f5_CH_B_d, f5_CH_B_q;
reg [15:0] f5_CH_C_d, f5_CH_C_q;
reg [15:0] f5_CH_D_d, f5_CH_D_q;

reg [15:0] f6_CH_A_d, f6_CH_A_q;
reg [15:0] f6_CH_B_d, f6_CH_B_q;
reg [15:0] f6_CH_C_d, f6_CH_C_q;
reg [15:0] f6_CH_D_d, f6_CH_D_q;

assign f1_data = f1_data_q;
assign f2_data = f2_data_q;
assign f3_data = f3_data_q;
assign f4_data = f4_data_q;
assign f5_data = f5_data_q;
assign f6_data = f6_data_q;
// assign rom_scan_is_done = done;
assign f1_addrs = f1_addr[15:2];
assign f2_addrs = f2_addr[15:2];
assign f3_addrs = f3_addr[15:2];
assign f4_addrs = f4_addr[15:2];
assign f5_addrs = f5_addr[15:2];
assign f6_addrs = f6_addr[15:2];

always @(*) begin


    f1_CH_A_d=f1_CH_A_q;
    f1_CH_B_d=f1_CH_B_q;
    f1_CH_C_d=f1_CH_C_q;
    f1_CH_D_d=f1_CH_D_q;

    f2_CH_A_d=f2_CH_A_q;
    f2_CH_B_d=f2_CH_B_q;
    f2_CH_C_d=f2_CH_C_q;
    f2_CH_D_d=f2_CH_D_q;
    
    f3_CH_A_d=f3_CH_A_q;
    f3_CH_B_d=f3_CH_B_q;
    f3_CH_C_d=f3_CH_C_q;
    f3_CH_D_d=f3_CH_D_q;
    
    f4_CH_A_d=f4_CH_A_q;
    f4_CH_B_d=f4_CH_B_q;
    f4_CH_C_d=f4_CH_C_q;
    f4_CH_D_d=f4_CH_D_q;
    
    f5_CH_A_d=f5_CH_A_q;
    f5_CH_B_d=f5_CH_B_q;
    f5_CH_C_d=f5_CH_C_q;
    f5_CH_D_d=f5_CH_D_q;
    
    f6_CH_A_d=f6_CH_A_q;
    f6_CH_B_d=f6_CH_B_q;
    f6_CH_C_d=f6_CH_C_q;
    f6_CH_D_d=f6_CH_D_q;


    if (go_home==1'b1) begin
       
        // F1
        case (f1_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                if (f1_CH_A_q>home_bias) begin
                    f1_CH_A_d=f1_CH_A_q-home_step;
                end else if (f1_CH_A_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f1_CH_A_d=f1_CH_A_q+home_step; 
                end 
            end
            2'b01: begin // this is a CHANNEL C
                if (f1_CH_C_q>home_bias) begin
                    f1_CH_C_d=f1_CH_C_q-home_step;
                end else if (f1_CH_C_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f1_CH_C_d=f1_CH_C_q+home_step;
                end 
            end
            2'b10: begin // this is a CHANNEL B
                if (f1_CH_B_q>home_bias) begin
                    f1_CH_B_d=f1_CH_B_q-home_step;
                end else if (f1_CH_B_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f1_CH_B_d=f1_CH_B_q+home_step; 
                end 
            end
            2'b11: begin // this is a CHANNEL D
                if (f1_CH_D_q>home_bias) begin
                    f1_CH_D_d=f1_CH_D_q-home_step;
                end else if (f1_CH_D_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f1_CH_D_d=f1_CH_D_q+home_step; 
                end 
            end
            default: begin
            end
        endcase


        // F2
        case (f2_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                if (f2_CH_A_q>home_bias) begin
                    f2_CH_A_d=f2_CH_A_q-home_step;
                end else if (f2_CH_A_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f2_CH_A_d=f2_CH_A_q+home_step; 
                end 
            end
            2'b01: begin // this is a CHANNEL C
                if (f2_CH_C_q>home_bias) begin
                    f2_CH_C_d=f2_CH_C_q-home_step;
                end else if (f2_CH_C_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f2_CH_C_d=f2_CH_C_q+home_step;
                end 
            end
            2'b10: begin // this is a CHANNEL B
                if (f2_CH_B_q>home_bias) begin
                    f2_CH_B_d=f2_CH_B_q-home_step;
                end else if (f2_CH_B_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f2_CH_B_d=f2_CH_B_q+home_step; 
                end 
            end
            2'b11: begin // this is a CHANNEL D
                if (f2_CH_D_q>home_bias) begin
                    f2_CH_D_d=f2_CH_D_q-home_step;
                end else if (f2_CH_D_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f2_CH_D_d=f2_CH_D_q+home_step; 
                end 
            end
            default: begin
            end
        endcase
        
        // F3
        case (f3_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                if (f3_CH_A_q>home_bias) begin
                    f3_CH_A_d=f3_CH_A_q-home_step;
                end else if (f3_CH_A_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f3_CH_A_d=f3_CH_A_q+home_step; 
                end 
            end
            2'b01: begin // this is a CHANNEL C
                if (f3_CH_C_q>home_bias) begin
                    f3_CH_C_d=f3_CH_C_q-home_step;
                end else if (f3_CH_C_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f3_CH_C_d=f3_CH_C_q+home_step;
                end 
            end
            2'b10: begin // this is a CHANNEL B
                if (f3_CH_B_q>home_bias) begin
                    f3_CH_B_d=f3_CH_B_q-home_step;
                end else if (f3_CH_B_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f3_CH_B_d=f3_CH_B_q+home_step; 
                end 
            end
            2'b11: begin // this is a CHANNEL D
                if (f3_CH_D_q>home_bias) begin
                    f3_CH_D_d=f3_CH_D_q-home_step;
                end else if (f3_CH_D_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f3_CH_D_d=f3_CH_D_q+home_step; 
                end 
            end
            default: begin
            end
        endcase

        // F4
        case (f4_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                if (f4_CH_A_q>home_bias) begin
                    f4_CH_A_d=f4_CH_A_q-home_step;
                end else if (f4_CH_A_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f4_CH_A_d=f4_CH_A_q+home_step; 
                end 
            end
            2'b01: begin // this is a CHANNEL C
                if (f4_CH_C_q>home_bias) begin
                    f4_CH_C_d=f4_CH_C_q-home_step;
                end else if (f4_CH_C_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f4_CH_C_d=f4_CH_C_q+home_step;
                end 
            end
            2'b10: begin // this is a CHANNEL B
                if (f4_CH_B_q>home_bias) begin
                    f4_CH_B_d=f4_CH_B_q-home_step;
                end else if (f4_CH_B_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f4_CH_B_d=f4_CH_B_q+home_step; 
                end 
            end
            2'b11: begin // this is a CHANNEL D
                if (f4_CH_D_q>home_bias) begin
                    f4_CH_D_d=f4_CH_D_q-home_step;
                end else if (f4_CH_D_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f4_CH_D_d=f4_CH_D_q+home_step; 
                end 
            end
            default: begin
            end
        endcase

        // F5
        case (f5_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                if (f5_CH_A_q>home_bias) begin
                    f5_CH_A_d=f5_CH_A_q-home_step;
                end else if (f5_CH_A_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f5_CH_A_d=f5_CH_A_q+home_step; 
                end 
            end
            2'b01: begin // this is a CHANNEL C
                if (f5_CH_C_q>home_bias) begin
                    f5_CH_C_d=f5_CH_C_q-home_step;
                end else if (f5_CH_C_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f5_CH_C_d=f5_CH_C_q+home_step;
                end 
            end
            2'b10: begin // this is a CHANNEL B
                if (f5_CH_B_q>home_bias) begin
                    f5_CH_B_d=f5_CH_B_q-home_step;
                end else if (f5_CH_B_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f5_CH_B_d=f5_CH_B_q+home_step; 
                end 
            end
            2'b11: begin // this is a CHANNEL D
                if (f5_CH_D_q>home_bias) begin
                    f5_CH_D_d=f5_CH_D_q-home_step;
                end else if (f5_CH_D_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f5_CH_D_d=f5_CH_D_q+home_step; 
                end 
            end
            default: begin
            end
        endcase

        // F6
        case (f6_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                if (f6_CH_A_q>home_bias) begin
                    f6_CH_A_d=f6_CH_A_q-home_step;
                end else if (f6_CH_A_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f6_CH_A_d=f6_CH_A_q+home_step; 
                end 
            end
            2'b01: begin // this is a CHANNEL C
                if (f6_CH_C_q>home_bias) begin
                    f6_CH_C_d=f6_CH_C_q-home_step;
                end else if (f6_CH_C_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f6_CH_C_d=f6_CH_C_q+home_step;
                end 
            end
            2'b10: begin // this is a CHANNEL B
                if (f6_CH_B_q>home_bias) begin
                    f6_CH_B_d=f6_CH_B_q-home_step;
                end else if (f6_CH_B_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f6_CH_B_d=f6_CH_B_q+home_step; 
                end 
            end
            2'b11: begin // this is a CHANNEL D
                if (f6_CH_D_q>home_bias) begin
                    f6_CH_D_d=f6_CH_D_q-home_step;
                end else if (f6_CH_D_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
                    f6_CH_D_d=f6_CH_D_q+home_step; 
                end 
            end
            default: begin
            end
        endcase

    end else begin // if go home==0
        

        // F1
        case (f1_addr[2:1])
            2'b00: begin
                f1_CH_A_d= rom_data[f1_addrs];
            end
            2'b01: begin
                f1_CH_C_d= f1_antidata;
            end
            2'b10: begin
                f1_CH_B_d= rom_data[f1_addrs];
            end
            2'b11: begin
                f1_CH_D_d= f1_antidata;
            end
        default: begin
            end
        endcase


        // F2
        case (f2_addr[2:1])
            2'b00: begin
                f2_CH_A_d= rom_data[f2_addrs];
            end
            2'b01: begin
                f2_CH_C_d= f2_antidata;
            end
            2'b10: begin
                f2_CH_B_d= rom_data[f2_addrs];
            end
            2'b11: begin
                f2_CH_D_d= f2_antidata;
            end
        default: begin
            end
        endcase

        // F3
        case (f3_addr[2:1])
            2'b00: begin
                f3_CH_A_d= rom_data[f3_addrs];
            end
            2'b01: begin
                f3_CH_C_d= f3_antidata;
            end
            2'b10: begin
                f3_CH_B_d= rom_data[f3_addrs];
            end
            2'b11: begin
                f3_CH_D_d= f3_antidata;
            end
        default: begin
            end
        endcase

        // F4
        case (f4_addr[2:1])
            2'b00: begin
                f4_CH_A_d= rom_data[f4_addrs];
            end
            2'b01: begin
                f4_CH_C_d= f4_antidata;
            end
            2'b10: begin
                f4_CH_B_d= rom_data[f4_addrs];
            end
            2'b11: begin
                f4_CH_D_d= f4_antidata;
            end
        default: begin
            end
        endcase

        // F5
        case (f5_addr[2:1])
            2'b00: begin
                f5_CH_A_d= rom_data[f5_addrs];
            end
            2'b01: begin
                f5_CH_C_d= f5_antidata;
            end
            2'b10: begin
                f5_CH_B_d= rom_data[f5_addrs];
            end
            2'b11: begin
                f5_CH_D_d= f5_antidata;
            end
        default: begin
            end
        endcase

        // F6
        case (f6_addr[2:1])
            2'b00: begin
                f6_CH_A_d= rom_data[f6_addrs];
            end
            2'b01: begin
                f6_CH_C_d= f6_antidata;
            end
            2'b10: begin
                f6_CH_B_d= rom_data[f6_addrs];
            end
            2'b11: begin
                f6_CH_D_d= f6_antidata;
            end
        default: begin
            end
        endcase


    end // if go home 



end // always





always @(*) begin

  f1_antidata = 16'hB900 - rom_data[f1_addrs];
  f2_antidata = 16'hB900 - rom_data[f2_addrs];
  f3_antidata = 16'hB900 - rom_data[f3_addrs];
  f4_antidata = 16'hB900 - rom_data[f4_addrs];
  f5_antidata = 16'hB900 - rom_data[f5_addrs];
  f6_antidata = 16'hB900 - rom_data[f6_addrs];
       
       
       

   rom_data[ 2]=16'b0011000011110110;
    rom_data[ 3]=16'b0101110111000000;
    rom_data[ 4]=16'b0011000100011001;
    rom_data[ 5]=16'b0101111011001110;
    rom_data[ 6]=16'b0011000100111110;
    rom_data[ 7]=16'b0101111111011100;
    rom_data[ 8]=16'b0011000101100100;
    rom_data[ 9]=16'b0110000011101010;
    rom_data[10]=16'b0011000110001100;
    rom_data[11]=16'b0110000111111000;
    rom_data[12]=16'b0011000110110101;
    rom_data[13]=16'b0110001100000101;
    rom_data[14]=16'b0011000111011111;
    rom_data[15]=16'b0110010000010010;
    rom_data[16]=16'b0011001000001011;
    rom_data[17]=16'b0110010100011110;
    rom_data[18]=16'b0011001000110111;
    rom_data[19]=16'b0110011000101010;
    rom_data[20]=16'b0011001001100101;
    rom_data[21]=16'b0110011100110101;
    rom_data[22]=16'b0011001010010011;
    rom_data[23]=16'b0110100001000000;
    rom_data[24]=16'b0011001011000010;
    rom_data[25]=16'b0110100101001010;
    rom_data[26]=16'b0011001011110011;
    rom_data[27]=16'b0110101001010011;
    rom_data[28]=16'b0011001100100100;
    rom_data[29]=16'b0110101101011011;
    rom_data[30]=16'b0011001101010110;
    rom_data[31]=16'b0110110001100010;
    rom_data[32]=16'b0011001110001000;
    rom_data[33]=16'b0110110101101001;
    rom_data[34]=16'b0011001110111100;
    rom_data[35]=16'b0110111001101101;
    rom_data[36]=16'b0011001111110000;
    rom_data[37]=16'b0110111101110001;
    rom_data[38]=16'b0011010000100101;
    rom_data[39]=16'b0111000001110011;
    rom_data[40]=16'b0011010001011011;
    rom_data[41]=16'b0111000101110100;
    rom_data[42]=16'b0011010010010001;
    rom_data[43]=16'b0111001001110100;
    rom_data[44]=16'b0011010011001000;
    rom_data[45]=16'b0111001101110001;
    rom_data[46]=16'b0011010100000000;
    rom_data[47]=16'b0111010001101101;
    rom_data[48]=16'b0011010100111001;
    rom_data[49]=16'b0111010101100111;
    rom_data[50]=16'b0011010101110010;
    rom_data[51]=16'b0111011001011111;
    rom_data[52]=16'b0011010110101100;
    rom_data[53]=16'b0111011101010100;
    rom_data[54]=16'b0011010111100111;
    rom_data[55]=16'b0111100001001000;
    rom_data[56]=16'b0011011000100011;
    rom_data[57]=16'b0111100100111001;
    rom_data[58]=16'b0011011001011111;
    rom_data[59]=16'b0111101000100111;
    rom_data[60]=16'b0011011010011100;
    rom_data[61]=16'b0111101100010011;
    rom_data[62]=16'b0011011011011001;
    rom_data[63]=16'b0111101111111011;
    rom_data[64]=16'b0011011100011000;
    rom_data[65]=16'b0111110011100001;
    rom_data[66]=16'b0011011101010111;
    rom_data[67]=16'b0111110111000011;
    rom_data[68]=16'b0011011110010111;
    rom_data[69]=16'b0111111010100001;
    rom_data[70]=16'b0011011111010111;
    rom_data[71]=16'b0111111101111100;
    rom_data[72]=16'b0011100000011001;
    rom_data[73]=16'b1000000001010011;
    rom_data[74]=16'b0011100001011011;
    rom_data[75]=16'b1000000100100110;
    rom_data[76]=16'b0011100010011110;
    rom_data[77]=16'b1000000111110100;
    rom_data[78]=16'b0011100011100010;
    rom_data[79]=16'b1000001010111110;
    rom_data[80]=16'b0011100100100111;
    rom_data[81]=16'b1000001110000010;
    rom_data[82]=16'b0011100101101101;
    rom_data[83]=16'b1000010001000001;
    rom_data[84]=16'b0011100110110011;
    rom_data[85]=16'b1000010011111011;
    rom_data[86]=16'b0011100111111010;
    rom_data[87]=16'b1000010110101110;
    rom_data[88]=16'b0011101001000010;
    rom_data[89]=16'b1000011001011011;
    rom_data[90]=16'b0011101010001011;
    rom_data[91]=16'b1000011100000010;
    rom_data[92]=16'b0011101011010101;
    rom_data[93]=16'b1000011110100001;
    rom_data[94]=16'b0011101100011111;
    rom_data[95]=16'b1000100000111001;
    rom_data[96]=16'b0011101101101011;
    rom_data[97]=16'b1000100011001001;
    rom_data[98]=16'b0011101110110111;
    rom_data[99]=16'b1000100101010001;
    rom_data[100]=16'b0011110000000100;
    rom_data[101]=16'b1000100111010000;
    rom_data[102]=16'b0011110001010001;
    rom_data[103]=16'b1000101001000111;
    rom_data[104]=16'b0011110010011111;
    rom_data[105]=16'b1000101010110011;
    rom_data[106]=16'b0011110011101110;
    rom_data[107]=16'b1000101100010110;
    rom_data[108]=16'b0011110100111110;
    rom_data[109]=16'b1000101101101111;
    rom_data[110]=16'b0011110110001110;
    rom_data[111]=16'b1000101110111101;
    rom_data[112]=16'b0011110111011110;
    rom_data[113]=16'b1000101111111111;
    rom_data[114]=16'b0011111000101111;
    rom_data[115]=16'b1000110000110111;
    rom_data[116]=16'b0011111010000000;
    rom_data[117]=16'b1000110001100011;
    rom_data[118]=16'b0011111010110101;
    rom_data[119]=16'b1000110010000011;
    rom_data[120]=16'b0011111100000111;
    rom_data[121]=16'b1000110010011000;
    rom_data[122]=16'b0011111101011010;
    rom_data[123]=16'b1000110010100000;
    rom_data[124]=16'b0011111110101100;
    rom_data[125]=16'b1000110010011100;
    rom_data[126]=16'b0011111111111110;
    rom_data[127]=16'b1000110010001100;
    rom_data[128]=16'b0100000001010000;
    rom_data[129]=16'b1000110001110000;
    rom_data[130]=16'b0100000010100001;
    rom_data[131]=16'b1000110001000111;
    rom_data[132]=16'b0100000011110010;
    rom_data[133]=16'b1000110000010011;
    rom_data[134]=16'b0100000101000011;
    rom_data[135]=16'b1000101111010100;
    rom_data[136]=16'b0100000110010011;
    rom_data[137]=16'b1000101110001001;
    rom_data[138]=16'b0100000111100010;
    rom_data[139]=16'b1000101100110011;
    rom_data[140]=16'b0100001000110001;
    rom_data[141]=16'b1000101011010011;
    rom_data[142]=16'b0100001010000000;
    rom_data[143]=16'b1000101001101000;
    rom_data[144]=16'b0100001011001101;
    rom_data[145]=16'b1000100111110100;
    rom_data[146]=16'b0100001100011010;
    rom_data[147]=16'b1000100101110110;
    rom_data[148]=16'b0100001101100110;
    rom_data[149]=16'b1000100011110000;
    rom_data[150]=16'b0100001110110001;
    rom_data[151]=16'b1000100001100000;
    rom_data[152]=16'b0100001111111100;
    rom_data[153]=16'b1000011111001001;
    rom_data[154]=16'b0100010001000110;
    rom_data[155]=16'b1000011100101010;
    rom_data[156]=16'b0100010010001111;
    rom_data[157]=16'b1000011010000011;
    rom_data[158]=16'b0100010011011000;
    rom_data[159]=16'b1000010111010110;
    rom_data[160]=16'b0100010100011111;
    rom_data[161]=16'b1000010100100010;
    rom_data[162]=16'b0100010101100110;
    rom_data[163]=16'b1000010001101000;
    rom_data[164]=16'b0100010110101101;
    rom_data[165]=16'b1000001110101000;
    rom_data[166]=16'b0100010111110010;
    rom_data[167]=16'b1000001011100011;
    rom_data[168]=16'b0100011000110111;
    rom_data[169]=16'b1000001000011000;
    rom_data[170]=16'b0100011001111100;
    rom_data[171]=16'b1000000101001001;
    rom_data[172]=16'b0100011011000000;
    rom_data[173]=16'b1000000001110101;
    rom_data[174]=16'b0100011100000011;
    rom_data[175]=16'b0111111110011101;
    rom_data[176]=16'b0100011101000101;
    rom_data[177]=16'b0111111011000001;
    rom_data[178]=16'b0100011110001000;
    rom_data[179]=16'b0111110111100001;
    rom_data[180]=16'b0100011111001001;
    rom_data[181]=16'b0111110011111101;
    rom_data[182]=16'b0100100000001010;
    rom_data[183]=16'b0111110000010110;
    rom_data[184]=16'b0100100001001011;
    rom_data[185]=16'b0111101100101100;
    rom_data[186]=16'b0100100010001011;
    rom_data[187]=16'b0111101000111111;
    rom_data[188]=16'b0100100011001010;
    rom_data[189]=16'b0111100101001111;
    rom_data[190]=16'b0100100100001010;
    rom_data[191]=16'b0111100001011101;
    rom_data[192]=16'b0100100101001000;
    rom_data[193]=16'b0111011101101000;
    rom_data[194]=16'b0100100110000111;
    rom_data[195]=16'b0111011001110001;
    rom_data[196]=16'b0100100111000101;
    rom_data[197]=16'b0111010101111000;
    rom_data[198]=16'b0100101000000011;
    rom_data[199]=16'b0111010001111101;
    rom_data[200]=16'b0100101001000000;
    rom_data[201]=16'b0111001101111111;
    rom_data[202]=16'b0100101001111101;
    rom_data[203]=16'b0111001010000001;
    rom_data[204]=16'b0100101010111010;
    rom_data[205]=16'b0111000110000000;
    rom_data[206]=16'b0100101011110110;
    rom_data[207]=16'b0111000001111110;
    rom_data[208]=16'b0100101100110011;
    rom_data[209]=16'b0110111101111011;
    rom_data[210]=16'b0100101101101110;
    rom_data[211]=16'b0110111001110110;
    rom_data[212]=16'b0100101110101010;
    rom_data[213]=16'b0110110101110000;
    rom_data[214]=16'b0100101111100110;
    rom_data[215]=16'b0110110001101001;
    rom_data[216]=16'b0100110000100001;
    rom_data[217]=16'b0110101101100001;
    rom_data[218]=16'b0100110001011100;
    rom_data[219]=16'b0110101001011000;
    rom_data[220]=16'b0100110010010111;
    rom_data[221]=16'b0110100101001110;
    rom_data[222]=16'b0100110011010010;
    rom_data[223]=16'b0110100001000011;
    rom_data[224]=16'b0100110100001101;
    rom_data[225]=16'b0110011100111000;
    rom_data[226]=16'b0100110101001000;
    rom_data[227]=16'b0110011000101100;
    rom_data[228]=16'b0100110110000010;
    rom_data[229]=16'b0110010100100000;
    rom_data[230]=16'b0100110110111101;
    rom_data[231]=16'b0110010000010011;
    rom_data[232]=16'b0100110111110111;
    rom_data[233]=16'b0110001100000110;
    rom_data[234]=16'b0100111000110001;
    rom_data[235]=16'b0110000111111000;
    rom_data[236]=16'b0100111001101100;
    rom_data[237]=16'b0110000011101010;
    rom_data[238]=16'b0100111010100110;
    rom_data[239]=16'b0101111111011100;
    rom_data[240]=16'b0100111011100000;
    rom_data[241]=16'b0101111011001110;
    rom_data[242]=16'b0100111100011011;
    rom_data[243]=16'b0101110111000000;
    rom_data[244]=16'b0100111101010101;
    rom_data[245]=16'b0101110010110010;
    rom_data[246]=16'b0100111110001111;
    rom_data[247]=16'b0101101110100100;
    rom_data[248]=16'b0100111111001010;
    rom_data[249]=16'b0101101010010110;
    rom_data[250]=16'b0101000000000100;
    rom_data[251]=16'b0101100110001000;
    rom_data[252]=16'b0101000000111111;
    rom_data[253]=16'b0101100001111011;
    rom_data[254]=16'b0101000001111001;
    rom_data[255]=16'b0101011101101110;
    rom_data[256]=16'b0101000010110100;
    rom_data[257]=16'b0101011001100010;
    rom_data[258]=16'b0101000011101111;
    rom_data[259]=16'b0101010101010110;
    rom_data[260]=16'b0101000100101010;
    rom_data[261]=16'b0101010001001010;
    rom_data[262]=16'b0101000101100101;
    rom_data[263]=16'b0101001101000000;
    rom_data[264]=16'b0101000110100001;
    rom_data[265]=16'b0101001000110110;
    rom_data[266]=16'b0101000111011100;
    rom_data[267]=16'b0101000100101101;
    rom_data[268]=16'b0101001000011000;
    rom_data[269]=16'b0101000000100101;
    rom_data[270]=16'b0101001001010100;
    rom_data[271]=16'b0100111100011101;
    rom_data[272]=16'b0101001010010000;
    rom_data[273]=16'b0100111000010111;
    rom_data[274]=16'b0101001011001101;
    rom_data[275]=16'b0100110100010010;
    rom_data[276]=16'b0101001100001001;
    rom_data[277]=16'b0100110000001111;
    rom_data[278]=16'b0101001101000110;
    rom_data[279]=16'b0100101100001100;
    rom_data[280]=16'b0101001110000100;
    rom_data[281]=16'b0100101000001100;
    rom_data[282]=16'b0101001111000001;
    rom_data[283]=16'b0100100100001100;
    rom_data[284]=16'b0101001111111111;
    rom_data[285]=16'b0100100000001111;
    rom_data[286]=16'b0101010000111110;
    rom_data[287]=16'b0100011100010011;
    rom_data[288]=16'b0101010001111101;
    rom_data[289]=16'b0100011000011001;
    rom_data[290]=16'b0101010010111100;
    rom_data[291]=16'b0100010100100001;
    rom_data[292]=16'b0101010011111011;
    rom_data[293]=16'b0100010000101011;
    rom_data[294]=16'b0101010100111011;
    rom_data[295]=16'b0100001100111000;
    rom_data[296]=16'b0101010101111100;
    rom_data[297]=16'b0100001001000111;
    rom_data[298]=16'b0101010110111101;
    rom_data[299]=16'b0100000101011001;
    rom_data[300]=16'b0101010111111110;
    rom_data[301]=16'b0100000001101101;
    rom_data[302]=16'b0101011001000000;
    rom_data[303]=16'b0011111110000101;
    rom_data[304]=16'b0101011010000011;
    rom_data[305]=16'b0011111010011111;
    rom_data[306]=16'b0101011011000110;
    rom_data[307]=16'b0011110110111101;
    rom_data[308]=16'b0101011100001010;
    rom_data[309]=16'b0011110011011110;
    rom_data[310]=16'b0101011101001110;
    rom_data[311]=16'b0011110000000100;
    rom_data[312]=16'b0101011110010011;
    rom_data[313]=16'b0011101100101101;
    rom_data[314]=16'b0101011111011001;
    rom_data[315]=16'b0011101001011010;
    rom_data[316]=16'b0101100000011111;
    rom_data[317]=16'b0011100110001100;
    rom_data[318]=16'b0101100001100110;
    rom_data[319]=16'b0011100011000010;
    rom_data[320]=16'b0101100010101101;
    rom_data[321]=16'b0011011111111110;
    rom_data[322]=16'b0101100011110110;
    rom_data[323]=16'b0011011100111111;
    rom_data[324]=16'b0101100100111111;
    rom_data[325]=16'b0011011010000101;
    rom_data[326]=16'b0101100110001000;
    rom_data[327]=16'b0011010111010010;
    rom_data[328]=16'b0101100111010011;
    rom_data[329]=16'b0011010100100101;
    rom_data[330]=16'b0101101000011110;
    rom_data[331]=16'b0011010001111110;
    rom_data[332]=16'b0101101001101010;
    rom_data[333]=16'b0011001111011111;
    rom_data[334]=16'b0101101010110111;
    rom_data[335]=16'b0011001101000111;
    rom_data[336]=16'b0101101100000100;
    rom_data[337]=16'b0011001010110111;
    rom_data[338]=16'b0101101101010010;
    rom_data[339]=16'b0011001000101111;
    rom_data[340]=16'b0101101110100001;
    rom_data[341]=16'b0011000110101111;
    rom_data[342]=16'b0101101111110000;
    rom_data[343]=16'b0011000100111001;
    rom_data[344]=16'b0101110001000000;
    rom_data[345]=16'b0011000011001101;
    rom_data[346]=16'b0101110010010000;
    rom_data[347]=16'b0011000001101010;
    rom_data[348]=16'b0101110011100001;
    rom_data[349]=16'b0011000000010001;
    rom_data[350]=16'b0101110100110011;
    rom_data[351]=16'b0010111111000011;
    rom_data[352]=16'b0101110110000100;
    rom_data[353]=16'b0010111110000000;
    rom_data[354]=16'b0101110111010110;
    rom_data[355]=16'b0010111101001001;
    rom_data[356]=16'b0101111000101000;
    rom_data[357]=16'b0010111100011101;
    rom_data[358]=16'b0101111001111011;
    rom_data[359]=16'b0010111011111101;
    rom_data[360]=16'b0101111011001101;
    rom_data[361]=16'b0010111011101000;
    rom_data[362]=16'b0101111100100000;
    rom_data[363]=16'b0010111011100000;
    rom_data[364]=16'b0101111101110010;
    rom_data[365]=16'b0010111011100100;
    rom_data[366]=16'b0101111111000100;
    rom_data[367]=16'b0010111011110100;
    rom_data[368]=16'b0110000000010110;
    rom_data[369]=16'b0010111100010001;
    rom_data[370]=16'b0110000001100111;
    rom_data[371]=16'b0010111100111001;
    rom_data[372]=16'b0110000010111000;
    rom_data[373]=16'b0010111101101101;
    rom_data[374]=16'b0110000100001001;
    rom_data[375]=16'b0010111110101100;
    rom_data[376]=16'b0110000101011001;
    rom_data[377]=16'b0010111111110111;
    rom_data[378]=16'b0110000110101001;
    rom_data[379]=16'b0011000001001101;
    rom_data[380]=16'b0110000111110111;
    rom_data[381]=16'b0011000010101101;
    rom_data[382]=16'b0110001001000110;
    rom_data[383]=16'b0011000100011000;
    rom_data[384]=16'b0110001010010011;
    rom_data[385]=16'b0011000110001100;
    rom_data[386]=16'b0110001011100000;
    rom_data[387]=16'b0011001000001010;
    rom_data[388]=16'b0110001100101100;
    rom_data[389]=16'b0011001010010000;
    rom_data[390]=16'b0110001101110111;
    rom_data[391]=16'b0011001100100000;
    rom_data[392]=16'b0110001111000010;
    rom_data[393]=16'b0011001110110111;
    rom_data[394]=16'b0110010000001100;
    rom_data[395]=16'b0011010001010110;
    rom_data[396]=16'b0110010001010101;
    rom_data[397]=16'b0011010011111101;
    rom_data[398]=16'b0110010010011110;
    rom_data[399]=16'b0011010110101010;
    rom_data[400]=16'b0110010011100101;
    rom_data[401]=16'b0011011001011110;
    rom_data[402]=16'b0110010100101100;
    rom_data[403]=16'b0011011100011000;
    rom_data[404]=16'b0110010101110011;
    rom_data[405]=16'b0011011111011000;
    rom_data[406]=16'b0110010110111000;
    rom_data[407]=16'b0011100010011101;
    rom_data[408]=16'b0110010111111110;
    rom_data[409]=16'b0011100101101000;
    rom_data[410]=16'b0110011001000010;
    rom_data[411]=16'b0011101000110111;
    rom_data[412]=16'b0110011010000110;
    rom_data[413]=16'b0011101100001011;
    rom_data[414]=16'b0110011011001001;
    rom_data[415]=16'b0011101111100011;
    rom_data[416]=16'b0110011100001100;
    rom_data[417]=16'b0011110010111111;
    rom_data[418]=16'b0110011101001110;
    rom_data[419]=16'b0011110110011111;
    rom_data[420]=16'b0110011110001111;
    rom_data[421]=16'b0011111010000011;
    rom_data[422]=16'b0110011111010000;
    rom_data[423]=16'b0011111101101010;
    rom_data[424]=16'b0110100000010001;
    rom_data[425]=16'b0100000001010100;
    rom_data[426]=16'b0110100001010001;
    rom_data[427]=16'b0100000101000001;
    rom_data[428]=16'b0110100010010000;
    rom_data[429]=16'b0100001000110001;
    rom_data[430]=16'b0110100011010000;
    rom_data[431]=16'b0100001100100011;
    rom_data[432]=16'b0110100100001111;
    rom_data[433]=16'b0100010000011000;
    rom_data[434]=16'b0110100101001101;
    rom_data[435]=16'b0100010100001111;
    rom_data[436]=16'b0110100110001011;
    rom_data[437]=16'b0100011000001000;
    rom_data[438]=16'b0110100111001001;
    rom_data[439]=16'b0100011100000100;
    rom_data[440]=16'b0110101000000110;
    rom_data[441]=16'b0100100000000001;
    rom_data[442]=16'b0110101001000011;
    rom_data[443]=16'b0100100100000000;
    rom_data[444]=16'b0110101010000000;
    rom_data[445]=16'b0100101000000000;
    rom_data[446]=16'b0110101010111100;
    rom_data[447]=16'b0100101100000010;
    rom_data[448]=16'b0110101011111001;
    rom_data[449]=16'b0100110000000110;
    rom_data[450]=16'b0110101100110101;
    rom_data[451]=16'b0100110100001010;
    rom_data[452]=16'b0110101101110000;
    rom_data[453]=16'b0100111000010000;
    rom_data[454]=16'b0110101110101100;
    rom_data[455]=16'b0100111100010111;
    rom_data[456]=16'b0110101111100111;
    rom_data[457]=16'b0101000000011111;
    rom_data[458]=16'b0110110000100010;
    rom_data[459]=16'b0101000100101000;
    rom_data[460]=16'b0110110001011101;
    rom_data[461]=16'b0101001000110010;
    rom_data[462]=16'b0110110010011000;
    rom_data[463]=16'b0101001100111101;
    rom_data[464]=16'b0110110011010011;
    rom_data[465]=16'b0101010001001000;
    rom_data[466]=16'b0110110100001110;
    rom_data[467]=16'b0101010101010100;
    rom_data[468]=16'b0110110101001000;
    rom_data[469]=16'b0101011001100000;
    rom_data[470]=16'b0110110110000011;
    rom_data[471]=16'b0101011101101101;
    rom_data[472]=16'b0110110110111101;
    rom_data[473]=16'b0101100001111011;
    rom_data[474]=16'b0110110111111000;
    rom_data[475]=16'b0101100110001000;
    rom_data[476]=16'b0110111000110010;
    rom_data[477]=16'b0101101010010110;
    rom_data[478]=16'b0110111001101100;
    rom_data[479]=16'b0101101110100100;
    rom_data[480]=16'b0110111010100110;
    rom_data[481]=16'b0101110010110010;
    rom_data[482]=16'b0110111011100001;
    rom_data[483]=16'b0101110111000000;
    rom_data[484]=16'b0110111100011011;
    rom_data[485]=16'b0101111011001110;
    rom_data[486]=16'b0110111101010101;
    rom_data[487]=16'b0101111111011100;
    rom_data[488]=16'b0110111110010000;
    rom_data[489]=16'b0110000011101010;
    rom_data[490]=16'b0110111111001010;
    rom_data[491]=16'b0110000111111000;
    rom_data[492]=16'b0111000000000101;
    rom_data[493]=16'b0110001100000101;
    rom_data[494]=16'b0111000000111111;
    rom_data[495]=16'b0110010000010010;
    rom_data[496]=16'b0111000001111010;
    rom_data[497]=16'b0110010100011110;
    rom_data[498]=16'b0111000010110101;
    rom_data[499]=16'b0110011000101010;
    rom_data[500]=16'b0111000011110000;
    rom_data[501]=16'b0110011100110110;
    rom_data[502]=16'b0111000100101011;
    rom_data[503]=16'b0110100001000000;
    rom_data[504]=16'b0111000101100111;
    rom_data[505]=16'b0110100101001010;
    rom_data[506]=16'b0111000110100010;
    rom_data[507]=16'b0110101001010011;
    rom_data[508]=16'b0111000111011110;
    rom_data[509]=16'b0110101101011100;
    rom_data[510]=16'b0111001000011010;
    rom_data[511]=16'b0110110001100011;
    rom_data[512]=16'b0111001001010110;
    rom_data[513]=16'b0110110101101001;
    rom_data[514]=16'b0111001010010011;
    rom_data[515]=16'b0110111001101110;
    rom_data[516]=16'b0111001011001111;
    rom_data[517]=16'b0110111101110001;
    rom_data[518]=16'b0111001100001100;
    rom_data[519]=16'b0111000001110100;
    rom_data[520]=16'b0111001101001010;
    rom_data[521]=16'b0111000101110101;
    rom_data[522]=16'b0111001110000111;
    rom_data[523]=16'b0111001001110100;
    rom_data[524]=16'b0111001111000101;
    rom_data[525]=16'b0111001101110001;
    rom_data[526]=16'b0111010000000100;
    rom_data[527]=16'b0111010001101101;
    rom_data[528]=16'b0111010001000011;
    rom_data[529]=16'b0111010101100111;
    rom_data[530]=16'b0111010010000010;
    rom_data[531]=16'b0111011001011111;
    rom_data[532]=16'b0111010011000001;
    rom_data[533]=16'b0111011101010101;
    rom_data[534]=16'b0111010100000001;
    rom_data[535]=16'b0111100001001000;
    rom_data[536]=16'b0111010101000010;
    rom_data[537]=16'b0111100100111001;
    rom_data[538]=16'b0111010110000011;
    rom_data[539]=16'b0111101000100111;
    rom_data[540]=16'b0111010111000100;
    rom_data[541]=16'b0111101100010011;
    rom_data[542]=16'b0111011000000110;
    rom_data[543]=16'b0111101111111011;
    rom_data[544]=16'b0111011001001001;
    rom_data[545]=16'b0111110011100001;
    rom_data[546]=16'b0111011010001100;
    rom_data[547]=16'b0111110111000011;
    rom_data[548]=16'b0111011011010000;
    rom_data[549]=16'b0111111010100010;
    rom_data[550]=16'b0111011100010100;
    rom_data[551]=16'b0111111101111101;
    rom_data[552]=16'b0111011101011001;
    rom_data[553]=16'b1000000001010011;
    rom_data[554]=16'b0111011110011111;
    rom_data[555]=16'b1000000100100110;
    rom_data[556]=16'b0111011111100101;
    rom_data[557]=16'b1000000111110100;
    rom_data[558]=16'b0111100000101100;
    rom_data[559]=16'b1000001010111110;
    rom_data[560]=16'b0111100001110011;
    rom_data[561]=16'b1000001110000010;
    rom_data[562]=16'b0111100010111100;
    rom_data[563]=16'b1000010001000001;
    rom_data[564]=16'b0111100100000101;
    rom_data[565]=16'b1000010011111011;
    rom_data[566]=16'b0111100101001110;
    rom_data[567]=16'b1000010110101110;
    rom_data[568]=16'b0111100110011001;
    rom_data[569]=16'b1000011001011011;
    rom_data[570]=16'b0111100111100100;
    rom_data[571]=16'b1000011100000010;
    rom_data[572]=16'b0111101000110000;
    rom_data[573]=16'b1000011110100001;
    rom_data[574]=16'b0111101001111101;
    rom_data[575]=16'b1000100000111001;
    rom_data[576]=16'b0111101011001010;
    rom_data[577]=16'b1000100011001001;
    rom_data[578]=16'b0111101100011000;
    rom_data[579]=16'b1000100101010001;
    rom_data[580]=16'b0111101101100111;
    rom_data[581]=16'b1000100111010001;
    rom_data[582]=16'b0111101110110110;
    rom_data[583]=16'b1000101001000111;
    rom_data[584]=16'b0111110000000110;
    rom_data[585]=16'b1000101010110011;
    rom_data[586]=16'b0111110001010110;
    rom_data[587]=16'b1000101100010110;
    rom_data[588]=16'b0111110010100111;
    rom_data[589]=16'b1000101101101111;
    rom_data[590]=16'b0111110011111001;
    rom_data[591]=16'b1000101110111101;
    rom_data[592]=16'b0111110101001010;
    rom_data[593]=16'b1000110000000000;
    rom_data[594]=16'b0111110110011100;
    rom_data[595]=16'b1000110000110111;
    rom_data[596]=16'b0111110111101001;
    rom_data[597]=16'b1000110001100011;
    rom_data[598]=16'b0111111000111011;
    rom_data[599]=16'b1000110010000011;
    rom_data[600]=16'b0111111010001110;
    rom_data[601]=16'b1000110010011000;
    rom_data[602]=16'b0111111011100000;
    rom_data[603]=16'b1000110010100000;
    rom_data[604]=16'b0111111100110010;
    rom_data[605]=16'b1000110010011100;
    rom_data[606]=16'b0111111110000011;
    rom_data[607]=16'b1000110010001100;
    rom_data[608]=16'b0111111111010101;
    rom_data[609]=16'b1000110001101111;
    rom_data[610]=16'b1000000000100110;
    rom_data[611]=16'b1000110001000111;
    rom_data[612]=16'b1000000001110111;
    rom_data[613]=16'b1000110000010011;
    rom_data[614]=16'b1000000011000111;
    rom_data[615]=16'b1000101111010100;
    rom_data[616]=16'b1000000100010110;
    rom_data[617]=16'b1000101110001001;
    rom_data[618]=16'b1000000101100101;
    rom_data[619]=16'b1000101100110011;
    rom_data[620]=16'b1000000110110011;
    rom_data[621]=16'b1000101011010011;
    rom_data[622]=16'b1000001000000001;
    rom_data[623]=16'b1000101001101000;
    rom_data[624]=16'b1000001001001110;
    rom_data[625]=16'b1000100111110100;
    rom_data[626]=16'b1000001010011010;
    rom_data[627]=16'b1000100101110110;
    rom_data[628]=16'b1000001011100101;
    rom_data[629]=16'b1000100011101111;
    rom_data[630]=16'b1000001100110000;
    rom_data[631]=16'b1000100001100000;
    rom_data[632]=16'b1000001101111010;
    rom_data[633]=16'b1000011111001001;
    rom_data[634]=16'b1000001111000011;
    rom_data[635]=16'b1000011100101010;
    rom_data[636]=16'b1000010000001011;
    rom_data[637]=16'b1000011010000011;
    rom_data[638]=16'b1000010001010010;
    rom_data[639]=16'b1000010111010110;
    rom_data[640]=16'b1000010010011001;
    rom_data[641]=16'b1000010100100010;
    rom_data[642]=16'b1000010011011111;
    rom_data[643]=16'b1000010001101000;
    rom_data[644]=16'b1000010100100100;
    rom_data[645]=16'b1000001110101000;
    rom_data[646]=16'b1000010101101000;
    rom_data[647]=16'b1000001011100011;
    rom_data[648]=16'b1000010110101100;
    rom_data[649]=16'b1000001000011000;
    rom_data[650]=16'b1000010111101111;
    rom_data[651]=16'b1000000101001001;
    rom_data[652]=16'b1000011000110001;
    rom_data[653]=16'b1000000001110101;
    rom_data[654]=16'b1000011001110010;
    rom_data[655]=16'b0111111110011101;
    rom_data[656]=16'b1000011010110011;
    rom_data[657]=16'b0111111011000001;
    rom_data[658]=16'b1000011011110011;
    rom_data[659]=16'b0111110111100001;
    rom_data[660]=16'b1000011100110010;
    rom_data[661]=16'b0111110011111101;
    rom_data[662]=16'b1000011101110001;
    rom_data[663]=16'b0111110000010110;
    rom_data[664]=16'b1000011110101111;
    rom_data[665]=16'b0111101100101100;
    rom_data[666]=16'b1000011111101100;
    rom_data[667]=16'b0111101000111111;
    rom_data[668]=16'b1000100000101001;
    rom_data[669]=16'b0111100101001111;
    rom_data[670]=16'b1000100001100100;
    rom_data[671]=16'b0111100001011101;
    rom_data[672]=16'b1000100010100000;
    rom_data[673]=16'b0111011101101000;
    rom_data[674]=16'b1000100011011010;
    rom_data[675]=16'b0111011001110001;
    rom_data[676]=16'b1000100100010100;
    rom_data[677]=16'b0111010101111000;
    rom_data[678]=16'b1000100101001101;
    rom_data[679]=16'b0111010001111100;
    rom_data[680]=16'b1000100110000101;
    rom_data[681]=16'b0111001101111111;
    rom_data[682]=16'b1000100110111101;
    rom_data[683]=16'b0111001010000000;
    rom_data[684]=16'b1000100111110011;
    rom_data[685]=16'b0111000110000000;
    rom_data[686]=16'b1000101000101001;
    rom_data[687]=16'b0111000001111110;
    rom_data[688]=16'b1000101001011110;
    rom_data[689]=16'b0110111101111010;
    rom_data[690]=16'b1000101010010010;
    rom_data[691]=16'b0110111001110110;
    rom_data[692]=16'b1000101011000101;
    rom_data[693]=16'b0110110101110000;
    rom_data[694]=16'b1000101011110111;
    rom_data[695]=16'b0110110001101001;
    rom_data[696]=16'b1000101100100111;
    rom_data[697]=16'b0110101101100001;
    rom_data[698]=16'b1000101101010111;
    rom_data[699]=16'b0110101001011000;
    rom_data[700]=16'b1000101110000100;
    rom_data[701]=16'b0110100101001110;
    rom_data[702]=16'b1000101110110000;
    rom_data[703]=16'b0110100001000011;
    rom_data[704]=16'b1000101111011011;
    rom_data[705]=16'b0110011100111000;
    rom_data[706]=16'b1000110000000011;
    rom_data[707]=16'b0110011000101100;
    rom_data[708]=16'b1000110000101000;
    rom_data[709]=16'b0110010100011111;
    rom_data[710]=16'b1000110001001011;
    rom_data[711]=16'b0110010000010011;
    rom_data[712]=16'b1000110001101011;
    rom_data[713]=16'b0110001100000101;
    rom_data[714]=16'b1000110010001000;
    rom_data[715]=16'b0110000111111000;
    rom_data[716]=16'b1000110010100000;
    rom_data[717]=16'b0110000011101010;
    rom_data[718]=16'b1000110010100000;
    rom_data[719]=16'b0101111111011100;
    rom_data[720]=16'b1000110010001000;
    rom_data[721]=16'b0101111011001110;
    rom_data[722]=16'b1000110001101011;
    rom_data[723]=16'b0101110111000000;
    rom_data[724]=16'b1000110001001011;
    rom_data[725]=16'b0101110010110001;
    rom_data[726]=16'b1000110000101000;
    rom_data[727]=16'b0101101110100011;
    rom_data[728]=16'b1000110000000011;
    rom_data[729]=16'b0101101010010110;
    rom_data[730]=16'b1000101111011011;
    rom_data[731]=16'b0101100110001000;
    rom_data[732]=16'b1000101110110000;
    rom_data[733]=16'b0101100001111011;
    rom_data[734]=16'b1000101110000100;
    rom_data[735]=16'b0101011101101110;
    rom_data[736]=16'b1000101101010111;
    rom_data[737]=16'b0101011001100001;
    rom_data[738]=16'b1000101100100111;
    rom_data[739]=16'b0101010101010110;
    rom_data[740]=16'b1000101011110111;
    rom_data[741]=16'b0101010001001010;
    rom_data[742]=16'b1000101011000101;
    rom_data[743]=16'b0101001101000000;
    rom_data[744]=16'b1000101010010010;
    rom_data[745]=16'b0101001000110110;
    rom_data[746]=16'b1000101001011110;
    rom_data[747]=16'b0101000100101101;
    rom_data[748]=16'b1000101000101001;
    rom_data[749]=16'b0101000000100100;
    rom_data[750]=16'b1000100111110011;
    rom_data[751]=16'b0100111100011101;
    rom_data[752]=16'b1000100110111101;
    rom_data[753]=16'b0100111000010111;
    rom_data[754]=16'b1000100110000101;
    rom_data[755]=16'b0100110100010010;
    rom_data[756]=16'b1000100101001101;
    rom_data[757]=16'b0100110000001111;
    rom_data[758]=16'b1000100100010100;
    rom_data[759]=16'b0100101100001100;
    rom_data[760]=16'b1000100011011010;
    rom_data[761]=16'b0100101000001011;
    rom_data[762]=16'b1000100010100000;
    rom_data[763]=16'b0100100100001100;
    rom_data[764]=16'b1000100001100100;
    rom_data[765]=16'b0100100000001110;
    rom_data[766]=16'b1000100000101001;
    rom_data[767]=16'b0100011100010011;
    rom_data[768]=16'b1000011111101100;
    rom_data[769]=16'b0100011000011001;
    rom_data[770]=16'b1000011110101111;
    rom_data[771]=16'b0100010100100001;
    rom_data[772]=16'b1000011101110001;
    rom_data[773]=16'b0100010000101011;
    rom_data[774]=16'b1000011100110010;
    rom_data[775]=16'b0100001100111000;
    rom_data[776]=16'b1000011011110011;
    rom_data[777]=16'b0100001001000111;
    rom_data[778]=16'b1000011010110011;
    rom_data[779]=16'b0100000101011001;
    rom_data[780]=16'b1000011001110010;
    rom_data[781]=16'b0100000001101101;
    rom_data[782]=16'b1000011000110001;
    rom_data[783]=16'b0011111110000100;
    rom_data[784]=16'b1000010111101111;
    rom_data[785]=16'b0011111010011111;
    rom_data[786]=16'b1000010110101100;
    rom_data[787]=16'b0011110110111101;
    rom_data[788]=16'b1000010101101000;
    rom_data[789]=16'b0011110011011110;
    rom_data[790]=16'b1000010100100100;
    rom_data[791]=16'b0011110000000011;
    rom_data[792]=16'b1000010011011111;
    rom_data[793]=16'b0011101100101100;
    rom_data[794]=16'b1000010010011001;
    rom_data[795]=16'b0011101001011010;
    rom_data[796]=16'b1000010001010010;
    rom_data[797]=16'b0011100110001100;
    rom_data[798]=16'b1000010000001011;
    rom_data[799]=16'b0011100011000010;
    rom_data[800]=16'b1000001111000011;
    rom_data[801]=16'b0011011111111110;
    rom_data[802]=16'b1000001101111010;
    rom_data[803]=16'b0011011100111111;
    rom_data[804]=16'b1000001100110000;
    rom_data[805]=16'b0011011010000101;
    rom_data[806]=16'b1000001011100101;
    rom_data[807]=16'b0011010111010010;
    rom_data[808]=16'b1000001010011010;
    rom_data[809]=16'b0011010100100101;
    rom_data[810]=16'b1000001001001110;
    rom_data[811]=16'b0011010001111110;
    rom_data[812]=16'b1000001000000001;
    rom_data[813]=16'b0011001111011111;
    rom_data[814]=16'b1000000110110011;
    rom_data[815]=16'b0011001101000111;
    rom_data[816]=16'b1000000101100101;
    rom_data[817]=16'b0011001010110110;
    rom_data[818]=16'b1000000100010110;
    rom_data[819]=16'b0011001000101111;
    rom_data[820]=16'b1000000011000111;
    rom_data[821]=16'b0011000110101111;
    rom_data[822]=16'b1000000001110111;
    rom_data[823]=16'b0011000100111001;
    rom_data[824]=16'b1000000000100110;
    rom_data[825]=16'b0011000011001101;
    rom_data[826]=16'b0111111111010101;
    rom_data[827]=16'b0011000001101010;
    rom_data[828]=16'b0111111110000011;
    rom_data[829]=16'b0011000000010001;
    rom_data[830]=16'b0111111100110010;
    rom_data[831]=16'b0010111111000011;
    rom_data[832]=16'b0111111011100000;
    rom_data[833]=16'b0010111110000000;
    rom_data[834]=16'b0111111010001110;
    rom_data[835]=16'b0010111101001001;
    rom_data[836]=16'b0111111000111011;
    rom_data[837]=16'b0010111100011101;
    rom_data[838]=16'b0111110111101001;
    rom_data[839]=16'b0010111011111101;
    rom_data[840]=16'b0111110110011100;
    rom_data[841]=16'b0010111011101000;
    rom_data[842]=16'b0111110101001010;
    rom_data[843]=16'b0010111011100000;
    rom_data[844]=16'b0111110011111001;
    rom_data[845]=16'b0010111011100100;
    rom_data[846]=16'b0111110010100111;
    rom_data[847]=16'b0010111011110100;
    rom_data[848]=16'b0111110001010110;
    rom_data[849]=16'b0010111100010001;
    rom_data[850]=16'b0111110000000110;
    rom_data[851]=16'b0010111100111001;
    rom_data[852]=16'b0111101110110110;
    rom_data[853]=16'b0010111101101101;
    rom_data[854]=16'b0111101101100111;
    rom_data[855]=16'b0010111110101100;
    rom_data[856]=16'b0111101100011000;
    rom_data[857]=16'b0010111111110111;
    rom_data[858]=16'b0111101011001010;
    rom_data[859]=16'b0011000001001101;
    rom_data[860]=16'b0111101001111101;
    rom_data[861]=16'b0011000010101101;
    rom_data[862]=16'b0111101000110000;
    rom_data[863]=16'b0011000100011000;
    rom_data[864]=16'b0111100111100100;
    rom_data[865]=16'b0011000110001100;
    rom_data[866]=16'b0111100110011001;
    rom_data[867]=16'b0011001000001010;
    rom_data[868]=16'b0111100101001110;
    rom_data[869]=16'b0011001010010001;
    rom_data[870]=16'b0111100100000101;
    rom_data[871]=16'b0011001100100000;
    rom_data[872]=16'b0111100010111100;
    rom_data[873]=16'b0011001110110111;
    rom_data[874]=16'b0111100001110011;
    rom_data[875]=16'b0011010001010110;
    rom_data[876]=16'b0111100000101100;
    rom_data[877]=16'b0011010011111101;
    rom_data[878]=16'b0111011111100101;
    rom_data[879]=16'b0011010110101010;
    rom_data[880]=16'b0111011110011111;
    rom_data[881]=16'b0011011001011110;
    rom_data[882]=16'b0111011101011001;
    rom_data[883]=16'b0011011100011000;
    rom_data[884]=16'b0111011100010100;
    rom_data[885]=16'b0011011111011000;
    rom_data[886]=16'b0111011011010000;
    rom_data[887]=16'b0011100010011101;
    rom_data[888]=16'b0111011010001100;
    rom_data[889]=16'b0011100101101000;
    rom_data[890]=16'b0111011001001001;
    rom_data[891]=16'b0011101000110111;
    rom_data[892]=16'b0111011000000110;
    rom_data[893]=16'b0011101100001011;
    rom_data[894]=16'b0111010111000100;
    rom_data[895]=16'b0011101111100011;
    rom_data[896]=16'b0111010110000011;
    rom_data[897]=16'b0011110011000000;
    rom_data[898]=16'b0111010101000010;
    rom_data[899]=16'b0011110110100000;
    rom_data[900]=16'b0111010100000001;
    rom_data[901]=16'b0011111010000011;
    rom_data[902]=16'b0111010011000001;
    rom_data[903]=16'b0011111101101010;
    rom_data[904]=16'b0111010010000010;
    rom_data[905]=16'b0100000001010100;
    rom_data[906]=16'b0111010001000011;
    rom_data[907]=16'b0100000101000001;
    rom_data[908]=16'b0111010000000100;
    rom_data[909]=16'b0100001000110001;
    rom_data[910]=16'b0111001111000101;
    rom_data[911]=16'b0100001100100011;
    rom_data[912]=16'b0111001110000111;
    rom_data[913]=16'b0100010000011000;
    rom_data[914]=16'b0111001101001010;
    rom_data[915]=16'b0100010100001111;
    rom_data[916]=16'b0111001100001100;
    rom_data[917]=16'b0100011000001001;
    rom_data[918]=16'b0111001011001111;
    rom_data[919]=16'b0100011100000100;
    rom_data[920]=16'b0111001010010011;
    rom_data[921]=16'b0100100000000001;
    rom_data[922]=16'b0111001001010110;
    rom_data[923]=16'b0100100100000000;
    rom_data[924]=16'b0111001000011010;
    rom_data[925]=16'b0100101000000000;
    rom_data[926]=16'b0111000111011110;
    rom_data[927]=16'b0100101100000010;
    rom_data[928]=16'b0111000110100010;
    rom_data[929]=16'b0100110000000110;
    rom_data[930]=16'b0111000101100111;
    rom_data[931]=16'b0100110100001011;
    rom_data[932]=16'b0111000100101011;
    rom_data[933]=16'b0100111000010000;
    rom_data[934]=16'b0111000011110000;
    rom_data[935]=16'b0100111100011000;
    rom_data[936]=16'b0111000010110101;
    rom_data[937]=16'b0101000000100000;
    rom_data[938]=16'b0111000001111010;
    rom_data[939]=16'b0101000100101001;
    rom_data[940]=16'b0111000000111111;
    rom_data[941]=16'b0101001000110010;
    rom_data[942]=16'b0111000000000101;
    rom_data[943]=16'b0101001100111101;
    rom_data[944]=16'b0110111111001010;
    rom_data[945]=16'b0101010001001000;
    rom_data[946]=16'b0110111110010000;
    rom_data[947]=16'b0101010101010100;
    rom_data[948]=16'b0110111101010101;
    rom_data[949]=16'b0101011001100001;
    rom_data[950]=16'b0110111100011011;
    rom_data[951]=16'b0101011101101110;
    rom_data[952]=16'b0110111011100001;
    rom_data[953]=16'b0101100001111011;
    rom_data[954]=16'b0110111010100110;
    rom_data[955]=16'b0101100110001000;
    rom_data[956]=16'b0110111001101100;
    rom_data[957]=16'b0101101010010110;
    rom_data[958]=16'b0110111000110010;
    rom_data[959]=16'b0101101110100100;
    rom_data[960]=16'b0110110111111000;
    rom_data[961]=16'b0101110010110010;
    rom_data[962]=16'b0110110110111101;
    rom_data[963]=16'b0101110111000001;
    rom_data[964]=16'b0110110110000011;
    rom_data[965]=16'b0101111011001111;
    rom_data[966]=16'b0110110101001000;
    rom_data[967]=16'b0101111111011101;
    rom_data[968]=16'b0110110100001110;
    rom_data[969]=16'b0110000011101010;
    rom_data[970]=16'b0110110011010011;
    rom_data[971]=16'b0110000111111000;
    rom_data[972]=16'b0110110010011000;
    rom_data[973]=16'b0110001100000101;
    rom_data[974]=16'b0110110001011101;
    rom_data[975]=16'b0110010000010010;
    rom_data[976]=16'b0110110000100010;
    rom_data[977]=16'b0110010100011111;
    rom_data[978]=16'b0110101111100111;
    rom_data[979]=16'b0110011000101011;
    rom_data[980]=16'b0110101110101100;
    rom_data[981]=16'b0110011100110110;
    rom_data[982]=16'b0110101101110000;
    rom_data[983]=16'b0110100001000001;
    rom_data[984]=16'b0110101100110101;
    rom_data[985]=16'b0110100101001011;
    rom_data[986]=16'b0110101011111001;
    rom_data[987]=16'b0110101001010100;
    rom_data[988]=16'b0110101010111100;
    rom_data[989]=16'b0110101101011100;
    rom_data[990]=16'b0110101010000000;
    rom_data[991]=16'b0110110001100011;
    rom_data[992]=16'b0110101001000011;
    rom_data[993]=16'b0110110101101001;
    rom_data[994]=16'b0110101000000110;
    rom_data[995]=16'b0110111001101110;
    rom_data[996]=16'b0110100111001001;
    rom_data[997]=16'b0110111101110010;
    rom_data[998]=16'b0110100110001011;
    rom_data[999]=16'b0111000001110100;
    rom_data[1000]=16'b0110100101001101;
    rom_data[1001]=16'b0111000101110101;
    rom_data[1002]=16'b0110100100001111;
    rom_data[1003]=16'b0111001001110100;
    rom_data[1004]=16'b0110100011010000;
    rom_data[1005]=16'b0111001101110010;
    rom_data[1006]=16'b0110100010010000;
    rom_data[1007]=16'b0111010001101101;
    rom_data[1008]=16'b0110100001010001;
    rom_data[1009]=16'b0111010101100111;
    rom_data[1010]=16'b0110100000010001;
    rom_data[1011]=16'b0111011001011111;
    rom_data[1012]=16'b0110011111010000;
    rom_data[1013]=16'b0111011101010101;
    rom_data[1014]=16'b0110011110001111;
    rom_data[1015]=16'b0111100001001000;
    rom_data[1016]=16'b0110011101001110;
    rom_data[1017]=16'b0111100100111001;
    rom_data[1018]=16'b0110011100001100;
    rom_data[1019]=16'b0111101000101000;
    rom_data[1020]=16'b0110011011001001;
    rom_data[1021]=16'b0111101100010011;
    rom_data[1022]=16'b0110011010000110;
    rom_data[1023]=16'b0111101111111100;
    rom_data[1024]=16'b0110011001000010;
    rom_data[1025]=16'b0111110011100001;
    rom_data[1026]=16'b0110010111111110;
    rom_data[1027]=16'b0111110111000011;
    rom_data[1028]=16'b0110010110111000;
    rom_data[1029]=16'b0111111010100010;
    rom_data[1030]=16'b0110010101110011;
    rom_data[1031]=16'b0111111101111101;
    rom_data[1032]=16'b0110010100101100;
    rom_data[1033]=16'b1000000001010100;
    rom_data[1034]=16'b0110010011100101;
    rom_data[1035]=16'b1000000100100110;
    rom_data[1036]=16'b0110010010011110;
    rom_data[1037]=16'b1000000111110101;
    rom_data[1038]=16'b0110010001010101;
    rom_data[1039]=16'b1000001010111110;
    rom_data[1040]=16'b0110010000001100;
    rom_data[1041]=16'b1000001110000010;
    rom_data[1042]=16'b0110001111000010;
    rom_data[1043]=16'b1000010001000001;
    rom_data[1044]=16'b0110001101110111;
    rom_data[1045]=16'b1000010011111011;
    rom_data[1046]=16'b0110001100101100;
    rom_data[1047]=16'b1000010110101110;
    rom_data[1048]=16'b0110001011100000;
    rom_data[1049]=16'b1000011001011100;
    rom_data[1050]=16'b0110001010010011;
    rom_data[1051]=16'b1000011100000010;
    rom_data[1052]=16'b0110001001000110;
    rom_data[1053]=16'b1000011110100001;
    rom_data[1054]=16'b0110000111110111;
    rom_data[1055]=16'b1000100000111001;
    rom_data[1056]=16'b0110000110101001;
    rom_data[1057]=16'b1000100011001010;
    rom_data[1058]=16'b0110000101011001;
    rom_data[1059]=16'b1000100101010001;
    rom_data[1060]=16'b0110000100001001;
    rom_data[1061]=16'b1000100111010001;
    rom_data[1062]=16'b0110000010111000;
    rom_data[1063]=16'b1000101001000111;
    rom_data[1064]=16'b0110000001100111;
    rom_data[1065]=16'b1000101010110100;
    rom_data[1066]=16'b0110000000010110;
    rom_data[1067]=16'b1000101100010110;
    rom_data[1068]=16'b0101111111000100;
    rom_data[1069]=16'b1000101101101111;
    rom_data[1070]=16'b0101111101110010;
    rom_data[1071]=16'b1000101110111101;
    rom_data[1072]=16'b0101111100100000;
    rom_data[1073]=16'b1000110000000000;
    rom_data[1074]=16'b0101111011001101;
    rom_data[1075]=16'b1000110000110111;
    rom_data[1076]=16'b0101111001111011;
    rom_data[1077]=16'b1000110001100011;
    rom_data[1078]=16'b0101111000101000;
    rom_data[1079]=16'b1000110010000011;
    rom_data[1080]=16'b0101110111010110;
    rom_data[1081]=16'b1000110010011000;
    rom_data[1082]=16'b0101110110000100;
    rom_data[1083]=16'b1000110010100000;
    rom_data[1084]=16'b0101110100110011;
    rom_data[1085]=16'b1000110010011100;
    rom_data[1086]=16'b0101110011100001;
    rom_data[1087]=16'b1000110010001100;
    rom_data[1088]=16'b0101110010010000;
    rom_data[1089]=16'b1000110001101111;
    rom_data[1090]=16'b0101110001000000;
    rom_data[1091]=16'b1000110001000111;
    rom_data[1092]=16'b0101101111110000;
    rom_data[1093]=16'b1000110000010011;
    rom_data[1094]=16'b0101101110100001;
    rom_data[1095]=16'b1000101111010100;
    rom_data[1096]=16'b0101101101010010;
    rom_data[1097]=16'b1000101110001001;
    rom_data[1098]=16'b0101101100000100;
    rom_data[1099]=16'b1000101100110011;
    rom_data[1100]=16'b0101101010110111;
    rom_data[1101]=16'b1000101011010011;
    rom_data[1102]=16'b0101101001101010;
    rom_data[1103]=16'b1000101001101000;
    rom_data[1104]=16'b0101101000011110;
    rom_data[1105]=16'b1000100111110100;
    rom_data[1106]=16'b0101100111010011;
    rom_data[1107]=16'b1000100101110110;
    rom_data[1108]=16'b0101100110001000;
    rom_data[1109]=16'b1000100011101111;
    rom_data[1110]=16'b0101100100111111;
    rom_data[1111]=16'b1000100001100000;
    rom_data[1112]=16'b0101100011110110;
    rom_data[1113]=16'b1000011111001001;
    rom_data[1114]=16'b0101100010101101;
    rom_data[1115]=16'b1000011100101001;
    rom_data[1116]=16'b0101100001100110;
    rom_data[1117]=16'b1000011010000011;
    rom_data[1118]=16'b0101100000011111;
    rom_data[1119]=16'b1000010111010110;
    rom_data[1120]=16'b0101011111011001;
    rom_data[1121]=16'b1000010100100010;
    rom_data[1122]=16'b0101011110010011;
    rom_data[1123]=16'b1000010001101000;
    rom_data[1124]=16'b0101011101001110;
    rom_data[1125]=16'b1000001110101000;
    rom_data[1126]=16'b0101011100001010;
    rom_data[1127]=16'b1000001011100010;
    rom_data[1128]=16'b0101011011000110;
    rom_data[1129]=16'b1000001000011000;
    rom_data[1130]=16'b0101011010000011;
    rom_data[1131]=16'b1000000101001001;
    rom_data[1132]=16'b0101011001000000;
    rom_data[1133]=16'b1000000001110101;
    rom_data[1134]=16'b0101010111111110;
    rom_data[1135]=16'b0111111110011101;
    rom_data[1136]=16'b0101010110111101;
    rom_data[1137]=16'b0111111011000000;
    rom_data[1138]=16'b0101010101111100;
    rom_data[1139]=16'b0111110111100000;
    rom_data[1140]=16'b0101010100111011;
    rom_data[1141]=16'b0111110011111101;
    rom_data[1142]=16'b0101010011111011;
    rom_data[1143]=16'b0111110000010110;
    rom_data[1144]=16'b0101010010111100;
    rom_data[1145]=16'b0111101100101100;
    rom_data[1146]=16'b0101010001111101;
    rom_data[1147]=16'b0111101000111111;
    rom_data[1148]=16'b0101010000111110;
    rom_data[1149]=16'b0111100101001111;
    rom_data[1150]=16'b0101001111111111;
    rom_data[1151]=16'b0111100001011100;
    rom_data[1152]=16'b0101001111000001;
    rom_data[1153]=16'b0111011101101000;
    rom_data[1154]=16'b0101001110000100;
    rom_data[1155]=16'b0111011001110001;
    rom_data[1156]=16'b0101001101000110;
    rom_data[1157]=16'b0111010101110111;
    rom_data[1158]=16'b0101001100001001;
    rom_data[1159]=16'b0111010001111100;
    rom_data[1160]=16'b0101001011001101;
    rom_data[1161]=16'b0111001101111111;
    rom_data[1162]=16'b0101001010010000;
    rom_data[1163]=16'b0111001010000000;
    rom_data[1164]=16'b0101001001010100;
    rom_data[1165]=16'b0111000110000000;
    rom_data[1166]=16'b0101001000011000;
    rom_data[1167]=16'b0111000001111110;
    rom_data[1168]=16'b0101000111011100;
    rom_data[1169]=16'b0110111101111010;
    rom_data[1170]=16'b0101000110100001;
    rom_data[1171]=16'b0110111001110101;
    rom_data[1172]=16'b0101000101100101;
    rom_data[1173]=16'b0110110101101111;
    rom_data[1174]=16'b0101000100101010;
    rom_data[1175]=16'b0110110001101000;
    rom_data[1176]=16'b0101000011101111;
    rom_data[1177]=16'b0110101101100000;
    rom_data[1178]=16'b0101000010110100;
    rom_data[1179]=16'b0110101001010111;
    rom_data[1180]=16'b0101000001111001;
    rom_data[1181]=16'b0110100101001101;
    rom_data[1182]=16'b0101000000111111;
    rom_data[1183]=16'b0110100001000011;
    rom_data[1184]=16'b0101000000000100;
    rom_data[1185]=16'b0110011100111000;
    rom_data[1186]=16'b0100111111001010;
    rom_data[1187]=16'b0110011000101100;
    rom_data[1188]=16'b0100111110001111;
    rom_data[1189]=16'b0110010100011111;
    rom_data[1190]=16'b0100111101010101;
    rom_data[1191]=16'b0110010000010010;
    rom_data[1192]=16'b0100111100011011;
    rom_data[1193]=16'b0110001100000101;
    rom_data[1194]=16'b0100111011100000;
    rom_data[1195]=16'b0110000111110111;
    rom_data[1196]=16'b0100111010100110;
    rom_data[1197]=16'b0110000011101010;
    rom_data[1198]=16'b0100111001101100;
    rom_data[1199]=16'b0101111111011100;
    rom_data[1200]=16'b0100111000110001;
    rom_data[1201]=16'b0101111011001101;
    rom_data[1202]=16'b0100110111110111;
    rom_data[1203]=16'b0101110110111111;
    rom_data[1204]=16'b0100110110111101;
    rom_data[1205]=16'b0101110010110001;
    rom_data[1206]=16'b0100110110000010;
    rom_data[1207]=16'b0101101110100011;
    rom_data[1208]=16'b0100110101001000;
    rom_data[1209]=16'b0101101010010101;
    rom_data[1210]=16'b0100110100001101;
    rom_data[1211]=16'b0101100110001000;
    rom_data[1212]=16'b0100110011010010;
    rom_data[1213]=16'b0101100001111011;
    rom_data[1214]=16'b0100110010010111;
    rom_data[1215]=16'b0101011101101110;
    rom_data[1216]=16'b0100110001011100;
    rom_data[1217]=16'b0101011001100001;
    rom_data[1218]=16'b0100110000100001;
    rom_data[1219]=16'b0101010101010101;
    rom_data[1220]=16'b0100101111100110;
    rom_data[1221]=16'b0101010001001010;
    rom_data[1222]=16'b0100101110101010;
    rom_data[1223]=16'b0101001100111111;
    rom_data[1224]=16'b0100101101101110;
    rom_data[1225]=16'b0101001000110101;
    rom_data[1226]=16'b0100101100110011;
    rom_data[1227]=16'b0101000100101100;
    rom_data[1228]=16'b0100101011110110;
    rom_data[1229]=16'b0101000000100100;
    rom_data[1230]=16'b0100101010111010;
    rom_data[1231]=16'b0100111100011101;
    rom_data[1232]=16'b0100101001111101;
    rom_data[1233]=16'b0100111000010111;
    rom_data[1234]=16'b0100101001000000;
    rom_data[1235]=16'b0100110100010010;
    rom_data[1236]=16'b0100101000000011;
    rom_data[1237]=16'b0100110000001110;
    rom_data[1238]=16'b0100100111000101;
    rom_data[1239]=16'b0100101100001100;
    rom_data[1240]=16'b0100100110000111;
    rom_data[1241]=16'b0100101000001011;
    rom_data[1242]=16'b0100100101001000;
    rom_data[1243]=16'b0100100100001100;
    rom_data[1244]=16'b0100100100001010;
    rom_data[1245]=16'b0100100000001110;
    rom_data[1246]=16'b0100100011001010;
    rom_data[1247]=16'b0100011100010010;
    rom_data[1248]=16'b0100100010001011;
    rom_data[1249]=16'b0100011000011001;
    rom_data[1250]=16'b0100100001001011;
    rom_data[1251]=16'b0100010100100001;
    rom_data[1252]=16'b0100100000001010;
    rom_data[1253]=16'b0100010000101011;
    rom_data[1254]=16'b0100011111001001;
    rom_data[1255]=16'b0100001100111000;
    rom_data[1256]=16'b0100011110001000;
    rom_data[1257]=16'b0100001001000111;
    rom_data[1258]=16'b0100011101000101;
    rom_data[1259]=16'b0100000101011000;
    rom_data[1260]=16'b0100011100000011;
    rom_data[1261]=16'b0100000001101101;
    rom_data[1262]=16'b0100011011000000;
    rom_data[1263]=16'b0011111110000100;
    rom_data[1264]=16'b0100011001111100;
    rom_data[1265]=16'b0011111010011111;
    rom_data[1266]=16'b0100011000110111;
    rom_data[1267]=16'b0011110110111101;
    rom_data[1268]=16'b0100010111110010;
    rom_data[1269]=16'b0011110011011110;
    rom_data[1270]=16'b0100010110101101;
    rom_data[1271]=16'b0011110000000011;
    rom_data[1272]=16'b0100010101100110;
    rom_data[1273]=16'b0011101100101100;
    rom_data[1274]=16'b0100010100011111;
    rom_data[1275]=16'b0011101001011010;
    rom_data[1276]=16'b0100010011011000;
    rom_data[1277]=16'b0011100110001011;
    rom_data[1278]=16'b0100010010001111;
    rom_data[1279]=16'b0011100011000010;
    rom_data[1280]=16'b0100010001000110;
    rom_data[1281]=16'b0011011111111110;
    rom_data[1282]=16'b0100001111111100;
    rom_data[1283]=16'b0011011100111110;
    rom_data[1284]=16'b0100001110110001;
    rom_data[1285]=16'b0011011010000101;
    rom_data[1286]=16'b0100001101100110;
    rom_data[1287]=16'b0011010111010010;
    rom_data[1288]=16'b0100001100011010;
    rom_data[1289]=16'b0011010100100100;
    rom_data[1290]=16'b0100001011001101;
    rom_data[1291]=16'b0011010001111110;
    rom_data[1292]=16'b0100001010000000;
    rom_data[1293]=16'b0011001111011110;
    rom_data[1294]=16'b0100001000110001;
    rom_data[1295]=16'b0011001101000110;
    rom_data[1296]=16'b0100000111100010;
    rom_data[1297]=16'b0011001010110110;
    rom_data[1298]=16'b0100000110010011;
    rom_data[1299]=16'b0011001000101110;
    rom_data[1300]=16'b0100000101000011;
    rom_data[1301]=16'b0011000110101111;
    rom_data[1302]=16'b0100000011110010;
    rom_data[1303]=16'b0011000100111001;
    rom_data[1304]=16'b0100000010100001;
    rom_data[1305]=16'b0011000011001100;
    rom_data[1306]=16'b0100000001010000;
    rom_data[1307]=16'b0011000001101010;
    rom_data[1308]=16'b0011111111111110;
    rom_data[1309]=16'b0011000000010001;
    rom_data[1310]=16'b0011111110101100;
    rom_data[1311]=16'b0010111111000011;
    rom_data[1312]=16'b0011111101011010;
    rom_data[1313]=16'b0010111110000000;
    rom_data[1314]=16'b0011111100000111;
    rom_data[1315]=16'b0010111101001001;
    rom_data[1316]=16'b0011111010110101;
    rom_data[1317]=16'b0010111100011101;
    rom_data[1318]=16'b0011111010000000;
    rom_data[1319]=16'b0010111011111101;
    rom_data[1320]=16'b0011111000101111;
    rom_data[1321]=16'b0010111011101000;
    rom_data[1322]=16'b0011110111011110;
    rom_data[1323]=16'b0010111011100000;
    rom_data[1324]=16'b0011110110001110;
    rom_data[1325]=16'b0010111011100100;
    rom_data[1326]=16'b0011110100111110;
    rom_data[1327]=16'b0010111011110100;
    rom_data[1328]=16'b0011110011101110;
    rom_data[1329]=16'b0010111100010001;
    rom_data[1330]=16'b0011110010011111;
    rom_data[1331]=16'b0010111100111001;
    rom_data[1332]=16'b0011110001010001;
    rom_data[1333]=16'b0010111101101101;
    rom_data[1334]=16'b0011110000000100;
    rom_data[1335]=16'b0010111110101100;
    rom_data[1336]=16'b0011101110110111;
    rom_data[1337]=16'b0010111111110111;
    rom_data[1338]=16'b0011101101101011;
    rom_data[1339]=16'b0011000001001101;
    rom_data[1340]=16'b0011101100011111;
    rom_data[1341]=16'b0011000010101101;
    rom_data[1342]=16'b0011101011010101;
    rom_data[1343]=16'b0011000100011000;
    rom_data[1344]=16'b0011101010001011;
    rom_data[1345]=16'b0011000110001100;
    rom_data[1346]=16'b0011101001000010;
    rom_data[1347]=16'b0011001000001010;
    rom_data[1348]=16'b0011100111111010;
    rom_data[1349]=16'b0011001010010001;
    rom_data[1350]=16'b0011100110110011;
    rom_data[1351]=16'b0011001100100000;
    rom_data[1352]=16'b0011100101101101;
    rom_data[1353]=16'b0011001110110111;
    rom_data[1354]=16'b0011100100100111;
    rom_data[1355]=16'b0011010001010111;
    rom_data[1356]=16'b0011100011100010;
    rom_data[1357]=16'b0011010011111101;
    rom_data[1358]=16'b0011100010011110;
    rom_data[1359]=16'b0011010110101010;
    rom_data[1360]=16'b0011100001011011;
    rom_data[1361]=16'b0011011001011110;
    rom_data[1362]=16'b0011100000011001;
    rom_data[1363]=16'b0011011100011000;
    rom_data[1364]=16'b0011011111010111;
    rom_data[1365]=16'b0011011111011000;
    rom_data[1366]=16'b0011011110010111;
    rom_data[1367]=16'b0011100010011110;
    rom_data[1368]=16'b0011011101010111;
    rom_data[1369]=16'b0011100101101000;
    rom_data[1370]=16'b0011011100011000;
    rom_data[1371]=16'b0011101000110111;
    rom_data[1372]=16'b0011011011011001;
    rom_data[1373]=16'b0011101100001011;
    rom_data[1374]=16'b0011011010011100;
    rom_data[1375]=16'b0011101111100100;
    rom_data[1376]=16'b0011011001011111;
    rom_data[1377]=16'b0011110011000000;
    rom_data[1378]=16'b0011011000100011;
    rom_data[1379]=16'b0011110110100000;
    rom_data[1380]=16'b0011010111100111;
    rom_data[1381]=16'b0011111010000011;
    rom_data[1382]=16'b0011010110101100;
    rom_data[1383]=16'b0011111101101010;
    rom_data[1384]=16'b0011010101110010;
    rom_data[1385]=16'b0100000001010100;
    rom_data[1386]=16'b0011010100111001;
    rom_data[1387]=16'b0100000101000001;
    rom_data[1388]=16'b0011010100000000;
    rom_data[1389]=16'b0100001000110001;
    rom_data[1390]=16'b0011010011001000;
    rom_data[1391]=16'b0100001100100100;
    rom_data[1392]=16'b0011010010010001;
    rom_data[1393]=16'b0100010000011000;
    rom_data[1394]=16'b0011010001011011;
    rom_data[1395]=16'b0100010100010000;
    rom_data[1396]=16'b0011010000100101;
    rom_data[1397]=16'b0100011000001001;
    rom_data[1398]=16'b0011001111110000;
    rom_data[1399]=16'b0100011100000100;
    rom_data[1400]=16'b0011001110111100;
    rom_data[1401]=16'b0100100000000001;
    rom_data[1402]=16'b0011001110001000;
    rom_data[1403]=16'b0100100100000000;
    rom_data[1404]=16'b0011001101010110;
    rom_data[1405]=16'b0100101000000001;
    rom_data[1406]=16'b0011001100100100;
    rom_data[1407]=16'b0100101100000011;
    rom_data[1408]=16'b0011001011110011;
    rom_data[1409]=16'b0100110000000110;
    rom_data[1410]=16'b0011001011000010;
    rom_data[1411]=16'b0100110100001011;
    rom_data[1412]=16'b0011001010010011;
    rom_data[1413]=16'b0100111000010001;
    rom_data[1414]=16'b0011001001100101;
    rom_data[1415]=16'b0100111100011000;
    rom_data[1416]=16'b0011001000110111;
    rom_data[1417]=16'b0101000000100000;
    rom_data[1418]=16'b0011001000001011;
    rom_data[1419]=16'b0101000100101001;
    rom_data[1420]=16'b0011000111011111;
    rom_data[1421]=16'b0101001000110011;
    rom_data[1422]=16'b0011000110110101;
    rom_data[1423]=16'b0101001100111101;
    rom_data[1424]=16'b0011000110001100;
    rom_data[1425]=16'b0101010001001001;
    rom_data[1426]=16'b0011000101100100;
    rom_data[1427]=16'b0101010101010101;
    rom_data[1428]=16'b0011000100111110;
    rom_data[1429]=16'b0101011001100001;
    rom_data[1430]=16'b0011000100011001;
    rom_data[1431]=16'b0101011101101110;
    rom_data[1432]=16'b0011000011110110;
    rom_data[1433]=16'b0101100001111011;
    rom_data[1434]=16'b0011000011010100;
    rom_data[1435]=16'b0101100110001001;
    rom_data[1436]=16'b0011000010110100;
    rom_data[1437]=16'b0101101010010111;
    rom_data[1438]=16'b0011000010110100;
    rom_data[1439]=16'b0101101110100101;
    rom_data[1440]=16'b0011000011010100;
    rom_data[1441]=16'b0101110010110011;


// F1
  if (f1_addr==0) begin
    f1_data_d = 24'b001010000000000000000001; // set SOFT_RESET once only (in mems cotrol arrd->8)
  end else if (f1_addr==1) begin
    f1_data_d = 24'b00111000_0000000000000000;    // set Vref only once
  end else if (f1_addr[0]==1'b0) begin
    f1_data_d = 24'b00111000_0000000000000000; //Vref send in 50% samples  
  end else begin //data in 50%
        
        case (f1_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                f1_data_d = {6'b000110, f1_addr[2:1], f1_CH_A_q};
            end
            2'b01: begin // this is a CHANNEL C
                f1_data_d = {6'b000110, f1_addr[2:1], f1_CH_C_q};
            end
            2'b10: begin // this is a CHANNEL B
                f1_data_d = {6'b000110, f1_addr[2:1], f1_CH_B_q};
            end
            2'b11: begin // this is a CHANNEL D
                f1_data_d = {6'b000110, f1_addr[2:1], f1_CH_D_q};
            end

            default: begin
            end
        endcase
   end // if addr=0


// F2
  if (f2_addr==0) begin
    f2_data_d = 24'b001010000000000000000001; // set SOFT_RESET once only (in mems cotrol arrd->8)
  end else if (f2_addr==1) begin
    f2_data_d = 24'b00111000_0000000000000000;    // set Vref only once
  end else if (f2_addr[0]==1'b0) begin
    f2_data_d = 24'b00111000_0000000000000000; //Vref send in 50% samples  
  end else begin //data in 50%
        
        case (f2_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                f2_data_d = {6'b000110, f2_addr[2:1], f2_CH_A_q};
            end
            2'b01: begin // this is a CHANNEL C
                f2_data_d = {6'b000110, f2_addr[2:1], f2_CH_C_q};
            end
            2'b10: begin // this is a CHANNEL B
                f2_data_d = {6'b000110, f2_addr[2:1], f2_CH_B_q};
            end
            2'b11: begin // this is a CHANNEL D
                f2_data_d = {6'b000110, f2_addr[2:1], f2_CH_D_q};
            end

            default: begin
            end
        endcase
   end // if addr=0



// F3
  if (f3_addr==0) begin
    f3_data_d = 24'b001010000000000000000001; // set SOFT_RESET once only (in mems cotrol arrd->8)
  end else if (f3_addr==1) begin
    f3_data_d = 24'b00111000_0000000000000000;    // set Vref only once
  end else if (f3_addr[0]==1'b0) begin
    f3_data_d = 24'b00111000_0000000000000000; //Vref send in 50% samples  
  end else begin //data in 50%
        
        case (f3_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                f3_data_d = {6'b000110, f3_addr[2:1], f3_CH_A_q};
            end
            2'b01: begin // this is a CHANNEL C
                f3_data_d = {6'b000110, f3_addr[2:1], f3_CH_C_q};
            end
            2'b10: begin // this is a CHANNEL B
                f3_data_d = {6'b000110, f3_addr[2:1], f3_CH_B_q};
            end
            2'b11: begin // this is a CHANNEL D
                f3_data_d = {6'b000110, f3_addr[2:1], f3_CH_D_q};
            end
            default: begin
            end
        endcase
  end // if addr=0

// F4
  if (f4_addr==0) begin
    f4_data_d = 24'b001010000000000000000001; // set SOFT_RESET once only (in mems cotrol arrd->8)
  end else if (f4_addr==1) begin
    f4_data_d = 24'b00111000_0000000000000000;    // set Vref only once
  end else if (f4_addr[0]==1'b0) begin
    f4_data_d = 24'b00111000_0000000000000000; //Vref send in 50% samples  
  end else begin //data in 50%
        
        case (f4_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                f4_data_d = {6'b000110, f4_addr[2:1], f4_CH_A_q};
            end
            2'b01: begin // this is a CHANNEL C
                f4_data_d = {6'b000110, f4_addr[2:1], f4_CH_C_q};
            end
            2'b10: begin // this is a CHANNEL B
                f4_data_d = {6'b000110, f4_addr[2:1], f4_CH_B_q};
            end
            2'b11: begin // this is a CHANNEL D
                f4_data_d = {6'b000110, f4_addr[2:1], f4_CH_D_q};
            end
            default: begin
            end
        endcase
  end // if addr=0

// F5
  if (f5_addr==0) begin
    f5_data_d = 24'b001010000000000000000001; // set SOFT_RESET once only (in mems cotrol arrd->8)
  end else if (f5_addr==1) begin
    f5_data_d = 24'b00111000_0000000000000000;    // set Vref only once
  end else if (f5_addr[0]==1'b0) begin
    f5_data_d = 24'b00111000_0000000000000000; //Vref send in 50% samples  
  end else begin //data in 50%
        
        case (f5_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                f5_data_d = {6'b000110, f5_addr[2:1], f5_CH_A_q};
            end
            2'b01: begin // this is a CHANNEL C
                f5_data_d = {6'b000110, f5_addr[2:1], f5_CH_C_q};
            end
            2'b10: begin // this is a CHANNEL B
                f5_data_d = {6'b000110, f5_addr[2:1], f5_CH_B_q};
            end
            2'b11: begin // this is a CHANNEL D
                f5_data_d = {6'b000110, f5_addr[2:1], f5_CH_D_q};
            end
            default: begin
            end
        endcase
  end // if addr=0


// F6
  if (f6_addr==0) begin
    f6_data_d = 24'b001010000000000000000001; // set SOFT_RESET once only (in mems cotrol arrd->8)
  end else if (f6_addr==1) begin
    f6_data_d = 24'b00111000_0000000000000000;    // set Vref only once
  end else if (f6_addr[0]==1'b0) begin
    f6_data_d = 24'b00111000_0000000000000000; //Vref send in 50% samples  
  end else begin //data in 50%
        
        case (f6_addr[2:1])
            2'b00: begin // this is a CHANNEL A
                f6_data_d = {6'b000110, f6_addr[2:1], f6_CH_A_q};
            end
            2'b01: begin // this is a CHANNEL C
                f6_data_d = {6'b000110, f6_addr[2:1], f6_CH_C_q};
            end
            2'b10: begin // this is a CHANNEL B
                f6_data_d = {6'b000110, f6_addr[2:1], f6_CH_B_q};
            end
            2'b11: begin // this is a CHANNEL D
                f6_data_d = {6'b000110, f6_addr[2:1], f6_CH_D_q};
            end
            default: begin
            end
        endcase
  end // if addr=0
end // always


always @(posedge f1_addr[0]) begin
    f1_CH_A_q<=f1_CH_A_d;
    f1_CH_B_q<=f1_CH_B_d;
    f1_CH_C_q<=f1_CH_C_d;
    f1_CH_D_q<=f1_CH_D_d;
end


always @(posedge f2_addr[0]) begin
    f2_CH_A_q<=f2_CH_A_d;
    f2_CH_B_q<=f2_CH_B_d;
    f2_CH_C_q<=f2_CH_C_d;
    f2_CH_D_q<=f2_CH_D_d;
end


always @(posedge f3_addr[0]) begin
    f3_CH_A_q<=f3_CH_A_d;
    f3_CH_B_q<=f3_CH_B_d;
    f3_CH_C_q<=f3_CH_C_d;
    f3_CH_D_q<=f3_CH_D_d;
end

always @(posedge f4_addr[0]) begin
    f4_CH_A_q<=f4_CH_A_d;
    f4_CH_B_q<=f4_CH_B_d;
    f4_CH_C_q<=f4_CH_C_d;
    f4_CH_D_q<=f4_CH_D_d;
end

always @(posedge f5_addr[0]) begin
    f5_CH_A_q<=f5_CH_A_d;
    f5_CH_B_q<=f5_CH_B_d;
    f5_CH_C_q<=f5_CH_C_d;
    f5_CH_D_q<=f5_CH_D_d;
end

always @(posedge f6_addr[0]) begin
    f6_CH_A_q<=f6_CH_A_d;
    f6_CH_B_q<=f6_CH_B_d;
    f6_CH_C_q<=f6_CH_C_d;
    f6_CH_D_q<=f6_CH_D_d;
end

always @(posedge clk) begin
    f1_data_q <= f1_data_d;
    f2_data_q <= f2_data_d;
    f3_data_q <= f3_data_d;
    f4_data_q <= f4_data_d;
    f5_data_q <= f5_data_d;
    f6_data_q <= f6_data_d;
end // always
 
endmodule