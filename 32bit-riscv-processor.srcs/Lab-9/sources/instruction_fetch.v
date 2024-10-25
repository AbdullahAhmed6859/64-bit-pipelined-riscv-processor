`timescale 1ns / 1ps

module instrution_fetch(
    input clk,
    input reset,
    output [31:0] instruction
);

wire [63:0] pc_in;
wire [63:0] pc_out;

program_counter pc (pc_in, clk, reset, pc_out);
instruction_memory im (pc_out, instruction);
adder_64 add_4 (pc_out, 64'b100, pc_in);
endmodule
