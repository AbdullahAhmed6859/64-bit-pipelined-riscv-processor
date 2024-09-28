`timescale 1ns / 1ps

module tb_multiplexer(
    );
    reg [63:0] a;
    reg [63:0] b;
    reg sel;
    wire [63:0] data_out;
    multiplexer x1 (a, b, sel, data_out);
    
    initial begin
        a = 2;
        b = 8;
        sel = 0;
        # 500;
        sel = 1;
    end
endmodule
