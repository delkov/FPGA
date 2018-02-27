module tdc_spi_master #(
  parameter CLK_DIV = 2
  )(
    // INPUT
    input clk,
    input rst,
    input miso,
    input start,
    input[7:0] data_in,
    input CS_END,

    // OUTPUT
    output mosi,
    output sck,
    output[7:0] data_out,
    output busy,
    // output new_data, // debug
    output CS
  );

  parameter CTR_SIZE = $clog2(CLK_DIV); //$clog2(2**CLK_DIV);

   
  localparam STATE_SIZE = 3;
  localparam IDLE = 3'd0,
    WAIT_HALF = 3'd1,
    TRANSFER = 3'd2,
    WAIT_BEFORE_CS = 3'd3,
    WAIT_DURING_CS = 3'd4;
   
  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [7:0] data_d, data_q;
  reg [CTR_SIZE-1:0] sck_d, sck_q;
  reg mosi_d, mosi_q;
  reg [4:0] ctr_d, ctr_q;
  reg new_data_d, new_data_q;
  reg [7:0] data_out_d, data_out_q;
  reg CS_d;
  reg CS_q = 1'b1;
   
  assign mosi = mosi_q;
  assign sck = (sck_q[CTR_SIZE-1]) & (state_q == TRANSFER); // just ~sck_q[CTR_SIZE-1] to make it falling edge.
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
        sck_d = 4'b0;              
        ctr_d = 5'b0;              
        if (start == 1'b1) begin   
          state_d = WAIT_HALF;     
          CS_d = 1'b0;
        end
      end
     WAIT_HALF: begin // MAKE CS BEFORE MOSI & good data tken from addr_d
       // copy data to send
       sck_d = sck_q + 1'b1;                  
       if (sck_q == {CTR_SIZE-1{1'b1}}) begin  // if clock is half full (about to fall)
         sck_d = 1'b0;                       
         state_d = TRANSFER;   
         data_d = data_in;              
        end
     end
      TRANSFER: begin
        sck_d = sck_q + 1'b1;                           
        if (sck_q == 4'b0000) begin                     
          mosi_d = data_q[7];                           // output the MSB of data
        end else if (sck_q == {CTR_SIZE-1{1'b1}}) begin  // else if it's half full (about to fall)
          data_d = {data_q[6:0], miso};  // read in data (shift in)
          
          //miso
        end else if (sck_q == {CTR_SIZE{1'b1}}) begin    // else if it's full (about to rise)
          ctr_d = ctr_q + 1'b1;                        
          if (ctr_q == 5'b111) begin               
            state_d = WAIT_BEFORE_CS;                   
            data_out_d = data_q;                        // output data
            // signal data is valid
            sck_d = 4'b0; 
          end
        end
      end

    // DECIDE WHAT TO DO WITTH CS PIN
     WAIT_BEFORE_CS: begin
       sck_d = sck_q + 1'b1;                  
       if (sck_q == {CTR_SIZE-1{1'b1}}) begin  
          if (CS_END==1'b1) begin
            CS_d=1'b1;
          end else begin
            CS_d=1'b0;
          end
            state_d = WAIT_DURING_CS; 
            sck_d=1'b0;
        end
     end

     // STAY CS PIN in the previous state some time..
     WAIT_DURING_CS: begin
       sck_d = sck_q + 1'b1;                 
       if (sck_q == {CTR_SIZE{1'b1}}) begin 
         sck_d = 1'b0;                        
         state_d = IDLE;                 
         new_data_d = 1'b1;   
        end
     end
    endcase
  
  end // always
   
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