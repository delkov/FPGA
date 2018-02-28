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
                    if (addr_q==16'd8648) begin
                         addr_d = 16'd8;  
                    end else begin
                    
    if (addr_q == 16'd463 || addr_q==16'd7183) begin


                            new_frame_d = 1'b1;
                    end else 



if (addr_q == 16'd463 || addr_q == 16'd1423) begin // || addr_q == 16'd2383 || addr_q == 16'd3343 || addr_q == 16'd4303 || addr_q == 16'd5263 || addr_q == 16'd6223 || addr_q == 16'd7183 || addr_q == 16'd8143 || addr_q == 16'd9103 || addr_q == 16'd10063 || addr_q == 16'd11023 || addr_q == 16'd11983 || addr_q == 16'd12943 || addr_q == 16'd13903 || addr_q == 16'd14863 || addr_q == 16'd15823 || addr_q == 16'd16783 || addr_q == 16'd17743 || addr_q == 16'd18703 || addr_q == 16'd19663 || addr_q == 16'd20623 || addr_q == 16'd21583 || addr_q == 16'd22543 || addr_q == 16'd23503 || addr_q == 16'd24463 || addr_q == 16'd25423 || addr_q == 16'd26383 || addr_q == 16'd27343 || addr_q == 16'd28303 || addr_q == 16'd29263 || addr_q == 16'd30223 || addr_q == 16'd31183 || addr_q == 16'd32143 || addr_q == 16'd33103 || addr_q == 16'd34063 || addr_q == 16'd35023 || addr_q == 16'd35983 || addr_q == 16'd36943 || addr_q == 16'd943 || addr_q == 16'd1903 || addr_q == 16'd2863 || addr_q == 16'd3823 || addr_q == 16'd4783 || addr_q == 16'd5743 || addr_q == 16'd6703 || addr_q == 16'd7663 || addr_q == 16'd8623 || addr_q == 16'd9583 || addr_q == 16'd10543 || addr_q == 16'd11503 || addr_q == 16'd12463 || addr_q == 16'd13423 || addr_q == 16'd14383 || addr_q == 16'd15343 || addr_q == 16'd16303 || addr_q == 16'd17263 || addr_q == 16'd18223 || addr_q == 16'd19183 || addr_q == 16'd20143 || addr_q == 16'd21103 || addr_q == 16'd22063 || addr_q == 16'd23023 || addr_q == 16'd23983 || addr_q == 16'd24943 || addr_q == 16'd25903 || addr_q == 16'd26863 || addr_q == 16'd27823 || addr_q == 16'd28783 || addr_q == 16'd29743 || addr_q == 16'd30703 || addr_q == 16'd31663 || addr_q == 16'd32623 || addr_q == 16'd33583 || addr_q == 16'd34543 || addr_q == 16'd35503 || addr_q == 16'd36463 || addr_q==16'd37423) begin

                        new_line_d=1'b1;
                   end 






                      addr_d = addr_q+1'b1;
                end // if end is reached





                end // new data
      end // SET_CHANNEL

      default: state_d = IDLE;
    endcase
  end // always
 



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