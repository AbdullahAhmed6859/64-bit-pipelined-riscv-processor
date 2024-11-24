`timescale 1ns / 1ps


module ID_EX(
    input clk,reset,
    input [31:0]pc_in,
    input [63:0]read_data1_in,
    input [63:0]read_data2_in,
    input [63:0]imm_input,
    output [4:0] rd_in,
    output [4:0] rs1_in,
    output [4:0] rs2_in,
    input [3:0] funct_in,
    input branch_in,memread_in,memtoreg_in,memwrite_in,aluSrc_in,regwrite_in,
    input [1:0] Aluop_in,
    
    
    output reg [63:0] pc_out,
      output reg [4:0] rs1,
      output reg [4:0] rs2,
      output reg [4:0] rd,
      output reg [63:0] imm_data,
      output reg [63:0] readdata1, 
      output reg [63:0] readdata2, 
      output reg [3:0] funct_out,
      output reg Branch,Memread,Memtoreg, Memwrite, Regwrite,Alusrc, 
      output reg [1:0] aluop
    );
    

always @ (posedge clk || reset)
    begin
      if (reset == 1'b1)
        begin
          pc_out <= 64'b0;
          rs1 <= 5'b0;
          rs2 <= 5'b0;
          rd <= 5'b0;
          imm_data <= 64'b0;
          readdata1 <= 64'b0;
          readdata2 <= 64'b0;
          funct_out <= 4'b0;
          Branch <= 1'b0;
          Memread <= 1'b0;
          Memtoreg <=1'b0;
          Memwrite <= 1'b0;
          Regwrite <= 1'b0;
          Alusrc <= 1'b0;
          aluop <= 2'b0;
        end
      else if (clk)
        begin
          pc_out <= pc_in;
          rs1 <= rs1_in;
          rs2 <= rs2_in;
          rd <= rd_in;
          imm_data <= imm_input;
          readdata1 <= read_data1_in;
          readdata2 <= read_data2_in;
          funct_out <= funct_in; 
          Branch <= branch_in;
          Memread <= memread_in;
          Memtoreg <= memtoreg_in;
          Memwrite <= memwrite_in;
          Regwrite <= regwrite_in;
          Alusrc <= aluSrc_in;
          aluop <= Aluop_in;
          
        end
    end
endmodule
