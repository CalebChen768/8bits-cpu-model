`timescale 1ns / 1ps


module cpu_tb;

reg clk,rst;
wire [7:0] bus,ram;
wire [5:0] MAR;
wire [27:0] ctrl_signal;
wire [7:0] R0,R1,R2,R3;
wire HALT;

cpu DUT(clk,rst,
bus,ram,
 MAR, ctrl_signal,
 R0,R1,R2,R3,HALT);


initial begin
#5 rst=0;clk=1;
#10 rst=1;
#10 rst=0;
#55
#10 rst=1;
end
always #5 clk=~clk; 

endmodule
