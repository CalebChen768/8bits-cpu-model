`timescale 1ns / 1ps

module dbus(
    input [7:0] DR_bus,R_bus,ALU_bus,
    output wire [7:0] bus_A,bus_B,bus_IR,bus_PC,bus_R,bus_DR,bus_MAR
    );
wire [7:0] data;
assign data = DR_bus;
assign data = R_bus;
assign data = ALU_bus;
assign bus_A=data;
assign bus_B=data;
assign bus_IR=data;
assign bus_PC=data;
assign bus_R=data;
assign bus_DR=data;
assign bus_MAR=data;
endmodule
