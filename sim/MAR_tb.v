`timescale 1ns / 1ps


module MAR_tb;
reg clk, IMAR, IMARB;
reg[5:0] Din;//PC计数器传来的地址
reg [7:0] DinD;//PC计数器传来的地址
reg  rst;
wire [5:0] Dout;

MAR u0(clk, IMAR, IMARB,
 Din,DinD, rst, Dout);

initial begin 	
    clk = 1'b1;
    rst=0;
end   
always #5 clk=~clk;
initial begin
#10 rst=1;
#10 Din=6'd12; DinD=8'd33; IMAR=1;IMARB=0;
#10 Din=6'd13; DinD=8'd34; IMAR=0;
#10 Din=6'd14; DinD=8'd35; IMAR=1;
#10 Din=6'd15; DinD=8'd36; IMARB=1;IMAR=0;
#10 Din=6'd16; DinD=8'd37; IMARB=0;
#10 Din=6'd17; DinD=8'd38; IMARB=1;
#10 $stop;
end


endmodule
