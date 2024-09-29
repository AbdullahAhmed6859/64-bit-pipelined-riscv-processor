`timescale 1ns / 1ps

module alu_8bit(
    input [7:0] a,
    input [7:0] b,
    input [3:0] alu_op,
    input carry_in,
    output carry_out,
    output [7:0] result
    );
    wire [0:6]  carry_outi;
    
    alu_1bit alu0 (a[0], b[0], alu_op, carry_in, carry_outi[0], result[0]);
    alu_1bit alu1 (a[1], b[1], alu_op, carry_outi[0], carry_outi[1], result[1]);
    alu_1bit alu2 (a[2], b[2], alu_op, carry_outi[1], carry_outi[2], result[2]);
    alu_1bit alu3 (a[3], b[3], alu_op, carry_outi[2], carry_outi[3], result[3]);
    alu_1bit alu4 (a[4], b[4], alu_op, carry_outi[3], carry_outi[4], result[4]);
    alu_1bit alu5 (a[5], b[5], alu_op, carry_outi[4], carry_outi[5], result[5]);
    alu_1bit alu6 (a[6], b[6], alu_op, carry_outi[5], carry_outi[6], result[6]);
    alu_1bit alu7 (a[7], b[7], alu_op, carry_outi[6], carry_out, result[7]);

    
endmodule
