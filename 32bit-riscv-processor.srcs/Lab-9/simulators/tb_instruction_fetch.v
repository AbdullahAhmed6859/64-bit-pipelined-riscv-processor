`timescale 1ns / 1ps

module tb_instrution_fetch(

    );
    reg reset, clk;
    wire [31:0] instruction;
    instrution_fetch x1(clk, reset, instruction);
    initial begin
    
    clk = 0; reset = 1;
    
    #10
    reset = 0;
    
    #50
    reset = 1;
    
    end 
    always #5 clk = ~clk;
endmodule
