`timescale 1ns / 1ps

module tb_data_memory();
reg [63:0] mem_addr;
reg [63:0] write_data;
reg clk;
reg mem_write;
reg mem_read;
wire [63:0] read_data;

data_memory testmodule(mem_addr,
    write_data,
    clk,
    mem_write,
    mem_read,
    read_data
);

initial begin
mem_addr = 4;
write_data = 64'h7F5731449;
clk = 0;

mem_read = 0;
mem_write = 0;

#700
mem_read = 1;
mem_write = 0;
 
#700;
mem_read = 0;
mem_write = 1;
 
#700;
mem_read = 1;
mem_write = 0;
 
#700;
mem_read = 0;
mem_write = 0; 

end
always begin
#5 clk = ~clk;

end

endmodule
