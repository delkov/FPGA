module my_clk_10 #(
    parameter CLK_DIV = 16
    )(
    // INPUT
    input clk,  
    input rst,  
    
    // OUTPUT
    output my_clk
  );

  assign my_clk = my_clk_q;
  
  parameter CTR_SIZE = $clog2(CLK_DIV); //$clog2(2**CLK_DIV);

  reg [CTR_SIZE-1:0] cnt_d, cnt_q;
  reg my_clk_q, my_clk_d;

  /* Combinational Logic */
  always @* begin
    //out = 0;
    cnt_d = cnt_q + 1'b1;
    if (cnt_q <= {CTR_SIZE-1{1'b1}}) begin
       // counter isn't max value yet
      my_clk_d=1'b0;
    end else begin
      //cnt_d=0;
      my_clk_d=1'b1;
  //    ready_d = 1'b1; // counter reached the max, we are ready
    end
    
  end
  
  /* Sequential Logic */
  always @(posedge clk) begin
    if (rst) begin
      // Add flip-flop reset values here
     // cnt_q<=0;
    end else begin
      // Add flip-flop q <= d statements here
      cnt_q <= cnt_d;
    end
    my_clk_q <= my_clk_d;
  end
  
endmodule
