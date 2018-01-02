module tdc_control (
    input clk,
    input rst,
    output [7:0] tx_data,
    output reg new_tx_data,
    input tx_busy,
    input [7:0] rx_data,
    input new_rx_data,
    // output data_in,
    input new_data,
    output [15:0] tdc_data_in,
    output CS,
    output enable,
    output start,
    output start_signal,
    output stop_signal,
    input tdc_trig
  );
 
  localparam STATE_SIZE = 3;
  localparam IDLE = 3'd0,
    SOFTWARE_RESET = 3'd1,
    TRIG_GENERATE = 3'd2,
    TRIG_WAIT_TO_GEN_START = 3'd3,
    STOP_WAIT = 3'd4,
    DELAY = 3'd4;

 
  localparam CH_STATE_SIZE = 2;
    localparam CH_A = 2'd0,
    CH_B = 2'd1,
    CH_C = 2'd2,
    CH_D = 2'd3;


  localparam MESSAGE_LEN = 24;
 
  reg [STATE_SIZE-1:0] state_d, state_q;

  reg [CH_STATE_SIZE-1:0] ch_state_d, ch_state_q;
 
  reg [3:0] addr_d, addr_q;
  reg CS_d, CS_q;
  reg [7:0] delta_A_d;//= 8'hA0;
  reg [7:0] delta_A_q = 8'd21;
  reg [7:0] delta_B_d;
  reg [7:0] delta_B_q = 8'd141;
  reg enable_d, enable_q;
  reg start_d, start_q;
  reg stop_signal_d, stop_signal_q;
  reg start_signal_d, start_signal_q;

  reg [3:0] CS_countr_d,CS_countr_q;

  assign enable = enable_q;
  assign start=start_q;
  assign CS = CS_q;
  assign start_signal = start_signal_q;
  assign stop_signal = stop_signal_q;

  tdc_rom tdc_rom (
  .clk(clk),
  .addr(addr_q),
  .data(tdc_data_in)
  );
 
  always @(*) begin
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    new_tx_data = 1'b0;
    CS_d = CS_q;
    CS_countr_d=CS_countr_q;
    ch_state_d = ch_state_q;
    delta_A_d = delta_A_q;
    delta_B_d = delta_B_q;
    enable_d=enable_q;
    start_signal_d=start_signal_q;
    stop_signal_d=stop_signal_q;


    // ENABLE CONFIGURED  by DELAY press S and H!!
    if (new_rx_data && rx_data == "s") begin
        enable_d=1'b0;
        state_d=IDLE;
    end


    case (state_q)
      IDLE: begin
        addr_d = 4'b0;
        start_d=1'b0;
        CS_d=1'b1;
        enable_d=1'b1;
        // CS_c1ountr_d=3'd0;
        

        stop_signal_d=1'b0;

        start_signal_d=1'b0;


        if (new_rx_data && rx_data == "h") begin
          state_d = SOFTWARE_RESET;
          addr_d=1'b0;
          start_d=1'b1;
          CS_d = 1'b0;
          // enable_d= 1'b0; // ENABLE LOW
          CS_countr_d=4'd0;

        end
      end

      // AFTER POWER ON, SETUP
      SOFTWARE_RESET: begin
        
        if (CS_countr_q==4'd2) begin
          CS_d = 1'b0;
        end else begin
          CS_countr_d=CS_countr_q+1'b1;
        end

        start_d=1'b0;
        
        if (new_data==1'b1) begin

          if (addr_q==4'd8) begin

            state_d = TRIG_GENERATE;
            CS_d=1'b1;
            CS_countr_d=4'd0;
            addr_d=4'd9; // reset all registers, NEW measurement, generate TRIG from TDC.
            start_d=1'b1; // start should be after addr already fine..
     
        
          end else begin

            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
            CS_d=1'b1;
            CS_countr_d=4'd0;
            // state_d=SOFTWARE_RESET;

          end

        end
    
      end













      // AFTER POWER ON, SETUP
      TRIG_GENERATE: begin

        // addr_d=4'd9; // reset all registers, NEW measurement, generate TRIG from TDC.
        start_d=1'b0; // start should be after addr already fine..
     
        if (CS_countr_q==4'd2) begin
          CS_d = 1'b0;
          CS_countr_d=4'd0;
        end else begin
          CS_countr_d=CS_countr_q+1'b1;
        end


        if (new_data==1'b1) begin
          state_d=TRIG_WAIT_TO_GEN_START;
          CS_d=1'b1;
          CS_countr_d=4'd0;
          // start_signal_d=1'b1;

            // addr_d=4'd9; // reset all registers, NEW measurement, generate TRIG from TDC.
            // start_d=1'b1; // start should be after addr already fine..
        end
    
      end



      TRIG_WAIT_TO_GEN_START: begin
        // CS_d=1'b1;

        if (tdc_trig==1'b1) begin

          if (CS_countr_q==4'd2) begin
            start_signal_d=1'b1;
            CS_countr_d=4'd0;
            stop_signal_d=1'b0;
            state_d=STOP_WAIT;
          end else begin
            CS_countr_d=CS_countr_q+1'b1;
          end

        end

      end






      STOP_WAIT: begin
          start_signal_d=1'b0;

          if (CS_countr_q==4'd15) begin
            stop_signal_d=1'b1;
            state_d=IDLE;
          end else begin
            CS_countr_d=CS_countr_q+1'b1;
          end



      end





























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
    addr_q <= addr_d;
    CS_q <= CS_d;
    CS_countr_q <= CS_countr_d;
    enable_q <= enable_d;
    start_q <= start_d;
    start_signal_q <= start_signal_d;
    stop_signal_q <= stop_signal_d;
  end
 
endmodule