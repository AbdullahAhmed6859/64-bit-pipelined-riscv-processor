`timescale 1ns / 1ps

module program_counter(
input [63:0] pc_in,
input clk,
input reset,
output reg [63:0] pc_out
);
initial pc_out = 0;
always @(posedge clk) begin
    if (~reset) begin
        if (pc_in > 15)
            pc_out = 0;
        else
            pc_out = pc_in;
    end
end

always @(reset)
    if (reset)
        pc_out = 0;



endmodule
