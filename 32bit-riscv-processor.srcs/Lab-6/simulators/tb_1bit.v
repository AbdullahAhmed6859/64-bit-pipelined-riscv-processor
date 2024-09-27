`timescale 1ns / 1ps

module tb_1bit;

    reg a, b;
    reg [3:0] alu_op;
    reg carry_in;
    wire result, carry_out;

    // Correct instantiation using named port mapping
    alu_1bit UUT (
        .a(a), 
        .b(b), 
        .alu_op(alu_op), 
        .carry_in(carry_in), 
        .carry_out(carry_out), 
        .result(result)
    );

    initial begin
        a = 1'b1;
        b = 1'b1;
        // Case for AND
        alu_op = 4'b0000;
        carry_in = 1'b0;
        #600

        // Case for OR
        alu_op = 4'b0001;
        carry_in = 1'b0;
        #600

        // Case for ADD
        alu_op = 4'b0010;
        carry_in = 1'b0;
        #600

        // Case for SUBTRACT (assuming alu_op == 0110 means subtraction in your ALU design)
        alu_op = 4'b0110;
        carry_in = 1'b1;
        #600

        // Case for NOR (assuming alu_op == 1100 means NOR in your ALU design)
        alu_op = 4'b1100;
        carry_in = 1'b0;

    end
endmodule
