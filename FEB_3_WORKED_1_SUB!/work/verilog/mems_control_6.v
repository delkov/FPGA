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


                        // check new_frame
                        




                        // if (addr_q == 16'd88) begin // 6495 no overflow at all1! 6490 also no overf.

                        //     new_frame_d = 1'b1;
                        // end else

                        // // up
                        // if (addr_q == 16'd88 || addr_q == 16'd408 || addr_q == 16'd728 || addr_q == 16'd1048 || addr_q == 16'd1368 || addr_q == 16'd1688 || addr_q == 16'd2008 || addr_q == 16'd2328 || addr_q == 16'd2648 || addr_q == 16'd2968 || addr_q == 16'd3288 || addr_q == 16'd3608 || addr_q == 16'd3928 || addr_q == 16'd4248 || addr_q == 16'd4568 || addr_q == 16'd4888 || addr_q == 16'd5208 || addr_q == 16'd5528 || addr_q == 16'd5848 || addr_q == 16'd6168 || addr_q == 16'd6488 || addr_q == 16'd6808 || addr_q == 16'd7128 || addr_q == 16'd7448 || addr_q == 16'd7768 || addr_q == 16'd8088 || addr_q == 16'd8408 || addr_q == 16'd8728 || addr_q == 16'd9048 || addr_q == 16'd9368 || addr_q == 16'd9688 || addr_q == 16'd10008 || addr_q == 16'd10328 || addr_q == 16'd10648 || addr_q == 16'd10968 || addr_q == 16'd11288 || addr_q == 16'd11608 || addr_q == 16'd11928 || addr_q == 16'd12248 || addr_q==16'd12568) begin

                        //     new_line_d=1'b1;
                        // end 
                        
                        



                        //+2

                        if (addr_q == 16'd96 || addr_q==16'd6496) begin // 6495 no overflow at all1! 6490 also no overf.

                        // if (addr_q == 16'd96) begin // 6495 no overflow at all1! 6490 also no overf.

                            new_frame_d = 1'b1;
                        end else 

                        // if (addr_q == 16'd88 || addr_q == 16'd408 || addr_q == 16'd728 || addr_q == 16'd1048 || addr_q == 16'd1368 || addr_q == 16'd1688 || addr_q == 16'd2008 || addr_q == 16'd2328 || addr_q == 16'd2648 || addr_q == 16'd2968 || addr_q == 16'd3288 || addr_q == 16'd3608 || addr_q == 16'd3928 || addr_q == 16'd4248 || addr_q == 16'd4568 || addr_q == 16'd4888 || addr_q == 16'd5208 || addr_q == 16'd5528 || addr_q == 16'd5848 || addr_q == 16'd6168 || addr_q == 16'd6488 || addr_q == 16'd6808 || addr_q == 16'd7128 || addr_q == 16'd7448 || addr_q == 16'd7768 || addr_q == 16'd8088 || addr_q == 16'd8408 || addr_q == 16'd8728 || addr_q == 16'd9048 || addr_q == 16'd9368 || addr_q == 16'd9688 || addr_q == 16'd10008 || addr_q == 16'd10328 || addr_q == 16'd10648 || addr_q == 16'd10968 || addr_q == 16'd11288 || addr_q == 16'd11608 || addr_q == 16'd11928 || addr_q == 16'd12248 || addr_q==16'd12568) begin
  
// UP & DOWN+9 - FIg2

