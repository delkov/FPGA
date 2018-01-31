module mems_control (
    input clk,
    input rst,
    output [7:0] tx_data,
    output reg new_tx_data,
    input tx_busy,
    input [7:0] rx_data,
    input new_rx_data,
    output start,
    input new_data,
    output [23:0] data_miso,
    input mems_busy,
	output new_frame,
    output new_line
  );
  
  parameter line_delay = 0;//dealy measured in samples 
  parameter frame_delay = 0; //delay measured in samples 
  
  reg pre_frame;
  reg pre_line;
  reg [(line_delay+1):0] line_delay_shift;
  reg [(frame_delay+1):0] frame_delay_shift;
  
  reg [23:0] data_miso_1;
  reg [23:0] data_miso_2;
  reg [23:0] data_miso_3;
  reg [23:0] data_miso_4;
  
  assign new_frame = frame_delay_shift[0];
  assign new_line = line_delay_shift[0];
  
  //assign new_frame = pre_frame;
  //assign new_line = pre_line;
	
  localparam STATE_SIZE = 2;
  localparam IDLE = 2'd0,
    SOFTWARE_RESET = 2'd1,
    LDAC_SETUP = 2'd2,
    SET_CHANNEL = 2'd3;
 
  localparam CH_STATE_SIZE = 2;
    localparam CH_A = 2'd0,
    CH_B = 2'd1,
    CH_C = 2'd2,
    CH_D = 2'd3;

// localparam UP_LIMIT = 8'd161; // max is 140, Pk-Pk 129, Avg 79
// localparam DOWN_LIMIT = 8'd21;

// localparam UP_LIMIT_2 = 8'd141; // 
// localparam DOWN_LIMIT_2 = 8'd41;

  reg [STATE_SIZE-1:0] state_d, state_q;

  reg [CH_STATE_SIZE-1:0] ch_state_d, ch_state_q;
 
  reg [15:0] addr_d, addr_q;
  reg start_d, start_q; 
  // reg [7:0] delta_A_d;
  // reg [7:0] delta_A_q = DOWN_LIMIT;
  // reg [7:0] delta_B_d;
  // reg [7:0] delta_B_q = UP_LIMIT;
  // reg [7:0] delta_C_d;
  // reg [7:0] delta_C_q = DOWN_LIMIT_2;
  // reg [7:0] delta_D_d;
  // reg [7:0] delta_D_q = UP_LIMIT_2;

  // reg [29:0] delay_cntr_d;
  // reg [29:0] delay_cntr_q = 10'd1;

  reg play_d, play_q;
  wire rom_scan_is_done;


  assign start=start_q;

  mems_rom mems_rom (
  .rst(rst),
  .clk(clk),
  .addr(addr_q),
  // .delta_A(delta_A_q),
  // .delta_B(delta_B_q),
  // .delta_C(delta_C_q),
  // .delta_D(delta_D_q),
  .data(data_miso),
  .rom_scan_is_done(rom_scan_is_done)
  );
  
always @(posedge addr_q[1]) begin //keeping in memory 4 last data_miso values
	//if (!mems_busy && start_q == 1'b0)  begin
		data_miso_4 = data_miso_3;
		data_miso_3 = data_miso_2;
		data_miso_2 = data_miso_1;
		data_miso_1 = data_miso;
	//end	
