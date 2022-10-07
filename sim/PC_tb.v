`timescale 1ns / 1ps

module PC_tb(

    );
    
reg  clk,IPC, IMPC, rst,IJ;
reg [7:0] Din;
wire [5:0] Dout;
    
PC u0(
    .clk(clk),
    .IPC(IPC),
    .IMPC(IMPC),
    .IJ(IJ),
    .rst(rst),
    .Din(Din),
    .Dout(Dout)
);
    
initial begin 	
    clk = 1'b1;
    rst=0;
end   
always #5 clk=~clk;
initial begin
#10 rst=1;
#10 IPC=1;
#10 IPC=1;
#10 IPC=1;
#10 IMPC=1; Din=6'h11;
#10 IMPC=1;IJ=1;IPC=0;Din=6'h15;
#10 IPC=1;IMPC=0;IJ=0;
#10 IMPC=1;IJ=1;IPC=0; Din=6'h20;
#10 IPC=1;IMPC=0;IJ=0;
#10 IPC=1;IMPC=0;

#10 $stop;
end

    
endmodule
