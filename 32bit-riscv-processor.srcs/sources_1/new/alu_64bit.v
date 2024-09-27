`timescale 1ns / 1ps

module alu_64bit(
    input [63:0] a,
    input [63:0] b,
    input [3:0] alu_op,
    output zero,
    output reg [63:0] result
    );
    
    always @(*) begin
        case (alu_op)
            // perform and
            4'b0000: begin
                result = a & b;
            end
            // perform or
            4'b0001: begin
                result = a | b;
            end
            // perform add
            4'b0010: begin
                result = a + b;
            end
            // perform subtract
            4'b0110: begin
                result = a - b;
            end
            // perform nor
            4'b1100: begin
                result = ~( a | b);
            end
            default: begin
                result = 64'b0;
            end
        endcase 
           
    end   
     assign zero = result == 64'b0 ? 0 : 1;
endmodule
