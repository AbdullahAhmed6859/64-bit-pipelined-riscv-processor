//`timescale 1ns / 1ps
//module instruction_memory(
//    input [63:0] instruction_address,
//    output[31:0] instruction
//);
//    reg [7:0] ins_mem [15:0];
//// lab
////    initial begin
////        ins_mem[15] = 8'b00001110;
////        ins_mem[14] = 8'b10010101;
////        ins_mem[13] = 8'b00111000;
////        ins_mem[12] = 8'b00100011;
////        ins_mem[11] = 8'b00000000;
////        ins_mem[10] = 8'b00010100;
////        ins_mem[9] = 8'b10000100;
////        ins_mem[8] = 8'b10010011;
////        ins_mem[7] = 8'b00000000;
////        ins_mem[6] = 8'b10011010;
////        ins_mem[5] = 8'b10000100;
////        ins_mem[4] = 8'b10110011;
////        ins_mem[3] = 8'b00001111;
////        ins_mem[2] = 8'b00000101;
////        ins_mem[1] = 8'b00110100;
////        ins_mem[0] = 8'b10000011;
////    end

//// project
//initial begin
////        ins_mem[15] = 8'b00000010;
////        ins_mem[14] = 8'b10010101;
////        ins_mem[13] = 8'b00110100;
////        ins_mem[12] = 8'b00100011;
////        ins_mem[11] = 8'b00010011;
////        ins_mem[10] = 8'b00000000;
////        ins_mem[9] = 8'b10000100;
////        ins_mem[8] = 8'b10010011;
////        ins_mem[11] = 8'b0000000;
////        ins_mem[10] = 8'b0000000;
////        ins_mem[9] = 8'b00000000;
////        ins_mem[8] = 8'b00010011;
////        ins_mem[7] = 8'b0000000;
////        ins_mem[6] = 8'b0000000;
////        ins_mem[5] = 8'b00000000;
////        ins_mem[4] = 8'b00010011;
//       {ins_mem[3], ins_mem[2], ins_mem[1], ins_mem[0]} = 32'h00538433;
//       {ins_mem[7], ins_mem[6], ins_mem[5], ins_mem[4]} = 32'h00540533;
//    end
//    assign instruction[7:0] = ins_mem[instruction_address];
//    assign instruction[15:8] = ins_mem[instruction_address + 1];
//    assign instruction[23:16] = ins_mem[instruction_address + 2];
//    assign instruction[31:24] = ins_mem[instruction_address + 3];
//endmodule

`timescale 1ns / 1ps
module instruction_memory(
    input clk,
    input reset,
    input [63:0] instruction_address,
    output reg[31:0] instruction
);
    reg [7:0] ins_mem [15:0];
// lab
//    initial begin
//        ins_mem[15] = 8'b00001110;
//        ins_mem[14] = 8'b10010101;
//        ins_mem[13] = 8'b00111000;
//        ins_mem[12] = 8'b00100011;
//        ins_mem[11] = 8'b00000000;
//        ins_mem[10] = 8'b00010100;
//        ins_mem[9] = 8'b10000100;
//        ins_mem[8] = 8'b10010011;
//        ins_mem[7] = 8'b00000000;
//        ins_mem[6] = 8'b10011010;
//        ins_mem[5] = 8'b10000100;
//        ins_mem[4] = 8'b10110011;
//        ins_mem[3] = 8'b00001111;
//        ins_mem[2] = 8'b00000101;
//        ins_mem[1] = 8'b00110100;
//        ins_mem[0] = 8'b10000011;
//    end

// project
initial begin
//        ins_mem[15] = 8'b00000010;
//        ins_mem[14] = 8'b10010101;
//        ins_mem[13] = 8'b00110100;
//        ins_mem[12] = 8'b00100011;
//        ins_mem[11] = 8'b00010011;
//        ins_mem[10] = 8'b00000000;
//        ins_mem[9] = 8'b10000100;
//        ins_mem[8] = 8'b10010011;
//        ins_mem[11] = 8'b0000000;
//        ins_mem[10] = 8'b0000000;
//        ins_mem[9] = 8'b00000000;
//        ins_mem[8] = 8'b00010011;
//        ins_mem[7] = 8'b0000000;
//        ins_mem[6] = 8'b0000000;
//        ins_mem[5] = 8'b00000000;
//        ins_mem[4] = 8'b00010011;
       {ins_mem[3], ins_mem[2], ins_mem[1], ins_mem[0]} <= 32'h00820333;
       {ins_mem[7], ins_mem[6], ins_mem[5], ins_mem[4]} <= 32'h00540533;
       {ins_mem[11], ins_mem[10], ins_mem[9], ins_mem[8]} <= 32'h00538433;
    end
always @(*)
    begin
    if (reset)
        instruction <= 0;
    else if (clk)
    begin
        instruction[7:0] <= ins_mem[instruction_address];
        instruction[15:8] <= ins_mem[instruction_address + 1];
        instruction[23:16] <= ins_mem[instruction_address + 2];
        instruction[31:24] <= ins_mem[instruction_address + 3];
        end
    end    

endmodule