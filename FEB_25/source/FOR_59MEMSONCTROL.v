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
    output [16:0] addr
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
  reg [16:0] addr_d, addr_q;
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
                    if (addr_q==17'd75524) begin //75524 fro 59x160 //37444 for 39x120 // 74884 for 39x240
                         addr_d = 17'd8;  
                    end else begin
                    
    if (addr_q == 17'd443 || addr_q==17'd38203) begin


                            new_frame_d = 1'b1;
                    end else 


if (addr_q == 17'd443 || addr_q == 17'd1723 || addr_q == 17'd3003 || addr_q == 17'd4283 || addr_q == 17'd5563 || addr_q == 17'd6843 || addr_q == 17'd8123 || addr_q == 17'd9403 || addr_q == 17'd10683 || addr_q == 17'd11963 || addr_q == 17'd13243 || addr_q == 17'd14523 || addr_q == 17'd15803 || addr_q == 17'd17083 || addr_q == 17'd18363 || addr_q == 17'd19643 || addr_q == 17'd20923 || addr_q == 17'd22203 || addr_q == 17'd23483 || addr_q == 17'd24763 || addr_q == 17'd26043 || addr_q == 17'd27323 || addr_q == 17'd28603 || addr_q == 17'd29883 || addr_q == 17'd31163 || addr_q == 17'd32443 || addr_q == 17'd33723 || addr_q == 17'd35003 || addr_q == 17'd36283 || addr_q == 17'd37563 || addr_q == 17'd38843 || addr_q == 17'd40123 || addr_q == 17'd41403 || addr_q == 17'd42683 || addr_q == 17'd43963 || addr_q == 17'd45243 || addr_q == 17'd46523 || addr_q == 17'd47803 || addr_q == 17'd49083 || addr_q == 17'd50363 || addr_q == 17'd51643 || addr_q == 17'd52923 || addr_q == 17'd54203 || addr_q == 17'd55483 || addr_q == 17'd56763 || addr_q == 17'd58043 || addr_q == 17'd59323 || addr_q == 17'd60603 || addr_q == 17'd61883 || addr_q == 17'd63163 || addr_q == 17'd64443 || addr_q == 17'd65723 || addr_q == 17'd67003 || addr_q == 17'd68283 || addr_q == 17'd69563 || addr_q == 17'd70843 || addr_q == 17'd72123 || addr_q == 17'd73403 || addr_q == 17'd74683 || addr_q == 17'd1083 || addr_q == 17'd2363 || addr_q == 17'd3643 || addr_q == 17'd4923 || addr_q == 17'd6203 || addr_q == 17'd7483 || addr_q == 17'd8763 || addr_q == 17'd10043 || addr_q == 17'd11323 || addr_q == 17'd12603 || addr_q == 17'd13883 || addr_q == 17'd15163 || addr_q == 17'd16443 || addr_q == 17'd17723 || addr_q == 17'd19003 || addr_q == 17'd20283 || addr_q == 17'd21563 || addr_q == 17'd22843 || addr_q == 17'd24123 || addr_q == 17'd25403 || addr_q == 17'd26683 || addr_q == 17'd27963 || addr_q == 17'd29243 || addr_q == 17'd30523 || addr_q == 17'd31803 || addr_q == 17'd33083 || addr_q == 17'd34363 || addr_q == 17'd35643 || addr_q == 17'd36923 || addr_q == 17'd38203 || addr_q == 17'd39483 || addr_q == 17'd40763 || addr_q == 17'd42043 || addr_q == 17'd43323 || addr_q == 17'd44603 || addr_q == 17'd45883 || addr_q == 17'd47163 || addr_q == 17'd48443 || addr_q == 17'd49723 || addr_q == 17'd51003 || addr_q == 17'd52283 || addr_q == 17'd53563 || addr_q == 17'd54843 || addr_q == 17'd56123 || addr_q == 17'd57403 || addr_q == 17'd58683 || addr_q == 17'd59963 || addr_q == 17'd61243 || addr_q == 17'd62523 || addr_q == 17'd63803 || addr_q == 17'd65083 || addr_q == 17'd66363 || addr_q == 17'd67643 || addr_q == 17'd68923 || addr_q == 17'd70203 || addr_q == 17'd71483 || addr_q == 17'd72763 || addr_q == 17'd74043 || addr_q==17'd75323) begin


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