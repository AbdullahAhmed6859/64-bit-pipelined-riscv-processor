`timescale 1ns / 1ps

module alu_8bit(
    input [7:0] a,
    input [7:0] b,
    input [3:0] alu_op,
    input carry_in,
    output carry_out,
    output [7:0] result
    );
    
    wire carry_out1, carry_out2, carry_out3, carry_out4, carry_out5, carry_out6, carry_out7;
    
    alu_1bit alu0 (a[0], b[0], alu_op, carry_in, carry_out1, result[0]);
    alu_1bit alu1 (a[1], b[1], alu_op, carry_out1, carry_out2, result[1]);
    alu_1bit alu2 (a[2], b[2], alu_op, carry_out2, carry_out3, result[2]);
    alu_1bit alu3 (a[3], b[3], alu_op, carry_out3, carry_out4, result[3]);
    alu_1bit alu4 (a[4], b[4], alu_op, carry_out4, carry_out5, result[4]);
    alu_1bit alu5 (a[5], b[5], alu_op, carry_out5, carry_out6, result[5]);
    alu_1bit alu6 (a[6], b[6], alu_op, carry_out6, carry_out7, result[6]);
    alu_1bit alu7 (a[7], b[7], alu_op, carry_out7, carry_out, result[7]);

    
endmodule