// if (addr_q == 16'd97 || addr_q == 16'd417 || addr_q == 16'd737 || addr_q == 16'd1057 || addr_q == 16'd1377 || addr_q == 16'd1697 || addr_q == 16'd2017 || addr_q == 16'd2337 || addr_q == 16'd2657 || addr_q == 16'd2977 || addr_q == 16'd3297 || addr_q == 16'd3617 || addr_q == 16'd3937 || addr_q == 16'd4257 || addr_q == 16'd4577 || addr_q == 16'd4897 || addr_q == 16'd5217 || addr_q == 16'd5537 || addr_q == 16'd5857 || addr_q == 16'd6177 || addr_q == 16'd6497 || addr_q == 16'd6817 || addr_q == 16'd7137 || addr_q == 16'd7457 || addr_q == 16'd7777 || addr_q == 16'd8097 || addr_q == 16'd8417 || addr_q == 16'd8737 || addr_q == 16'd9057 || addr_q == 16'd9377 || addr_q == 16'd9697 || addr_q == 16'd10017 || addr_q == 16'd10337 || addr_q == 16'd10657 || addr_q == 16'd10977 || addr_q == 16'd11297 || addr_q == 16'd11617 || addr_q == 16'd11937 || addr_q == 16'd12257 || addr_q == 16'd12577 || addr_q == 16'd257 || addr_q == 16'd577 || addr_q == 16'd897 || addr_q == 16'd1217 || addr_q == 16'd1537 || addr_q == 16'd1857 || addr_q == 16'd2177 || addr_q == 16'd2497 || addr_q == 16'd2817 || addr_q == 16'd3137 || addr_q == 16'd3457 || addr_q == 16'd3777 || addr_q == 16'd4097 || addr_q == 16'd4417 || addr_q == 16'd4737 || addr_q == 16'd5057 || addr_q == 16'd5377 || addr_q == 16'd5697 || addr_q == 16'd6017 || addr_q == 16'd6337 || addr_q == 16'd6657 || addr_q == 16'd6977 || addr_q == 16'd7297 || addr_q == 16'd7617 || addr_q == 16'd7937 || addr_q == 16'd8257 || addr_q == 16'd8577 || addr_q == 16'd8897 || addr_q == 16'd9217 || addr_q == 16'd9537 || addr_q == 16'd9857 || addr_q == 16'd10177 || addr_q == 16'd10497 || addr_q == 16'd10817 || addr_q == 16'd11137 || addr_q == 16'd11457 || addr_q == 16'd11777 || addr_q == 16'd12097 || addr_q == 16'd12417 || addr_q==16'd12737) begin

