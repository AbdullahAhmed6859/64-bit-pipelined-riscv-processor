`timescale 1ns / 1ps

module tb_1bit;
    reg a;
    reg b;
    reg [3:0] alu_op;
    reg carry_in;
    wire carry_out;
    wire result;
    
    alu_1bit UUT (a, b, alu_op, carry_in, carry_out, result);

    initial begin
        a = 1'b1;
        b = 1'b0;
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

        // Case for SUBTRACT 
        alu_op = 4'b0110;
        carry_in = 1'b1;
        #600

        // Case for NOR 
        alu_op = 4'b1100;
        carry_in = 1'b0;

    end
endmodule
