module main_control (
    // INPUT
    input clk,
    input rst,
    // input tx_busy,
    input [7:0] rx_data,
    input new_rx_data,
    // OUTPUT
    output tdc_enable, // used after powe_on, from LOW to HIGH to TDC
    output soft_reset, // flag to make TDC soft reset
    output play,
    output pause
  );


  localparam  STATE_SIZE = 2,
  IDLE = 2'd0,
  ENABLE_HIGH = 2'd1,
  SOFT_RESET = 2'd2;
  reg [STATE_SIZE-1:0] state_d, state_q;

  reg play_d, play_q;
  reg pause_d, pause_q;
  reg soft_reset;
  reg tdc_enable_d, tdc_enable_q;
  reg [19:0] countr_d, countr_q; // to count ud to 2ms approx, 1.7ms is needed for booting TDC

  assign tdc_enable = tdc_enable_q;
  assign pause = pause_q;
  assign play = play_q;

  /* Combinational Logic */
  always @* begin
  play_d = play_q;    
  pause_d = pause_q;  
  tdc_enable_d = tdc_enable_q;
  countr_d = countr_q;
  state_d = state_q;

    case (state_q)
      IDLE: begin
        play_d = 1'b0;
        soft_reset=1'b0;
        if (new_rx_data && rx_data == "d") begin
            tdc_enable_d=1'b0;
            state_d = ENABLE_HIGH;
            countr_d = 20'd1;
        end 

        if (new_rx_data && rx_data == "s") begin
          pause_d=1'b1;
          play_d=1'b0;
        end 

        if (new_rx_data && rx_data == "p") begin
          play_d=1'b1;
          pause_d=1'b0;
        end
      end // IDLE


      ENABLE_HIGH: begin
        if (countr_q==20'd0) begin
            tdc_enable_d = 1'b1;
            state_d = SOFT_RESET;
        end else begin
            countr_d = countr_q + 1'b1;
        end
      end // ENABLE_HIGH

      SOFT_RESET: begin
            soft_reset=1'b1;
            state_d = IDLE;
      end // SOFT_RESET

      default: state_d = IDLE;
    endcase

  end // always
  

  /* Sequential Logic */
  always @(posedge clk) begin
    if (rst) begin
      // Add flip-flop reset values here
    end else begin
      // Add flip-flop q <= d statements here
      tdc_enable_q <= tdc_enable_d;
      countr_q <= countr_d;
      state_q <= state_d;
      pause_q <= pause_d;
      play_q <= play_d;

    end
  end
  
endmodule
