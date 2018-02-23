module main_control #(
      parameter BAUD_RATE_PARAM = 4000000
    )(
    // INPUT
    input clk,
    input rst,
    input SERIAL_IN,
    // input [7:0] rx_data,
    // input new_rx_data,
    
    // OUTPUT
    output f1_tdc_enable, // used after powe_on, from LOW to HIGH to TDC
    output f2_tdc_enable, // used after powe_on, from LOW to HIGH to TDC
    output f3_tdc_enable, // used after powe_on, from LOW to HIGH to TDC
    output f4_tdc_enable, // used after powe_on, from LOW to HIGH to TDC
    output f5_tdc_enable, // used after powe_on, from LOW to HIGH to TDC
    output f6_tdc_enable, // used after powe_on, from LOW to HIGH to TDC
    
    output reg f1_soft_reset, // flag to make TDC soft reset
    output reg f2_soft_reset, // flag to make TDC soft reset
    output reg f3_soft_reset, // flag to make TDC soft reset
    output reg f4_soft_reset, // flag to make TDC soft reset
    output reg f5_soft_reset, // flag to make TDC soft reset
    output reg f6_soft_reset, // flag to make TDC soft reset

    output go_home,
    output pause
  );


  localparam  STATE_SIZE = 2,
  IDLE = 2'd0,
  ENABLE_HIGH = 2'd1,
  SOFT_RESET = 2'd2;
  
  reg [STATE_SIZE-1:0] state_d, state_q;

  reg play_d, play_q;
  reg pause_d, pause_q=1'b0;
  reg go_home_d, go_home_q=1'b0;
  reg tdc_enable_d, tdc_enable_q=1'b0; // by default 
  reg [19:0] countr_d, countr_q; // to count ud to 2ms approx, 1.7ms is needed for booting TDC

  assign f1_tdc_enable = tdc_enable_q;
  assign f2_tdc_enable = tdc_enable_q;
  assign f3_tdc_enable = tdc_enable_q;
  assign f4_tdc_enable = tdc_enable_q;
  assign f5_tdc_enable = tdc_enable_q;
  assign f6_tdc_enable = tdc_enable_q;

  assign go_home = go_home_q;
  assign pause = pause_q;


  wire new_rx_data;
  wire [7:0] rx_data;

  serial_rx #(.CLK_PER_BIT(BAUD_RATE_PARAM)) serial_rx2 (
    .clk(clk),
    .rst(rst),
    .rx(SERIAL_IN),
    .data(rx_data),
    .new_data(new_rx_data)
  );
  
  

  /* Combinational Logic */
  always @* begin
  pause_d = pause_q;  
  tdc_enable_d = tdc_enable_q;
  countr_d = countr_q;
  state_d = state_q;
  go_home_d=go_home_q;




        if (new_rx_data && rx_data == "d") begin
          tdc_enable_d=1'b0;
          state_d = ENABLE_HIGH;
          countr_d = 20'd1;
          go_home_d=1'b0;
        end 


        if (new_rx_data && rx_data == "h") begin
          go_home_d=1'b1;
          // tdc_enable_d=1'b0; // if uncomment shutdown is not working...
          // pause_d=1'b1; // to power off laser also
        end 

        // if (new_rx_data && rx_data == "s") begin
        //   pause_d=1'b1;
        // end 
        // if (new_rx_data && rx_data == "p") begin
        //   pause_d=1'b0;
        // end


    case (state_q)
      IDLE: begin
        f1_soft_reset=1'b0;
        f2_soft_reset=1'b0;
        f3_soft_reset=1'b0;
        f4_soft_reset=1'b0;
        f5_soft_reset=1'b0;
        f6_soft_reset=1'b0;        
      end // IDLE

      ENABLE_HIGH: begin
        tdc_enable_d = 1'b1;
        if (countr_q==20'd0) begin // time required ENABLE LOW-HIGH is ~2ms. we are waiting 20 ms
          state_d = SOFT_RESET;
          countr_d=1'd0;
        end else begin
          countr_d = countr_q + 1'b1;
        end
      end // ENABLE_HIGH

      // delay to avoid serial overflow, since all new line will can come same time..
      SOFT_RESET: begin
        countr_d = countr_q + 1'b1;
        // if (countr_q == 20'd1000) begin
        //   f1_soft_reset=1'b1;
        //   f2_soft_reset=1'b0;
        //   f3_soft_reset=1'b0;
        //   f4_soft_reset=1'b0;
        //   f5_soft_reset=1'b0;
        //   f6_soft_reset=1'b0;  
        // end else if (countr_q == 20'd1000) begin
        //   f1_soft_reset=1'b0;
        //   f2_soft_reset=1'b1;
        //   f3_soft_reset=1'b0;
        //   f4_soft_reset=1'b0;
        //   f5_soft_reset=1'b0;
        //   f6_soft_reset=1'b0; 
        // end else if (countr_q == 20'd4000) begin
        //   f1_soft_reset=1'b0;
        //   f2_soft_reset=1'b0;
        //   f3_soft_reset=1'b1;
        //   f4_soft_reset=1'b0;
        //   f5_soft_reset=1'b0;
        //   f6_soft_reset=1'b0; 
        // end else if (countr_q == 20'd7000) begin
        //   f1_soft_reset=1'b0;
        //   f2_soft_reset=1'b0;
        //   f3_soft_reset=1'b0;
        //   f4_soft_reset=1'b1;
        //   f5_soft_reset=1'b0;
        //   f6_soft_reset=1'b0; 
        // end else if (countr_q == 20'd25000) begin
        //   f1_soft_reset=1'b0;
        //   f2_soft_reset=1'b0;
        //   f3_soft_reset=1'b0;
        //   f4_soft_reset=1'b0;
        //   f5_soft_reset=1'b1;
        //   f6_soft_reset=1'b0; 
        // end else if (countr_q == 20'd28000) begin
        //   f1_soft_reset=1'b0;
        //   f2_soft_reset=1'b0;
        //   f3_soft_reset=1'b0;
        //   f4_soft_reset=1'b0;
        //   f5_soft_reset=1'b0;
        //   f6_soft_reset=1'b1; 
        // end else if (countr_q == 20'd31000) begin
        //   state_d = IDLE;
        // end

        if (countr_q == 20'd1000) begin
          f1_soft_reset=1'b1;
          f2_soft_reset=1'b0;
          f3_soft_reset=1'b0;
          f4_soft_reset=1'b0;
          f5_soft_reset=1'b0;
          f6_soft_reset=1'b0;  
        end else if (countr_q == 20'd4000) begin
          f1_soft_reset=1'b0;
          f2_soft_reset=1'b1;
          f3_soft_reset=1'b0;
          f4_soft_reset=1'b0;
          f5_soft_reset=1'b0;
          f6_soft_reset=1'b0; 
        end else if (countr_q == 20'd7000) begin
          f1_soft_reset=1'b0;
          f2_soft_reset=1'b0;
          f3_soft_reset=1'b1;
          f4_soft_reset=1'b0;
          f5_soft_reset=1'b0;
          f6_soft_reset=1'b0; 
        end else if (countr_q == 20'd11000) begin
          f1_soft_reset=1'b0;
          f2_soft_reset=1'b0;
          f3_soft_reset=1'b0;
          f4_soft_reset=1'b1;
          f5_soft_reset=1'b0;
          f6_soft_reset=1'b0; 
        end else if (countr_q == 20'd25000) begin
          f1_soft_reset=1'b0;
          f2_soft_reset=1'b0;
          f3_soft_reset=1'b0;
          f4_soft_reset=1'b0;
          f5_soft_reset=1'b1;
          f6_soft_reset=1'b0; 
        end else if (countr_q == 20'd28000) begin
          f1_soft_reset=1'b0;
          f2_soft_reset=1'b0;
          f3_soft_reset=1'b0;
          f4_soft_reset=1'b0;
          f5_soft_reset=1'b0;
          f6_soft_reset=1'b1; 
        end else if (countr_q == 20'd31000) begin
          state_d = IDLE;
        end


      end // SOFT_RESET

      default: begin
        state_d = IDLE;
        f1_soft_reset=1'b0;
        f2_soft_reset=1'b0;
        f3_soft_reset=1'b0;
        f4_soft_reset=1'b0;
        f5_soft_reset=1'b0;
        f6_soft_reset=1'b0;
      end
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
      go_home_q <= go_home_d;
    end
  end
  
endmodule
