`timescale 1ns / 1ps
module data_memory(
    input [63:0] mem_addr,
    input[63:0] write_data,
    input clk,
    input mem_write,
    input mem_read,
    output [63:0] read_data
);
reg [7:0] memory [63:0];
integer i;
initial begin 
for (i =0; i < 64; i=i+1) begin
// lab
//        memory[i] = 64'b0 + i;
// project
    memory[i] = 64'b0;
    end
end


assign read_data[7:0] = mem_read? memory[mem_addr]: 8'b0;
assign read_data[15:8] = mem_read? memory[mem_addr+1]: 8'b0;
assign read_data[23:16] = mem_read? memory[mem_addr+2]: 8'b0;
assign read_data[31:24] = mem_read? memory[mem_addr+3]: 8'b0;
assign read_data[39:32] = mem_read? memory[mem_addr+4]: 8'b0;
assign read_data[47:40] = mem_read? memory[mem_addr+5]: 8'b0;
assign read_data[55:48] = mem_read? memory[mem_addr+6]: 8'b0;
assign read_data[63:56] = mem_read? memory[mem_addr+7]: 8'b0;

always @(posedge clk) begin
    if (mem_write) begin
        memory[mem_addr] = write_data[7:0];
        memory[mem_addr+1] = write_data[15:8];
        memory[mem_addr+2] = write_data[23:16];
        memory[mem_addr+3] = write_data[31:24];
        memory[mem_addr+4] = write_data[39:32];
        memory[mem_addr+5] = write_data[47:40];
        memory[mem_addr+6] = write_data[55:48];
        memory[mem_addr+7] = write_data[63:56];
    end
end
endmodule
