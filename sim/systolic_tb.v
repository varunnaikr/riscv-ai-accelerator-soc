`timescale 1ns/1ps

module systolic_tb;

reg clk;

reg [15:0] a0,a1,a2;
reg [15:0] b0,b1,b2;

wire [31:0] c00,c01,c02;
wire [31:0] c10,c11,c12;
wire [31:0] c20,c21,c22;

systolic_array_3x3 uut(
clk,
a0,a1,a2,
b0,b1,b2,
c00,c01,c02,
c10,c11,c12,
c20,c21,c22
);

always #5 clk = ~clk;

initial begin

$dumpfile("systolic.vcd");
$dumpvars(0,systolic_tb);

clk = 0;

a0 = 1;
a1 = 2;
a2 = 3;

b0 = 4;
b1 = 5;
b2 = 6;

#200;

$finish;

end

endmodule
