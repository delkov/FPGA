module mems_control_8 (
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
    output [17:0] addr
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
  reg [17:0] addr_d, addr_q;
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
          addr_d = 17'd8;//addr_q + 1'b1; // will be 2 in SET_CHANNEL
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
                    if (addr_q==18'd66148) begin //75524 fro 59x160 //37444 for 39x120 // 74884 for 39x240
                         addr_d = 17'd8;  
                    end else begin
                    
    if (addr_q == 17'd547 || addr_q==17'd33611) begin


                            new_frame_d = 1'b1;
                    end else 


if (addr_q == 18'd547 || addr_q == 18'd2243 || addr_q == 18'd3939 || addr_q == 18'd5635 || addr_q == 18'd7331 || addr_q == 18'd9027 || addr_q == 18'd10723 || addr_q == 18'd12419 || addr_q == 18'd14115 || addr_q == 18'd15811 || addr_q == 18'd17507 || addr_q == 18'd19203 || addr_q == 18'd20899 || addr_q == 18'd22595 || addr_q == 18'd24291 || addr_q == 18'd25987 || addr_q == 18'd27683 || addr_q == 18'd29379 || addr_q == 18'd31075 || addr_q == 18'd32771 || addr_q == 18'd34459 || addr_q == 18'd36155 || addr_q == 18'd37851 || addr_q == 18'd39547 || addr_q == 18'd41243 || addr_q == 18'd42939 || addr_q == 18'd44635 || addr_q == 18'd46331 || addr_q == 18'd48027 || addr_q == 18'd49723 || addr_q == 18'd51419 || addr_q == 18'd53115 || addr_q == 18'd54811 || addr_q == 18'd56507 || addr_q == 18'd58203 || addr_q == 18'd59899 || addr_q == 18'd61595 || addr_q == 18'd63291 || addr_q == 18'd64987 || addr_q == 18'd1395 || addr_q == 18'd3091 || addr_q == 18'd4787 || addr_q == 18'd6483 || addr_q == 18'd8179 || addr_q == 18'd9875 || addr_q == 18'd11571 || addr_q == 18'd13267 || addr_q == 18'd14963 || addr_q == 18'd16659 || addr_q == 18'd18355 || addr_q == 18'd20051 || addr_q == 18'd21747 || addr_q == 18'd23443 || addr_q == 18'd25139 || addr_q == 18'd26835 || addr_q == 18'd28531 || addr_q == 18'd30227 || addr_q == 18'd31923 || addr_q == 18'd33611 || addr_q == 18'd35307 || addr_q == 18'd37003 || addr_q == 18'd38699 || addr_q == 18'd40395 || addr_q == 18'd42091 || addr_q == 18'd43787 || addr_q == 18'd45483 || addr_q == 18'd47179 || addr_q == 18'd48875 || addr_q == 18'd50571 || addr_q == 18'd52267 || addr_q == 18'd53963 || addr_q == 18'd55659 || addr_q == 18'd57355 || addr_q == 18'd59051 || addr_q == 18'd60747 || addr_q == 18'd62443 || addr_q == 18'd64139 || addr_q==18'd65835) begin

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