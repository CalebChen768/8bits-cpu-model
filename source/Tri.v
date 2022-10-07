module Tri(
    input wire [7:0] din,
    input en,
    output wire [7:0] dout
    );
    
assign dout[7:0]=en?din[7:0]:8'bZZZZ_ZZZZ;


endmodule