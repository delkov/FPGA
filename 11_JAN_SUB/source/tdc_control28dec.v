module tdc_control (
    input clk,
    input rst,
    output [7:0] tx_data,
    output reg new_tx_data,
    input tx_busy,
    input [7:0] rx_data,
    input new_rx_data,
    input new_data,
    output [15:0] tdc_data_in,
    output enable,
    output start,
    output start_signal,
    output stop_signal,
    input tdc_trig,
    input w_TDC_INTB,
    output CS_END
  );
 
  localparam STATE_SIZE = 4;
  localparam IDLE = 4'd0,
    SOFTWARE_RESET = 4'd1,
    TRIG_GENERATE = 4'd2,
    TRIG_WAIT_TO_GEN_START = 4'd3,
    STOP_WAIT = 4'd4,
    DELAY = 4'd5,
    INTB_WAIT = 4'd6,
    READ_TIME1 = 4'd7,
    READ_CALIB1 = 4'd8,
    READ_CALIB2 = 4'd9;

  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [5:0] addr_d, addr_q;
  reg [7:0] delta_A_d;
  reg [7:0] delta_A_q = 8'd21;
  reg [7:0] delta_B_d;
  reg [7:0] delta_B_q = 8'd141;
  reg enable_d;
  reg enable_q = 1'b0;
  reg start_d, start_q;
  reg stop_signal_d, stop_signal_q;
  reg start_signal_d, start_signal_q;
  reg [3:0] CS_countr_d,CS_countr_q;
  reg [3:0] Byte_countr_d,Byte_countr_q;
   
  // reg CS_BEGIN_d, CS_BEGIN_q;
  reg CS_END_d, CS_END_q;

  assign enable = enable_q;
  assign start = start_q;
  assign start_signal = start_signal_q;
  assign stop_signal = stop_signal_q;
  // assign CS_BEGIN = CS_BEGIN_q;
  assign CS_END = CS_END_q;


  tdc_rom tdc_rom (
  .clk(clk),
  .addr(addr_q),
  .data(tdc_data_in)
  );
 
  always @(*) begin
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    new_tx_data = 1'b0;
    CS_countr_d=CS_countr_q;
    Byte_countr_d=Byte_countr_q;
    delta_A_d = delta_A_q;
    delta_B_d = delta_B_q;
    enable_d=enable_q;
    start_d=start_q;
    start_signal_d=start_signal_q;
    stop_signal_d=stop_signal_q;
    CS_END_d=CS_END_q;
    // CS_BEGIN_d=CS_BEGIN_q;


    if (new_rx_data && rx_data == "d") begin
        enable_d=1'b0;
    end

    if (new_rx_data && rx_data == "u") begin
        enable_d=1'b1;
    end

    if (new_rx_data && rx_data == "i") begin
        state_d=IDLE;
    end


    case (state_q)
      IDLE: begin
        addr_d = 6'd0;
        start_d=1'b0;
        stop_signal_d=1'b0;
        start_signal_d=1'b0;
        Byte_countr_d=4'd1;
        CS_countr_d=4'd0;

        if (new_rx_data && rx_data == "r") begin
          state_d = SOFTWARE_RESET;
          Byte_countr_d=4'd1;
          start_d=1'b1;
          CS_END_d=1'b0;
        end

        if (new_rx_data && rx_data == "h") begin
          state_d = DELAY;
        end

      end // IDLE

      // AFTER POWER ON, SETUP
      SOFTWARE_RESET: begin
            start_d=1'b0; 
            if (new_data==1'b1) begin
                if (Byte_countr_q==4'd1) begin
                  Byte_countr_d=4'd0; // needed since CS every 2 package
                  CS_END_d=1'b1;
                end else begin
                  CS_END_d=1'b0;
                  Byte_countr_d = Byte_countr_q+1;
                end

              if (addr_q == 6'd17) begin
                state_d = DELAY;
                CS_countr_d = 4'd1;
                start_d=1'b0;
              end else begin
                addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
                start_d=1'b1;
              end
            end // new data if
      end // SOFT_RESET end


      // MEASUREMENT CYCLE BEGIN // 
      DELAY: begin
          addr_d=6'd18; // reset all registers, NEW measurement, generate TRIG from TDC.
          if (CS_countr_q == 4'd15) begin
            start_d=1'b1;
            Byte_countr_d=4'd1;
            state_d = TRIG_GENERATE;
          end else begin
            CS_countr_d = CS_countr_q + 1'b1;
          end
      end

      TRIG_GENERATE: begin
        start_d=1'b0; // start should be after addr already fine..
        if (new_data==1'b1) begin
          if (Byte_countr_q==4'd1) begin
            Byte_countr_d=4'd0;
            CS_END_d=1'b1;
          end else begin
            CS_END_d=1'b0;
            Byte_countr_d = Byte_countr_q+1;
          end

          if (addr_q == 6'd19) begin
            state_d = TRIG_WAIT_TO_GEN_START;
            CS_countr_d = 4'd0;
          end else begin
            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
          end  
        end  // new_data   
      end // TRIG_GENERATE

      TRIG_WAIT_TO_GEN_START: begin
        if (tdc_trig==1'b1) begin // trig will be long time up, so 6 clocks is fine
          if (CS_countr_q==4'd6) begin
            start_signal_d=1'b1;
            CS_countr_d=4'd0;
            stop_signal_d=1'b0;
            state_d=STOP_WAIT;
          end else begin
            CS_countr_d=CS_countr_q+1'b1;
          end
        end // new data
      end

      STOP_WAIT: begin
          if (CS_countr_q==4'd2) begin
            start_signal_d=1'b0;
          end

          if (CS_countr_q==4'd13) begin
            stop_signal_d=1'b1;
            state_d=INTB_WAIT;
            CS_countr_d=4'd0;
          end else begin
            CS_countr_d=CS_countr_q+1'b1;
          end
      end

      INTB_WAIT: begin
          if (CS_countr_q==4'd2) begin
            stop_signal_d=1'b0;
          end else begin
            CS_countr_d=CS_countr_q+1'b1;
          end

          if (w_TDC_INTB == 1'b0) begin // IF INTB LOW, PROCESSING OF MEASUREMENT IS READY
            state_d = READ_TIME1;
            addr_d = 6'd20;
            start_d = 1'b1;
            Byte_countr_d = 1'b1;
          end
      end

      READ_TIME1: begin
        start_d=1'b0; // start should be after addr already fine..
        if (new_data==1'b1) begin
          // set wr_en -> join to the FIFO (buf_in) module outside
          if (Byte_countr_q==4'd3) begin // if 3 -> end will be after 4th package
            Byte_countr_d=4'd1;
            CS_END_d=1'b1;
          end else begin
            CS_END_d=1'b0;
            Byte_countr_d = Byte_countr_q+1;
          end

          if (addr_q == 6'd23) begin
            state_d = READ_CALIB1;
            start_d = 1'b1;
            addr_d = 6'd24;
            Byte_countr_d = 1'b1;
          end else begin
            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
          end  
        end  // new_data   
      end // READ_TIME

      READ_CALIB1: begin
        start_d=1'b0; // start should be after addr already fine..
        if (new_data==1'b1) begin
          if (Byte_countr_q==4'd3) begin
            Byte_countr_d=4'd1;
            CS_END_d=1'b1;
          end else begin
            CS_END_d=1'b0;
            Byte_countr_d = Byte_countr_q+1;
          end

          if (addr_q == 6'd27) begin
            state_d = READ_CALIB2;
            addr_d = 6'd28;
            start_d = 1'b1;
            Byte_countr_d = 1'b1;
          end else begin
            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
          end  
        end  // new_data   
      end // READ_CALIB1


      READ_CALIB2: begin
        start_d=1'b0; // start should be after addr already fine..
        if (new_data==1'b1) begin
          if (Byte_countr_q==4'd3) begin
            Byte_countr_d=4'd1;
            CS_END_d=1'b1;
          end else begin
            CS_END_d=1'b0;
            Byte_countr_d = Byte_countr_q+1;
          end

          if (addr_q == 6'd31) begin // overflow since 32==0
            state_d = DELAY;
            addr_d = 6'd0;
            start_d = 1'b0;
            CS_countr_d = 4'd0;
            // Byte_countr_d = 1'b1;
          end else begin
            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
          end  
        end  // new_data   
      end // READ_CALIB2


      // MEASUREMENT CYCLE END //



      default: state_d = IDLE;
    endcase
  
  end // always
 
  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
    end else begin
      state_q <= state_d;
      // ch_state_q <= ch_state_d;
    end

    delta_B_q <= delta_B_d; 
    delta_A_q <= delta_A_d; 
    addr_q <= addr_d;
    CS_countr_q <= CS_countr_d;
    Byte_countr_q <= Byte_countr_d;
    // CS_BEGIN_q <= CS_BEGIN_d;
    CS_END_q <= CS_END_d;
    enable_q <= enable_d;
    start_q <= start_d;
    start_signal_q <= start_signal_d;
    stop_signal_q <= stop_signal_d;
  end
 
endmodule