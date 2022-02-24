module controller(

//input：输入的指令种类
input i_add,input i_addu,input i_addi,input i_addiu,input i_sub,input i_subu,
    input i_and,input i_andi,input i_or,input i_ori,input i_xor,input i_xori,input i_nor,
    input i_lui,
    input i_sll,input i_sllv,input i_sra,input i_srav,input i_srl,input i_srlv,
    input i_slt,input i_slti,input i_sltu,input i_sltiu,
    input i_beq,input i_bne,
    input i_j,input i_jal,input i_jr,
    input i_lw,input i_sw,
    
//input:ALU状态信号，决定是否写入等操作
input Z,
input C,
input N,
input O,

//output：控制信号
//output  PC_CLK,
//output  IM_R,
//output  [4:0]rsc,
//output  [4:0]rtc,
//output  [4:0]rdc,
output  RF_W,
//output  RF_CLK,
output  [3:0]ALUC,

output  M1,
output  M2,
output  M3,
output  [1:0]M4,
output  M5,
output  M6,
output  M7,
output  [1:0]M8,

output  CS,
output  DM_R,
output  DM_W


    );
    
    //assign PC_CLK=1;
    //assign IM_R=1;
    
    //由此可见regfle的rd在下降沿写入，根据运算结果决定
    assign RF_W=((~O)&(i_add|i_addi|i_sub))|(i_addu)|(i_addiu)|(i_subu)|(i_and)|(i_andi)|(i_or)|(i_ori)|
    (i_xor)|(i_xori)|(i_nor)|(i_lui)|(i_sll)|(i_sllv)|(i_sra)|(i_srav)|(i_srl)|(i_srlv)|
    (i_slt)|(i_slti)|(i_sltu)|(i_sltiu)|(i_jal)|(i_lw);
    
    
    
    //assign RF_CLK=
    
   // assign ALUC=2;
    assign ALUC[3]=(i_lui)|(i_sll)|(i_sllv)|(i_sra)|(i_srav)|(i_srl)|(i_srlv)|(i_slt)|(i_slti)|(i_sltu)|(i_sltiu);  
    assign ALUC[2]=(i_and)|(i_andi)|(i_or)|(i_ori)|(i_xor)|(i_xori)|(i_nor)|(i_sll)|(i_sllv)|(i_sra)|(i_srav)|(i_srl)|(i_srlv);    
    assign ALUC[1]=(i_add)|(i_addi)|(i_sub)|(i_xor)|(i_xori)|(i_nor)|(i_sll)|(i_sllv)|(i_slt)|(i_slti)|(i_sltu)|(i_sltiu)|(i_lw)|(i_sw);  
    assign ALUC[0]=(i_sub)|(i_subu)|(i_or)|(i_ori)|(i_nor)|(i_srl)|(i_srlv)|(i_slt)|(i_slti)|(i_beq)|(i_bne);
    
    
    assign M1=(i_add)|(i_addu)|(i_addi)|(i_addiu)|(i_sub)|(i_subu)|(i_and)|(i_andi)|(i_or)|(i_ori)|
    (i_xor)|(i_xori)|(i_nor)|(i_lui)|(i_sll)|(i_sllv)|(i_sra)|(i_srav)|(i_srl)|(i_srlv)|
    (i_slt)|(i_slti)|(i_sltu)|(i_sltiu)|(i_beq)|(i_bne)|(i_lw)|(i_sw);
    
    assign M2=(i_add)|(i_addu)|(i_addi)|(i_addiu)|(i_sub)|(i_subu)|(i_and)|(i_andi)|(i_or)|(i_ori)|
    (i_xor)|(i_xori)|(i_nor)|(i_lui)|(i_sll)|(i_sllv)|(i_sra)|(i_srav)|(i_srl)|(i_srlv)|
    (i_slt)|(i_slti)|(i_sltu)|(i_sltiu);
    
    assign M3=(i_add)|(i_addu)|(i_addi)|(i_addiu)|(i_sub)|(i_subu)|(i_and)|(i_andi)|(i_or)|(i_ori)|
    (i_xor)|(i_xori)|(i_nor)|(i_lui)|(i_sllv)|(i_srav)|(i_srlv)|
    (i_slt)|(i_slti)|(i_sltu)|(i_sltiu)|(i_beq)|(i_bne)|(i_j)|(i_jal)|(i_jr)|(i_lw)|(i_sw);
    
    assign M4[1]=(i_addi)|(i_addiu)|(i_slti)|(i_sltiu)|(i_lw)|(i_sw); 
    assign M4[0]=(i_andi)|(i_ori)|(i_xori)|(i_lui);
    
    assign M5=(Z&i_beq)|(~Z&i_bne);//由此可见pc在下降沿写入，根据运算结果决定
    
    assign M6=(i_j)|(i_jal);
    
    assign M7=i_jal;
    
    assign M8[1]=i_jal;
    assign M8[0]=(i_addi)|(i_addiu)|(i_andi)|(i_ori)|
    (i_xori)|(i_lui)|
    (i_slti)|(i_sltiu)|(i_beq)|(i_bne)|(i_j)|(i_jr)|(i_lw)|(i_sw);
    
    assign CS=(i_lw)|(i_sw);
    assign DM_R=(i_lw);
    assign DM_W=(i_sw);


endmodule
