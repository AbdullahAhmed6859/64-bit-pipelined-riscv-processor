//`timescale 1ns / 1ps

//module program_counter(
//input [63:0] pc_in,
//input clk,
//input reset,
//output reg [63:0] pc_out
//);
//initial pc_out = 0;
//always @(posedge clk) begin
//    if (~reset) begin
//        if (pc_in > 7)
//            pc_out = 0;
//        else
//            pc_out = pc_in;
//    end
//end

//always @(*)
//    if (reset)
//        pc_out = 0;
        
//endmodule

`timescale 1ns / 1ps

module program_counter(
input [63:0] pc_in,
input clk,
input reset,
input pc_write,
output reg [63:0] pc_out
);
reg pc_s;
always @(posedge clk or posedge reset) begin
    if (~reset) begin
        if (pc_in > 199) begin
            pc_out <= 0;
        end else begin
            if (~pc_s) begin
                pc_out <= 0;
                pc_s <= 1;
            end else if(pc_write) 
            pc_out <= pc_in;
        end
    end else begin
        pc_s <= 0;
        pc_out <= 0;
    end
end
endmodule
