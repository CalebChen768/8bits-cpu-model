`timescale 1ns / 1ps

module MUX(
    input [7:0] D1,D2,
    input ctrl,
    output wire [7:0] D 
    );
    
assign D[7] = (D1[7]&&~ctrl)|| (D2[7]&&ctrl); 
assign D[6] = (D1[6]&&~ctrl)|| (D2[6]&&ctrl); 
assign D[5] = (D1[5]&&~ctrl)|| (D2[5]&&ctrl); 
assign D[4] = (D1[4]&&~ctrl)|| (D2[4]&&ctrl); 
assign D[3] = (D1[3]&&~ctrl)|| (D2[3]&&ctrl); 
assign D[2] = (D1[2]&&~ctrl)|| (D2[2]&&ctrl); 
assign D[1] = (D1[1]&&~ctrl)|| (D2[1]&&ctrl); 
assign D[0] = (D1[0]&&~ctrl)|| (D2[0]&&ctrl); 

endmodule
