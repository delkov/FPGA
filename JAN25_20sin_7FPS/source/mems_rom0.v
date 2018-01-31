module mems_rom (
	input rst,
    input clk,
    input [15:0] addr,
    // input [7:0] delta_A,
    // input [7:0] delta_B,
    // input [7:0] delta_C,
    // input [7:0] delta_D,
    output [23:0] data,
	output rom_scan_is_done
  );
  
  parameter rom_size = 4800;
 
  reg [15:0] rom_data [rom_size:0];
  reg [23:0] data_d, data_q;
  wire[14:0] addrs;
  reg [15:0] antidata;
  reg done;
 
  assign data = data_q;
  assign rom_scan_is_done = done;
  assign addrs = addr[15:2];

  
  always @(rst,addrs) begin
	if (rst) begin
        done = 1'b0;
	end	
	else begin
		if (addrs == rom_size)
			done = 1'b1;
		else
			done = 1'b0;
	end		
  end
 
  always @(*) begin
	antidata = 16'hB900 - rom_data[addrs];
	
 


	if (addr[0]==1'b0) begin
		data_d = 24'b00111000_0000000000000000;	//Vref send in 50% samples	
	end	
	
	else begin //data in 50%
		if (addr[1]==1'b0) begin
			data_d = {6'b000110,addr[2], addr[1], rom_data[addrs]};
		//data_d = 24'b00111000_0000000000000000;
		end
		else if(addr[1]==1'b1) begin
			data_d = {6'b000110,addr[2:1],antidata};
			//data_d = 24'b00111000_0000000000000000;
		end
	end
  end


  always @(posedge clk) begin
  
  	if (addr==0) begin
		data_q <= 24'b001010000000000000000001; // SOFT_RESET;//
	end
	else if (addr==1) begin
		data_q <= 24'b00111000_0000000000000000;	//Vref 
	end
	else begin
		data_q <= data_d;
	end
  end
 
endmodule