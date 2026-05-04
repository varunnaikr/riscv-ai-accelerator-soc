`timescale 1ns/1ps

module systolic_tb;

reg clk;

reg [15:0] a0,a1,a2,a3,a4,a5,a6,a7;
reg [15:0] b0,b1,b2,b3,b4,b5,b6,b7;

wire [31:0] c0,c1,c2,c3,c4,c5,c6,c7;

systolic_array_8x8 dut (
    .clk(clk),

    .a0(a0), .a1(a1), .a2(a2), .a3(a3),
    .a4(a4), .a5(a5), .a6(a6), .a7(a7),

    .b0(b0), .b1(b1), .b2(b2), .b3(b3),
    .b4(b4), .b5(b5), .b6(b6), .b7(b7),

    .c0(c0), .c1(c1), .c2(c2), .c3(c3),
    .c4(c4), .c5(c5), .c6(c6), .c7(c7)
);

initial begin
    clk = 0;
end

always #5 clk = ~clk;

initial begin

    $dumpfile("systolic.vcd");
    $dumpvars(0, systolic_tb);

    // initialize inputs
    a0=1; a1=2; a2=3; a3=4;
    a4=5; a5=6; a6=7; a7=8;

    b0=1; b1=2; b2=3; b3=4;
    b4=5; b5=6; b6=7; b7=8;

    #1000;

    $display("C0 = %d", c0);
    $display("C1 = %d", c1);
    $display("C2 = %d", c2);
    $display("C3 = %d", c3);

    $finish;

end

endmodule
