module message_printer (
    input clk,
    input rst,
    output [7:0] tx_data,
    output reg new_tx_data,
    input tx_busy,
    input [7:0] rx_data,
    input new_rx_data,
    // output data_in,
    output start,
    input new_data,
    output [23:0] data_miso,
    output CS
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


  localparam MESSAGE_LEN = 24;
 
  reg [STATE_SIZE-1:0] state_d, state_q;

  reg [CH_STATE_SIZE-1:0] ch_state_d, ch_state_q;
 
  reg [3:0] addr_d, addr_q;
  reg start_d,start_q; 
  reg CS_d,CS_q;
  reg [7:0] delta_A_d;//= 8'hA0;
  reg [7:0] delta_A_q = 8'd21;
  reg [7:0] delta_B_d;
  reg [7:0] delta_B_q = 8'd141;




  assign start=start_q;
  assign CS = CS_q;

  message_rom message_rom (
  .clk(clk),
  .addr(addr_q),
  .delta_A(delta_A_q),
  .delta_B(delta_B_q),
  .data(data_miso)
  );
 
  always @(*) begin
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    new_tx_data = 1'b0;
    CS_d = CS_q;
    ch_state_d = ch_state_q;
    delta_A_d = delta_A_q;
    delta_B_d = delta_B_q;


    if (new_rx_data && rx_data == "s") begin
        // state_d = SOFTWARE_RESET;
        state_d=IDLE;
    end


    case (state_q)
      IDLE: begin
        addr_d = 4'b0;
        start_d=1'b0;
        CS_d=1'b1;
        if (new_rx_data && rx_data == "h") begin
          state_d = SOFTWARE_RESET;
          // addr_d=addr_q+1'b1;
          start_d=1'b1;
          CS_d = 1'b0;
        end
      end
      



      SOFTWARE_RESET: begin
        start_d=1'b0;
        if (new_data == 1'b1) begin //MESSAGE_LEN-1) begin
          addr_d=addr_q+1'b1;
          state_d = LDAC_SETUP;
          start_d = 1'b1;
          CS_d = 1'b1;

        end
      end

      LDAC_SETUP: begin
      CS_d = 1'b0;
        start_d=1'b0;
        if (new_data==1'b1) begin //MESSAGE_LEN-1) begin
          addr_d = addr_q + 1'b1;
          state_d = SET_CHANNEL;
          start_d = 1'b1;
          CS_d = 1'b1;
          // add_d={8{1'b0}};
          ch_state_d = CH_A;
        end
      end


      SET_CHANNEL: begin
        CS_d = 1'b0;
        start_d = 1'b0;
        
        if (new_data==1'b1) begin //MESSAGE_LEN-1) begin

          case (ch_state_q)
            CH_A: begin

              if (delta_A_q > 8'd141)
                delta_A_d = 8'd21;
              else 
                delta_A_d = delta_A_q + 1'b1;
              // end



              // delta_B
              // if (delta_A_q > 8'hB0)
              //   delta_A_d = {8{1'b0}};  
              // else 
             
              addr_d = 4'd3;  
              start_d = 1'b1;
              CS_d = 1'b1;
              ch_state_d = CH_B; 

            end


            CH_B: begin

              if (delta_B_q < 8'd21)
                delta_B_d = 8'd141;
              else 
                delta_B_d = delta_B_q - 1'b1;
              // end

                addr_d = 4'd2;
                start_d = 1'b1;
                CS_d = 1'b1;
                ch_state_d = CH_A; 

              end



            default: ch_state_d = CH_A;
          endcase


        end // new_data
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

    delta_B_q <= delta_B_d; 
    delta_A_q <= delta_A_d; 
    // add_q <= add_d;
    start_q<=start_d;
    addr_q <= addr_d;
    CS_q <= CS_d;
  end
 
endmodule