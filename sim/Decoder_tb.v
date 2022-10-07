`timescale 1ns / 1ps


module Decoder_tb;

 reg [7:0] cmd;
 wire [27:0] res;
wire [3:0] Tgt1, Tgt2;


Decoder dut(cmd,res,Tgt1,Tgt2);

initial begin
#10 cmd=8'b00000000;
#10 cmd=8'b00000001;
#10 cmd=8'b00000010;
#10 cmd=8'b11000000;
#10 cmd=8'b11000101;
#10 cmd=8'b11001010;
#10 cmd=8'b11001111;
#10 cmd=8'b11010000;
#10 cmd=8'b11010101;
#10 cmd=8'b11011010;
#10 cmd=8'b11011111;
#10 cmd=8'b11100000;
#10 cmd=8'b11100101;
#10 cmd=8'b11101010;
#10 cmd=8'b00011100;
#10 cmd=8'b00100011;
#10 cmd=8'b00111011;
#10 cmd=8'b01000100;
#10 cmd=8'b01010100;
#10 cmd=8'b01101010;
#10 cmd=8'b01110011;
#10 cmd=8'b10001010;
#10 cmd=8'b10011111;
#10 cmd=8'b10100000;
#10 $stop;
end

endmodule
