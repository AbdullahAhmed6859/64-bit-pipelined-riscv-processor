`timescale 1ns / 1ps

module tb_alu_control;

    reg [1:0] aluop;
    reg [3:0] funct;

    wire [3:0] operation;

    alu_control uut (aluop, funct, operation);

    initial
    begin
        funct = 4'b0000;
        aluop = 2'b00;
        #500 
        aluop = 2'b01;
        #500 
        aluop = 2'b10;
        
        #500
        funct = 4'b1000;
        #500 
        funct = 4'b0111;
        #500 
        funct = 4'b0110;
        
    end


endmodule