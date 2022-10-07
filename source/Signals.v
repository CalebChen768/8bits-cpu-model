`timescale 1ns / 1ps

//½ÚÅÄ·¢ÉúÆ÷ clk rst0 
module SG(
    input wire clk,
    input wire  rst,
    output  wire [7:0] signals
    );
reg [7:0] state = 8'b10000000;

    
    assign signals = state;
    always @(posedge clk or negedge rst) begin
    if(rst == 0) 
        state = 8'b10000000;
    else if(clk==1) begin
        state[7:1] <= state[6:0];
        state[0] <= state[7];
    end
end
//wire [7:0] original;
//assign original = {~rst,rst,rst,rst,rst,rst,rst,rst};    
//assign signals[7:0] = (rst&{signals[6:0],signals[7]})|(~rst&original[7:0]) ;

endmodule
