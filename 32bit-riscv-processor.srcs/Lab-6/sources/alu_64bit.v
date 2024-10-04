`timescale 1ns / 1ps

module alu_64bit(
    input [63:0] a,
    input [63:0] b,
    input [3:0] alu_op,
    output zero,
    output reg [63:0] result
    );

    always @(*) begin
        case (alu_op)
            4'b0000: result = a & b;  // AND
            4'b0001: result = a | b;  // OR
            4'b0010: result = a + b;  // ADD
            4'b0110: result = a - b;  // SUBTRACT
            4'b1100: result = ~(a | b);  // NOR
        endcase
    end

    assign zero = ~(|result);
endmodule
