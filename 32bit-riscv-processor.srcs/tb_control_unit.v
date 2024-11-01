`timescale 1ns / 1ps

module tb_control_unit(

    );
    
    reg [6:0] opcode;
    wire branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write; 
    wire [1:0] alu_op;
    
    control_unit x1 (opcode, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
    
    initial begin 
    //R type
    opcode = 7'b0110011;
    #500;
    
    //I type
    opcode = 7'b0000011;
    #500;
    
    //S type
    opcode = 7'b0100011;
    #500;
    
    //SB type
    opcode = 7'b1100011;
    #500;
    
    //addi type
    opcode = 7'b0010011;
    #500;

    end
    
    
    
endmodule
