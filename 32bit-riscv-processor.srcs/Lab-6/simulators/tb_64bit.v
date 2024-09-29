`timescale 1ns / 1ps

module tb_64bit;

reg [63:0] a;
reg [63:0] b;
reg [3:0] alu_op;
wire zero1, zero2;
wire [63:0] result1;
wire [63:0] result2;

alu_64bit x1 (a, b, alu_op, zero1, result1);
alu_64bit_low_level x2 (a, b, alu_op, zero2, result2);

initial begin
a = 16'h0000000000000200; // 512 
b = 16'h0000000000000100; // 256

//Case for And
alu_op = 4'b0000;
#600

//Case for Or
alu_op = 4'b0001;
#600

//Case for Add
alu_op = 4'b0010;

#600
//Case for subtract
alu_op = 4'b0110;
#600

//Case for Nor
alu_op = 4'b1100;

end
endmodule