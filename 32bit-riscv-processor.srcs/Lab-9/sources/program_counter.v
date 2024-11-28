`timescale 1ns / 1ps

module program_counter(
input [63:0] pc_in,
input clk,
input reset,
output reg [63:0] pc_out
);
reg pc_s;
always @(posedge clk or posedge reset) begin
    if (~reset) begin
        if (pc_in > 119) begin
            pc_out <= 0;
        end else begin
            if (~pc_s) begin
                pc_out <= 0;
                pc_s <= 1;
            end else 
            pc_out <= pc_in;
        end
    end else begin
        pc_s <= 0;
        pc_out <= 0;
    end
end
endmodule
