`timescale 1ns / 1ps

module SG_tb;

reg CLK;
reg rst;
wire [7:0] signals;

SG DUT(
    .clk(CLK),
    .rst(rst),
    .signals(signals)
);


initial begin
    CLK = 1; rst = 0;
end
always #5 CLK=~CLK;   
initial begin
 #10   rst=1;
end
endmodule
