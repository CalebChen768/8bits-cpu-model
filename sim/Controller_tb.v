`timescale 1ns / 1ps

module Controller_tb;
reg clk,rst;
reg [27:0] ctrl;
reg [3:0] Tgt1,Tgt2;
wire [7:0] T;
wire IA,IB,IADD,ISUB,IADC,ISBB,IMUL,IDIV,
                IINC,IDEC,ISHL,ISHR,INOT,INEG,IAND,IOR,
                IJMP,IJA,IJB,IJE,EALU,I0,E0,I1,E1,I2,E2,I3,E3,IF,EF,
                IDFR,IDFB,EDTB,iwr,IPC,IMPC,IMAR,IIR,IMARB;
 
 Controller u0(ctrl,
 Tgt1,Tgt2,
 T,
IA,IB,IADD,ISUB,IADC,ISBB,IMUL,IDIV,
                IINC,IDEC,ISHL,ISHR,INOT,INEG,IAND,IOR,
                IJMP,IJA,IJB,IJE,EALU,I0,E0,I1,E1,I2,E2,I3,E3,IF,EF,
                IDFR,IDFB,EDTB,iwr,IPC,IMPC,IMAR,IIR,IMARB) ;
                
SG u1(clk,rst,T);            

initial begin 	
clk = 1'b1;
rst=1;
end	
always #5 clk = ~clk;	
initial begin
#80 ctrl=28'b0000_0000_0000_1000_0000_0000_0000;Tgt1=4'b0001;Tgt2=4'b1000;
#80 ctrl=28'b0000_0000_0000_0000_0010_0000_0000;Tgt1=4'b0001;Tgt2=4'b0000;
#80 ctrl=28'b0010_0000_0000_0000_0000_0000_0000;Tgt1=4'b0001;Tgt2=4'b0000;
#80 ctrl=28'b0000_0000_0000_0001_0000_0000_0000;Tgt1=4'b0001;Tgt2=4'b0000;
#80 ctrl=28'b0000_0000_0000_0000_0000_0000_0001;Tgt1=4'b0000;Tgt2=4'b0000;

end
          
endmodule
