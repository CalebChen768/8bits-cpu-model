`timescale 1ns / 1ps

module ALU_tb;

reg clk,rst,IADD,ISUB,IADC,ISBB,IMUL,IDIV,IINC,IDEC,ISHL,ISHR,INOT,INEG,IAND,IOR,IJMP,IJA,IJB,IJE,EALU;

reg [3:0] Tgt1, Tgt2;
reg [7:0] DR0,DR1, DR2,DR3;
    
reg [7:0]Flags_in;
wire [7:0] Flags_out;
wire [7:0] Dout,Dout_R1;
wire IJ;

ALU u0(clk,rst,Tgt1,Tgt2,DR0,DR1,DR2,DR3,
IADD,ISUB,IADC,ISBB,IMUL,IDIV,IINC,IDEC,ISHL,ISHR,INOT,INEG,IAND,IOR,IJMP,IJA,IJB,IJE,EALU,
Flags_in,Flags_out, Dout,Dout_R1,IJ);



initial begin
   clk = 1; rst = 1;
end
initial begin
#10 DR0=8'h20;DR1=8'h21;DR2=8'h22;DR3=8'h23;Flags_in=8'b00000001;
#10 Tgt1=4'b0001;Tgt2=4'b1000;EALU=1;
#10 IADD=1;
#10 IADD=0;ISUB=1;
#10 ISUB=0;IADC=1;
#10 IADC=0;ISBB=1;
#10 ISBB=0;IMUL=1;
#10 IMUL=0;IDIV=1;
#10 IDIV=0;INOT=1;
#10 INOT=0;INEG=1;
#10 INEG=0;IAND=1;
#10 IAND=0;IOR=1;
#10 IOR=0;
#10 DR0=8'h20;DR1=8'h21;DR2=8'h22;DR3=8'h1;Flags_in=8'b00000001;
#10 ISHL=1;
#10 ISHL=0;ISHR=1;
#10 ISHR=0;
#10 IJMP=1;
#10 IJMP=0;IJA=1;
#10 $stop;
end

endmodule
