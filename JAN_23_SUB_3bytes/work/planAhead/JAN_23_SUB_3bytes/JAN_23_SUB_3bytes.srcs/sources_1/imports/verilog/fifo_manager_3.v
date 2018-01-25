module fifo_manager_3 #(
    parameter BAUD_RATE_PARAM = 4000000,
    parameter FIFO_WIDTH = 10
    )(

    // INPUT
    input clk,  // clock
    input rst,  // reset

    // TDC
    input [31:0] f1_din,
    input [31:0] f2_din,
    
    input f1_wr_en,
    input f2_wr_en,
    input f3_wr_en,
    input f4_wr_en,
    input f5_wr_en,
    input f6_wr_en,

    // MEMS
    input f1_new_line,
    input f2_new_line,
    input f3_new_line,
    input f4_new_line,
    input f5_new_line,
    input f6_new_line,
    
    input f1_new_frame,
    input f2_new_frame,
    input f3_new_frame,
    input f4_new_frame,
    input f5_new_frame,
    input f6_new_frame,

  
    // OUTPUT

    // TDC
    output reg f1_FIFO_writing_done,
    output reg f2_FIFO_writing_done,
    output reg f3_FIFO_writing_done,
    output reg f4_FIFO_writing_done,
    output reg f5_FIFO_writing_done,
    output reg f6_FIFO_writing_done,
    
    // MEMS
    output reg f1_new_line_FIFO_done,
    output reg f2_new_line_FIFO_done,
    output reg f3_new_line_FIFO_done,
    output reg f4_new_line_FIFO_done,
    output reg f5_new_line_FIFO_done,
    output reg f6_new_line_FIFO_done,

    output reg f1_new_frame_FIFO_done,
    output reg f2_new_frame_FIFO_done,
    output reg f3_new_frame_FIFO_done,
    output reg f4_new_frame_FIFO_done,
    output reg f5_new_frame_FIFO_done,
    output reg f6_new_frame_FIFO_done,


    // OTHERS
    output tx_busy_TDC, // debugging
    output new_data_FROM_FIFO_TO_SERIAL, // debugging
    output w_tx_OUT_TDC, 
    output w_empty, // debugging
    output w_full, // debugging
    output reg t_rd_en // debugging
  );

  // reg t_rd_en;
  reg wr_en_d, wr_en_q;
  reg [47:0] data_TO_FIFO_d, data_TO_FIFO_q;
  reg new_data_FROM_FIFO_TO_SERIAL_d, new_data_FROM_FIFO_TO_SERIAL_q;
  

  wire [47:0] w_data_FROM_FIFO_TO_SERIAL;
  
  assign new_data_FROM_FIFO_TO_SERIAL = new_data_FROM_FIFO_TO_SERIAL_q;



  serial_tx2_14 #(.CLK_PER_BIT(BAUD_RATE_PARAM)) serial_tx_TDC (
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

  fifo_15 #(.FIFO_WIDTH(FIFO_WIDTH)) fifo (
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

    wr_en_d = wr_en_q;
    data_TO_FIFO_d = data_TO_FIFO_q;
    new_data_FROM_FIFO_TO_SERIAL_d = new_data_FROM_FIFO_TO_SERIAL_q;

    // MUST USE nested IF!! since priority matters..
    
    // TDC_1
    if (f1_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      f1_FIFO_writing_done=1'b1; // fifo_writing_done
      data_TO_FIFO_d = {f1_din[31:0],16'h0001};
      // data_TO_FIFO_d = {16'h6978,16'h00D4,16'h0001};
      // data_TO_FIFO_d = {16'h00D4, 16'h00D4,16'h0001};

      // TDC
      f2_FIFO_writing_done=1'b0;
      f3_FIFO_writing_done=1'b0;
      f4_FIFO_writing_done=1'b0;
      f5_FIFO_writing_done=1'b0;
      f6_FIFO_writing_done=1'b0;

      // MEMS
      f1_new_line_FIFO_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f6_new_line_FIFO_done=1'b0;

      f1_new_frame_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;


    // TDC_2
    end else if (f2_wr_en==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      f2_FIFO_writing_done=1'b1;
      // data_TO_FIFO_d = {16'h6978,16'h03E8,16'h0064,16'h0002};
      data_TO_FIFO_d = {f2_din[31:0],16'h0002};


      // TDC
      f1_FIFO_writing_done=1'b0;
      f3_FIFO_writing_done=1'b0;
      f4_FIFO_writing_done=1'b0;
      f5_FIFO_writing_done=1'b0;
      f6_FIFO_writing_done=1'b0;

      // MEMS
      f1_new_line_FIFO_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f6_new_line_FIFO_done=1'b0;

      f1_new_frame_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // // TDC_3
    // end else if (f3_wr_en==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f3_FIFO_writing_done=1'b1;
    //   // data_TO_FIFO_d = {16'h6978,16'h03E8,16'h00A4,16'h0003};
    //   data_TO_FIFO_d = {16'h00D4,16'h00D4,16'h0003};


    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // TDC_4
    // end else if (f4_wr_en==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f4_FIFO_writing_done=1'b1;
    //   // data_TO_FIFO_d = {16'h6978,16'h03E8,16'h00A4,16'h0004};
    //   data_TO_FIFO_d = {16'h00D4,16'h00D4,16'h0004};


    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // TDC_5
    // end else if (f5_wr_en==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f5_FIFO_writing_done=1'b1;
    //   // data_TO_FIFO_d = {16'h6978,16'h03E8,16'h00A4,16'h0005};
    //   data_TO_FIFO_d = {16'h00D4,16'h00D4,16'h0005};


    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0;
    //   f4_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // TDC_6
    // end else if (f6_wr_en==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f6_FIFO_writing_done=1'b1;
    //   // data_TO_FIFO_d = {16'h6978,16'h03E8,16'h00A4,16'h0006};
    //   data_TO_FIFO_d = {16'h00D4,16'h00D4,16'h0006};


    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0;
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // MEMS_1
    end else if (f1_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      f1_new_line_FIFO_done=1'b1;
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0001};

      // TDC
      f1_FIFO_writing_done=1'b0;
      f2_FIFO_writing_done=1'b0;
      f3_FIFO_writing_done=1'b0;
      f4_FIFO_writing_done=1'b0;
      f5_FIFO_writing_done=1'b0;
      f6_FIFO_writing_done=1'b0;

      // MEMS
      f2_new_line_FIFO_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      
      f1_new_frame_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS_1
    end else if (f1_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      f1_new_frame_FIFO_done=1'b1;
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0001};

      // TDC
      f1_FIFO_writing_done=1'b0;
      f2_FIFO_writing_done=1'b0;
      f3_FIFO_writing_done=1'b0;
      f4_FIFO_writing_done=1'b0;
      f5_FIFO_writing_done=1'b0;
      f6_FIFO_writing_done=1'b0;

      // MEMS
      f1_new_line_FIFO_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f6_new_line_FIFO_done=1'b0;
      
      f2_new_frame_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // MEMS_2
    end else if (f2_new_line==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      f2_new_line_FIFO_done=1'b1;
      data_TO_FIFO_d = {16'h000D,16'h000D,16'h0002};

      // TDC
      f1_FIFO_writing_done=1'b0;
      f2_FIFO_writing_done=1'b0;
      f3_FIFO_writing_done=1'b0;  
      f4_FIFO_writing_done=1'b0;
      f5_FIFO_writing_done=1'b0;
      f6_FIFO_writing_done=1'b0;

      // MEMS
      f1_new_line_FIFO_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f6_new_line_FIFO_done=1'b0;

      f1_new_frame_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;
    
    // MEMS_2
    end else if (f2_new_frame==1'b1) begin
      wr_en_d=1'b1; // write TO FIFO
      f2_new_frame_FIFO_done=1'b1;
      data_TO_FIFO_d = {16'h000E,16'h000E,16'h0002};

      // TDC
      f1_FIFO_writing_done=1'b0;
      f2_FIFO_writing_done=1'b0;
      f3_FIFO_writing_done=1'b0;  
      f4_FIFO_writing_done=1'b0;
      f5_FIFO_writing_done=1'b0;
      f6_FIFO_writing_done=1'b0;

      // MEMS
      f1_new_line_FIFO_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f6_new_line_FIFO_done=1'b0;

      f1_new_frame_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
      f6_new_frame_FIFO_done=1'b0;

    // // MEMS_3
    // end else if (f3_new_line==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f3_new_line_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000D,16'h000D,16'h0003};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0; 
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // MEMS_3
    // end else if (f3_new_frame==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f3_new_frame_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000E,16'h000E,16'h0003};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0;  
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // MEMS_4
    // end else if (f4_new_line==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f4_new_line_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000D,16'h000D,16'h0004};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0; 
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // MEMS_4
    // end else if (f4_new_frame==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f4_new_frame_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000E,16'h000E,16'h0004};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0;  
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    //    // MEMS_5
    // end else if (f5_new_line==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f5_new_line_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000D,16'h000D,16'h0005};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0; 
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // MEMS_5
    // end else if (f5_new_frame==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f5_new_frame_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000E,16'h000E,16'h0005};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0;  
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    //   // MEMS_6
    // end else if (f6_new_line==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f6_new_line_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000D,16'h000D,16'h0006};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0; 
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;
    //   f6_new_frame_FIFO_done=1'b0;

    // // MEMS_6
    // end else if (f6_new_frame==1'b1) begin
    //   wr_en_d=1'b1; // write TO FIFO
    //   f6_new_frame_FIFO_done=1'b1;
    //   data_TO_FIFO_d = {16'h000E,16'h000E,16'h0006};

    //   // TDC
    //   f1_FIFO_writing_done=1'b0;
    //   f2_FIFO_writing_done=1'b0;
    //   f3_FIFO_writing_done=1'b0;  
    //   f4_FIFO_writing_done=1'b0;
    //   f5_FIFO_writing_done=1'b0;
    //   f6_FIFO_writing_done=1'b0;

    //   // MEMS
    //   f1_new_line_FIFO_done=1'b0;
    //   f2_new_line_FIFO_done=1'b0;
    //   f3_new_line_FIFO_done=1'b0;
    //   f4_new_line_FIFO_done=1'b0;
    //   f5_new_line_FIFO_done=1'b0;
    //   f6_new_line_FIFO_done=1'b0;

    //   f1_new_frame_FIFO_done=1'b0;
    //   f2_new_frame_FIFO_done=1'b0;
    //   f3_new_frame_FIFO_done=1'b0;
    //   f4_new_frame_FIFO_done=1'b0;
    //   f5_new_frame_FIFO_done=1'b0;

    // NONE
    end else begin
      wr_en_d = 1'b0;

      // TDC
      f1_FIFO_writing_done=1'b0;
      f2_FIFO_writing_done=1'b0;
      f3_FIFO_writing_done=1'b0;
      f4_FIFO_writing_done=1'b0;
      f5_FIFO_writing_done=1'b0;
      f6_FIFO_writing_done=1'b0;

      // MEMS
      f1_new_line_FIFO_done=1'b0;
      f2_new_line_FIFO_done=1'b0;
      f3_new_line_FIFO_done=1'b0;
      f4_new_line_FIFO_done=1'b0;
      f5_new_line_FIFO_done=1'b0;
      f6_new_line_FIFO_done=1'b0;

      f1_new_frame_FIFO_done=1'b0;
      f2_new_frame_FIFO_done=1'b0;
      f3_new_frame_FIFO_done=1'b0;
      f4_new_frame_FIFO_done=1'b0;
      f5_new_frame_FIFO_done=1'b0;
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


      // x1_fifo_writing_done_q <= x1_fifo_writing_done_d;
      // new_line_FIFO_done_q <= new_line_FIFO_done_d;
      // new_frame_FIFO_done_q <= new_frame_FIFO_done_d;


      wr_en_q <= wr_en_d;
      data_TO_FIFO_q <= data_TO_FIFO_d;
      new_data_FROM_FIFO_TO_SERIAL_q <= new_data_FROM_FIFO_TO_SERIAL_d;
      
    end
  end
  
endmodule
