`timescale 1ns / 1ps

module data_extractor(
    input [31:0] instruction,
    output reg [63:0] imm
    );
    
    always @(*) begin
        imm = 64'b0;  

        case (instruction[6:5])
            2'b00: begin
                // I-type instruction
                imm[11:0] = instruction[31:20]; 
                imm[63:12] = {52{instruction[31]}}; // assign cvalue of imm[11] to all remaining bits
            end
            2'b01: begin
                // S-type instruction
                imm[11:5] = instruction[31:25];
                imm[4:0] = instruction[11:7];
                imm[63:12] = {52{instruction[31]}};  // assign cvalue of imm[11] to all remaining bits
            end
            2'b11: begin
                // SB-type instruction
                imm[12] = instruction[31];  
                imm[10:5] = instruction[30:25];  
                imm[4:1] = instruction[11:8];    
                imm[11] = instruction[7];      
                imm[63:13] = {51{instruction[31]}}; // assign cvalue of imm[12] to all remaining bits
            end
            default: begin
                imm = 64'b0; 
            end
        endcase
    end
endmodule
