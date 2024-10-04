`timescale 1ns / 1ps

module top_lab7(
input [31:0] instruction,
output [63:0] readData1,
output [63:0] readData2
    );
    
reg [63:0] writedata;
reg clk, reset, regWrite;

wire [4:0] rs1, rs2, rd;

instruction_parser x1 (instruction, opcode, rd, func3, rs1, rs2, func7);
register_file x2 (writedata, rs1, rs2, rd, regWrite, clk, reset, readData1, readData2);
initial
begin
writedata = 63'd30;
clk = 0;
reset = 0;
regWrite = 1;
end

always #500 clk = ~clk;

endmodule
