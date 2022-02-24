module i_to_controller(
input [5:0]op,
input [5:0]func,
input Z,
input C,
input N,
input O,
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
    
    //指令种类，组合逻辑构建
    wire i_add,i_addi,i_addu,i_addiu,i_sub,i_subu;
    wire i_and,i_andi,i_or,i_ori,i_xor,i_xori,i_nor;
    wire i_lui;
    wire i_sll,i_sllv,i_sra,i_srav,i_srl,i_srlv;
    wire i_slt,i_slti,i_sltu,i_sltiu;
    wire i_beq,i_bne;
    wire i_j,i_jal,i_jr;
    wire i_lw,i_sw;
    
    //R-TYPE
    assign i_add=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(~func[2])&(~func[1])&(~func[0]);
    assign i_addu=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(~func[2])&(~func[1])&(func[0]);
    assign i_sub=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(~func[2])&(func[1])&(~func[0]);
    assign i_subu=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(~func[2])&(func[1])&(func[0]);
    assign i_and=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(func[2])&(~func[1])&(~func[0]);
    assign i_or=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(func[2])&(~func[1])&(func[0]);
    assign i_xor=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(func[2])&(func[1])&(~func[0]);
    assign i_nor=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(~func[3])&(func[2])&(func[1])&(func[0]);
    assign i_slt=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(func[3])&(~func[2])&(func[1])&(~func[0]);
    assign i_sltu=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(func[5])&(~func[4])&(func[3])&(~func[2])&(func[1])&(func[0]);
    
    assign i_sll=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(~func[5])&(~func[4])&(~func[3])&(~func[2])&(~func[1])&(~func[0]);
    assign i_srl=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(~func[5])&(~func[4])&(~func[3])&(~func[2])&(func[1])&(~func[0]);
    assign i_sra=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(~func[5])&(~func[4])&(~func[3])&(~func[2])&(func[1])&(func[0]);
    assign i_sllv=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(~func[5])&(~func[4])&(~func[3])&(func[2])&(~func[1])&(~func[0]);
    assign i_srlv=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(~func[5])&(~func[4])&(~func[3])&(func[2])&(func[1])&(~func[0]);
    assign i_srav=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(~func[5])&(~func[4])&(~func[3])&(func[2])&(func[1])&(func[0]);
    assign i_jr=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(~op[1])&(~op[0])&(~func[5])&(~func[4])&(func[3])&(~func[2])&(~func[1])&(~func[0]);
    
    //I-TYPE
    assign i_addi=(~op[5])&(~op[4])&(op[3])&(~op[2])&(~op[1])&(~op[0]);
    assign i_addiu=(~op[5])&(~op[4])&(op[3])&(~op[2])&(~op[1])&(op[0]);
    assign i_andi=(~op[5])&(~op[4])&(op[3])&(op[2])&(~op[1])&(~op[0]);
    assign i_ori=(~op[5])&(~op[4])&(op[3])&(op[2])&(~op[1])&(op[0]);
    assign i_xori=(~op[5])&(~op[4])&(op[3])&(op[2])&(op[1])&(~op[0]);
    assign i_lui=(~op[5])&(~op[4])&(op[3])&(op[2])&(op[1])&(op[0]);
    assign i_lw=(op[5])&(~op[4])&(~op[3])&(~op[2])&(op[1])&(op[0]);
    assign i_sw=(op[5])&(~op[4])&(op[3])&(~op[2])&(op[1])&(op[0]);
    assign i_beq=(~op[5])&(~op[4])&(~op[3])&(op[2])&(~op[1])&(~op[0]);
    assign i_bne=(~op[5])&(~op[4])&(~op[3])&(op[2])&(~op[1])&(op[0]);    
    assign i_slti=(~op[5])&(~op[4])&(op[3])&(~op[2])&(op[1])&(~op[0]);
    assign i_sltiu=(~op[5])&(~op[4])&(op[3])&(~op[2])&(op[1])&(op[0]);
    
    //J-TYPE
    assign i_j=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(op[1])&(~op[0]);
    assign i_jal=(~op[5])&(~op[4])&(~op[3])&(~op[2])&(op[1])&(op[0]);
    
    //实例化，产生控制信号
    controller con(i_add, i_addu, i_addi, i_addiu, i_sub, i_subu,i_and, i_andi, i_or, i_ori, i_xor, i_xori, i_nor,
         i_lui,i_sll, i_sllv, i_sra, i_srav, i_srl, i_srlv,i_slt, i_slti, i_sltu, i_sltiu,i_beq, i_bne,
         i_j, i_jal, i_jr,i_lw, i_sw,
         Z,C,N,O,
         RF_W,ALUC,
         M1,M2,M3,M4,M5,M6,M7,M8,
         CS,DM_R,DM_W);
    
endmodule
