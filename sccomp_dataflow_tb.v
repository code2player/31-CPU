`timescale 1ns / 1ns
module test(
    );
    reg clk, rst;
    wire [31:0] inst, pc;   
    
    integer file_output;
    integer counter=0 ;
    initial begin
        file_output = $fopen("result.txt", "a");
        clk = 1'b0;
        rst = 1'b1;
        #50 rst=1'b0;
    end

    always begin
        #20 clk = !clk;
    end

    always @(posedge clk) begin
        if(counter>=1200)
        begin
        $fclose(file_output);
        end
        else if(clk==1'b1&&rst==1'b0)
        begin
        counter=counter+1;
        $fdisplay(file_output, "pc: %h", pc);
        $fdisplay(file_output, "instr: %h", inst);
        $fdisplay(file_output, "regfile0: %h", test.uut.sccpu.cpu_ref.array_reg[0]);
        $fdisplay(file_output, "regfile1: %h", test.uut.sccpu.cpu_ref.array_reg[1]);
        $fdisplay(file_output, "regfile2: %h", test.uut.sccpu.cpu_ref.array_reg[2]);
        $fdisplay(file_output, "regfile3: %h", test.uut.sccpu.cpu_ref.array_reg[3]);
        $fdisplay(file_output, "regfile4: %h", test.uut.sccpu.cpu_ref.array_reg[4]);
        $fdisplay(file_output, "regfile5: %h", test.uut.sccpu.cpu_ref.array_reg[5]);
        $fdisplay(file_output, "regfile6: %h", test.uut.sccpu.cpu_ref.array_reg[6]);
        $fdisplay(file_output, "regfile7: %h", test.uut.sccpu.cpu_ref.array_reg[7]);
        $fdisplay(file_output, "regfile8: %h", test.uut.sccpu.cpu_ref.array_reg[8]);
        $fdisplay(file_output, "regfile9: %h", test.uut.sccpu.cpu_ref.array_reg[9]);
        $fdisplay(file_output, "regfile10: %h", test.uut.sccpu.cpu_ref.array_reg[10]);
        $fdisplay(file_output, "regfile11: %h", test.uut.sccpu.cpu_ref.array_reg[11]);
        $fdisplay(file_output, "regfile12: %h", test.uut.sccpu.cpu_ref.array_reg[12]);
        $fdisplay(file_output, "regfile13: %h", test.uut.sccpu.cpu_ref.array_reg[13]);
        $fdisplay(file_output, "regfile14: %h", test.uut.sccpu.cpu_ref.array_reg[14]);
        $fdisplay(file_output, "regfile15: %h", test.uut.sccpu.cpu_ref.array_reg[15]);
        $fdisplay(file_output, "regfile16: %h", test.uut.sccpu.cpu_ref.array_reg[16]);
        $fdisplay(file_output, "regfile17: %h", test.uut.sccpu.cpu_ref.array_reg[17]);
        $fdisplay(file_output, "regfile18: %h", test.uut.sccpu.cpu_ref.array_reg[18]);
        $fdisplay(file_output, "regfile19: %h", test.uut.sccpu.cpu_ref.array_reg[19]);
        $fdisplay(file_output, "regfile20: %h", test.uut.sccpu.cpu_ref.array_reg[20]);
        $fdisplay(file_output, "regfile21: %h", test.uut.sccpu.cpu_ref.array_reg[21]);
        $fdisplay(file_output, "regfile22: %h", test.uut.sccpu.cpu_ref.array_reg[22]);
        $fdisplay(file_output, "regfile23: %h", test.uut.sccpu.cpu_ref.array_reg[23]);
        $fdisplay(file_output, "regfile24: %h", test.uut.sccpu.cpu_ref.array_reg[24]);
        $fdisplay(file_output, "regfile25: %h", test.uut.sccpu.cpu_ref.array_reg[25]);
        $fdisplay(file_output, "regfile26: %h", test.uut.sccpu.cpu_ref.array_reg[26]);
        $fdisplay(file_output, "regfile27: %h", test.uut.sccpu.cpu_ref.array_reg[27]);
        $fdisplay(file_output, "regfile28: %h", test.uut.sccpu.cpu_ref.array_reg[28]);
        $fdisplay(file_output, "regfile29: %h", test.uut.sccpu.cpu_ref.array_reg[29]);
        $fdisplay(file_output, "regfile30: %h", test.uut.sccpu.cpu_ref.array_reg[30]);
        $fdisplay(file_output, "regfile31: %h", test.uut.sccpu.cpu_ref.array_reg[31]);
        end
        else
        begin
        
        end
        
    end
    
    sccomp_dataflow uut(
        .clk_in(clk),
        .reset(rst),
        .inst(inst),
        .pc(pc)
    );
endmodule

