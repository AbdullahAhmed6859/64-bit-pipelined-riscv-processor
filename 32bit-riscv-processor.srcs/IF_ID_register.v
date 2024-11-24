`timescale 1ns / 1ps

module IF_ID_register(
    input clk,
    input reset,
    input [63:0] pc_in,
    input [31:0] instruction,
    output reg [63:0] pc_out,
    output reg [31:0] ins_out
    );
    
    initial begin
    pc_out <= 0;
    ins_out <= 0;
    end   
    
    always @(posedge clk || reset) begin
    if (reset) begin
    pc_out <= 0;
    ins_out <= 0;
    end
    else if (clk) begin
    pc_out <= pc_in;
    ins_out <= instruction;
    end
    end
    
//    always @(*) begin
//    pc_var <= pc_in;
//    ins_var <= instruction;
//    end
    
     
endmodule
