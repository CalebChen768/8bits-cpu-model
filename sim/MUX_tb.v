`timescale 1ns / 1ps

module Mux_tb();

reg [7:0] D1,D2;
reg ctrl;
wire [7:0] Dout;

MUX u0(D1,D2,ctrl,Dout);

initial begin
#10 D1=8'd11;D2=8'd21;
#10 D1=8'd12;D2=8'd22;ctrl=1;
#10 D1=8'd13;D2=8'd23;
#10 D1=8'd14;D2=8'd24;ctrl=0;
#10 D1=8'd15;D2=8'd25;
#10 D1=8'd16;D2=8'd26;ctrl=1;
#10 $stop;
end

endmodule
