module instruction_to_control(
input [31:0]instru,
input Z,
input C,
input N,
input O,
//output  PC_CLK,
//output  IM_R,
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
    
        i_to_controller i_to_con(instru[31:26],instru[5:0],
         Z,C,N,O,
         RF_W,ALUC,
         M1,M2,M3,M4,M5,M6,M7,M8,
         CS,DM_R,DM_W);
    
endmodule
