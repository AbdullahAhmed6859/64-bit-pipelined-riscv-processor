`timescale 1ns / 1ps

module alu_control(
input [1:0] aluop,
input [3:0] funct,
output [3:0] operation
    );
    
    assign operation =
        // I/S type (load and store only)
        aluop == 2'b00 ? 4'b0010: // add 
        // SB type
        aluop == 2'b01 ? 4'b0110: // subtract
        // R/I type
        aluop == 2'b10 ? (
        funct[2:0] == 3'b000 ? 4'b0010: // add
        funct == 4'b1000 ? 4'b0110: // subtract
        funct[2:0] == 3'b111 ? 4'b0000: // and
        funct[2:0] == 3'b110 ? 4'b0001: // or
        funct[2:0] == 3'b001 ? 4'b1000: // slli
        4'bx
        ):
        4'bx;
endmodule