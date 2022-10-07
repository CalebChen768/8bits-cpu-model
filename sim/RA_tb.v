`timescale 1ns / 1ps

module RA_tb(

    );
    
reg clk,rst,I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL,IDIV;
reg [7:0] Din,Din_Low, Flags_in;
wire [7:0] Dout0, Flags_out;

wire [7:0] DR0, DR1, DR2, DR3;

RA u0(
     .clk(clk),
     .rst(rst),
     .I0(I0),
     .E0(E0),
     .I1(I1),
     .E1(E1),
     .I2(I2),
     .E2(E2),
     .I3(I3),
     .E3(E3),
     .IF(IF),
     .EF(EF),
     .IMUL(IMUL),
     .IDIV(IDIV),
     .Din(Din),
     .DinA(Din_Low),
     .Flags_in(Flags_in),
     .Dout0(Dout0),
     .Flags_out(Flags_out),
     .DR0(DR0),
     .DR1(DR1),
     .DR2(DR2),
     .DR3(DR3)
    );
    
initial begin 	
clk = 1'b1;
rst=1;
{I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0000_000;IDIV=0;
end	
always #5 clk = ~clk;	
initial begin
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b1000_0000_000;Din = 8'd12;IDIV=0;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0100_0000_000;Din = 8'd13;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0010_0000_000;Din = 8'd14;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0001_0000_000;Din = 8'd15;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_1000_000;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0100_000;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0010_000;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0001_000;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0000_001;Din_Low = 8'd21;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0100_000;Din = 8'd20;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0000_100;Flags_in = 8'd23;
#10 {I0,I1,I2,I3,E0,E1,E2,E3,IF,EF,IMUL}=11'b0000_0000_010;
#10 $stop;
end
    
endmodule
