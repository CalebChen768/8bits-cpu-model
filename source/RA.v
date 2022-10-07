`timescale 1ns / 1ps

module RA(
    input wire clk,//clock
    input wire rst,//1->0 negedge clear
    input wire I0,
    input wire E0,//R0 signal
    input wire I1,
    input wire E1,//R1 signal
    input wire I2,
    input wire E2,//R2 signal
    input wire I3,
    input wire E3,//R3 signal
    input wire IF,
    input wire EF,//Flags
    input wire IMUL,//ctrl signal MUL AUL to R1 
    input wire IDIV,
    input wire [7:0] Din,//R0~R3
    input wire [7:0] DinA,//low 8 bit from ALU to R1
    input wire [7:0] Flags_in,//Flags in
    output wire [7:0] Dout0,
   // output wire [7:0] Dout1,
    //output wire [7:0] Dout2,
    //output wire [7:0] Dout3,//R out
    output wire [7:0] Flags_out,//Flags out
    output wire [7:0] DR0,  
    output wire [7:0] DR1,  
    output wire [7:0] DR2,  
    output wire [7:0] DR3
    );

wire [7:0] Dto_R1;
    
R r0(
    .clk(clk),
    .rst(rst),
    .IR(I0),
    .ER(E0),
    .Din(Din),
    .Dout(Dout0),
    .Dshow(DR0)
);

MUX mux(
    .D1(Din),
    .D2(DinA),
    .ctrl(IMUL||IDIV),
    .D(Dto_R1)
);

R r1(
    .clk(clk),
    .rst(rst),
    .IR(IMUL||IDIV||I1),
    .ER(E1),
    .Din(Dto_R1),
    .Dout(Dout0),
    .Dshow(DR1)
);

R r2(
    .clk(clk),
    .rst(rst),
    .IR(I2),
    .ER(E2),
    .Din(Din),
    .Dout(Dout0),
    .Dshow(DR2)
);

R r3(
    .clk(clk),
    .rst(rst),
    .IR(I3),
    .ER(E3),
    .Din(Din),
    .Dout(Dout0),
    .Dshow(DR3)
);

R psw(
     .clk(clk),
     .rst(rst),
     .IR(IF),
     .ER(EF),
     .Din(Flags_in),
     .Dout(Flags_out)
    );
 
endmodule
