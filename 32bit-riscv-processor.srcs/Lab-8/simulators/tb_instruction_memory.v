`timescale 1ns / 1ps

module tb_instruction_memory();
    reg [63:0] ins_address;
    wire [31:0] instruction;
    
    instruction_memory test (ins_address, instruction);
    
    initial begin
        ins_address = 0;
        #1000;
        ins_address = 4;
    end
    
endmodule
