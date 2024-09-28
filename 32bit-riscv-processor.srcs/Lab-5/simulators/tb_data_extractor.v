`timescale 1ns / 1ps

module tb_data_extractor(
    );
    
    reg [31:0] instruction;
    wire [63:0] imm;
    
    data_extractor x1 (instruction, imm);

    initial begin
        instruction = 'h00430293;
        # 1000;
        instruction = 'h00532223;
        # 1000;
        instruction = 'h00629263;
    end
endmodule
