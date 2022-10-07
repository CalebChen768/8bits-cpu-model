`timescale 1ns/10ps
module ram_ip_tb();
	reg  we,clk,EDTB;
	reg  [5:0] addr;
	reg  [7:0] data_in;
	wire [7:0] data_out;
	wire [7:0] DR_MAR;
	
ram_ip DUT(
.iwr   (we),
.clk  (clk),
.EDTB(EDTB),
.addr (addr),
.din  (data_in),
.dout (data_out),
.to_MAR(DR_MAR)
 );
initial begin 
#20 we   = 1'b0;EDTB=1;clk  = 1'b0;addr = 6'd0;	
end
always #10 clk = ~ clk;
initial begin
#20 we = 1'b0; 
#20 addr = 6'd0; 
#20 addr = 6'd1; 
#20 addr = 6'd2; 
#20 addr = 6'd3; 
#20 addr = 6'd4; 
#20 addr = 6'd5;

#20   we   = 1'b1;  addr = 6'd0;  data_in = 8'h3e;
#20 addr = 6'd1;  data_in = 8'h6;
#20 addr = 6'd2;  data_in = 8'hc6;
#20 addr = 6'd3;  data_in = 8'h7;
#20 addr = 6'd4;  data_in = 8'h76;
#20 addr = 6'd5; data_in = 8'b0000_0000; 
#20 addr = 6'd6; data_in = 8'bxxxx_xxxx; 
#20 we = 1'b0; 
#20 addr = 6'd6; 
#20 addr = 6'd5; 
#20 addr = 6'd4; 
#20 addr = 6'd3; 
#20 addr = 6'd2; 
#20 addr = 6'd1; 
#20  $stop;
end 
endmodule 