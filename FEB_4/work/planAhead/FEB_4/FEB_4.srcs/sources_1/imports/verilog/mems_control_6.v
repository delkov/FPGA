module mems_control_6 (
    // INPUT
    input clk,
    input rst,
    input pause,
    input mems_SPI_busy,
    input mems_soft_reset,
    input new_line_FIFO_done,
    input new_frame_FIFO_done,
    input go_home,

    // OUTPUT
    output mems_SPI_start,
    output [23:0] data_mosi,
    output new_line,
    output new_frame
  );
  
  reg new_line_d, new_line_q;//=1'b0;
  reg new_frame_d, new_frame_q;//=1'b0;
  
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


  mems_rom_17 mems_rom (
  // INPUT
  .rst(rst),
  .clk(clk),
  .addr(addr_q),
  .go_home(go_home),
  // OUTPUT
  .data(data_mosi),
  .rom_scan_is_done(rom_scan_is_done)
  );


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
                    // if (addr_q==16'd12800) begin
                         addr_d = 16'd8;  
                    end else begin
                    
if (addr_q == 16'd360 || addr_q==16'd5160) begin // 6495 no overflow at all1! 6490 also no overf.


// if (addr_q == 16'd164) begin // 6495 no overflow at all1! 6490 also no overf.

                        // if (addr_q == 16'd164 || addr_q == 16'd4964) begin // || addr_q==16'd4941) begin // 6495 no overflow at all1! 6490 also no overf.

                            new_frame_d = 1'b1;
                        end else 

if (addr_q == 16'd360 || addr_q == 16'd1320 || addr_q == 16'd2280 || addr_q == 16'd3240 || addr_q == 16'd4200 || addr_q == 16'd5160 || addr_q == 16'd6120 || addr_q == 16'd7080 || addr_q == 16'd8040 || addr_q == 16'd9000 || addr_q == 16'd840 || addr_q == 16'd1800 || addr_q == 16'd2760 || addr_q == 16'd3720 || addr_q == 16'd4680 || addr_q == 16'd5640 || addr_q == 16'd6600 || addr_q == 16'd7560 || addr_q == 16'd8520 || addr_q==16'd9480) begin
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