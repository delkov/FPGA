module mems_rom (
    // INPUT
    input rst,
    input clk,
    input [17:0] f1_addr,
    input [17:0] f2_addr,
    input [17:0] f3_addr,
    input [17:0] f4_addr,
    input [17:0] f5_addr,
    input [17:0] f6_addr,

    input exit,

    // OUTPUT
    output [23:0] f1_data,
    output [23:0] f2_data,
    output [23:0] f3_data,
    output [23:0] f4_data,
    output [23:0] f5_data,
    output [23:0] f6_data
  );
  
localparam home_step=5'd30; 
localparam home_bias=16'd23250;
// localparam home_bias_debug=16'd13250;
// localparam home_bias_x2_8bit=8'hB4; // from oscillo, exp.data

localparam home_bias_x2_16bit=16'hB900; // from oscillo, exp.data B950

localparam STATE_SIZE = 3;
localparam READ_F1 = 3'd0,
  READ_F2 = 3'd1,
  READ_F3 = 3'd2,
  READ_F4 = 3'd3,
  READ_F5 = 3'd4,
  READ_F6 = 3'd5;

reg [10:0] cnt_d, cnt_q; 
reg [STATE_SIZE-1:0] state_d, state_q=READ_F1;
reg [15:0] addrs_d, addrs_q;

reg [23:0] f1_data_d, f1_data_q;
reg [23:0] f2_data_d, f2_data_q;
reg [23:0] f3_data_d, f3_data_q;
reg [23:0] f4_data_d, f4_data_q;
reg [23:0] f5_data_d, f5_data_q;
reg [23:0] f6_data_d, f6_data_q;

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

wire [15:0] ROM_DOUT;

// manually make RAMB8BWERs, much more better then auto-wires (goes to ROM, but not optimally && there is distributed RAM, so takes 16K not 8K..), and much much better then reg (goes to RAM).
ROM_COMBO_mode3_14deg ROM_COMBO_mode3_14deg ( // ROM_COMBO_mode3_14deg;
  .clka(clk),
  .addra(addrs_q),
  .douta(ROM_DOUT)
);


