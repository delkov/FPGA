module mems_control (
    // INPUT
    input clk,
    input rst,
    input pause,
    input mems_SPI_busy,
    input mems_soft_reset,
    input new_line_FIFO_done,
    input new_frame_FIFO_done,

    // OUTPUT
    output mems_SPI_start,
    output [23:0] data_mosi,
    output new_line,
    output new_frame
  );
  
  reg new_line_d, new_line_q=1'b0;
  reg new_frame_d, new_frame_q=1'b0;
  
  assign mems_SPI_start=mems_SPI_start_q;

  assign new_line = new_line_q;
  assign new_frame = new_frame_q;
  
  localparam STATE_SIZE = 2;
  localparam IDLE = 2'd0,
    SOFTWARE_RESET = 2'd1,
    VREF_SETUP = 2'd2,
    SET_CHANNEL = 2'd3;
 
  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [15:0] addr_d, addr_q;
  reg mems_SPI_start_d, mems_SPI_start_q; 

  reg play_d, play_q;
  wire rom_scan_is_done;


  mems_rom mems_rom (
  .rst(rst),
  .clk(clk),
  .addr(addr_q),
  .data(data_mosi),
  .rom_scan_is_done(rom_scan_is_done)
  );


  always @(*) begin

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


    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    play_d = play_q;

    case (state_q)
      IDLE: begin
        addr_d = 4'b0;
        mems_SPI_start_d=1'b0;
        if (mems_soft_reset==1'b1) begin
          state_d = SOFTWARE_RESET;
          mems_SPI_start_d=1'b1;
        end
      end // IDLE

      SOFTWARE_RESET: begin
        mems_SPI_start_d=1'b0;
        if (!mems_SPI_busy && mems_SPI_start_q == 1'b0) begin 
          addr_d=addr_q+1'b1;
          state_d = VREF_SETUP;
          mems_SPI_start_d = 1'b1;
        end
      end // SOFTWARE_RESET

      VREF_SETUP: begin // we hav problem with DAC, change its ref voltage from external to internal and vice versa -> have to send command for external one all time.
        mems_SPI_start_d=1'b0;
        if (!mems_SPI_busy && mems_SPI_start_q == 1'b0) begin 
          addr_d = addr_q + 1'b1; // will be 2 in SET_CHANNEL
          state_d = SET_CHANNEL;
          mems_SPI_start_d = 1'b1;
        end
      end // VREF_SETUP

      SET_CHANNEL: begin
                play_d=1'b0;
                mems_SPI_start_d = 1'b0;

                if ((!mems_SPI_busy && mems_SPI_start_q == 1'b0) && pause==1'b0) begin 
                    mems_SPI_start_d = 1'b1;    

                    // begin from the beginning if end reached.         
                    if (rom_scan_is_done==1'b1) begin
                         addr_d=16'd8;  
                       end else begin
                         addr_d = addr_q+1'b1;
                    end

//                     // check new_line conditions
if (addr_q == 16'd64 || addr_q == 16'd448 || addr_q == 16'd832 || addr_q == 16'd1216 || addr_q == 16'd1600 || addr_q == 16'd1984 || addr_q == 16'd2368 || addr_q == 16'd2752 || addr_q == 16'd3136 || addr_q == 16'd3520 || addr_q == 16'd3904 || addr_q == 16'd4288 || addr_q == 16'd4672 || addr_q == 16'd5056 || addr_q == 16'd5440 || addr_q == 16'd5824 || addr_q == 16'd6208 || addr_q == 16'd6592 || addr_q == 16'd6976 || addr_q == 16'd7360 || addr_q == 16'd7744 || addr_q == 16'd8128 || addr_q == 16'd8512 || addr_q == 16'd8896 || addr_q == 16'd9280 || addr_q == 16'd9664 || addr_q == 16'd10048 || addr_q == 16'd10432 || addr_q == 16'd10816 || addr_q == 16'd11200 || addr_q == 16'd11584 || addr_q == 16'd11968 || addr_q == 16'd12352 || addr_q == 16'd12736 || addr_q == 16'd13120 || addr_q == 16'd13504 || addr_q == 16'd13888 || addr_q == 16'd14272 || addr_q == 16'd14656 || addr_q == 16'd15040 || addr_q == 16'd256 || addr_q == 16'd640 || addr_q == 16'd1024 || addr_q == 16'd1408 || addr_q == 16'd1792 || addr_q == 16'd2176 || addr_q == 16'd2560 || addr_q == 16'd2944 || addr_q == 16'd3328 || addr_q == 16'd3712 || addr_q == 16'd4096 || addr_q == 16'd4480 || addr_q == 16'd4864 || addr_q == 16'd5248 || addr_q == 16'd5632 || addr_q == 16'd6016 || addr_q == 16'd6400 || addr_q == 16'd6784 || addr_q == 16'd7168 || addr_q == 16'd7552 || addr_q == 16'd7936 || addr_q == 16'd8320 || addr_q == 16'd8704 || addr_q == 16'd9088 || addr_q == 16'd9472 || addr_q == 16'd9856 || addr_q == 16'd10240 || addr_q == 16'd10624 || addr_q == 16'd11008 || addr_q == 16'd11392 || addr_q == 16'd11776 || addr_q == 16'd12160 || addr_q == 16'd12544 || addr_q == 16'd12928 || addr_q == 16'd13312 || addr_q == 16'd13696 || addr_q == 16'd14080 || addr_q == 16'd14464 || addr_q == 16'd14848 || addr_q==16'd15267) begin

                        new_line_d=1'b1;
                    end //else begin
                      // new_line_d=1'b0;
//                     // end


                    // check new_frame conditions
if (addr_q == 16'd7680 || addr_q==16'd15360) begin


                      new_frame_d = 1'b1;
                    end //else begin



                end // new data
      end // SET_CHANNEL

      default: state_d = IDLE;
    endcase
  end
 



  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
    end else begin
      state_q <= state_d;
    end

    new_line_q <= new_line_d; 
    new_frame_q <= new_frame_d; 
    
    mems_SPI_start_q <= mems_SPI_start_d;
    addr_q <= addr_d;
    play_q <= play_d;
  end
 
endmodule