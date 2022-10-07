`timescale 1ns / 1ps

//clk EN1 rst0 D -> Q
module LS377(
    input wire clk,
    input wire EN,
    input wire rst,
    input wire [7:0] D,
    output wire [7:0] Q,
    output wire  [7:0] Dshow
    );
    
reg [7:0] data=8'b0000_0000;

assign Q = data;
assign Dshow=data;     
always @ (posedge clk or negedge rst) begin
    if(rst == 0)
        data = 8'b0000_0000;
    else if(EN == 1) 
        data = D;
end
endmodule
