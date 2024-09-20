`timescale 1ns / 1ps

module multiplexer(
    input [63:0] a,
    input [63:0] b,
    input sel,
    output wire [63:0] data_out
    );
    
    assign data_out = sel == 0 ? a : b;
    
endmodule