// +5
// if (addr_q == 16'd93 || addr_q == 16'd413 || addr_q == 16'd733 || addr_q == 16'd1053 || addr_q == 16'd1373 || addr_q == 16'd1693 || addr_q == 16'd2013 || addr_q == 16'd2333 || addr_q == 16'd2653 || addr_q == 16'd2973 || addr_q == 16'd3293 || addr_q == 16'd3613 || addr_q == 16'd3933 || addr_q == 16'd4253 || addr_q == 16'd4573 || addr_q == 16'd4893 || addr_q == 16'd5213 || addr_q == 16'd5533 || addr_q == 16'd5853 || addr_q == 16'd6173 || addr_q == 16'd6493 || addr_q == 16'd6813 || addr_q == 16'd7133 || addr_q == 16'd7453 || addr_q == 16'd7773 || addr_q == 16'd8093 || addr_q == 16'd8413 || addr_q == 16'd8733 || addr_q == 16'd9053 || addr_q == 16'd9373 || addr_q == 16'd9693 || addr_q == 16'd10013 || addr_q == 16'd10333 || addr_q == 16'd10653 || addr_q == 16'd10973 || addr_q == 16'd11293 || addr_q == 16'd11613 || addr_q == 16'd11933 || addr_q == 16'd12253 || addr_q == 16'd12573 || addr_q == 16'd253 || addr_q == 16'd573 || addr_q == 16'd893 || addr_q == 16'd1213 || addr_q == 16'd1533 || addr_q == 16'd1853 || addr_q == 16'd2173 || addr_q == 16'd2493 || addr_q == 16'd2813 || addr_q == 16'd3133 || addr_q == 16'd3453 || addr_q == 16'd3773 || addr_q == 16'd4093 || addr_q == 16'd4413 || addr_q == 16'd4733 || addr_q == 16'd5053 || addr_q == 16'd5373 || addr_q == 16'd5693 || addr_q == 16'd6013 || addr_q == 16'd6333 || addr_q == 16'd6653 || addr_q == 16'd6973 || addr_q == 16'd7293 || addr_q == 16'd7613 || addr_q == 16'd7933 || addr_q == 16'd8253 || addr_q == 16'd8573 || addr_q == 16'd8893 || addr_q == 16'd9213 || addr_q == 16'd9533 || addr_q == 16'd9853 || addr_q == 16'd10173 || addr_q == 16'd10493 || addr_q == 16'd10813 || addr_q == 16'd11133 || addr_q == 16'd11453 || addr_q == 16'd11773 || addr_q == 16'd12093 || addr_q == 16'd12413 || addr_q==16'd12733) begin
// -2
//if (addr_q == 16'd86 || addr_q == 16'd406 || addr_q == 16'd726 || addr_q == 16'd1046 || addr_q == 16'd1366 || addr_q == 16'd1686 || addr_q == 16'd2006 || addr_q == 16'd2326 || addr_q == 16'd2646 || addr_q == 16'd2966 || addr_q == 16'd3286 || addr_q == 16'd3606 || addr_q == 16'd3926 || addr_q == 16'd4246 || addr_q == 16'd4566 || addr_q == 16'd4886 || addr_q == 16'd5206 || addr_q == 16'd5526 || addr_q == 16'd5846 || addr_q == 16'd6166 || addr_q == 16'd6486 || addr_q == 16'd6806 || addr_q == 16'd7126 || addr_q == 16'd7446 || addr_q == 16'd7766 || addr_q == 16'd8086 || addr_q == 16'd8406 || addr_q == 16'd8726 || addr_q == 16'd9046 || addr_q == 16'd9366 || addr_q == 16'd9686 || addr_q == 16'd10006 || addr_q == 16'd10326 || addr_q == 16'd10646 || addr_q == 16'd10966 || addr_q == 16'd11286 || addr_q == 16'd11606 || addr_q == 16'd11926 || addr_q == 16'd12246 || addr_q == 16'd12566 || addr_q == 16'd246 || addr_q == 16'd566 || addr_q == 16'd886 || addr_q == 16'd1206 || addr_q == 16'd1526 || addr_q == 16'd1846 || addr_q == 16'd2166 || addr_q == 16'd2486 || addr_q == 16'd2806 || addr_q == 16'd3126 || addr_q == 16'd3446 || addr_q == 16'd3766 || addr_q == 16'd4086 || addr_q == 16'd4406 || addr_q == 16'd4726 || addr_q == 16'd5046 || addr_q == 16'd5366 || addr_q == 16'd5686 || addr_q == 16'd6006 || addr_q == 16'd6326 || addr_q == 16'd6646 || addr_q == 16'd6966 || addr_q == 16'd7286 || addr_q == 16'd7606 || addr_q == 16'd7926 || addr_q == 16'd8246 || addr_q == 16'd8566 || addr_q == 16'd8886 || addr_q == 16'd9206 || addr_q == 16'd9526 || addr_q == 16'd9846 || addr_q == 16'd10166 || addr_q == 16'd10486 || addr_q == 16'd10806 || addr_q == 16'd11126 || addr_q == 16'd11446 || addr_q == 16'd11766 || addr_q == 16'd12086 || addr_q == 16'd12406 || addr_q==16'd12726) begin
//+3
 // if (addr_q == 16'd91 || addr_q == 16'd411 || addr_q == 16'd731 || addr_q == 16'd1051 || addr_q == 16'd1371 || addr_q == 16'd1691 || addr_q == 16'd2011 || addr_q == 16'd2331 || addr_q == 16'd2651 || addr_q == 16'd2971 || addr_q == 16'd3291 || addr_q == 16'd3611 || addr_q == 16'd3931 || addr_q == 16'd4251 || addr_q == 16'd4571 || addr_q == 16'd4891 || addr_q == 16'd5211 || addr_q == 16'd5531 || addr_q == 16'd5851 || addr_q == 16'd6171 || addr_q == 16'd6491 || addr_q == 16'd6811 || addr_q == 16'd7131 || addr_q == 16'd7451 || addr_q == 16'd7771 || addr_q == 16'd8091 || addr_q == 16'd8411 || addr_q == 16'd8731 || addr_q == 16'd9051 || addr_q == 16'd9371 || addr_q == 16'd9691 || addr_q == 16'd10011 || addr_q == 16'd10331 || addr_q == 16'd10651 || addr_q == 16'd10971 || addr_q == 16'd11291 || addr_q == 16'd11611 || addr_q == 16'd11931 || addr_q == 16'd12251 || addr_q == 16'd12571 || addr_q == 16'd251 || addr_q == 16'd571 || addr_q == 16'd891 || addr_q == 16'd1211 || addr_q == 16'd1531 || addr_q == 16'd1851 || addr_q == 16'd2171 || addr_q == 16'd2491 || addr_q == 16'd2811 || addr_q == 16'd3131 || addr_q == 16'd3451 || addr_q == 16'd3771 || addr_q == 16'd4091 || addr_q == 16'd4411 || addr_q == 16'd4731 || addr_q == 16'd5051 || addr_q == 16'd5371 || addr_q == 16'd5691 || addr_q == 16'd6011 || addr_q == 16'd6331 || addr_q == 16'd6651 || addr_q == 16'd6971 || addr_q == 16'd7291 || addr_q == 16'd7611 || addr_q == 16'd7931 || addr_q == 16'd8251 || addr_q == 16'd8571 || addr_q == 16'd8891 || addr_q == 16'd9211 || addr_q == 16'd9531 || addr_q == 16'd9851 || addr_q == 16'd10171 || addr_q == 16'd10491 || addr_q == 16'd10811 || addr_q == 16'd11131 || addr_q == 16'd11451 || addr_q == 16'd11771 || addr_q == 16'd12091 || addr_q == 16'd12411 || addr_q==16'd12731) begin
