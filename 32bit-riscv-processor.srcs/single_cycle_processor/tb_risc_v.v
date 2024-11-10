`timescale 1ns / 1ps

module tb_risc_v();

    reg clk, reset;
    risc_v rv(clk, reset);
    
    initial begin
        reset = 0;
        clk = 0;
//        #500 reset = 0;
    end
    always # 100 clk = ~clk;
    
endmodule
