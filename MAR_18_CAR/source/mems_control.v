module mems_control (
    // INPUT
    input clk,
    input rst,
    input [1:0] mode,
    // input exit,
    input pause,
    input mems_SPI_busy,
    input mems_soft_reset,
    input new_line_FIFO_done,
    input new_frame_FIFO_done,

    // OUTPUT
    output mems_SPI_start,
    output new_line,
    output new_frame,
    output reversed_frame,
    output [17:0] addr
  );
  
  reg new_line_d, new_line_q;//=1'b0;
  reg new_frame_d, new_frame_q;//=1'b0;
  
  assign mems_SPI_start=mems_SPI_start_q;

  assign new_line = new_line_q;
  assign new_frame = new_frame_q;
  assign reversed_frame = reversed_frame_q;

  assign addr = addr_q;
  
  localparam STATE_SIZE = 2;
  localparam IDLE = 2'd0,
    SOFTWARE_RESET = 2'd1,
    VREF_SETUP = 2'd2,
    SET_CHANNEL = 2'd3;
 
  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [17:0] addr_d, addr_q;
  reg mems_SPI_start_d, mems_SPI_start_q; 
  reg reversed_frame_d,reversed_frame_q;

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

    reversed_frame_d=reversed_frame_q;
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    // play_d = play_q;

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
      VREF_SETUP: begin // we have problem with DAC, change its ref voltage from external to internal and vice versa -> have to send command for external one all time.
        mems_SPI_start_d=1'b0;
        if (!mems_SPI_busy && mems_SPI_start_q == 1'b0) begin 

          case (mode)
            2'd0: begin
              addr_d = 17'd8;//addr_q + 1'b1; // will be 2 in SET_CHANNEL
              end
            2'd1: begin
              addr_d=17'd5768;
              end
            default: begin 
              end

          endcase // case
          

          state_d = SET_CHANNEL;
          mems_SPI_start_d = 1'b1;
        end // new data
      end // VREF_SETUP
      SET_CHANNEL: begin


                mems_SPI_start_d = 1'b0;
                if ((!mems_SPI_busy && mems_SPI_start_q == 1'b0) && pause==1'b0) begin 



                    mems_SPI_start_d = 1'b1;    



                    case (mode)
                        // mode 1
                        2'd0: begin

                          if (addr_q>=18'd13444) begin // 75524 fro 59x160 //37444 for 39x120 // 74884 for 39x240
                            addr_d = 17'd8;  
                          end else begin
                        
                        
                            if (addr_q == 17'd1353) begin
                              new_frame_d = 1'b1;
                              reversed_frame_d=1'b0;
                            end else if (addr_q == 17'd8065) begin
                              new_frame_d = 1'b1;
                              reversed_frame_d=1'b1;
                            end else
                            


if (addr_q == 18'd1353 || addr_q == 18'd5833 || addr_q == 18'd10305 || addr_q == 18'd3593 || addr_q == 18'd8065 || addr_q==18'd12545) begin

                      new_line_d=1'b1;
                              end 

                              addr_d = addr_q+1'b1;

                          end // if end is reached
                        end // mode 1


















                        // mode_2
                        2'd1: begin

                          if (addr_q>=18'd26884 || addr_q<=18'd13444) begin //75524 fro 59x160 //37444 for 39x120 // 74884 for 39x240
                            addr_d = 17'd13448;  
                          end else begin
                        
                            if (addr_q == 17'd14152) begin
                              new_frame_d = 1'b1;
                              
                              reversed_frame_d=1'b0;
                            end else if (addr_q == 17'd20864) begin
                              new_frame_d = 1'b1;
                              reversed_frame_d=1'b1;
                            end else
                            


                            

if (addr_q == 18'd14152 || addr_q == 18'd16072 || addr_q == 18'd17992 || addr_q == 18'd19912 || addr_q == 18'd21824 || addr_q == 18'd23744 || addr_q == 18'd25664 || addr_q == 18'd15112 || addr_q == 18'd17032 || addr_q == 18'd18952 || addr_q == 18'd20864 || addr_q == 18'd22784 || addr_q == 18'd24704 || addr_q==18'd26624) begin

                        new_line_d=1'b1;
                            end 

                            addr_d = addr_q+1'b1;


                          end // if end is reached

                        end // mode_2





















// for 10 lines

        2'd2: begin


                          if (addr_q>=18'd42004 || addr_q<=18'd26884) begin //75524 fro 59x160 //37444 for 39x120 // 74884 for 39x240
                            addr_d = 17'd26888;  
                          end else begin
                        
                              
                            if (addr_q == 17'd27540) begin
                              new_frame_d = 1'b1;
                              reversed_frame_d=1'b0;
                            end else if (addr_q == 17'd35084) begin
                              new_frame_d = 1'b1;
                              reversed_frame_d=1'b1;
                            end else

                            
if (addr_q == 18'd27540 || addr_q == 18'd29220 || addr_q == 18'd30900 || addr_q == 18'd32580 || addr_q == 18'd34260 || addr_q == 18'd35924 || addr_q == 18'd37604 || addr_q == 18'd39284 || addr_q == 18'd40964 || addr_q == 18'd28380 || addr_q == 18'd30060 || addr_q == 18'd31740 || addr_q == 18'd33420 || addr_q == 18'd35084 || addr_q == 18'd36764 || addr_q == 18'd38444 || addr_q == 18'd40124 || addr_q==18'd41804) begin
                                  new_line_d=1'b1;
                            end 

                            addr_d = addr_q+1'b1;
                          end // if end is reached


// for HR
//         2'd2: begin


//                           if (addr_q>=18'd124316 || addr_q<=18'd26884) begin //75524 fro 59x160 //37444 for 39x120 // 74884 for 39x240
//                             addr_d = 17'd26888;  
//                           end else begin
                        
                              
//                             if (addr_q == 17'd27941) begin
//                               new_frame_d = 1'b1;
//                               reversed_frame_d=1'b0;
//                             end else if (addr_q == 17'd76653) begin
//                               new_frame_d = 1'b1;
//                               reversed_frame_d=1'b1;
//                             end else


// if (addr_q == 18'd27941 || addr_q == 18'd31301 || addr_q == 18'd34661 || addr_q == 18'd38021 || addr_q == 18'd41381 || addr_q == 18'd44741 || addr_q == 18'd48101 || addr_q == 18'd51461 || addr_q == 18'd54821 || addr_q == 18'd58181 || addr_q == 18'd61541 || addr_q == 18'd64901 || addr_q == 18'd68261 || addr_q == 18'd71621 || addr_q == 18'd74981 || addr_q == 18'd78333 || addr_q == 18'd81693 || addr_q == 18'd85053 || addr_q == 18'd88413 || addr_q == 18'd91773 || addr_q == 18'd95133 || addr_q == 18'd98493 || addr_q == 18'd101853 || addr_q == 18'd105213 || addr_q == 18'd108573 || addr_q == 18'd111933 || addr_q == 18'd115293 || addr_q == 18'd118653 || addr_q == 18'd122013 || addr_q == 18'd29621 || addr_q == 18'd32981 || addr_q == 18'd36341 || addr_q == 18'd39701 || addr_q == 18'd43061 || addr_q == 18'd46421 || addr_q == 18'd49781 || addr_q == 18'd53141 || addr_q == 18'd56501 || addr_q == 18'd59861 || addr_q == 18'd63221 || addr_q == 18'd66581 || addr_q == 18'd69941 || addr_q == 18'd73301 || addr_q == 18'd76653 || addr_q == 18'd80013 || addr_q == 18'd83373 || addr_q == 18'd86733 || addr_q == 18'd90093 || addr_q == 18'd93453 || addr_q == 18'd96813 || addr_q == 18'd100173 || addr_q == 18'd103533 || addr_q == 18'd106893 || addr_q == 18'd110253 || addr_q == 18'd113613 || addr_q == 18'd116973 || addr_q == 18'd120333 || addr_q==18'd123693) begin


//                       new_line_d=1'b1;
//                             end 

//                             addr_d = addr_q+1'b1;
//                           end // if end is reached













                        end // mode_2



                    endcase // case



                    // end // if end is reached





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
    reversed_frame_q <= reversed_frame_d;
    mems_SPI_start_q <= mems_SPI_start_d;
    addr_q <= addr_d;
  end
 
endmodule