module cpu(
input clk_in,
input reset,
output [31:0] pc_out,
input [31:0] imem_out,
input [31:0] dmem_out,
output [31:0] rt_out,
output [31:0] alu_out,

output Z,
output C,
output N,
output O,
//input  PC_CLK,
//input  IM_R,
input  RF_W,
//input  RF_CLK,
input  [3:0]ALUC,

input  M1,
input  M2,
input  M3,
input  [1:0]M4,
input  M5,
input  M6,
input  M7,
input  [1:0]M8,

input  CS,
input  DM_R,
input  DM_W

    );
    

    
    //各个部件的输出
    /*------------------------*/
    wire [31:0] mux1_out;
    wire [31:0] mux2_out;
    wire [31:0] mux3_out;
    wire [31:0] mux4_out;
    wire [31:0] mux5_out;
    wire [31:0] mux6_out;
    wire [31:0] mux7_out;
    wire [4:0] mux8_out;
    
    wire [31:0] ext16_out;
    wire [31:0] s_ext16_out;
    wire [31:0] s_ext18_out;
    wire [31:0] ext5_out;
    
    wire [31:0] join_out;
   // wire [31:0] pc_out;
    wire [31:0] npc_out;
    //wire [31:0] imem_out;
   // wire [31:0] dmem_out;
   // wire [31:0] dmem_data_out;
    wire [31:0] add_out;
    wire [31:0] rs_out;
   // wire [31:0] rt_out;
    //wire [31:0] alu_out;
    
    /*------------------------*/
    
    
    //选择器部分
    selector21 mux1(mux6_out,mux5_out,M1,mux1_out);
    selector21 mux2(dmem_out,alu_out,M2,mux2_out);
    selector21 mux3(ext5_out,rs_out,M3,mux3_out);
    selector41 mux4(rt_out,ext16_out,s_ext16_out,32'b0,M4,mux4_out);
    selector21 mux5(npc_out,add_out,M5,mux5_out);
    selector21 mux6(rs_out,join_out,M6,mux6_out);
    selector21 mux7(mux2_out,npc_out,M7,mux7_out);
    selector41_5 mux8(imem_out[15:11],imem_out[20:16],5'b11111,5'b0,M8,mux8_out);
    
    //扩展器部分
    EXT_16 cpu_ext1 (imem_out[15:0],ext16_out);
    S_EXT_16 cpu_ext2 (imem_out[15:0],s_ext16_out);
    S_EXT_18 cpu_ext3 ({imem_out[15:0],2'b00},s_ext18_out);
    EXT_5 cpu_ext4 (imem_out[10:6],ext5_out);
    
    joint_pc_im jpi({imem_out[25:0],2'b00},pc_out[31:28],join_out);
    pc promc (clk_in,reset,mux1_out,pc_out);
    ADD npromc(pc_out,4,npc_out);
    ADD add2(s_ext18_out,npc_out,add_out);
    
    //
    Regfiles cpu_ref(clk_in,reset,RF_W,imem_out[25:21],imem_out[20:16],mux8_out,mux7_out,rs_out,rt_out);
    alu ALunit(mux3_out,mux4_out,ALUC,reset,alu_out,Z,C,N,O);
    
    
    
endmodule
