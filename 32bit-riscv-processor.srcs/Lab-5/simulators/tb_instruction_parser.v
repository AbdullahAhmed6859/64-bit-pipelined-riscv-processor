`timescale 1ns / 1ps

module tb_ins_par(
    );
    
    reg [31:0] instruction;
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] func3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] func7;
    
    instruction_parser x1 (instruction, opcode, rd, func3, rs1, rs2, func7);
    
    initial begin
        instruction = 'h007302b3;
        # 500;
        instruction = 'h407302b3;
    end
endmodule