// +4
// if (addr_q == 16'd92 || addr_q == 16'd412 || addr_q == 16'd732 || addr_q == 16'd1052 || addr_q == 16'd1372 || addr_q == 16'd1692 || addr_q == 16'd2012 || addr_q == 16'd2332 || addr_q == 16'd2652 || addr_q == 16'd2972 || addr_q == 16'd3292 || addr_q == 16'd3612 || addr_q == 16'd3932 || addr_q == 16'd4252 || addr_q == 16'd4572 || addr_q == 16'd4892 || addr_q == 16'd5212 || addr_q == 16'd5532 || addr_q == 16'd5852 || addr_q == 16'd6172 || addr_q == 16'd6492 || addr_q == 16'd6812 || addr_q == 16'd7132 || addr_q == 16'd7452 || addr_q == 16'd7772 || addr_q == 16'd8092 || addr_q == 16'd8412 || addr_q == 16'd8732 || addr_q == 16'd9052 || addr_q == 16'd9372 || addr_q == 16'd9692 || addr_q == 16'd10012 || addr_q == 16'd10332 || addr_q == 16'd10652 || addr_q == 16'd10972 || addr_q == 16'd11292 || addr_q == 16'd11612 || addr_q == 16'd11932 || addr_q == 16'd12252 || addr_q == 16'd12572 || addr_q == 16'd252 || addr_q == 16'd572 || addr_q == 16'd892 || addr_q == 16'd1212 || addr_q == 16'd1532 || addr_q == 16'd1852 || addr_q == 16'd2172 || addr_q == 16'd2492 || addr_q == 16'd2812 || addr_q == 16'd3132 || addr_q == 16'd3452 || addr_q == 16'd3772 || addr_q == 16'd4092 || addr_q == 16'd4412 || addr_q == 16'd4732 || addr_q == 16'd5052 || addr_q == 16'd5372 || addr_q == 16'd5692 || addr_q == 16'd6012 || addr_q == 16'd6332 || addr_q == 16'd6652 || addr_q == 16'd6972 || addr_q == 16'd7292 || addr_q == 16'd7612 || addr_q == 16'd7932 || addr_q == 16'd8252 || addr_q == 16'd8572 || addr_q == 16'd8892 || addr_q == 16'd9212 || addr_q == 16'd9532 || addr_q == 16'd9852 || addr_q == 16'd10172 || addr_q == 16'd10492 || addr_q == 16'd10812 || addr_q == 16'd11132 || addr_q == 16'd11452 || addr_q == 16'd11772 || addr_q == 16'd12092 || addr_q == 16'd12412 || addr_q==16'd12732) begin
                            // if (addr_q == 16'd93 || addr_q == 16'd413 || addr_q == 16'd733 || addr_q == 16'd1053 || addr_q == 16'd1373 || addr_q == 16'd1693 || addr_q == 16'd2013 || addr_q == 16'd2333 || addr_q == 16'd2653 || addr_q == 16'd2973 || addr_q == 16'd3293 || addr_q == 16'd3613 || addr_q == 16'd3933 || addr_q == 16'd4253 || addr_q == 16'd4573 || addr_q == 16'd4893 || addr_q == 16'd5213 || addr_q == 16'd5533 || addr_q == 16'd5853 || addr_q == 16'd6173 || addr_q == 16'd6493 || addr_q == 16'd6813 || addr_q == 16'd7133 || addr_q == 16'd7453 || addr_q == 16'd7773 || addr_q == 16'd8093 || addr_q == 16'd8413 || addr_q == 16'd8733 || addr_q == 16'd9053 || addr_q == 16'd9373 || addr_q == 16'd9693 || addr_q == 16'd10013 || addr_q == 16'd10333 || addr_q == 16'd10653 || addr_q == 16'd10973 || addr_q == 16'd11293 || addr_q == 16'd11613 || addr_q == 16'd11933 || addr_q == 16'd12253 || addr_q == 16'd12573 || addr_q == 16'd253 || addr_q == 16'd573 || addr_q == 16'd893 || addr_q == 16'd1213 || addr_q == 16'd1533 || addr_q == 16'd1853 || addr_q == 16'd2173 || addr_q == 16'd2493 || addr_q == 16'd2813 || addr_q == 16'd3133 || addr_q == 16'd3453 || addr_q == 16'd3773 || addr_q == 16'd4093 || addr_q == 16'd4413 || addr_q == 16'd4733 || addr_q == 16'd5053 || addr_q == 16'd5373 || addr_q == 16'd5693 || addr_q == 16'd6013 || addr_q == 16'd6333 || addr_q == 16'd6653 || addr_q == 16'd6973 || addr_q == 16'd7293 || addr_q == 16'd7613 || addr_q == 16'd7933 || addr_q == 16'd8253 || addr_q == 16'd8573 || addr_q == 16'd8893 || addr_q == 16'd9213 || addr_q == 16'd9533 || addr_q == 16'd9853 || addr_q == 16'd10173 || addr_q == 16'd10493 || addr_q == 16'd10813 || addr_q == 16'd11133 || addr_q == 16'd11453 || addr_q == 16'd11773 || addr_q == 16'd12093 || addr_q == 16'd12413 || addr_q==16'd12733) begin


