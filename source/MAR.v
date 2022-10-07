`timescale 1ns / 1ps

module MAR(
        input wire clk,
        input wire IMAR,
        input wire IMARB,
        input wire [5:0] Din,//PC计数器传来的地址
        input wire [7:0] Din_BUS,//PC计数器传来的地址
        input wire  rst,
        output wire [5:0] Dout
    );
    
reg [5:0] addr=6'b000000;  
assign Dout=addr;

always @ (posedge IMAR or posedge IMARB or negedge rst) begin
    if(rst==0) addr=6'b000000;
    else if(IMAR==1) addr = Din;
    else if(IMARB==1) addr = Din_BUS[5:0];  
    else addr=addr;
end

endmodule
