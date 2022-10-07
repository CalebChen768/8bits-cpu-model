`timescale 1ns / 1ps

module dbus_tb;

reg [7:0] DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus;
wire [7:0] bus_A,bus_B,bus_IR,bus_PC;

dbus DUT(DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus,bus_A,bus_B,bus_IR,bus_PC);

initial begin 
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'dZ,8'dZ,8'dZ,8'dZ,8'dZ,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'd12,8'dZ,8'dZ,8'dZ,8'dZ,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'dZ,8'd23,8'dZ,8'dZ,8'dZ,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'dZ,8'dZ,8'd55,8'dZ,8'dZ,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'dZ,8'dZ,8'dZ,8'd1,8'dZ,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'dZ,8'dZ,8'dZ,8'dZ,8'd33,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'dZ,8'dZ,8'dZ,8'dZ,8'dZ,8'd4};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'd123,8'd231,8'dZ,8'dZ,8'dZ,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'd1,8'd2,8'dZ,8'dZ,8'dZ,8'dZ};
#5 {DR_bus,R0_bus,R1_bus,R2_bus,R3_bus,ALU_bus}={8'bZZZZ_ZZZ1,8'bZZZZ_ZZ1Z,8'b1111_ZZZZ,8'dZ,8'dZ,8'dZ};
#5 $stop;


end
endmodule