// if (addr_q == 16'd94 || addr_q == 16'd414 || addr_q == 16'd734 || addr_q == 16'd1054 || addr_q == 16'd1374 || addr_q == 16'd1694 || addr_q == 16'd2014 || addr_q == 16'd2334 || addr_q == 16'd2654 || addr_q == 16'd2974 || addr_q == 16'd3294 || addr_q == 16'd3614 || addr_q == 16'd3934 || addr_q == 16'd4254 || addr_q == 16'd4574 || addr_q == 16'd4894 || addr_q == 16'd5214 || addr_q == 16'd5534 || addr_q == 16'd5854 || addr_q == 16'd6174 || addr_q == 16'd6494 || addr_q == 16'd6814 || addr_q == 16'd7134 || addr_q == 16'd7454 || addr_q == 16'd7774 || addr_q == 16'd8094 || addr_q == 16'd8414 || addr_q == 16'd8734 || addr_q == 16'd9054 || addr_q == 16'd9374 || addr_q == 16'd9694 || addr_q == 16'd10014 || addr_q == 16'd10334 || addr_q == 16'd10654 || addr_q == 16'd10974 || addr_q == 16'd11294 || addr_q == 16'd11614 || addr_q == 16'd11934 || addr_q == 16'd12254 || addr_q == 16'd12574 || addr_q == 16'd254 || addr_q == 16'd574 || addr_q == 16'd894 || addr_q == 16'd1214 || addr_q == 16'd1534 || addr_q == 16'd1854 || addr_q == 16'd2174 || addr_q == 16'd2494 || addr_q == 16'd2814 || addr_q == 16'd3134 || addr_q == 16'd3454 || addr_q == 16'd3774 || addr_q == 16'd4094 || addr_q == 16'd4414 || addr_q == 16'd4734 || addr_q == 16'd5054 || addr_q == 16'd5374 || addr_q == 16'd5694 || addr_q == 16'd6014 || addr_q == 16'd6334 || addr_q == 16'd6654 || addr_q == 16'd6974 || addr_q == 16'd7294 || addr_q == 16'd7614 || addr_q == 16'd7934 || addr_q == 16'd8254 || addr_q == 16'd8574 || addr_q == 16'd8894 || addr_q == 16'd9214 || addr_q == 16'd9534 || addr_q == 16'd9854 || addr_q == 16'd10174 || addr_q == 16'd10494 || addr_q == 16'd10814 || addr_q == 16'd11134 || addr_q == 16'd11454 || addr_q == 16'd11774 || addr_q == 16'd12094 || addr_q == 16'd12414 || addr_q==16'd12734) begin

