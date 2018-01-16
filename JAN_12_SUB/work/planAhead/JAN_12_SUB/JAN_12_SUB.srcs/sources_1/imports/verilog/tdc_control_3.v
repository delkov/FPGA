 module tdc_control_3 #(
    parameter SHOOTING_PARAM = 5000000
    )(
    // INPUT
    input clk,
    input rst,
    // input tdc_SPI_new_data, //used for SPI
    input [7:0] tdc_MISO,
    input tdc_soft_reset,
    input TDC_INTB,
    input tdc_SPI_busy,
    input fifo_writing_done,
    input pause,

    // OUTPUT
    output start_signal,
    output CS_END,
    output start, // for start SPI
    output [7:0] tdc_MOSI,
    output w_wr_en, // allow write to FIFO
    output [47:0] data_TO_FIFO
  );
 
  localparam STATE_SIZE = 4,
    IDLE = 4'd0,
    SOFTWARE_RESET = 4'd1,
    TRIG_GENERATE = 4'd2,
    TRIG_WAIT_TO_GEN_START = 4'd3,
    START_PULSE = 4'd4,
    DELAY = 4'd5,
    INTB_WAIT = 4'd6,
    READ_TIME1 = 4'd7,
    READ_CALIB1 = 4'd8,
    READ_CALIB2 = 4'd9,
    // CHECK_NEW_LINE_AND_FRAME = 4'd10,
    WRITE_FIFO = 4'd11,
    WAIT_FIFO_WRITING = 4'd12,
    PAUSE=4'd13;

  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [5:0] addr_d, addr_q;
  reg start_d, start_q;
  reg start_signal_d, start_signal_q;
  reg [29:0] CS_countr_d,CS_countr_q;
  reg [3:0] Byte_countr_d,Byte_countr_q;
  reg CS_END_d, CS_END_q; // SPI
  // data from TDC
  reg [15:0] time1_d,time1_q;
  reg [15:0] calib1_d,calib1_q;
  reg [15:0] calib2_d,calib2_q;
  reg [47:0] data_TO_FIFO_d, data_TO_FIFO_q; // combine data from TDC, will be sent to FIFO
  // end data from tdc
  reg wr_en_d, wr_en_q;

  assign w_wr_en = wr_en_q;

  assign start = start_q;
  assign start_signal = start_signal_q;
  assign data_TO_FIFO = data_TO_FIFO_q;
  assign CS_END = CS_END_q;

  // data for initialiaztion and so on..
  tdc_rom_15 tdc_rom (
  .clk(clk),
  .addr(addr_q),
  .data(tdc_MOSI)
  );
 
  always @(*) begin
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    CS_countr_d=CS_countr_q;
    Byte_countr_d=Byte_countr_q;
    start_d=start_q;
    start_signal_d=start_signal_q;
    CS_END_d=CS_END_q;
    time1_d = time1_q;
    calib1_d = calib1_q;
    calib2_d = calib2_q;
    data_TO_FIFO_d = data_TO_FIFO_q;
    wr_en_d = wr_en_q;

    case (state_q)
      PAUSE: begin
        if (pause==1'b0) begin
          state_d=DELAY;
        end
      end // PAUSE

      IDLE: begin
        addr_d = 6'd0;
        start_d=1'b0;
        start_signal_d=1'b0;
        Byte_countr_d=4'd1;
        CS_countr_d=4'd0;

        if (tdc_soft_reset) begin
          state_d = SOFTWARE_RESET;
          Byte_countr_d=4'd1;
          start_d=1'b1;
          CS_END_d=1'b0;
        end
      end // IDLE

      // AFTER POWER ON, SETUP
      SOFTWARE_RESET: begin
            start_d=1'b0; 
            if (!tdc_SPI_busy && start_q == 1'b0) begin // start_q is nedded, to prevent immediately next cycle
                // special CS manipulation
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
          CS_countr_d = CS_countr_q + 1'b1; // increase each time..
          if (CS_countr_q == SHOOTING_PARAM) begin // how often to shoot
            time1_d=16'b0;
            calib1_d=16'b0;
            calib2_d=16'b0;
            start_d=1'b1;
            Byte_countr_d=4'd1;
            state_d = TRIG_GENERATE;
          end else begin
            wr_en_d = 1'b0;
          end
      end // DELAY

      TRIG_GENERATE: begin
        start_d=1'b0; // start should be after addr already fine..
        if (!tdc_SPI_busy && start_q == 1'b0) begin
          // special CS manipulation
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
        end  // tdc_SPI_new_data   
      end // TRIG_GENERATE

      TRIG_WAIT_TO_GEN_START: begin
        // if (tdc_trig==1'b1) begin // actually trig is immediatelly after reset registers! (so we dont have it in hardware)
          if (CS_countr_q==10'd5) begin // 100ns delay instead of trig waiting
            start_signal_d=1'b1;
            CS_countr_d=4'd0;
            state_d=START_PULSE;
          end else begin
            CS_countr_d=CS_countr_q+1'b1;
          end
        // end // tdc_trig
      end

      START_PULSE: begin // this case  isneeded only sto make start 60ns.
          if (CS_countr_q==4'd2) begin // start duration is 60ns
            start_signal_d=1'b0;
            // if (TDC_INTB == 1'b1) begin // check right PIN
            state_d=INTB_WAIT;
            // end
            CS_countr_d=4'd0;
          end else begin
            CS_countr_d=CS_countr_q+1'b1;
          end
      end

      INTB_WAIT: begin
          if (TDC_INTB == 1'b0) begin // IF INTB LOW, PROCESSING OF MEASUREMENT IS READY
            state_d = READ_TIME1;
            addr_d = 6'd20;
            start_d = 1'b1;
            Byte_countr_d = 1'b1;
          end
      end

      // BYTE_CONTER can be changed to addr_q case
      READ_TIME1: begin
        start_d=1'b0; // start should be after addr already fine..
        if (!tdc_SPI_busy && start_q == 1'b0) begin

          // set wr_en -> join to the FIFO (buf_in) module outside
          if (Byte_countr_q==4'd3) begin // if 3 -> end will be after 4th package
            Byte_countr_d=4'd1;
            CS_END_d=1'b1;
          end else begin
            CS_END_d=1'b0;
            Byte_countr_d = Byte_countr_q+1;
          end

          // PREPARE DATA FOR SERIAL
          if (addr_q == 6'd22 || addr_q == 6'd23) begin
            time1_d = time1_q << 8 | tdc_MISO;//{tdc_MISO[0],tdc_MISO[1],tdc_MISO[2],tdc_MISO[3],tdc_MISO[4], tdc_MISO[5],tdc_MISO[6],tdc_MISO[7]};//{tdc_MISO[7],tdc_MISO[6],tdc_MISO[5],tdc_MISO[4],tdc_MISO[3], tdc_MISO[2],tdc_MISO[1],tdc_MISO[0]};
          end// else begin

          if (addr_q == 6'd23) begin
            state_d = READ_CALIB1;
            start_d = 1'b1;
            addr_d = 6'd24;
            Byte_countr_d = 1'b1;
          end else begin
            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
          end  
        end  // tdc_SPI_new_data   
      end // READ_TIME

      READ_CALIB1: begin
        start_d=1'b0; // start should be after addr already fine..
        if (!tdc_SPI_busy && start_q == 1'b0) begin
          // special CS manipulation
          if (Byte_countr_q==4'd3) begin
            Byte_countr_d=4'd1;
            CS_END_d=1'b1;         
          end else begin
            CS_END_d=1'b0;
            Byte_countr_d = Byte_countr_q+1;
          end

          // PREPARE DATA FOR SERIAL
          if (addr_q == 6'd26 || addr_q == 6'd27) begin
            calib1_d = calib1_q << 8 | tdc_MISO;//{tdc_MISO[0],tdc_MISO[1],tdc_MISO[2],tdc_MISO[3],tdc_MISO[4], tdc_MISO[5],tdc_MISO[6],tdc_MISO[7]};//{tdc_MISO[7],tdc_MISO[6],tdc_MISO[5],tdc_MISO[4],tdc_MISO[3], tdc_MISO[2],tdc_MISO[1],tdc_MISO[0]};
          end// else begin

          if (addr_q == 6'd27) begin
            state_d = READ_CALIB2;
            addr_d = 6'd28;
            start_d = 1'b1;
            Byte_countr_d = 1'b1;
          end else begin
            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
          end  
        end  // tdc_SPI_new_data   
      end // READ_CALIB1

      READ_CALIB2: begin
        start_d=1'b0; // start should be after addr already fine..
        if (!tdc_SPI_busy && start_q == 1'b0) begin
          // special CS manipulation
          if (Byte_countr_q==4'd3) begin
            Byte_countr_d=4'd1;
            CS_END_d=1'b1;
          end else begin
            CS_END_d=1'b0;
            Byte_countr_d = Byte_countr_q+1;
          end

          // PREPARE DATA FOR SERIAL
          if (addr_q == 6'd30 || addr_q == 6'd31) begin
            calib2_d = calib2_q << 8 | tdc_MISO;//{tdc_MISO[0],tdc_MISO[1],tdc_MISO[2],tdc_MISO[3],tdc_MISO[4], tdc_MISO[5],tdc_MISO[6],tdc_MISO[7]};//{tdc_MISO[7],tdc_MISO[6],tdc_MISO[5],tdc_MISO[4],tdc_MISO[3], tdc_MISO[2],tdc_MISO[1],tdc_MISO[0]};
          end// else begin

          if (addr_q == 6'd31) begin // overflow since 32==0
            state_d = WRITE_FIFO;
            addr_d = 6'd0;
            start_d = 1'b0;
            CS_countr_d = 4'd0;
            Byte_countr_d = 1'b1;
          end else begin
            addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
            start_d=1'b1;
          end  
        end  // tdc_SPI_new_data   
      end // READ_CALIB2

      WRITE_FIFO: begin
        wr_en_d=1'b1;
        data_TO_FIFO_d = {calib2_q, calib1_q, time1_q};
        state_d=WAIT_FIFO_WRITING;
      end  // WRITE_FIFO


      // ALREADY SENT DATA, WAIT UNTIL it will be written to FIFO
      WAIT_FIFO_WRITING: begin
        if (fifo_writing_done) begin //s1_fifi_writing e.g
          state_d=DELAY; // VERY IMPORTANT, otherwise will be meandr wr_en
          wr_en_d = 1'b0;  // s1_wr_en e.g
        end// else begin
      end  // WAIT_FIFO_WRITING

      // MEASUREMENT CYCLE END //
      default: state_d = IDLE;
    endcase

  end // always
 

  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
    end else if (pause) begin
      state_q <= PAUSE;
    end else begin
      state_q <= state_d;
    end

    start_signal_q <= start_signal_d;
    data_TO_FIFO_q <= data_TO_FIFO_d;
    wr_en_q <= wr_en_d;
    time1_q <= time1_d; 
    calib1_q <= calib1_d; 
    calib2_q <= calib2_d; 
    addr_q <= addr_d;
    CS_countr_q <= CS_countr_d;
    Byte_countr_q <= Byte_countr_d;
    CS_END_q <= CS_END_d;
    start_q <= start_d;
  end
 
endmodule
