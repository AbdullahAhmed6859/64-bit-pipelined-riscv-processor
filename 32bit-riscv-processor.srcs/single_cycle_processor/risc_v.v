`timescale 1ns / 1ps
module risc_v(
    input clk,
    input reset
);

wire [63:0] pc_in;
wire [63:0] pc_out;
wire [31:0] instruction;
wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] func3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] func7;
wire branch;
wire mem_read;
wire mem_to_reg;
wire [1:0] alu_op;
wire mem_write;
wire alu_src;
wire reg_write;
wire [63:0] imm;
wire [63:0] rs1_data;
wire [63:0] rs2_data;
wire [63:0] next_ins_address;
wire [63:0] branch_ins_address;
wire [3:0] operation;
wire [63:0] alu_second_operand;
wire zero;
wire [63:0] alu_result;
wire [63:0] read_data;
wire [63:0] write_data;
wire pc_mux_sel;

program_counter pc (pc_in, clk, reset, pc_out);
instruction_memory im (pc_out, instruction);
instruction_parser ip (instruction, opcode, rd, func3, rs1, rs2, func7);
control_unit cu (opcode, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
register_file rf (write_data, rs1, rs2, rd, reg_write, clk, reset, rs1_data, rs2_data);
data_extractor de (instruction, imm);
adder_64 add_1 (pc_out, 4, next_ins_address);
adder_64 add_2 (pc_out, imm << 1 , branch_ins_address);
alu_control ac (alu_op, {instruction[30], instruction[14:12]}, operation);
multiplexer reg_mux (rs2_data, imm, alu_src, alu_second_operand);
alu_64bit alu (rs1_data, alu_second_operand, operation, zero, alu_result);
branch_unit bu (func3, alu_result, zero, branch, pc_mux_sel);
multiplexer pc_mux (next_ins_address, branch_ins_address, pc_mux_sel, pc_in);
data_memory dm (alu_result, rs2_data, clk, mem_write, mem_read, read_data);
multiplexer mem_mux (alu_result, read_data, mem_to_reg, write_data);


endmodule
