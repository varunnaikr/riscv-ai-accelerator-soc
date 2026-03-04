`timescale 1ns/1ps

module regfile_tb;

reg clk;
reg we;
reg [4:0] rs1, rs2, rd;
reg [31:0] wd;
wire [31:0] rd1, rd2;

regfile uut (
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(wd),
    .rd1(rd1),
    .rd2(rd2)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("regfile.vcd");
    $dumpvars(0, regfile_tb);

    clk = 0;
    we = 0;
    rs1 = 0;
    rs2 = 0;
    rd  = 0;
    wd  = 0;

    #10;

    we = 1;
    rd = 5;
    wd = 32'hA5A5A5A5;
    #10;

    we = 0;
    rs1 = 5;
    #10;

    $finish;
end
endmodule
