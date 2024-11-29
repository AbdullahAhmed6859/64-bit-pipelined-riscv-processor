`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 11:18:51 PM
// Design Name: 
// Module Name: data_hazard_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_hazard_unit(
    input [4:0] ID_EX_rd, 
    input [4:0]IF_ID_rs1, 
    input [4:0] IF_ID_rs2,
    input ID_EX_MemRead,
    output reg ID_EX_mux_out,
    output reg IF_ID_Write,
    output reg PCWrite
    );
    
always@(*)
begin    
    if (ID_EX_MemRead && (ID_EX_rd == IF_ID_rs1 || ID_EX_rd == IF_ID_rs2))
        begin
            ID_EX_mux_out = 0;
            IF_ID_Write = 0;
            PCWrite = 0;
        end
    else
        begin
            ID_EX_mux_out = 1;
            IF_ID_Write = 1;
            PCWrite = 1;
        end

end





endmodule

