`timescale 1ns / 1ps

module EX_MEM_register(
input clk,
input reset,
input mem_to_reg,
input reg_write,
input branch,
input mem_write,
input mem_read,
input [63:0] adder_in,
input zero,
input [63:0] alu_result,
input [63:0] mux_in,
input [4:0] rd,
output reg mem_to_reg_out,
output reg reg_write_out,
output reg branch_out,
output reg mem_write_out,
output reg mem_read_out,
output reg [63:0] adder_out,
output reg zero_out,
output reg [63:0] alu_result_out,
output reg [63:0] mux_out,
output reg [4:0] rd_out
    );
    initial begin
    mem_to_reg_out = 0;
    reg_write_out = 0;
    branch_out = 0;
    mem_write_out = 0;
    mem_read_out = 0;
    adder_out = 0;
    zero_out = 0;
    alu_result_out = 0;
    mux_out = 0;
    rd_out = 0;
    end   
    
    always @(posedge clk ) begin
    if (reset) begin
    mem_to_reg_out = 0;
    reg_write_out = 0;
    branch_out = 0;
    mem_write_out = 0;
    mem_read_out = 0;
    adder_out = 0;
    zero_out = 0;
    alu_result_out = 0;
    mux_out = 0;
    rd_out = 0;
    
    end
    else begin
    mem_to_reg_out = mem_to_reg;
    reg_write_out = reg_write;
    branch_out = branch;
    mem_write_out = mem_write;
    mem_read_out = mem_read;
    adder_out = adder_in;
    zero_out = zero;
    alu_result_out = alu_result;
    mux_out = mux_in;
    rd_out = rd;
    end
    end
    
endmodule

    

