module fifo_manager_2 #(
    parameter BAUD_RATE_PARAM = 4000000,
    parameter FIFO_WIDTH = 10
    )(

    // INPUT
    input clk,  // clock
    input rst,  // reset

    // F1
    input [31:0] f1_din,
    input f1_wr_en,
    input f1_new_line,
    input f1_new_frame,
    output reg f1_FIFO_writing_done,
    output reg f1_new_line_FIFO_done,
    output reg f1_new_frame_FIFO_done,
    
    // F2
    input [31:0] f2_din,
    input f2_wr_en,
    input f2_new_line,
    input f2_new_frame,
    output reg f2_FIFO_writing_done,
    output reg f2_new_line_FIFO_done,
    output reg f2_new_frame_FIFO_done,

    // F3
    input [31:0] f3_din,
    input f3_wr_en,
    input f3_new_line,
    input f3_new_frame,
    output reg f3_FIFO_writing_done,
    output reg f3_new_line_FIFO_done,
    output reg f3_new_frame_FIFO_done,
    
    // F4
    input [31:0] f4_din,
    input f4_wr_en,
    input f4_new_line,
    input f4_new_frame,
    output reg f4_FIFO_writing_done,
    output reg f4_new_line_FIFO_done,
    output reg f4_new_frame_FIFO_done,
    
    // F5
    input [31:0] f5_din,
    input f5_wr_en,
    input f5_new_line,
    input f5_new_frame,
    output reg f5_FIFO_writing_done,
    output reg f5_new_line_FIFO_done,
    output reg f5_new_frame_FIFO_done,
    
    // F6
    input [31:0] f6_din,
    input f6_wr_en,
    input f6_new_line,
    input f6_new_frame,
    output reg f6_FIFO_writing_done,
    output reg f6_new_line_FIFO_done,
    output reg f6_new_frame_FIFO_done,


    // OTHERS
    output tx_busy_TDC, // debugging
    // output new_data_FROM_FIFO_TO_SERIAL, // debugging
    output w_tx_OUT_TDC
    // output w_empty, // debugging
    // output w_full, // debugging
    // output reg t_rd_en // debugging
  );

  reg t_rd_en;
  reg wr_en_d, wr_en_q;
  reg [47:0] data_TO_FIFO_d, data_TO_FIFO_q;
  reg new_data_FROM_FIFO_TO_SERIAL_d, new_data_FROM_FIFO_TO_SERIAL_q;
  

  wire [47:0] w_data_FROM_FIFO_TO_SERIAL;
  
  assign new_data_FROM_FIFO_TO_SERIAL = new_data_FROM_FIFO_TO_SERIAL_q;






  serial_tx2_11 #(.CLK_PER_BIT(BAUD_RATE_PARAM)) serial_tx_TDC (
    // INPUT
    .clk(clk),
    .rst(rst), 
    .block(rst), 
    .new_data(new_data_FROM_FIFO_TO_SERIAL_q),
    .data(w_data_FROM_FIFO_TO_SERIAL),
    
    // OUTPUT
    .tx(w_tx_OUT_TDC), 
    .busy(tx_busy_TDC) 
  );

  fifo_12 #(.FIFO_WIDTH(FIFO_WIDTH)) fifo (
    // INPUT
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en_q),
    .rd_en(t_rd_en),
    .buf_in(data_TO_FIFO_q),

    // OUTPUT
    .buf_out(w_data_FROM_FIFO_TO_SERIAL),
    .buf_empty(w_empty),
    .buf_full(w_full),
    .fifo_counter()
  );

  /* Combinational Logic */
  always @* begin
    
    // delay_d = delay_q;
    data_TO_FIFO_d = data_TO_FIFO_q;
    wr_en_d = wr_en_q;
    new_data_FROM_FIFO_TO_SERIAL_d = new_data_FROM_FIFO_TO_SERIAL_q;

    // MUST USE nested IF!! since priority matters..
    
    // // F1
    // // TDC
    if (f1_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {f1_din[31:0],16'h0001};

      f1_FIFO_writing_done=1'b1;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
      
      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS
    end else if (f1_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0001};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b1;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;
    
    end else if (f1_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0001};
      
      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b1;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;

      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
    
      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // // F2
    // // TDC
    end else if (f2_wr_en==1'b1) begin
    // if (f2_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {f2_din[31:0],16'h0002};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b1;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
      
      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS
    end else if (f2_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0002};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b1;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;
    
    end else if (f2_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0002};
      
      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b1;

      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
    
      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;


    // F3
    // TDC
    end else if (f3_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {f3_din[31:0],16'h0003};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b1;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS
    end else if (f3_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0003};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b1;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
    
      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    end else if (f3_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0003};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;

      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b1;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // F4
    // TDC 
    end else if (f4_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {f4_din[31:0],16'h0004};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b1;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS
    end else if (f4_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0004};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b1;
      f4_new_frame_FIFO_done=1'b0;
      
      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    end else if (f4_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0004};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;

      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b1;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // F5
    // TDC
    end else if (f5_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {f5_din[31:0],16'h0005};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b1;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS
    end else if (f5_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0005};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      
      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b1;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    end else if (f5_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0005};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;

      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b1;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // F6
    // TDC
    end else if (f6_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {f6_din[31:0],16'h0006};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b1;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS
    end else if (f6_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0006};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
    
      f3_FIFO_writing_done=1'b0;  
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      
      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b1;
      f6_new_frame_FIFO_done=1'b0;

    end else if (f6_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0006};

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;

      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b1;




    // NONE
    end else begin
      wr_en_d = 1'b0;

      f1_FIFO_writing_done=1'b0;
      f1_new_line_FIFO_done=1'b0;
      f1_new_frame_FIFO_done=1'b0;

      f2_FIFO_writing_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;

      f3_FIFO_writing_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;

      f4_FIFO_writing_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;

      f5_FIFO_writing_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;

      f6_FIFO_writing_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    end


    // READ ALL TIME, IF SOMETHING EXIST IMMEDIATELY RELEASE
    if (!w_empty && !tx_busy_TDC && !new_data_FROM_FIFO_TO_SERIAL_q) begin // since to be busy 1 cycle is needed, if 1 cycle between data from FIFO -> loss -> use new_data checking (1 cycle before to get busy)
        t_rd_en = 1'b1;
        new_data_FROM_FIFO_TO_SERIAL_d = 1'b1;
    end else begin
        t_rd_en = 1'b0;
        new_data_FROM_FIFO_TO_SERIAL_d = 1'b0;
    end

  end // always
  
  /* Sequential Logic */
  always @(posedge clk) begin
    if (rst) begin
      // Add flip-flop reset values here
    end else begin
      // Add flip-flop q <= d statements here
      // delay_q <= delay_d;
      wr_en_q <= wr_en_d;
      data_TO_FIFO_q <= data_TO_FIFO_d;
      new_data_FROM_FIFO_TO_SERIAL_q <= new_data_FROM_FIFO_TO_SERIAL_d;
      
    end
  end
  
endmodule
