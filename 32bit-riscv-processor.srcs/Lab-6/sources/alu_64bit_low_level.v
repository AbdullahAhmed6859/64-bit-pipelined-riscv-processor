`timescale 1ns / 1ps

module alu_64bit_low_level(
    input [63:0] a,
    input [63:0] b,
    input [3:0] alu_op,
    output zero,
    output [63:0] result
    );

    wire [63:0] carry;
    wire carry_in = (alu_op == 4'b0110) ? 1'b1 : 1'b0;
    assign zero = ~(|result);
    // no carry in
    alu_1bit alu0 (a[0], b[0], alu_op, carry_in , carry[0], result[0]);

    genvar i;
    generate
        for (i = 1; i <= 62; i = i + 1) begin : alu_loop
            alu_1bit alu (a[i], b[i], alu_op, carry[i-1], carry[i], result[i]);
        end
    endgenerate
    
    // no carry out
    alu_1bit alu63 (a[63], b[63], alu_op, carry[62], carry[63], result[63]);

endmodule