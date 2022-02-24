module sccomp_dataflow(
input clk_in,
input reset,
output [31:0] inst,
output [31:0] pc
    );
    
                    //¿ØÖÆÐÅºÅ
/*------------------------*/
wire Z;
wire C;
wire N;
wire O;
// wire  PC_CLK;
//  wire  IM_R;
wire  RF_W;
// wire  RF_CLK;
wire  [3:0]ALUC;

wire  M1;
wire  M2;
wire  M3;
wire  [1:0]M4;
wire  M5;
wire  M6;
wire  M7;
wire  [1:0]M8;

wire  CS;
wire  DM_R;
wire  DM_W;
/*------------------------*/
//wire [31:0] imem_out;
wire [31:0] dmem_out;
wire [31:0] rt_out;
wire [31:0] alu_out;

wire [31:0] im_addr;
wire [31:0] dm_addr;


    assign im_addr =  pc- 32'h00400000;
    assign dm_addr =  alu_out- 32'h10010000;
    
    IMEM imemory(pc[12:2],inst);
    DMEM dmemory(clk_in,1'b1,DM_W,dm_addr[12:2],rt_out,dmem_out);
    cpu sccpu(clk_in,reset,pc,inst,dmem_out,rt_out,alu_out,
    Z,C,N,O,
    RF_W,ALUC,
    M1,M2,M3,M4,M5,M6,M7,M8,
    CS,DM_R,DM_W);
    
    instruction_to_control itc(
    inst,
    Z,C,N,O,
    RF_W,ALUC,
    M1,M2,M3,M4,M5,M6,M7,M8,
    CS,DM_R,DM_W);
    
    
endmodule
