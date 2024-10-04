`timescale 1ns / 1ps
module register_file(
    input [63:0] write_data,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input reg_write,
    input clk,
    input reset,
    output reg [63:0] read_data_1,
    output reg [63:0] read_data_2
    );
    
    reg [63:0] registers [31:0];
    
    integer i;
    initial
        for (i = 0; i < 63; i = i + 1)
            registers[i] = 64'b0 + i;
    
    
    always @(posedge clk)
        if (reg_write)
            registers[rd] <= write_data;
    
    
    always @(reset or rs1 or rs2 or registers) begin
        if (~reset) begin
            read_data_1 <= registers[rs1];
            read_data_2 <= registers[rs2];
        end else begin
            read_data_1 <= 64'b0;
            read_data_2 <= 64'b0;
        end
    end 
    
endmodule