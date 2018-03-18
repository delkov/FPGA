 module tdc_control_6 #(
    parameter SHOOTING_PARAM = 5000000
    )(
    // INPUT
    input clk,
    input rst,
    // input tdc_SPI_new_data, //used for SPI debugging
    input [7:0] tdc_MISO,
    input tdc_soft_reset,
    input TDC_INTB,
    input tdc_SPI_busy,
    input fifo_writing_done, // FIFO feedback
    input [1:0] mode,
    input pause,
    input exit,

    // OUTPUT
    output start_signal,
    output CS_END,
    output start, // for start SPI
    output [7:0] tdc_MOSI,
    output w_wr_en, // allow write to FIFO
    output [31:0] data_TO_FIFO
    // output reg CHECK_DATA // debug bad values from TDC
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
    CALCULATE_CALIB_DIFF = 4'd10,
    WRITE_FIFO = 4'd11,
    WAIT_FIFO_WRITING = 4'd12,
    CHECK_DATA = 4'd13,
    PAUSE=4'd14;


  reg [15:0] REG_SHOOTING_PARAM;

  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [5:0] addr_d, addr_q;
  reg start_d, start_q;
  reg start_signal_d, start_signal_q;
  reg [15:0] CS_countr_d,CS_countr_q;
  reg [3:0] Byte_countr_d,Byte_countr_q;
  reg CS_END_d, CS_END_q; // SPI
  // data from TDC
  reg [15:0] time1_d,time1_q;
  reg [15:0] calib1_d,calib1_q;
  reg [15:0] calib2_d,calib2_q;

  reg [15:0] calib_diff_d,calib_diff_q; // calib2-calib1
  
  reg [31:0] data_TO_FIFO_d, data_TO_FIFO_q; // combine data from TDC, will be sent to FIFO
  // end data from tdc
  reg wr_en_d, wr_en_q;

  assign w_wr_en = wr_en_q;
  assign start = start_q;
  assign start_signal = start_signal_q;
  assign data_TO_FIFO = data_TO_FIFO_q;
  assign CS_END = CS_END_q;

  // data for initialiaztion and so on..
  tdc_rom_13 tdc_rom (
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
    calib_diff_d = calib_diff_q;
    data_TO_FIFO_d = data_TO_FIFO_q;
    wr_en_d = wr_en_q;


    case(mode)
      2'd0: begin
        REG_SHOOTING_PARAM=16'd5036;
      end
      2'd1: begin
        REG_SHOOTING_PARAM=16'd5065;
      end
      2'd2: begin
        REG_SHOOTING_PARAM=16'd5064;
      end
      default:begin
        REG_SHOOTING_PARAM=16'd5064;
      end
    endcase



    if (exit==1'b1) begin
      state_d=IDLE;
    end

    if (pause==1'b1) begin
      state_d=PAUSE;
    end


    // to make shooting uniform, so outside the case
    if (fifo_writing_done==1'b1) begin //s1_fifi_writing e.g
      wr_en_d = 1'b0;  // s1_wr_en e.g
    end


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
          //wr_en_d = 1'b0; UNCOMMENT -- FOR 1 SUB IS BEST!
          addr_d=6'd18; // reset all registers, NEW measurement, generate TRIG from TDC.
          CS_countr_d = CS_countr_q + 1'b1; // increase each time..
          if (CS_countr_q == REG_SHOOTING_PARAM) begin // how often to shoot
            time1_d=16'b0;
            calib1_d=16'b0;
            calib2_d=16'b0;

            wr_en_d = 1'b0;
            start_d=1'b1;
            Byte_countr_d=4'd1;
            state_d = TRIG_GENERATE;
            CS_countr_d=16'd0;
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
          CS_countr_d=CS_countr_q+1'b1;
          if (CS_countr_q==10'd5) begin // 100ns delay instead of trig waiting
            start_signal_d=1'b1;
            CS_countr_d=4'd0;
            state_d=START_PULSE;
          end //else begin
      end
      START_PULSE: begin // this case  isneeded only to make start 60ns.
          CS_countr_d=CS_countr_q+1'b1;
          if (CS_countr_q==4'd3) begin // start duration is 60ns
            start_signal_d=1'b0;
            state_d=INTB_WAIT;
            CS_countr_d=4'd0;
          end //else begin
      end
      INTB_WAIT: begin
          CS_countr_d = CS_countr_q+1'b1;
          // if (TDC_INTB == 1'b0 && CS_countr_q==16'd199) begin // second codition to make it unformaly.. somtimes INTB faster, sometimes slower.
          if (CS_countr_q==16'd149) begin // second codition to make it unformaly.. somtimes INTB faster, sometimes slower.
            state_d = READ_TIME1;
            addr_d = 6'd20;
            start_d = 1'b1;
            Byte_countr_d = 1'b1;
          end
          // wrong measurement (NOT OVERFLOW, after overflow INTB down!! e.g INTB broken..). SHOULD BE BIGGER THAN OVERFLOW VALUE (see tdc_rom, not 840ns) No more signal than 2us (16'd100) -- 1.8us is max for TDC INTB..
          // if (CS_countr_q ==16'd100) begin
          //   state_d = DELAY;
          //   CS_countr_d=16'd0;
          // end //else begin
      end
      // BYTE_CONTER can be changed to addr_q case
      READ_TIME1: begin
        start_d=1'b0; // start should be after addr already fine.. previous addr already passed.
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
            time1_d = time1_q << 8 | tdc_MISO;
          end// else begin

          addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
          start_d = 1'b1;
          if (addr_q == 6'd23) begin
              state_d = READ_CALIB1;
              addr_d = 6'd24;
              Byte_countr_d = 1'b1;
          end// else begin
        end  // tdc_SPI_new_data   
      end // READ_TIME
      READ_CALIB1: begin
        // e.g NO STOP SIGNAL CASE..
        // PREVENT ZEROS! BUT SIGNAL willbe really weak.. since no time for charging of capacitor
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
            calib1_d = calib1_q << 8 | tdc_MISO;
          end

          start_d = 1'b1;
          addr_d = addr_q + 1'b1; // 1 or 2 cycles beetwen addr and data, so deep data_in into in master_spi
          if (addr_q == 6'd27) begin
            state_d = READ_CALIB2;
            addr_d = 6'd28;
            Byte_countr_d = 1'b1;
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
            calib2_d = calib2_q << 8 | tdc_MISO;
          end

          if (addr_q == 6'd31) begin // overflow since 32==0
            state_d = CHECK_DATA;
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
      CHECK_DATA: begin
        state_d=WRITE_FIFO;
        if (time1_q == 16'h0000) begin
          time1_d=16'd1488;
          calib1_d=16'd1000;
          calib2_d=16'd5000;
        end //else begin
      end  // CHECK_DATA
      WRITE_FIFO: begin
        data_TO_FIFO_d = {calib2_q-calib1_q, time1_q}; // 32bit
        wr_en_d=1'b1;
        state_d=DELAY;
        // CS_countr_d=16'd0;
      end  // WRITE_FIFO
      // ALREADY SENT DATA, WAIT UNTIL it will be written to FIFO
   
      // WAIT_FIFO_WRITING: begin
      //   CS_countr_d=16'd0;
      //   // to make shoots uniform, so outside the case
      //   if (fifo_writing_done==1'b1) begin //s1_fifi_writing e.g
      //     state_d=DELAY; // VERY IMPORTANT, otherwise will be meandr wr_en
      //     wr_en_d = 1'b0;  // s1_wr_en e.g
      //   end
      // end  // WAIT_FIFO_WRITING





      // MEASUREMENT CYCLE END //
      default: state_d = IDLE;
    endcase


  end // always
 




  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
    // end else if (pause) begin
    //   state_q <= PAUSE;
    end else begin
      state_q <= state_d;
    end

    start_signal_q <= start_signal_d;
    data_TO_FIFO_q <= data_TO_FIFO_d;
    wr_en_q <= wr_en_d;
    time1_q <= time1_d; 
    calib1_q <= calib1_d; 
    calib2_q <= calib2_d; 
    calib_diff_q <= calib_diff_d; 
    addr_q <= addr_d;
    CS_countr_q <= CS_countr_d;
    Byte_countr_q <= Byte_countr_d;
    CS_END_q <= CS_END_d;
    start_q <= start_d;
  end

endmodule