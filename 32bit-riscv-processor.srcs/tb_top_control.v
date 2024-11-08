`timescale 1ns / 1ps

module tb_top_control(

    );
    reg [6:0] opcode;
    reg [3:0] funct;
    wire branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write; 
    wire [3:0] operation;
    
    top_control tc1 (opcode, funct, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, operation);
    initial begin
        
    //R type 
    opcode = 7'b0110011;
    funct = 4'b0000;
    #400;
    
    //R type
    opcode = 7'b0110011;
    funct = 4'b1000;
    #400;
    
    //R type
    opcode = 7'b0110011;
    funct = 4'b0111;
    #400;
    
    //R type
    opcode = 7'b0110011;
    funct = 4'b0110;
    #400;
    
    //I type
    opcode = 7'b0000011;
    #400;
    
    //S type
    opcode = 7'b0100011;
    #400;
    
    //SB type
    opcode = 7'b1100011;
    
    #500;
    

    end 
endmodule
