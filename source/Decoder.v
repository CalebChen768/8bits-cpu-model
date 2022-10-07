`timescale 1ns / 1ps

module Decoder(
    input wire [7:0] cmd,
    output wire [27:0] res,//xxxxxxxxxxxxxx
    output wire [3:0] Tgt1,
    output wire [3:0] Tgt2
);

wire [1:0] re1,re2;


assign res[0]=~cmd[7]&~cmd[6]&~cmd[5]&~cmd[4]&cmd[3]&cmd[2]&cmd[1]&cmd[0];
assign res[1]=~cmd[7]&~cmd[6]&~cmd[5]&~cmd[4]&~cmd[3]&~cmd[2]&~cmd[1]&cmd[0];
assign res[2]=~cmd[7]&~cmd[6]&~cmd[5]&~cmd[4]&~cmd[3]&~cmd[2]&cmd[1]&~cmd[0];
assign res[3]=cmd[7]&cmd[6]&~cmd[5]&~cmd[4]&~cmd[3]&~cmd[2];
assign res[4]=cmd[7]&cmd[6]&~cmd[5]&~cmd[4]&~cmd[3]&cmd[2];
assign res[5]=cmd[7]&cmd[6]&~cmd[5]&~cmd[4]&cmd[3]&~cmd[2];
assign res[6]=cmd[7]&cmd[6]&~cmd[5]&~cmd[4]&cmd[3]&cmd[2];
assign res[7]=cmd[7]&cmd[6]&~cmd[5]&cmd[4]&~cmd[3]&~cmd[2];
assign res[8]=cmd[7]&cmd[6]&~cmd[5]&cmd[4]&~cmd[3]&cmd[2];
assign res[9]=cmd[7]&cmd[6]&~cmd[5]&cmd[4]&cmd[3]&~cmd[2];
assign res[10]=cmd[7]&cmd[6]&~cmd[5]&cmd[4]&cmd[3]&cmd[2];
assign res[11]=cmd[7]&cmd[6]&cmd[5]&~cmd[4]&~cmd[3]&~cmd[2];
assign res[12]=cmd[7]&cmd[6]&cmd[5]&~cmd[4]&~cmd[3]&cmd[2];
assign res[13]=cmd[7]&cmd[6]&cmd[5]&~cmd[4]&cmd[3]&~cmd[2];
assign res[14]=~cmd[7]&~cmd[6]&~cmd[5]&cmd[4];
assign res[15]=~cmd[7]&~cmd[6]&cmd[5]&~cmd[4];
assign res[16]=~cmd[7]&~cmd[6]&cmd[5]&cmd[4];
assign res[17]=~cmd[7]&cmd[6]&~cmd[5]&~cmd[4];
assign res[18]=~cmd[7]&cmd[6]&~cmd[5]&cmd[4];
assign res[19]=~cmd[7]&cmd[6]&cmd[5]&~cmd[4];
assign res[20]=~cmd[7]&cmd[6]&cmd[5]&cmd[4];
assign res[21]=cmd[7]&~cmd[6]&~cmd[5]&~cmd[4];
assign res[22]=cmd[7]&~cmd[6]&~cmd[5]&cmd[4];
assign res[23]=cmd[7]&~cmd[6]&cmd[5]&~cmd[4];

assign res[24]=cmd[7]&cmd[6]&cmd[5]&cmd[4]&~cmd[3]&~cmd[2];
assign res[25]=cmd[7]&cmd[6]&cmd[5]&cmd[4]&~cmd[3]&cmd[2];
assign res[26]=cmd[7]&cmd[6]&cmd[5]&cmd[4]&cmd[3]&~cmd[2];
assign res[27]=cmd[7]&cmd[6]&cmd[5]&cmd[4]&cmd[3]&cmd[2];



assign re1[0]  = (res[0]||res[1]||res[2])? 1'bZ:((res[3]||res[4]||res[5]||res[6]||res[7]||res[8]||res[9]||res[10]||res[11]||res[12]||res[13]||res[24]||res[25]||res[26]||res[27])&cmd[0])|
                    ((res[14]||res[15]||res[16]||res[17]||res[18]||res[19]||res[20]||res[21]||res[22]||res[23])&cmd[2]);
assign re1[1]  = (res[0]||res[1]||res[2])? 1'bZ:((res[3]||res[4]||res[5]||res[6]||res[7]||res[8]||res[9]||res[10]||res[11]||res[12]||res[13]||res[24]||res[25]||res[26]||res[27])&cmd[1])|
                    ((res[14]||res[15]||res[16]||res[17]||res[18]||res[19]||res[20]||res[21]||res[22]||res[23])&cmd[3]);

assign re2[0] = (res[0]||res[1]||res[2]||res[3]||res[4]||res[5]||res[6]||res[7]||res[8]||res[9]||res[10]||res[11]||res[12]||res[13]||res[24]||res[25]||res[26]||res[27])? 1'bZ:(res[14]||res[15]||res[16]||res[17]||res[18]||res[19]||res[20]||res[21]||res[22]||res[23])&&cmd[0];

assign re2[1] = (res[0]||res[1]||res[2]||res[3]||res[4]||res[5]||res[6]||res[7]||res[8]||res[9]||res[10]||res[11]||res[12]||res[13]||res[24]||res[25]||res[26]||res[27])? 1'bZ:(res[14]||res[15]||res[16]||res[17]||res[18]||res[19]||res[20]||res[21]||res[22]||res[23])&&cmd[1];


assign Tgt1[3] = re1[1]&re1[0];
assign Tgt1[2] = re1[1]&~re1[0];
assign Tgt1[1] = ~re1[1]&re1[0];
assign Tgt1[0] = ~re1[1]&~re1[0];


assign Tgt2[3] = re2[1]&re2[0];
assign Tgt2[2] = re2[1]&~re2[0];
assign Tgt2[1] = ~re2[1]&re2[0];
assign Tgt2[0] = ~re2[1]&~re2[0];



endmodule
