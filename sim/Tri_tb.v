`timescale 1ns / 1ps

module Tri_tb(

    );
    
reg [7:0] din;
reg en;
wire [7:0] dout;

Tri u0(din,en,dout);

initial begin
#10 din=8'd11; en=1;
#10 din=8'd12; en=1;
#10 din=8'd13; en=0;
#10 din=8'd14; en=0;
#10 din=8'd15; en=0;
#10 din=8'd16; en=1;
#10 din=8'd17; en=1;
#10 din=8'd18; en=1;
#5 $stop;
end    
endmodule
