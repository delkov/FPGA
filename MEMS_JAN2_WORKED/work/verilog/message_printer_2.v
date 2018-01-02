module message_printer_2 (
    input clk,
    input rst,
    output [7:0] tx_data,
    output reg new_tx_data,
    input tx_busy,
    input [7:0] rx_data,
    input new_rx_data,
    output start,
    input new_data,
    output [23:0] data_miso
  );
 
  localparam STATE_SIZE = 2;
  localparam IDLE = 2'd0,
    SOFTWARE_RESET = 2'd1,
    LDAC_SETUP = 2'd2,
    SET_CHANNEL = 2'd3;
 
  localparam CH_STATE_SIZE = 2;
    localparam CH_A = 2'd0,
    CH_B = 2'd1,
    CH_C = 2'd2,
    CH_D = 2'd3;

localparam UP_LIMIT = 8'd161; // max is 140, Pk-Pk 129, Avg 79
localparam DOWN_LIMIT = 8'd21;


localparam UP_LIMIT_2 = 8'd141; // max is 140, Pk-Pk 129, Avg 79
localparam DOWN_LIMIT_2 = 8'd41;

  reg [STATE_SIZE-1:0] state_d, state_q;

  reg [CH_STATE_SIZE-1:0] ch_state_d, ch_state_q;
 
  reg [3:0] addr_d, addr_q;
  reg start_d,start_q; 
  reg [7:0] delta_A_d;
  reg [7:0] delta_A_q = DOWN_LIMIT;
  reg [7:0] delta_B_d;
  reg [7:0] delta_B_q = UP_LIMIT;
  reg [7:0] delta_C_d;
  reg [7:0] delta_C_q = DOWN_LIMIT_2;
  reg [7:0] delta_D_d;
  reg [7:0] delta_D_q = UP_LIMIT_2;

  // reg [29:0] delay_cntr_d;
  // reg [29:0] delay_cntr_q = 10'd1;

  reg play_d, play_q;


  assign start=start_q;

  message_rom_9 message_rom (
  .clk(clk),
  .addr(addr_q),
  .delta_A(delta_A_q),
  .delta_B(delta_B_q),
  .delta_C(delta_C_q),
  .delta_D(delta_D_q),
  .data(data_miso)
  );
 
  always @(*) begin
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    new_tx_data = 1'b0;
    ch_state_d = ch_state_q;
    delta_A_d = delta_A_q;
    delta_B_d = delta_B_q;
    delta_C_d = delta_C_q;
    delta_D_d = delta_D_q;
    // delay_cntr_d = delay_cntr_q;

    play_d = play_q;

    if (new_rx_data && rx_data == "s") begin
        state_d=IDLE;
    end

    if (new_rx_data && rx_data == "p") begin
        state_d=SET_CHANNEL;
        play_d=1'b1;
    end

    case (state_q)
      IDLE: begin
        addr_d = 4'b0;
        start_d=1'b0;
        if (new_rx_data && rx_data == "h") begin
          state_d = SOFTWARE_RESET;
          start_d=1'b1;
        end
      end

      SOFTWARE_RESET: begin
        start_d=1'b0;
        if (new_data == 1'b1) begin 
          addr_d=addr_q+1'b1;
          state_d = LDAC_SETUP;
          start_d = 1'b1;
        end
      end

      LDAC_SETUP: begin
        start_d=1'b0;
        if (new_data==1'b1) begin 
          addr_d = addr_q + 1'b1;
          state_d = SET_CHANNEL;
          start_d = 1'b1;
          ch_state_d = CH_A;
          // delay_cntr_d = 4'd1;
        end
      end


      SET_CHANNEL: begin
        play_d=1'b0;


             case (ch_state_q)
               CH_A: begin
                start_d = 1'b0;

                if (new_data==1'b1 || play_q==1'b1) begin 
                       if (delta_A_q > UP_LIMIT) begin
                         delta_A_d = DOWN_LIMIT;
                         delta_B_d = UP_LIMIT;

                         // WE CAN WRITE C,D only after A>UP, so no each time..S
                         if (delta_C_q > UP_LIMIT_2) begin
                           delta_C_d = DOWN_LIMIT_2;
                           delta_D_d = UP_LIMIT_2;  
                         end else begin
                           delta_C_d = delta_C_d + 1'b1;
                           delta_D_d = delta_D_d - 1'b1;
                         end
                           
                       end else begin
                         delta_A_d = delta_A_q + 1'b1;
                       end


                       addr_d = 4'd3;  
                       start_d = 1'b1;
                       ch_state_d = CH_B; 
                end // new data

                    // // IF DELAY IS NEEDED CHANGE VALUE OR JUST CHANGE SPI SPEED (PREFER)
                    // if (delay_cntr_q==29'd50000) begin
                    //    addr_d = 4'd3;  
                    //    start_d = 1'b1;
                    //    ch_state_d = CH_B; 
                    // end else begin
                    //    delay_cntr_d = delay_cntr_q + 1'b1;
                    // end
               end

               CH_B: begin
                 start_d=1'b0;
                 if (new_data==1'b1) begin 
                   delta_B_d = delta_B_q - 1'b1;
                   addr_d = 4'd4;
                   start_d = 1'b1;
                   ch_state_d = CH_C; 
                 end
               end

               CH_C: begin
                 start_d=1'b0;
                 if (new_data==1'b1) begin 
                   addr_d = 4'd5;
                   start_d = 1'b1;
                   ch_state_d = CH_D; 
                 end
               end

               CH_D: begin
                 start_d=1'b0;
                 if (new_data==1'b1) begin 
                   addr_d = 4'd2;
                   start_d = 1'b1;
                   ch_state_d = CH_A; 
                   // delay_cntr_d = 10'd1;
                 end

               end

               default: ch_state_d = CH_A;
             endcase

      end // SET_CHANNEL

      default: state_d = IDLE;
    endcase
  end
 
  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
    end else begin
      state_q <= state_d;
      ch_state_q <= ch_state_d;
    end

    delta_A_q <= delta_A_d; 
    delta_B_q <= delta_B_d; 
    delta_C_q <= delta_C_d; 
    delta_D_q <= delta_D_d; 
    start_q<=start_d;
    addr_q <= addr_d;
    // delay_cntr_q <= delay_cntr_d;

    play_q <= play_d;
  end
 
endmodule