module fake_tdc_4 (
    
    // INPUT
    input clk,  // clock
    input rst,  // reset
    input f_FIFO_writing_done,

    // OUTPUT
    output  wr_en

  );

  localparam STATE_SIZE = 2,
    DELAY = 2'd0,
    SEND_TO_FIFO = 2'd1;

  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [29:0] delay_cntr_d, delay_cntr_q;
  reg wr_en_d, wr_en_q;

  assign wr_en = wr_en_q;

  /* Combinational Logic */
  always @* begin
    delay_cntr_d = delay_cntr_q;
    state_d = state_q; // default values
    wr_en_d = wr_en_q;


    if (f_FIFO_writing_done==1'b1) begin
      wr_en_d=1'b0; // latch here is fine
    end 


    case (state_q)
      DELAY: begin
        if (delay_cntr_q == 30'd10000) begin
          state_d = SEND_TO_FIFO;
        end else begin
          delay_cntr_d = delay_cntr_q + 1'b1;
        end
      end // DELAY

      SEND_TO_FIFO: begin
        wr_en_d=1'b1;
        state_d=DELAY;  
        delay_cntr_d=30'd0;
      end

      default: begin
        state_d = DELAY;
      end

    endcase
  
  end
  



  /* Sequential Logic */
  always @(posedge clk) begin
    if (rst) begin
      // Add flip-flop reset values here
    end else begin
      // Add flip-flop q <= d statements here
      state_q <= state_d;
      delay_cntr_q <= delay_cntr_d;
      wr_en_q <= wr_en_d;
    end
  end
  
endmodule
