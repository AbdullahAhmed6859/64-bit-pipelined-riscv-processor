module tb_register_file();
    reg [63:0] WriteData;
    reg [4:0] RS1;
    reg [4:0] RS2;
    reg [4:0] RD;
    reg RegWrite, clk, reset;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    
    register_file rf_1(
        WriteData, RS1, RS2,
        RD,
        RegWrite,
        clk,
        reset,
        ReadData1,
        ReadData2
    );

    initial begin
    clk = 0;
    RegWrite = 0;
    reset = 1;

    RS1 = 10;
    RS2 = 20;
    WriteData = 64'd35;
    RD = 20;
    #1000 reset = 0;
    #1000 RegWrite = 1;
    end
    
    always
    #500 clk=~clk;
endmodule