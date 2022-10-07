`timescale 1ns / 1ps

module LS377_tb;

reg CLK;
reg rst;
reg EN;
reg [7:0] D;
wire [7:0] Q;

LS377 DUT(
    .clk(CLK),
    .rst(rst),
    .EN(EN),
    .D(D),
    .Q(Q)
);

initial begin 	
CLK = 1'b1;
rst=1;
EN=0;
end	
always #5 CLK = ~CLK;	
initial begin
#10  D=8'd12; EN=0; 
#10  D=8'd13; EN=1;
#10  D=8'd14; EN=0;
#10  D=8'd15;
#10  D=8'd16; EN=1;
#10  D=8'd17;
#10  D=8'd18; EN=0;
#10  D=8'd19;
#10  D=8'd20;rst=0;
#10  D=8'd21;rst=1;
#10  D=8'd22;EN=1;
#10   $stop;
end

endmodule
