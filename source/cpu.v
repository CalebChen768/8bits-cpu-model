`timescale 1ns / 1ps

module cpu(
input clk,input rst,
output wire [7:0] bus_DR,DR_bus,//dbusœﬂ
output wire [5:0] MAR_ram,
output wire [27:0] ctrl_signal ,
output wire [7:0] R0,R1,R2,R3,
output wire HALT
);
assign HALT = ctrl_signal[0];

wire [7:0] R_bus,ALU_bus, bus_A,bus_B,bus_IR,bus_PC,bus_R,bus_MAR;
wire [3:0] Tgt1,Tgt2;
wire [5:0] PC_MAR;
wire [7:0] Flag_ALU,ALU_Flag,ALU_Low8,IR_Decoder;
wire IADD,ISUB,IADC,ISBB,IMUL,IDIV,
IINC,IDEC,ISHL,ISHR,INOT,INEG,IAND,IOR,
IJMP,IJA,IJB,IJE,EALU,I0,E0,I1,E1,I2,E2,I3,E3,IF,EF,
EDTB,iwr,IPC,IMPC,IMAR,IIR,IMARB;
wire [7:0] signals;


assign HALT=ctrl_signal[0];



wire [7:0] ram_MAR;
wire IJ;

//always @(posedge rst or posedge ctrl_signal[0]) begin
//    if(ctrl_signal[0]) HALT=1;
//    else if(rst) HALT=0;
//    else HALT=0;
//end

ALU u0(
    .clk(clk),
    .rst(rst),
    .Tgt1(Tgt1),
    .Tgt2(Tgt2),
    .DR0(R0),
    .DR1(R1),
    .DR2(R2),
    .DR3(R3),
    .IADD(IADD),
    .ISUB(ISUB),
    .IADC(IADC),
    .ISBB(ISBB),
    .IMUL(IMUL),
    .IDIV(IDIV),
    .IINC(IINC),
    .IDEC(IDEC),
    .ISHL(ISHL),
    .ISHR(ISHR),
    .INOT(INOT),
    .INEG(INEG),
    .IAND(IAND),
    .IOR(IOR),
    .IJMP(IJMP),
    .IJA(IJA),
    .IJB(IJB),
    .IJE(IJE),
    .EALU(EALU),
    .Flags_in(Flag_ALU),
    .Flags_out(ALU_Flag),
    .Dout(ALU_bus),
    .Dout_R1(ALU_Low8),
    .IJ(IJ)
);

RA u1(
    .clk(clk),
    .rst(rst),
    .I0(I0),
    .E0(E0),
    .I1(I1),
    .E1(E1),
    .I2(I2),
    .E2(E2),
    .I3(I3),
    .E3(E3),
    .IF(IF),
    .EF(EF),
    .IMUL(IMUL),
    .IDIV(IDIV),
    .Din(bus_R),
    .DinA(ALU_Low8),
    .Flags_in(ALU_Flag),
    .Dout0(R_bus),
    .Flags_out(Flag_ALU),
    .DR0(R0),
    .DR1(R1),
    .DR2(R2),
    .DR3(R3)
);

//DR u2(
//    .clk(clk),
//    .IDFR(IDFR),
//    .IDFB(IDFB),
//    .EDTB(EDTB),
//    .Din_RAM(ram_DR),
//    .Din_BUS(bus_DR),
//    .rst(rst),
//    .Dout_RAM(DR_ram),
//    .Dout_BUS(DR_bus)
//);

MAR u3(
    .clk(clk),
    .IMAR(IMAR),
    .IMARB(IMARB),
    .Din(PC_MAR),
    .Din_BUS(ram_MAR),
    .rst(rst),
    .Dout(MAR_ram)
);

ram_ip u4(
    .clk(clk),
    .iwr(iwr),
    .EDTB(EDTB),
    .addr(MAR_ram),
    .din(bus_DR),
    .dout(DR_bus),
    .to_MAR(ram_MAR)
);

PC u5(
    .clk(clk),
    .IPC(IPC),
    .IMPC(IMPC),
    .IJ(IJ),
    .rst(rst),
    .Din(bus_PC),
    .Dout(PC_MAR)
);

dbus u6(
    .DR_bus(DR_bus),
    .R_bus(R_bus),
    .ALU_bus(ALU_bus),
    .bus_A(bus_A),
    .bus_B(bus_B),
    .bus_IR(bus_IR),
    .bus_PC(bus_PC),
    .bus_MAR(bus_MAR),
    .bus_R(bus_R),
    .bus_DR(bus_DR)
);

IR u7(
    .clk(clk),
    .rst(rst),
    .IIR(IIR),
    .Din(bus_IR),
    .Dout(IR_Decoder)
);

Decoder u8(
    .cmd(IR_Decoder),
    .res(ctrl_signal),//26 updatig 
    .Tgt1(Tgt1),
    .Tgt2(Tgt2)
);

SG u9(
    .clk(clk),
    .rst(rst),
    .signals(signals));


Controller u10(
    ctrl_signal,
    Tgt1,
    Tgt2,
    signals,
    IA,IB,IADD,ISUB,IADC,ISBB,IMUL,IDIV,
    IINC,IDEC,ISHL,ISHR,INOT,INEG,IAND,IOR,
    IJMP,IJA,IJB,IJE,EALU,I0,E0,I1,E1,I2,E2,I3,E3,IF,EF,
    IDFR,IDFB,EDTB,iwr,IPC,IMPC,IMAR,IIR,IMARB
);
endmodule
