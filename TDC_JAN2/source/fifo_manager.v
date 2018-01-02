module fifo_manager (
    // INPUT
    input clk,  // clock
    input rst,  // reset
    input s1_wr_en,
    input s2_wr_en,
    input [47:0] s1_din,
  
    output w_s1_fifo_writing_done,
        output w_s2_fifo_writing_done,
    // OUTPUT
    output tx_busy_TDC,
    output new_data_FROM_FIFO_TO_SERIAL,
    output w_tx_OUT_TDC,
    output w_empty,
    output w_full,
    output t_rd_en
  );

  reg t_rd_en;
  reg wr_en_d, wr_en_q;
  reg [47:0] data_TO_FIFO_d, data_TO_FIFO_q;
  reg new_data_FROM_FIFO_TO_SERIAL_d, new_data_FROM_FIFO_TO_SERIAL_q;
  
  reg s1_fifo_writing_done;
  reg s2_fifo_writing_done;

  wire [47:0] w_data_FROM_FIFO_TO_SERIAL;
  
  assign new_data_FROM_FIFO_TO_SERIAL = new_data_FROM_FIFO_TO_SERIAL_q;

  assign w_s1_fifo_writing_done = s1_fifo_writing_done;

  assign w_s2_fifo_writing_done = s2_fifo_writing_done;

  serial_tx2 #(.CLK_PER_BIT(17)) serial_tx_TDC (
    // input
    .clk(clk),
    .rst(rst), 
    .block(rst), // input
    .new_data(new_data_FROM_FIFO_TO_SERIAL_q),
    .data(w_data_FROM_FIFO_TO_SERIAL),
    // output
    .tx(w_tx_OUT_TDC), 
    .busy(tx_busy_TDC) 
  );

  fifo fifo (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en_q),
    .rd_en(t_rd_en),
    .buf_in(data_TO_FIFO_q),
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
    if (s1_wr_en) begin
      wr_en_d=1'b1; // write TO FIFO
      data_TO_FIFO_d = s1_din[47:0];
      s1_fifo_writing_done=1'b1; // fifo_writing_done

      // s1_fifo_writing_done=1'b0; 
    //   s2_fifo_writing_done=1'b0;
    // end else if (s1_wr_en) begin
    //   wr_en_d=1'b1;
    //   data_TO_FIFO_d = {8'b11111111, s1_din[39:0]};
    //   s1_fifo_writing_done=1'b1;
      
    //   s2_fifo_writing_done=1'b0; // not writing s1
    end else begin
      wr_en_d = 1'b0;
      s1_fifo_writing_done=1'b0;
      // s2_fifo_writing_done=1'b0;
    end
      

    // READ ALL TIME
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
      wr_en_q <= wr_en_d;
      data_TO_FIFO_q <= data_TO_FIFO_d;
      new_data_FROM_FIFO_TO_SERIAL_q <= new_data_FROM_FIFO_TO_SERIAL_d;

    end
  end
  
endmodule