// if (addr_q == 16'd95 || addr_q == 16'd415 || addr_q == 16'd735 || addr_q == 16'd1055 || addr_q == 16'd1375 || addr_q == 16'd1695 || addr_q == 16'd2015 || addr_q == 16'd2335 || addr_q == 16'd2655 || addr_q == 16'd2975 || addr_q == 16'd3295 || addr_q == 16'd3615 || addr_q == 16'd3935 || addr_q == 16'd4255 || addr_q == 16'd4575 || addr_q == 16'd4895 || addr_q == 16'd5215 || addr_q == 16'd5535 || addr_q == 16'd5855 || addr_q == 16'd6175 || addr_q == 16'd6495 || addr_q == 16'd6815 || addr_q == 16'd7135 || addr_q == 16'd7455 || addr_q == 16'd7775 || addr_q == 16'd8095 || addr_q == 16'd8415 || addr_q == 16'd8735 || addr_q == 16'd9055 || addr_q == 16'd9375 || addr_q == 16'd9695 || addr_q == 16'd10015 || addr_q == 16'd10335 || addr_q == 16'd10655 || addr_q == 16'd10975 || addr_q == 16'd11295 || addr_q == 16'd11615 || addr_q == 16'd11935 || addr_q == 16'd12255 || addr_q == 16'd12575 || addr_q == 16'd255 || addr_q == 16'd575 || addr_q == 16'd895 || addr_q == 16'd1215 || addr_q == 16'd1535 || addr_q == 16'd1855 || addr_q == 16'd2175 || addr_q == 16'd2495 || addr_q == 16'd2815 || addr_q == 16'd3135 || addr_q == 16'd3455 || addr_q == 16'd3775 || addr_q == 16'd4095 || addr_q == 16'd4415 || addr_q == 16'd4735 || addr_q == 16'd5055 || addr_q == 16'd5375 || addr_q == 16'd5695 || addr_q == 16'd6015 || addr_q == 16'd6335 || addr_q == 16'd6655 || addr_q == 16'd6975 || addr_q == 16'd7295 || addr_q == 16'd7615 || addr_q == 16'd7935 || addr_q == 16'd8255 || addr_q == 16'd8575 || addr_q == 16'd8895 || addr_q == 16'd9215 || addr_q == 16'd9535 || addr_q == 16'd9855 || addr_q == 16'd10175 || addr_q == 16'd10495 || addr_q == 16'd10815 || addr_q == 16'd11135 || addr_q == 16'd11455 || addr_q == 16'd11775 || addr_q == 16'd12095 || addr_q == 16'd12415 || addr_q==16'd12735) begin
// +8
// if (addr_q == 16'd96 || addr_q == 16'd416 || addr_q == 16'd736 || addr_q == 16'd1056 || addr_q == 16'd1376 || addr_q == 16'd1696 || addr_q == 16'd2016 || addr_q == 16'd2336 || addr_q == 16'd2656 || addr_q == 16'd2976 || addr_q == 16'd3296 || addr_q == 16'd3616 || addr_q == 16'd3936 || addr_q == 16'd4256 || addr_q == 16'd4576 || addr_q == 16'd4896 || addr_q == 16'd5216 || addr_q == 16'd5536 || addr_q == 16'd5856 || addr_q == 16'd6176 || addr_q == 16'd6496 || addr_q == 16'd6816 || addr_q == 16'd7136 || addr_q == 16'd7456 || addr_q == 16'd7776 || addr_q == 16'd8096 || addr_q == 16'd8416 || addr_q == 16'd8736 || addr_q == 16'd9056 || addr_q == 16'd9376 || addr_q == 16'd9696 || addr_q == 16'd10016 || addr_q == 16'd10336 || addr_q == 16'd10656 || addr_q == 16'd10976 || addr_q == 16'd11296 || addr_q == 16'd11616 || addr_q == 16'd11936 || addr_q == 16'd12256 || addr_q == 16'd12576 || addr_q == 16'd256 || addr_q == 16'd576 || addr_q == 16'd896 || addr_q == 16'd1216 || addr_q == 16'd1536 || addr_q == 16'd1856 || addr_q == 16'd2176 || addr_q == 16'd2496 || addr_q == 16'd2816 || addr_q == 16'd3136 || addr_q == 16'd3456 || addr_q == 16'd3776 || addr_q == 16'd4096 || addr_q == 16'd4416 || addr_q == 16'd4736 || addr_q == 16'd5056 || addr_q == 16'd5376 || addr_q == 16'd5696 || addr_q == 16'd6016 || addr_q == 16'd6336 || addr_q == 16'd6656 || addr_q == 16'd6976 || addr_q == 16'd7296 || addr_q == 16'd7616 || addr_q == 16'd7936 || addr_q == 16'd8256 || addr_q == 16'd8576 || addr_q == 16'd8896 || addr_q == 16'd9216 || addr_q == 16'd9536 || addr_q == 16'd9856 || addr_q == 16'd10176 || addr_q == 16'd10496 || addr_q == 16'd10816 || addr_q == 16'd11136 || addr_q == 16'd11456 || addr_q == 16'd11776 || addr_q == 16'd12096 || addr_q == 16'd12416 || addr_q==16'd12736) begin
// +9
// if (addr_q == 16'd97 || addr_q == 16'd417 || addr_q == 16'd737 || addr_q == 16'd1057 || addr_q == 16'd1377 || addr_q == 16'd1697 || addr_q == 16'd2017 || addr_q == 16'd2337 || addr_q == 16'd2657 || addr_q == 16'd2977 || addr_q == 16'd3297 || addr_q == 16'd3617 || addr_q == 16'd3937 || addr_q == 16'd4257 || addr_q == 16'd4577 || addr_q == 16'd4897 || addr_q == 16'd5217 || addr_q == 16'd5537 || addr_q == 16'd5857 || addr_q == 16'd6177 || addr_q == 16'd6497 || addr_q == 16'd6817 || addr_q == 16'd7137 || addr_q == 16'd7457 || addr_q == 16'd7777 || addr_q == 16'd8097 || addr_q == 16'd8417 || addr_q == 16'd8737 || addr_q == 16'd9057 || addr_q == 16'd9377 || addr_q == 16'd9697 || addr_q == 16'd10017 || addr_q == 16'd10337 || addr_q == 16'd10657 || addr_q == 16'd10977 || addr_q == 16'd11297 || addr_q == 16'd11617 || addr_q == 16'd11937 || addr_q == 16'd12257 || addr_q == 16'd12577 || addr_q == 16'd257 || addr_q == 16'd577 || addr_q == 16'd897 || addr_q == 16'd1217 || addr_q == 16'd1537 || addr_q == 16'd1857 || addr_q == 16'd2177 || addr_q == 16'd2497 || addr_q == 16'd2817 || addr_q == 16'd3137 || addr_q == 16'd3457 || addr_q == 16'd3777 || addr_q == 16'd4097 || addr_q == 16'd4417 || addr_q == 16'd4737 || addr_q == 16'd5057 || addr_q == 16'd5377 || addr_q == 16'd5697 || addr_q == 16'd6017 || addr_q == 16'd6337 || addr_q == 16'd6657 || addr_q == 16'd6977 || addr_q == 16'd7297 || addr_q == 16'd7617 || addr_q == 16'd7937 || addr_q == 16'd8257 || addr_q == 16'd8577 || addr_q == 16'd8897 || addr_q == 16'd9217 || addr_q == 16'd9537 || addr_q == 16'd9857 || addr_q == 16'd10177 || addr_q == 16'd10497 || addr_q == 16'd10817 || addr_q == 16'd11137 || addr_q == 16'd11457 || addr_q == 16'd11777 || addr_q == 16'd12097 || addr_q == 16'd12417 || addr_q==16'd12737) begin
                            

