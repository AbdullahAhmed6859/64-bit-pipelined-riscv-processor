`timescale 1ns / 1ps

module tb_8bit(


    );
reg [7:0] a, b;
reg [3:0] alu_op;
reg carry_in;
wire [7:0] result;
wire carry_out;

alu_8bit x1(a, b, alu_op, carry_in, result, carry_out);

initial
begin

a = 8'b00000111;
b = 8'b00000010;
//Case for And;
alu_op = 4'b0000;
carry_in = 1'b0;
#600

//Case for Or
alu_op = 4'b0001;
carry_in = 1'b0;
#600

//Case for Add
alu_op = 4'b0010;
carry_in = 1'b0;
#600

//Case for subtract
alu_op = 4'b0110;
carry_in = 1'b1;
#600

//Case for Nor
alu_op = 4'b1100;
carry_in = 1'b0;




end

endmodule