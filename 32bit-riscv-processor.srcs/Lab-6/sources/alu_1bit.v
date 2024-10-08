`timescale 1ns / 1ps

module alu_1bit(
    input a,
    input b,
    input [3:0] alu_op,
    input carry_in,
    output carry_out,
    output result
    );
    wire a_invert, b_invert, mux_1_out, mux_2_out, and_out, or_out, adder_out;
    wire [1:0] operation;
    assign a_invert = alu_op[3];
    assign b_invert = alu_op[2];
    assign operation = alu_op[1:0];
    // mux outputs
    assign mux_1_out = a_invert ? ~a : a;
    assign mux_2_out = b_invert ? ~b : b;
//     determine the value of rsult and carry out based on opreation
    assign result =
        operation == 2'b00 ? mux_1_out & mux_2_out:
        operation == 2'b01 ? mux_1_out | mux_2_out:
        operation == 2'b10 ? mux_1_out + mux_2_out + carry_in: 
        1'b0;
    assign carry_out =
        operation == 2'b10 ? 
        (mux_1_out & carry_in) |
        (mux_2_out & carry_in) |
        (mux_1_out & mux_2_out)
        : 1'b0;
endmodule
