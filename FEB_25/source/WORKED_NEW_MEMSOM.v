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
  );
  

reg [13:0] addrs;
wire [13:0] wire_addrs;

assign wire_addrs[13:0] = addrs;


reg [23:0] f1_data_d, f1_data_q;
wire[13:0] f1_addrs;

reg [23:0] f2_data_d, f2_data_q;
wire[13:0] f2_addrs;

localparam home_step=5'd30;
localparam home_bias=16'd23250;
localparam home_bias_debug=16'd13250;
localparam home_bias_x2_8bit=8'hB4; // from oscillo, exp.data

reg [15:0] f1_CH_A_d, f1_CH_A_q;
reg [15:0] f1_CH_B_d, f1_CH_B_q;
reg [15:0] f1_CH_C_d, f1_CH_C_q;
reg [15:0] f1_CH_D_d, f1_CH_D_q;

reg [15:0] f2_CH_A_d, f2_CH_A_q;
reg [15:0] f2_CH_B_d, f2_CH_B_q;
reg [15:0] f2_CH_C_d, f2_CH_C_q;
reg [15:0] f2_CH_D_d, f2_CH_D_q;



assign f1_data = f1_data_q;
assign f1_addrs = f1_addr[15:2];

assign f2_data = f2_data_q;
assign f2_addrs = f2_addr[15:2];


wire [7:0] ROM_DOUT;




localparam STATE_SIZE = 3;
localparam READ_F1 = 3'd0,
  READ_F2 = 3'd1,
  READ_F3 = 3'd2,
  READ_F4 = 3'd3,
  READ_F5 = 3'd4,
  READ_F6 = 3'd5;
reg [STATE_SIZE-1:0] state_d, state_q=READ_F2;


reg [2:0] cnt_d, cnt_q; 

 // make RAMB8BWERs, better than assign twice
 ROM7 ROM7(
  .clka(clk),
  .addra(wire_addrs),
  .douta(ROM_DOUT)
 );


always @(*) begin
    // addrs=f1_addrs;  // to make first cycle of reading wright working, doesn matter in fact..

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


    if (go_home==1'b1) begin
        // F1
        // case (f1_addr[2:1])
        //     2'b00: begin // this is a CHANNEL A
        //         if (f1_CH_A_q>home_bias) begin
        //             f1_CH_A_d=f1_CH_A_q-home_step;
        //         end else if (f1_CH_A_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
        //             f1_CH_A_d=f1_CH_A_q+home_step; 
        //         end 
        //     end
        //     2'b01: begin // this is a CHANNEL C
        //         if (f1_CH_C_q>home_bias) begin
        //             f1_CH_C_d=f1_CH_C_q-home_step;
        //         end else if (f1_CH_C_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
        //             f1_CH_C_d=f1_CH_C_q+home_step;
        //         end 
        //     end
        //     2'b10: begin // this is a CHANNEL B
        //         if (f1_CH_B_q>home_bias) begin
        //             f1_CH_B_d=f1_CH_B_q-home_step;
        //         end else if (f1_CH_B_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
        //             f1_CH_B_d=f1_CH_B_q+home_step; 
        //         end 
        //     end
        //     2'b11: begin // this is a CHANNEL D
        //         if (f1_CH_D_q>home_bias) begin
        //             f1_CH_D_d=f1_CH_D_q-home_step;
        //         end else if (f1_CH_D_q<=home_bias) begin //if (CH_A_q<CH_C_q) begin
        //             f1_CH_D_d=f1_CH_D_q+home_step; 
        //         end 
        //     end
        //     default: begin
        //     end
        // endcase
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


    end else begin // if NOT go home

        case (state_q)
            READ_F2: begin
                addrs=f2_addr[15:2];
                if (cnt_q==3'd2) begin
                //     stay_cnt_d=3'd0;
                   // F2
                    case (f2_addr[2:1])
                        2'b00: begin // this is a CHANNEL A
                            f2_CH_A_d= {ROM_DOUT, 8'b10000000};
                        end
                        2'b01: begin // this is a CHANNEL C
                            f2_CH_C_d= {home_bias_x2_8bit-ROM_DOUT, 8'b10000000};
                        end
                        2'b10: begin // this is a CHANNEL B
                            f2_CH_B_d= {ROM_DOUT, 8'b10000000};
                        end
                        2'b11: begin // this is a CHANNEL D
                            f2_CH_D_d= {home_bias_x2_8bit-ROM_DOUT, 8'b10000000};
                        end
                    endcase


                end else begin
                    cnt_d=cnt_q+1'b1;
                end

            end // READ_F2
        endcase


    end // if go home 
end // always


always @(*) begin

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


always @(posedge clk) begin
    state_q <= state_d;
    cnt_q <= cnt_d;

    f1_data_q <= f1_data_d;
    f2_data_q <= f2_data_d;
    // f3_data_q <= f3_data_d;
    // f4_data_q <= f4_data_d;
    // f5_data_q <= f5_data_d;
    // f6_data_q <= f6_data_d;
end // always
 
endmodule