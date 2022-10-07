`timescale 1ns / 1ps

module MUX_ALU(
    input wire [3:0] Tgt1,        
    input wire [3:0] Tgt2,
    input wire [7:0] DR0,
    input wire [7:0] DR1,
    input wire [7:0] DR2,
    input wire [7:0] DR3,
    output reg [7:0] DA,
    output reg [7:0] DB
    );
   
always @(*) begin
    if(Tgt1[0]==1)
        DA=DR0;
    else if(Tgt1[1]==1)
        DA=DR1;
    else if(Tgt1[2]==1)
        DA=DR2;
    else if(Tgt1[3]==1)
        DA=DR3;
    else
        DA=8'bZZZZ_ZZZZ;   
        
    if(Tgt2[0]==1)
        DB=DR0;
    else if(Tgt2[1]==1)
        DB=DR1;
    else if(Tgt2[2]==1)
        DB=DR2;
    else if(Tgt2[3]==1)
        DB=DR3;
    else
        DB=8'bZZZZ_ZZZZ;       
end
endmodule
