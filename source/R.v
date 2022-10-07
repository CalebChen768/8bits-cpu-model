`timescale 1ns / 1ps

//Register
module R(
    input wire clk,
    input wire rst,
    input wire IR,
    input wire ER,
    input wire [7:0] Din,
    output wire [7:0] Dout,
    output wire [7:0] Dshow
    );
    
wire [7:0] data;    

LS377 u0(
   .clk(IR),
   .rst(rst),
   .EN(IR),
   .D(Din),
   .Q(data),
   .Dshow(Dshow)
);

Tri u1(
    .din(data),
    .en(ER),
    .dout(Dout)
);

endmodule
