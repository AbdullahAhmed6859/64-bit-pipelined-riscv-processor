`timescale 1ns / 1ps

module MEM_WB(
  input clk,reset,
  input [63:0] read_data_in,
  input [63:0] result_alu_in,
  input [4:0]Rd_in, 
  input memtoreg_in, regwrite_in,
  output reg [63:0] readdata, 
  output reg [63:0] result_alu_out,
  output reg [4:0] rd,
  output reg Memtoreg, Regwrite
);
 
 
initial begin
readdata <= 63'b0;
          result_alu_out <= 63'b0;
          rd <= 5'b0;
          Memtoreg <= 1'b0;
          Regwrite <= 1'b0;
end
  always @(posedge clk)
    begin
      if (reset == 1'b1)
        begin
          readdata <= 63'b0;
          result_alu_out <= 63'b0;
          rd <= 5'b0;
          Memtoreg <= 1'b0;
          Regwrite <= 1'b0;
          
        end
      else
        begin
         readdata <= read_data_in;
          result_alu_out <= result_alu_in;
          rd <= Rd_in;
          Memtoreg <= memtoreg_in;
          Regwrite <= regwrite_in;
        end
    end
endmodule
