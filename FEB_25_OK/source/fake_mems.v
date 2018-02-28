module fake_mems (
    
    // INPUT
    input clk,  // clock
    input rst,  // reset
    input new_line_FIFO_done,
    input new_frame_FIFO_done,

    // OUTPUT
    output new_line,
    output new_frame

  );

  localparam STATE_SIZE = 2,
    DELAY = 2'd0,
    SEND_TO_FIFO = 2'd1;

  reg [STATE_SIZE-1:0] state_d, state_q;

  reg [29:0] delay_cntr_d, delay_cntr_q=30'd0;
  reg [29:0] delay_cntr2_d, delay_cntr2_q=30'd0;
  reg new_line_d, new_line_q;
  reg new_frame_d, new_frame_q;

  assign new_line = new_line_q;
  assign new_frame = new_frame_q;

  /* Combinational Logic */
  always @* begin
    delay_cntr_d = delay_cntr_q;
    delay_cntr2_d = delay_cntr2_q;
    state_d = state_q; // default values


    if (new_line_FIFO_done==1'b1) begin
      new_line_d=1'b0; // latch here is not fine (if at the same time 2 modules -> problem)
    end else begin
      new_line_d = new_line_q;
    end


    if (new_frame_FIFO_done==1'b1) begin
      new_frame_d=1'b0; // latch here is not fine
    end else begin
      new_frame_d = new_frame_q;
    end


    case (state_q)
      DELAY: begin
        if (delay_cntr_q == 30'd550000) begin


          if (delay_cntr2_q == 30'd15) begin
            new_frame_d=1'b1;
            delay_cntr_d=30'd0;
            delay_cntr2_d=30'd0;
            // state_d = SEND_TO_FIFO;
          end else begin
            new_line_d=1'b1;
            delay_cntr_d=30'd0;
            delay_cntr2_d = delay_cntr2_q + 1'b1;
          end
          
        end else begin
          delay_cntr_d = delay_cntr_q + 1'b1;
        end // if
      
      end // DELAY

      // SEND_TO_FIFO: begin
        // if (delay_cntr_q == 30'd3000000) begin
          // new_frame_d=1'b1;
          // delay_cntr_d=30'd0;
          // state_d = DELAY;
        // end else begin
          // delay_cntr_d = delay_cntr_q + 1'b1;
        // end
      // end

      // SEND_NEW_FRAME_TO_FIFO: begin
      //   new_line_d=1'b1;
      //   // new_frame_d=1'b13;
      //   state_d=DELAY;  
      //   delay_cntr_d=30'd0;
      // end


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


      new_line_q <= new_line_d; 
      new_frame_q <= new_frame_d; 


      state_q <= state_d;
      delay_cntr_q <= delay_cntr_d;
      delay_cntr2_q <= delay_cntr2_d;
      // wr_en_q <= wr_en_d;
    end
  end
  
endmodule
