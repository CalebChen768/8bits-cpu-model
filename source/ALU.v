`timescale 1ns / 1ps

module ALU(
    input wire clk,//clock
    input wire rst,
    input wire [3:0] Tgt1,
    input wire [3:0] Tgt2,
    input wire [7:0] DR0,
    input wire [7:0] DR1,
    input wire [7:0] DR2,
    input wire [7:0] DR3,
    
    
    input wire  IADD,
    input wire  ISUB,
    input wire  IADC,
    input wire   ISBB,
    input wire   IMUL,//0高八位，1第八位
    input wire IDIV,//0存结果，1存余数
    input wire IINC,
    input wire IDEC,
    
    input wire   ISHL,
    input wire   ISHR,
    input wire   INOT,
    input wire  INEG,
    input wire  IAND,
    input wire  IOR,
    
    input wire IJMP,
    input wire IJA,
    input wire IJB,
    input wire IJE,
    
    
    input wire   EALU,
        
    input wire  [7:0] Flags_in,
    
    output wire [7:0] Flags_out,
    
    output wire [7:0] Dout,
    output wire [7:0] Dout_R1,

    output reg IJ

    );
    
    
wire [7:0] DA,DB;//A和B传入ALU的数据
reg [15:0] result; //运算结果
wire EFLAG;//是否传入Flag中 ,是否影响标志位  
wire [7:0] Flags;//标志位结果
reg CF,PF,ZF,SF,OF;
//reg IJ;

assign Flags={3'b000,OF,SF,ZF,PF,CF};
assign EFLAG=1;

//wire [15:0] res;
//assign res = result;
//assign test_result=result;   //test 
//reg [7:0] OA,OB;//乘法特殊处理
//wire op;
//assign op = OA[7]^OB[7];
always @ (*) begin  
    
//    if(DA[7]==1'b1) OA={1'b1,~DA[6:0]};
//    else OA=DA;
    
//    if(DB[7]==1'b1) OB={1'b1,~DB[6:0]};
//    else OB=DB;
    


    if(IADD == 1'b1) begin
         result = DA + DB;
         CF = result[8];
         ZF=~(result[0]||result[1] || result[2] ||result[3] || result[4] || result[5] || result[6] ||result[7]); 
         PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
         SF=result[7];
         if((DA[7]^~DB[7])&(result[7]^DB[7])==1) OF=1;
         else OF=0;
         IJ=1;
    end
    else if(IADC == 1'b1) begin
         result = DA + DB + Flags_in[0];
         CF = result[8];
         ZF=~(result[0]||result[1] || result[2] ||result[3] || result[4] || result[5] || result[6] ||result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
         if((DA[7]^~DB[7])&(result[7]^DB[7])==1) OF=1;
         else OF=0;    
         IJ=1;    
    end
    else if(ISUB == 1'b1) begin
        result = DA - DB;
        if(DA<DB) CF=1;
        else CF=0;
        ZF=~(result[0]||result[1] || result[2] ||result[3] || result[4] || result[5] || result[6] ||result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        if(~(DA[7]^DB[7])&~(result[7]^~DB[7])==1) OF=1;
         else OF=0;  
         IJ=1;
    end
    else if(ISBB == 1'b1) begin
        result = DA - DB - Flags_in[0];
        if(DA<(DB+Flags_in[0])) CF=1;
        else CF=0;
        ZF=~(result[0]||result[1] || result[2] ||result[3] || result[4] || result[5] || result[6] ||result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        if(~(DA[7]^DB[7])&~(result[7]^~DB[7])==1) OF=1;
         else OF=0;  
         IJ=1;
    end
    else if(IMUL==1'b1) begin 
        result = DA * DB;
        if(result[15:8]==8'b0000_0000) CF=0;
        else CF=1;
        result={result[7:0],result[15:8]};
        ZF=Flags_in[2];
        PF=Flags_in[1];
        SF=Flags_in[3];
        OF=CF;
        IJ=1;
    end
      else if(IDIV==1'b1) begin 

        result[7:0] = DA/DB;
        result[15:8]=DA%DB;
        CF=Flags_in[0];
        ZF=Flags_in[2];
        PF=Flags_in[1];
        SF=Flags_in[3];
        OF=Flags_in[4];
        IJ=1;
    end
    else if(IINC==1'b1) begin
        result = DA + 1;
        CF=Flags_in[0];
        ZF=~(result[0] && result[1] && result[2] &&result[3] && result[4] && result[5] && result[6] &&result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        OF=0;
        IJ=1;
    end
    else if(IDEC==1'b1) begin
        result = DA - 1;
        CF=Flags_in[0];
        ZF=~(result[0] && result[1] && result[2] &&result[3] && result[4] && result[5] && result[6] &&result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        OF=0;
        IJ=1;
    end
    else if(IOR==1) begin
        result[15:8]=8'd0;
        result[7:0] = DA|DB;
        CF=0;
        ZF=~(result[0] && result[1] && result[2] &&result[3] && result[4] && result[5] && result[6] &&result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        OF=0;
        IJ=1;
    end
    else if(IAND==1) begin
        result[15:8]=8'd0;
        result[7:0] = DA&DB;
        CF=0;
        ZF=~(result[0] && result[1] && result[2] &&result[3] && result[4] && result[5] && result[6] &&result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        OF=0;
        IJ=1;
    end
    else if(ISHL==1)begin
         result[15:8]=8'd0;
        {CF,result[7:0]}=DA<<DB;
        ZF=~(result[0] && result[1] && result[2] &&result[3] && result[4] && result[5] && result[6] &&result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        OF=0;
        IJ=1;
    end
    else if(ISHR==1)begin
        result[15:8]=8'd0;
        result[7:0]=DA>>DB;
        if(DB>8)
            CF=0;
        else
            CF=DA[DB-1];
        ZF=~(result[0]||result[1] || result[2] ||result[3] || result[4] || result[5] || result[6] ||result[7]); 
        PF=~(((result[0]^result[1])^(result[2]^result[3]))^((result[4]^result[5])^(result[6]^result[7])));
        SF=result[7];
        OF=0;
        IJ=1;
   end
   else if(INOT==1) begin
        result[15:8]=8'd0;   
        result[7:0] = ~DA;
        CF=Flags_in[0];
        ZF=Flags_in[2];
        PF=Flags_in[1];
        SF=Flags_in[3];
        OF=Flags_in[4];
        IJ=1;
   end
   else if(INEG==1) begin
         result[15:8]=8'd0;
        result[7:0]=~DA[7:0];
        result[7:0]=result+1;
        CF=DA[0]||DA[1] || DA[2] ||DA[3]||DA[4] ||DA[5]|| DA[6] ||DA[7];
        ZF=Flags_in[2];
        PF=Flags_in[1];
        SF=Flags_in[3];
        OF = DA[7]&&~(DA[0]||DA[1] || DA[2] ||DA[3]||DA[4] ||DA[5]|| DA[6]);
        IJ=1;
   end
   else if(IJMP==1||IJA==1||IJE==1||IJB==1)
   begin
        CF=Flags_in[0];
        ZF=Flags_in[2];
        PF=Flags_in[1];
        SF=Flags_in[3];
        OF=Flags_in[4];
        result[15:8]=8'd0;
          result[7:0] = DA[7:0];
        if(IJMP==1) begin
            IJ=1;
        end
        else if(IJA==1)begin
            if(CF==0&&ZF==0) 
                IJ=1;
             else IJ=0;
        end
        else if(IJB==1) begin
          if(CF==1) 
                IJ=1;
             else IJ=0;
        end
        else if(IJE==1) begin
          if(ZF==1) 
                IJ=1;
             else IJ=0;
        end
        else begin
            IJ=0;
        end
   end
   else begin
        result=16'd0;
        CF=Flags_in[0];
        ZF=Flags_in[2];
        PF=Flags_in[1];
        SF=Flags_in[3];
        OF=Flags_in[4];
        IJ=1;
   end
//   Flags[4:0]={OF,SF,ZF,PF,CF};
//   Flags[7:5]=3'd0;
//   EFLAG=1'b1;//...................
end   
   
   
 MUX_ALU u0(
    .Tgt1(Tgt1),
    .Tgt2(Tgt2),
    .DR0(DR0),
    .DR1(DR1),
    .DR2(DR2),
    .DR3(DR3),
    .DA(DA),
    .DB(DB)

 );  
   
Tri Tri_BUS(
    .din(result[7:0]),
    .en(EALU&&IJ),
    .dout(Dout)
);

Tri Tri_R1(
    .din(result[15:8]),
    .en(IMUL||IDIV),
    .dout(Dout_R1)
);

Tri  Tri_Flag(
    .din(Flags),
    .en(EFLAG),
    .dout(Flags_out)
);  

endmodule
