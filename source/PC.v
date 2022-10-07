`timescale 1ns / 1ps

module PC(
     input wire clk,
     input wire IPC,
     input wire IMPC,
     input wire IJ,
     input wire rst,
     input wire [7:0] Din,
    output wire [5:0] Dout
    );
    
reg [5:0] now_addr;    
assign Dout=now_addr;
always @ (posedge clk or negedge rst) begin
    if(rst==0) now_addr=6'b000000;
    else if(IPC==1) now_addr=now_addr+1;
    else if(IMPC==1&&IJ==1) now_addr=Din[5:0];
    else now_addr=now_addr;
end    
endmodule
