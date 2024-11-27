`timescale 1ns / 1ps

//module data_extractor(
//    input [31:0] instruction,
//    output reg [63:0] imm
//    );
    
//    always @(*) begin  
//        case (instruction[6:5])
//            2'b00: begin
//                // I-type instruction
//                imm[11:0] <= instruction[31:20]; 
//                imm[63:12] <= {52{instruction[31]}}; // assign cvalue of imm[11] to all remaining bits
//            end
//            2'b01: begin
//                // S-type instruction
//                imm[11:5] <= instruction[31:25];
//                imm[4:0] <= instruction[11:7];
//                imm[63:12] <= {52{instruction[31]}};  // assign cvalue of imm[11] to all remaining bits
//            end
//            2'b11: begin
//                // SB-type instruction
//                imm[0] <= 1'b0;
//                imm[12] <= instruction[31];  
//                imm[10:5] <= instruction[30:25];  
//                imm[4:1] <= instruction[11:8];    
//                imm[11] <= instruction[7];      
//                imm[63:13] <= {51{instruction[31]}}; // assign cvalue of imm[12] to all remaining bits
//            end
//            default: begin
//                imm <= 64'b0; 
//            end
//        endcase
//    end
//endmodule


module data_extractor(
    input [31:0] instruction,
    output [63:0] imm
    );
    
    // I-type instruction (if instruction[6:5] == 2'b00)
    wire [63:0] imm_i = {{52{instruction[31]}}, instruction[31:20]};
    // S-type instruction (if instruction[6:5] == 2'b01)
    wire [63:0] imm_s = {{52{instruction[31]}}, instruction[31:25], instruction[11:7]};
    // SB-type instruction (if instruction[6:5] == 2'b11)
    wire [63:0] imm_sb = {{52{instruction[31]}}, instruction[31],  instruction[7], instruction[30:25], instruction[11:8]};

    // Final imm based on instruction[6:5] using a mux structure
    assign imm = (instruction[6:5] == 2'b00) ? imm_i :
                 (instruction[6:5] == 2'b01) ? imm_s :
                 (instruction[6:5] == 2'b11) ? imm_sb :
                 64'b0;
                 
endmodule
