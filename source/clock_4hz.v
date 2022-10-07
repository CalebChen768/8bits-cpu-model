`timescale 1ns/100ps
module clock_4hz(
input  wire CLK,
input  wire CLRn,
output reg  T4hz );
//   ?   
reg  [25:0] Q_conut;
always @( posedge CLK or negedge CLRn ) begin	 
  if ( ~CLRn ) Q_conut <= 26'd0;
else if ( Q_conut < 26'd12499 )    
 // else if ( Q_conut < 26'd640 )    
    Q_conut <= Q_conut + 1;
  else Q_conut <= 26'd0; 
end
always @ ( posedge CLK or negedge CLRn ) begin
   if ( ~CLRn ) T4hz <= 0;
	else if( Q_conut == 26'd0 )
		T4hz <= ~ T4hz;
end
endmodule 