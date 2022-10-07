`timescale 1ns / 1ps

module ram_ip(
input wire clk,iwr,EDTB,
input wire [5:0] addr,
input wire [7:0] din,
output wire [7:0] dout,
output wire [7:0] to_MAR
    );

wire [7:0] ram_data;
assign to_MAR=ram_data;
    
blk_mem_gen_0 ram (
  .clka(~clk),    // input wire clka
  .wea(iwr),      // input wire [0 : 0] wea
  .addra(addr),  // input wire [5 : 0] addra
  .dina(din),   // input wire [7 : 0] dina
  .douta(ram_data)  // output wire [7 : 0] douta
);

Tri T(
 .din(ram_data),
 .en(EDTB),
  .dout(dout)
);

endmodule
