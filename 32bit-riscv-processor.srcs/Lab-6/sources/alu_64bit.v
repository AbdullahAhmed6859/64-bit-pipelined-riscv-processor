`timescale 1ns / 1ps

module alu_64bit(
    input [63:0] a,
    input [63:0] b,
    input [3:0] alu_op,
    output zero,
    output [63:0] result
);
    
    assign result =
        alu_op == 4'b0000 ? a & b:
        alu_op == 4'b0001 ? a | b:
        alu_op == 4'b0010 ? a + b:
        alu_op == 4'b0110 ? a - b:
        alu_op == 4'b110 ? ~(a | b):
        0;                                                                                                    
        
    assign zero = ~(|result);
endmodule
