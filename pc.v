module pc(
input PC_CLK,
input reset,
input [31:0] pc_in,
output reg [31:0] pc_out
    );
    
    always @(negedge PC_CLK or posedge reset)//������ or �½��أ�
    begin
        if(reset==1'b1)
            pc_out<=32'h00400000;
        else
            pc_out<=pc_in;
    end

endmodule
