`timescale 1ns / 1ps

module tb_top_lab7(
    );
    
    reg [31:0] instruction;
    wire [63:0] readData1;
    wire [63:0] readData2;
    
//    instruction_parser x1 (instruction, opcode, rd, func3, rs1, rs2, func7);
    top_lab7 x2 (instruction, readData1, readData2);
    
    initial begin
        instruction = 32'h014a8ab3;
        
//instruction = 32'b00000000010110101000101010010011;
    end
    
endmodule