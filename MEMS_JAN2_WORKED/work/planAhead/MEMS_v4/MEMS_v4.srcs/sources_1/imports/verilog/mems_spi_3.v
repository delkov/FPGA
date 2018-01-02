module mems_spi_master_3 #(parameter CLK_DIV = 2)(
    input clk,
    input rst,
    input miso,
    output mosi,
    output sck,
    input start,
    input[23:0] data_in,
    output[23:0] data_out,
    output busy,
    output new_data,
    output CS
  );
   
  localparam STATE_SIZE = 3;
  localparam IDLE = 3'd0,
    WAIT_HALF = 3'd1,
    TRANSFER = 3'd2,
    WAIT_FOR_CS_1 = 3'd3,
    WAIT_FOR_CS_2 = 3'd4;
   
  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [23:0] data_d, data_q;
  reg [CLK_DIV-1:0] sck_d, sck_q;
  reg mosi_d, mosi_q;
  reg [4:0] ctr_d, ctr_q;
  reg new_data_d, new_data_q;
  reg [23:0] data_out_d, data_out_q;
  reg CS_d, CS_q;
   
  assign mosi = mosi_q;
  assign sck = (~sck_q[CLK_DIV-1]) & (state_q == TRANSFER);
  assign busy = state_q != IDLE;
  assign data_out = data_out_q;
  assign new_data = new_data_q;
  assign CS = CS_q;
   
  always @(*) begin
    sck_d = sck_q;
    data_d = data_q;
    mosi_d = mosi_q;
    ctr_d = ctr_q;
    new_data_d = 1'b0;
    data_out_d = data_out_q;
    state_d = state_q;
    CS_d=CS_q;
     
    case (state_q)
      IDLE: begin
        // CS_d = 1'b1;
        sck_d = 4'b0;              // reset clock counter
        ctr_d = 5'b0;              // reset bit counter
        if (start == 1'b1) begin   // if start command
        // copy data to send
          state_d = WAIT_HALF;     // change state
          CS_d = 1'b0;
        end
      end

     WAIT_HALF: begin
       data_d = data_in;
       sck_d = sck_q + 1'b1;                  // increment clock counter
       if (sck_q == {CLK_DIV{1'b1}}) begin  // if clock is half full (about to fall)
         sck_d = 1'b0;                        // reset to 0
         state_d = TRANSFER;                  // change state
        end
     end

      TRANSFER: begin
        sck_d = sck_q + 1'b1;                           // increment clock counter
        if (sck_q == 4'b0000) begin                     // if clock counter is 0
          mosi_d = data_q[23];                           // output the MSB of data
        end else if (sck_q == {CLK_DIV-1{1'b1}}) begin  // else if it's half full (about to fall)
          data_d = {data_q[22:0], miso};//sck_d>>7};//miso};                 // read in data (shift in)
          
          //miso
        end else if (sck_q == {CLK_DIV{1'b1}}) begin    // else if it's full (about to rise)
          ctr_d = ctr_q + 1'b1;                         // increment bit counter
          if (ctr_q == 5'b10111) begin                    // if we are on the last bit
            state_d = WAIT_FOR_CS_1;                             // change state
            data_out_d = data_q;                        // output data
                       // signal data is valid
            sck_d = 4'b0; 

          end
        end
      end // TRANSFER

     WAIT_FOR_CS_1: begin
       // data_d = data_in;
       sck_d = sck_q + 1'b1;                  // increment clock counter
       if (sck_q == {CLK_DIV-1{1'b1}}) begin  // if clock is half full (about to fall)
            CS_d=1'b1;
            state_d = WAIT_FOR_CS_2; 
            sck_d=1'b0;

        end
     end

     WAIT_FOR_CS_2: begin
       // data_d = data_in;
       sck_d = sck_q + 1'b1;                  // increment clock counter
       if (sck_q == {CLK_DIV{1'b1}}) begin  // if clock is half full (about to fall)
         sck_d = 1'b0;                        // reset to 0
         state_d = IDLE;                  // change state
         new_data_d = 1'b1;   

        end
     end


    
    endcase
  end
   
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 5'b0;
      data_q <= 24'b0;
      sck_q <= 4'b0;
      mosi_q <= 1'b0;
      state_q <= IDLE;
      data_out_q <= 24'b0;
      new_data_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
      data_q <= data_d;
      sck_q <= sck_d;
      mosi_q <= mosi_d;
      state_q <= state_d;
      data_out_q <= data_out_d;
      new_data_q <= new_data_d;
      CS_q <= CS_d;
    end
  end
   
endmodule