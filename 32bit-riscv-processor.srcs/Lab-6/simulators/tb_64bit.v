`timescale 1ns / 1ps

module tb_64bit(
    );
reg [63:0] a, b;
reg [3:0] alu_op;
wire [63:0] result;
wire zero;

alu_64bit x1 (a, b, alu_op, result, zero);

initial
begin
a = 64'h0000_0000_0000_0200; // 512 
a = 64'h0000_0000_0000_0100; // 256

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