if (addr_q == 16'd96 || addr_q == 16'd416 || addr_q == 16'd736 || addr_q == 16'd1056 || addr_q == 16'd1376 || addr_q == 16'd1696 || addr_q == 16'd2016 || addr_q == 16'd2336 || addr_q == 16'd2656 || addr_q == 16'd2976 || addr_q == 16'd3296 || addr_q == 16'd3616 || addr_q == 16'd3936 || addr_q == 16'd4256 || addr_q == 16'd4576 || addr_q == 16'd4896 || addr_q == 16'd5216 || addr_q == 16'd5536 || addr_q == 16'd5856 || addr_q == 16'd6176 || addr_q == 16'd6496 || addr_q == 16'd6816 || addr_q == 16'd7136 || addr_q == 16'd7456 || addr_q == 16'd7776 || addr_q == 16'd8096 || addr_q == 16'd8416 || addr_q == 16'd8736 || addr_q == 16'd9056 || addr_q == 16'd9376 || addr_q == 16'd9696 || addr_q == 16'd10016 || addr_q == 16'd10336 || addr_q == 16'd10656 || addr_q == 16'd10976 || addr_q == 16'd11296 || addr_q == 16'd11616 || addr_q == 16'd11936 || addr_q == 16'd12256 || addr_q == 16'd12576 || addr_q == 16'd256 || addr_q == 16'd576 || addr_q == 16'd896 || addr_q == 16'd1216 || addr_q == 16'd1536 || addr_q == 16'd1856 || addr_q == 16'd2176 || addr_q == 16'd2496 || addr_q == 16'd2816 || addr_q == 16'd3136 || addr_q == 16'd3456 || addr_q == 16'd3776 || addr_q == 16'd4096 || addr_q == 16'd4416 || addr_q == 16'd4736 || addr_q == 16'd5056 || addr_q == 16'd5376 || addr_q == 16'd5696 || addr_q == 16'd6016 || addr_q == 16'd6336 || addr_q == 16'd6656 || addr_q == 16'd6976 || addr_q == 16'd7296 || addr_q == 16'd7616 || addr_q == 16'd7936 || addr_q == 16'd8256 || addr_q == 16'd8576 || addr_q == 16'd8896 || addr_q == 16'd9216 || addr_q == 16'd9536 || addr_q == 16'd9856 || addr_q == 16'd10176 || addr_q == 16'd10496 || addr_q == 16'd10816 || addr_q == 16'd11136 || addr_q == 16'd11456 || addr_q == 16'd11776 || addr_q == 16'd12096 || addr_q == 16'd12416 || addr_q==16'd12736) begin
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