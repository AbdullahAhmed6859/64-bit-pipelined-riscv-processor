`timescale 1ns / 1ps

module tb_risc_v();

    reg clk, reset;
    pipeline_processor rv(clk, reset);
    
    initial begin
        reset = 1;
        clk = 0;
        #10 reset = 0;
    end
    always #2 clk = ~clk;
    
endmodule
