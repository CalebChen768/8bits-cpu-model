`timescale 1ns / 1ps

module Controller(
    input wire [27:0] ctrl,
    input wire [3:0] Tgt1,
    input wire [3:0] Tgt2,
    input wire [7:0] T,
    output wire IA,IB,IADD,ISUB,IADC,ISBB,IMUL,IDIV,
                IINC,IDEC,ISHL,ISHR,INOT,INEG,IAND,IOR,
                IJMP,IJA,IJB,IJE,EALU,I0,E0,I1,E1,I2,E2,I3,E3,IF,EF,
                IDFR,IDFB,EDTB,iwr,IPC,IMPC,IMAR,IIR,IMARB
);

assign IADD=T[6]&&(ctrl[3]||ctrl[15])       ;
assign ISUB=T[6]&&(ctrl[5]||ctrl[17]||ctrl[23])        ;
assign IADC=T[6]&&(ctrl[4]||ctrl[16])        ;
assign ISBB=T[6]&&(ctrl[6]||ctrl[18])        ;
assign IMUL=T[6]&&(ctrl[1]||ctrl[7])       ;
assign IDIV=T[6]&&(ctrl[2]||ctrl[8])       ;
assign IINC=0    ;
assign IDEC=0      ;
assign ISHL=T[6]&&ctrl[19]       ;
assign ISHR=T[6]&&ctrl[20]       ;
assign INOT=T[6]&&ctrl[12]       ;
assign INEG=T[6]&&ctrl[13]       ;
assign IAND=T[6]&&ctrl[21]       ;
assign IOR=T[6]&&ctrl[22]       ;
assign IJMP=T[6]&&ctrl[24]       ;
assign IJA=T[6]&&ctrl[25]       ;
assign IJB=T[6]&&ctrl[26]       ;
assign IJE=T[6]&&ctrl[27]       ;

assign EALU=T[6]&&
            (ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[7]
            ||ctrl[8]||ctrl[12]||ctrl[13]||ctrl[15]||ctrl[16]||ctrl[17]||ctrl[18]||ctrl[19]||ctrl[20]||ctrl[21]||ctrl[22]||ctrl[24]||ctrl[25]||ctrl[26]||ctrl[27])       ;
assign I0=(Tgt1[0]&&T[7]&&(ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[7]||ctrl[8]||ctrl[9]
            ||ctrl[12]||ctrl[13]||ctrl[15]||ctrl[16]||ctrl[17]||ctrl[18]||ctrl[19]||ctrl[20]||ctrl[21]||ctrl[22]))
            ||(Tgt1[0]&&T[6]&&ctrl[11])
            ||(Tgt1[0]&&T[4]&&ctrl[14])       ;
assign E0=(Tgt1[0]&&T[6]&&ctrl[10])||(Tgt2[0]&&T[3]&&ctrl[14])       ;
assign I1=(Tgt1[1]&&T[7]&&(ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[7]||ctrl[8]||ctrl[9]
            ||ctrl[12]||ctrl[13]||ctrl[15]||ctrl[16]||ctrl[17]||ctrl[18]||ctrl[19]||ctrl[20]||ctrl[21]||ctrl[22]))
              ||(Tgt1[1]&&T[6]&&ctrl[11])
            ||(Tgt1[1]&&T[4]&&ctrl[14])       ;
assign E1=(Tgt1[1]&&T[6]&&ctrl[10])||(Tgt2[1]&&T[3]&&ctrl[14])       ;
assign I2=(Tgt1[2]&&T[7]&&(ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[7]||ctrl[8]||ctrl[9]
            ||ctrl[12]||ctrl[13]||ctrl[15]||ctrl[16]||ctrl[17]||ctrl[18]||ctrl[19]||ctrl[20]||ctrl[21]||ctrl[22]))
              ||(Tgt1[2]&&T[6]&&ctrl[11])
            ||(Tgt1[2]&&T[4]&&ctrl[14])       ;
assign E2=(Tgt1[2]&&T[6]&&ctrl[10])||(Tgt2[2]&&T[3]&&ctrl[14])       ;
assign I3=(Tgt1[3]&&T[7]&&(ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[7]||ctrl[8]||ctrl[9]
            ||ctrl[12]||ctrl[13]||ctrl[15]||ctrl[16]||ctrl[17]||ctrl[18]||ctrl[19]||ctrl[20]||ctrl[21]||ctrl[22]))
              ||(Tgt1[3]&&T[6]&&ctrl[11])
            ||(Tgt1[3]&&T[4]&&ctrl[14])       ;
assign E3=(Tgt1[3]&&T[6]&&ctrl[10])||(Tgt2[3]&&T[3]&&ctrl[14])       ;
assign IF=T[7]&&(ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[7]||ctrl[8]
            ||ctrl[15]||ctrl[16]||ctrl[17]||ctrl[18]||ctrl[19]||ctrl[20]||ctrl[21]||ctrl[22]||ctrl[23])       ;
assign EF=1       ;
//assign IDFR=T[1]||(T[4]&&(ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[9]||ctrl[10]||ctrl[11]))
//        ||(T[6]&&ctrl[9])         ;
//assign IDFB=T[7]&&ctrl[10]       ;
assign EDTB=(T[2]||(T[5]&&ctrl[11])||(T[6]&&(ctrl[9])))&&~ctrl[0]     ;
assign iwr=T[6]&&ctrl[10];
assign IPC=(T[2]||(T[5]&&(ctrl[1]||ctrl[2]||ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[9]
                ||ctrl[10]||ctrl[11])) )&&~ctrl[0]    ;
assign IMPC=T[6]&&(ctrl[24]||ctrl[25]||ctrl[26]||ctrl[27])       ;
assign IMAR=(T[0]||(T[3]&&(ctrl[3]||ctrl[4]||ctrl[5]||ctrl[6]||ctrl[1]||ctrl[2]||ctrl[9]||ctrl[10]||ctrl[11])) )&&~ctrl[0]    ;
assign IIR=T[2]&&~ctrl[0]     ;
assign IMARB=T[5]&&(ctrl[9]||ctrl[10])       ;  
endmodule
