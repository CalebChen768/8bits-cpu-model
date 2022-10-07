`timescale 1ns / 1ps

module IR(
    input wire clk,
    input wire rst,
    input wire IIR,
    input wire [7:0] Din,
    output wire [7:0] Dout
    );
    
LS377 u_IR(
    .clk(clk),
    .rst(rst),
    .EN(IIR),
    .D(Din),
    .Q(Dout)
    );     
endmodule
