`timescale 1ns / 1ps

module top_control(
    input [6:0] opcode,
    input [3:0] funct,
    output branch,
    output mem_read,
    output mem_to_reg,
    output mem_write,
    output  alu_src,
    output reg_write,
    output [3:0] operation
    );
    wire [1:0] alu_op;
    
    control_unit x1 (opcode, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
    alu_control x2 (alu_op, funct, operation);
    
    
endmodule