end	
	
  
always @(negedge clk) begin   //new line making always, independent on sin / triangle / etc
	if (rst) begin
        pre_line = 1'b0;
		pre_frame = 1'b0;
	end	
	else begin
		if (addr_q[2:1]==2'b00) begin
			if(data_miso>=data_miso_4)
				pre_line = 1'b1;
			else if(data_miso<data_miso_4)
				pre_line = 1'b0;
		end
		else if (addr_q[2:1]==2'b10) begin
			if(data_miso>=data_miso_4)
				pre_frame = 1'b1;
			else if(data_miso<data_miso_4)
				pre_frame = 1'b0;
		end	
	end		
end

always @(posedge addr_q[1]) begin   //new line delay
		line_delay_shift[(line_delay+1):0] = {pre_line, line_delay_shift[(line_delay+1):1]};
		frame_delay_shift[(frame_delay+1):0] = {pre_frame, frame_delay_shift[(frame_delay+1):1]};				
end
 
  always @(*) begin
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    new_tx_data = 1'b0;
    ch_state_d = ch_state_q;
    // delta_A_d = delta_A_q;
    // delta_B_d = delta_B_q;
    // delta_C_d = delta_C_q;
    // delta_D_d = delta_D_q;
    // delayg_cntr_d = delay_cntr_q;

    play_d = play_q;

    if (new_rx_data && rx_data == "s") begin
        state_d=IDLE;
    end

    if (new_rx_data && rx_data == "p") begin
        state_d=SET_CHANNEL;
        play_d=1'b1;
    end

    case (state_q)
      IDLE: begin
        addr_d = 9'b0;
     //   start_d=1'b0;
     //   if (new_rx_data && rx_data == "h") begin
          state_d = SOFTWARE_RESET;
          start_d=1'b1;
     //   end
      end

      SOFTWARE_RESET: begin
        start_d=1'b0;
        if (!mems_busy && start_q == 1'b0) begin 
          addr_d=addr_q+1'b1;
          state_d = LDAC_SETUP;
          start_d = 1'b1;
        end
      end

      LDAC_SETUP: begin
        start_d=1'b0;
        if (!mems_busy && start_q == 1'b0) begin 
          addr_d = addr_q + 1'b1; // will be 2 in SET_CHANNEL
          state_d = SET_CHANNEL;
          start_d = 1'b1;
          ch_state_d = CH_A;
          // delay_cntr_d = 4'd1;
        end
      end


      SET_CHANNEL: begin
        play_d=1'b0;

             case (ch_state_q)
               CH_A: begin
                start_d = 1'b0;

                if ((!mems_busy && start_q == 1'b0) || play_q==1'b1) begin 
                       // if (delta_A_q > UP_LIMIT) begin
                       //   delta_A_d = DOWN_LIMIT;
                       //   delta_B_d = UP_LIMIT;

                       //   // WE CAN WRITE C,D only after A>UP, so no each time..S
                       //   if (delta_C_q > UP_LIMIT_2) begin
                       //     delta_C_d = DOWN_LIMIT_2;
                       //     delta_D_d = UP_LIMIT_2;  
                       //   end else begin
                       //     delta_C_d = delta_C_d + 1'b1;
                       //     delta_D_d = delta_D_d - 1'b1;
                       //   end
                           
                       // end else begin
                       //   delta_A_d = delta_A_q + 1'b1;
                       // end


                       addr_d = addr_q+1'b1;//4'd3;  
                       start_d = 1'b1;
                       ch_state_d = CH_B; 
                end // new data

                    // // IF DELAY IS NEEDED CHANGE VALUE OR JUST CHANGE SPI SPEED (PREFER)
                    // if (delay_cntr_q==29'd50000) begin
                    //    addr_d = 4'd3;  
                    //    start_d = 1'b1;
                    //    ch_state_d = CH_B; 
                    // end else begin
                    //    delay_cntr_d = delay_cntr_q + 1'b1;
                    // end
               end

               CH_B: begin
                 start_d=1'b0;
                 if (!mems_busy && start_q == 1'b0) begin 
                   // delta_B_d = delta_B_q - 1'b1;
                   // if (addr_q==7'd61) begin
                    // addr_d=7'd2;  
                   // end else begin
                   addr_d = addr_q+1'b1;//4'd3;  
                   // end

                   start_d = 1'b1;
                   ch_state_d = CH_C; 
                 end
               end

               CH_C: begin
                 start_d=1'b0;
                 if (!mems_busy && start_q == 1'b0) begin 
                   addr_d = addr_q+1'b1;//4'd3;  
                   start_d = 1'b1;
                   ch_state_d = CH_D; 
                 end
               end

               CH_D: begin
                 start_d=1'b0;
                 if (!mems_busy && start_q == 1'b0) begin 

                   //if (addr_q==9'd481) begin
				   if (rom_scan_is_done==1'b1) begin
                     addr_d=16'd8;  
                   end else begin
                     addr_d = addr_q+1'b1;//4'd3;  
                   end


                   start_d = 1'b1;
                   ch_state_d = CH_A; 
                   // delay_cntr_d = 10'd1;
                 end

               end

               default: ch_state_d = CH_A;
             endcase

      end // SET_CHANNEL

      default: state_d = IDLE;
    endcase
  end
 
  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
    end else begin
      state_q <= state_d;
      ch_state_q <= ch_state_d;
    end

    // delta_A_q <= delta_A_d; 
    // delta_B_q <= delta_B_d; 
    // delta_C_q <= delta_C_d; 
    // delta_D_q <= delta_D_d; 
    start_q<=start_d;
    addr_q <= addr_d;
    // delay_cntr_q <= delay_cntr_d;

    play_q <= play_d;
  end
 
endmodule