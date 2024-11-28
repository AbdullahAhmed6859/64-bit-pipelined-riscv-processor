`timescale 1ns / 1ps

module control_unit(
    input reset,
    input [6:0] opcode,
    output branch,
    output mem_read,
    output mem_to_reg,
    output [1:0] alu_op,
    output mem_write,
    output  alu_src,
    output reg_write
);
    wire [7:0] outputs;
    wire [2:0] opcode_3;
//    assign opcode_3 = opcode[6:4];
    
    assign outputs =
        reset ? 0:
        opcode[6:4] == 3'b011 ? 8'b00100010: // R type
        opcode[6:4] == 3'b000 ? 8'b11110000: // I type (ld)
        opcode[6:4] == 3'b010 ? 8'b1x001000: // S type (sd)
        opcode[6:4] == 3'b110 ? 8'b0x000101: // SB type
        opcode[6:4] == 3'b001 ? 8'b10100010: // I type (all others)
        0;
    
    assign alu_op = outputs[1:0];
    assign branch = outputs[2];
    assign mem_write = outputs[3];
    assign mem_read = outputs[4];
    assign reg_write = outputs[5];
    assign mem_to_reg = outputs[6];
    assign alu_src = outputs[7];

    
endmodule
