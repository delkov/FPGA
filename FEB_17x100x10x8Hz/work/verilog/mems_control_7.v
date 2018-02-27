module mems_control_7 (
    // INPUT
    input clk,
    input rst,
    input pause,
    input mems_SPI_busy,
    input mems_soft_reset,
    input new_line_FIFO_done,
    input new_frame_FIFO_done,
    // input go_home,

    // OUTPUT
    output mems_SPI_start,
    // output [23:0] data_mosi,
    output new_line,
    output new_frame,
    output [15:0] addr
  );
  
  reg new_line_d, new_line_q;//=1'b0;
  reg new_frame_d, new_frame_q;//=1'b0;
  
  assign mems_SPI_start=mems_SPI_start_q;

  assign new_line = new_line_q;
  assign new_frame = new_frame_q;

  assign addr = addr_q;
  
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




  always @(*) begin

    // if (new_line_FIFO_done==1'b1 && new_line_q==1'b1) begin
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
          addr_d = 16'd8;//addr_q + 1'b1; // will be 2 in SET_CHANNEL
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
                    // if (rom_scan_is_done==1'b1) begin
                    


                    if (addr_q==16'd11524) begin
                    // if (addr_q==16'd15844) begin
                         addr_d = 16'd8;  
                    end else begin
                    
// if (addr_q == 16'd623 || addr_q==16'd8623) begin
// if (addr_q == 16'd226 || addr_q==16'd3826) begin
if (addr_q == 16'd540 || addr_q==16'd6300) begin

// if (addr_q == 16'd164) begin // 6495 no overflow at all1! 6490 also no overf.

                        // if (addr_q == 16'd164 || addr_q == 16'd4964) begin // || addr_q==16'd4941) begin // 6495 no overflow at all1! 6490 also no overf.

                            new_frame_d = 1'b1;
                        end else 
// if (addr_q == 16'd562 || addr_q == 16'd2322 || addr_q == 16'd4082 || addr_q == 16'd5842 || addr_q == 16'd7602 || addr_q == 16'd1442 || addr_q == 16'd3202 || addr_q == 16'd4962 || addr_q == 16'd6722 || addr_q==16'd8482) begin
// if (addr_q == 16'd623 || addr_q == 16'd2223 || addr_q == 16'd3823 || addr_q == 16'd5423 || addr_q == 16'd7023 || addr_q == 16'd8623 || addr_q == 16'd10223 || addr_q == 16'd11823 || addr_q == 16'd13423 || addr_q == 16'd15023 || addr_q == 16'd1423 || addr_q == 16'd3023 || addr_q == 16'd4623 || addr_q == 16'd6223 || addr_q == 16'd7823 || addr_q == 16'd9423 || addr_q == 16'd11023 || addr_q == 16'd12623 || addr_q == 16'd14223 || addr_q==16'd15823) begin





// if (addr_q == 16'd436 || addr_q == 16'd1716 || addr_q == 16'd2996 || addr_q == 16'd4276 || addr_q == 16'd5556 || addr_q == 16'd6836 || addr_q == 16'd8116 || addr_q == 16'd9396 || addr_q == 16'd10676 || addr_q == 16'd1076 || addr_q == 16'd2356 || addr_q == 16'd3636 || addr_q == 16'd4916 || addr_q == 16'd6196 || addr_q == 16'd7476 || addr_q == 16'd8756 || addr_q == 16'd10036 || addr_q==16'd11316) begin
// if (addr_q == 16'd528 || addr_q == 16'd1808 || addr_q == 16'd3088 || addr_q == 16'd4368 || addr_q == 16'd5648 || addr_q == 16'd6928 || addr_q == 16'd8208 || addr_q == 16'd9488 || addr_q == 16'd10768 || addr_q == 16'd1168 || addr_q == 16'd2448 || addr_q == 16'd3728 || addr_q == 16'd5008 || addr_q == 16'd6288 || addr_q == 16'd7568 || addr_q == 16'd8848 || addr_q == 16'd10128 || addr_q==16'd11408) begin
if (addr_q == 16'd540 || addr_q == 16'd1820 || addr_q == 16'd3100 || addr_q == 16'd4380 || addr_q == 16'd5660 || addr_q == 16'd6940 || addr_q == 16'd8220 || addr_q == 16'd9500 || addr_q == 16'd10780 || addr_q == 16'd1180 || addr_q == 16'd2460 || addr_q == 16'd3740 || addr_q == 16'd5020 || addr_q == 16'd6300 || addr_q == 16'd7580 || addr_q == 16'd8860 || addr_q == 16'd10140 || addr_q==16'd11420) begin
          


              new_line_d=1'b1;
                end 






                      addr_d = addr_q+1'b1;
                    end // if rom_scan_is_done








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