// LOOP FOR FORMATING DATA
always @(*) begin
    addrs_d=addrs_q;  // to make first cycle of reading wright working, doesn matter in fact..
    state_d=state_q;
    cnt_d=cnt_q;

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

    if (exit==1'b1) begin
        cnt_d=cnt_q+1'b1;
        if (cnt_q==11'b0) begin
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
                    end else if (f6_CH_A_q<=home_bias) begin 
                        f6_CH_A_d=f6_CH_A_q+home_step; 
                    end 
                end
                2'b01: begin // this is a CHANNEL C
                    if (f6_CH_C_q>home_bias) begin
                        f6_CH_C_d=f6_CH_C_q-home_step;
                    end else if (f6_CH_C_q<=home_bias) begin 
                        f6_CH_C_d=f6_CH_C_q+home_step;
                    end 
                end
                2'b10: begin // this is a CHANNEL B
                    if (f6_CH_B_q>home_bias) begin
                        f6_CH_B_d=f6_CH_B_q-home_step;
                    end else if (f6_CH_B_q<=home_bias) begin
                        f6_CH_B_d=f6_CH_B_q+home_step; 
                    end 
                end
                2'b11: begin // this is a CHANNEL D
                    if (f6_CH_D_q>home_bias) begin
                        f6_CH_D_d=f6_CH_D_q-home_step;
                    end else if (f6_CH_D_q<=home_bias) begin 
                        f6_CH_D_d=f6_CH_D_q+home_step; 
                    end 
                end
                default: begin
                end
            endcase
        end // if cnt_q==0
    end else begin // if NOT go home
        case (state_q)
            READ_F1: begin
                    addrs_d=f1_addr[17:2];
                    cnt_d=cnt_q+1'b1;
                    if (cnt_q==11'd2) begin
                        cnt_d=11'b0;
                        state_d=READ_F2;
                        if (f1_addr[2:1]==2'b00) begin
                            f1_CH_A_d= ROM_DOUT;// 8'b10000000};
                        end else if (f1_addr[2:1]==2'b01) begin
                            f1_CH_C_d= home_bias_x2_16bit-ROM_DOUT;// 8'b10000000};
                        end else if (f1_addr[2:1]==2'b10) begin
                            f1_CH_B_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f1_addr[2:1]==2'b11) begin
                            f1_CH_D_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end
                    end
            end // READ_F1
            READ_F2: begin
                    addrs_d=f2_addr[17:2];
                    cnt_d=cnt_q+1'b1;
                    if (cnt_q==11'd2) begin
                        cnt_d=11'b0;
                        state_d=READ_F3;
                        if (f2_addr[2:1]==2'b00) begin
                            f2_CH_A_d= ROM_DOUT;// 8'b10000000};
                        end else if (f2_addr[2:1]==2'b01) begin
                            f2_CH_C_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end else if (f2_addr[2:1]==2'b10) begin
                            f2_CH_B_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f2_addr[2:1]==2'b11) begin
                            f2_CH_D_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end
                    end
            end // READ_F2
            READ_F3: begin
                    addrs_d=f3_addr[17:2];
                    cnt_d=cnt_q+1'b1;
                    if (cnt_q==11'd2) begin
                        cnt_d=11'b0;
                        state_d=READ_F4;
                        if (f3_addr[2:1]==2'b00) begin 
                            f3_CH_A_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f3_addr[2:1]==2'b01) begin
                            f3_CH_C_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end else if (f3_addr[2:1]==2'b10) begin
                            f3_CH_B_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f3_addr[2:1]==2'b11) begin
                            f3_CH_D_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end
                    end 
            end // READ_F3
            READ_F4: begin
                    addrs_d=f4_addr[17:2];
                    cnt_d=cnt_q+1'b1;
                    if (cnt_q==11'd2) begin
                        cnt_d=11'b0;
                        state_d=READ_F5;
                        if (f4_addr[2:1]==2'b00) begin 
                            f4_CH_A_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f4_addr[2:1]==2'b01) begin
                            f4_CH_C_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end else if (f4_addr[2:1]==2'b10) begin
                            f4_CH_B_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f4_addr[2:1]==2'b11) begin
                            f4_CH_D_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end
                    end 
            end // READ_F4
            READ_F5: begin
                    addrs_d=f5_addr[17:2];
                    cnt_d=cnt_q+1'b1;
                    if (cnt_q==11'd2) begin
                        cnt_d=11'b0;
                        state_d=READ_F6;
                        if (f5_addr[2:1]==2'b00) begin
                            f5_CH_A_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f5_addr[2:1]==2'b01) begin
                            f5_CH_C_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end else if (f5_addr[2:1]==2'b10) begin
                            f5_CH_B_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f5_addr[2:1]==2'b11) begin
                            f5_CH_D_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end
                    end 
            end // READ_F5
            READ_F6: begin
                    addrs_d=f6_addr[17:2];
                    cnt_d=cnt_q+1'b1;
                    if (cnt_q==11'd2) begin
                        cnt_d=11'b0;
                        state_d=READ_F1;
                        if (f6_addr[2:1]==2'b00) begin 
                            f6_CH_A_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f6_addr[2:1]==2'b01) begin
                            f6_CH_C_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end else if (f6_addr[2:1]==2'b10) begin
                            f6_CH_B_d= ROM_DOUT;//, 8'b10000000};
                        end else if (f6_addr[2:1]==2'b11) begin
                            f6_CH_D_d= home_bias_x2_16bit-ROM_DOUT;//, 8'b10000000};
                        end
                    end 
            end // READ_F6
        endcase
    end // if go home 
end //always





// LOOP FOR SENDING DATA
always @(*) begin
  // F1
  if (f1_addr==0) begin
    f1_data_d = 24'b001010000000000000000001; // set SOFT_RESET once only (in mems cotrol arrd->8)
  end else if (f1_addr==1) begin
    f1_data_d = 24'b00111000_0000000000000000;    // set Vref only once
  end else if (f1_addr[0]==1'b0) begin
    f1_data_d = 24'b00111000_0000000000000000; // Vref send in 50% samples  
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
    f2_data_d = 24'b00111000_0000000000000000; // Vref send in 50% samples  
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


always @(posedge clk) begin
    f1_CH_A_q<=f1_CH_A_d;
    f1_CH_B_q<=f1_CH_B_d;
    f1_CH_C_q<=f1_CH_C_d;
    f1_CH_D_q<=f1_CH_D_d;

    f2_CH_A_q<=f2_CH_A_d;
    f2_CH_B_q<=f2_CH_B_d;
    f2_CH_C_q<=f2_CH_C_d;
    f2_CH_D_q<=f2_CH_D_d;
    
    f3_CH_A_q<=f3_CH_A_d;
    f3_CH_B_q<=f3_CH_B_d;
    f3_CH_C_q<=f3_CH_C_d;
    f3_CH_D_q<=f3_CH_D_d;

    f4_CH_A_q<=f4_CH_A_d;
    f4_CH_B_q<=f4_CH_B_d;
    f4_CH_C_q<=f4_CH_C_d;
    f4_CH_D_q<=f4_CH_D_d;

    f5_CH_A_q<=f5_CH_A_d;
    f5_CH_B_q<=f5_CH_B_d;
    f5_CH_C_q<=f5_CH_C_d;
    f5_CH_D_q<=f5_CH_D_d;

    f6_CH_A_q<=f6_CH_A_d;
    f6_CH_B_q<=f6_CH_B_d;
    f6_CH_C_q<=f6_CH_C_d;
    f6_CH_D_q<=f6_CH_D_d;

    f1_data_q <= f1_data_d;
    f2_data_q <= f2_data_d;
    f3_data_q <= f3_data_d;
    f4_data_q <= f4_data_d;
    f5_data_q <= f5_data_d;
    f6_data_q <= f6_data_d;

    addrs_q<=addrs_d;
    state_q <= state_d;
    cnt_q <= cnt_d;
end // always
 
endmodule