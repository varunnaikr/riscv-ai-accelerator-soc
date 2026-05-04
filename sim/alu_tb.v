`timescale 1ns/1ps

module alu_tb;

reg [31:0] a;
reg [31:0] b;
reg [3:0] op;
wire [31:0] result;

alu uut (
    .a(a),
    .b(b),
    .op(op),
    .result(result)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    a = 10; b = 5; op = 4'b0000; #10; // ADD
    a = 10; b = 5; op = 4'b0001; #10; // SUB
    a = 10; b = 5; op = 4'b0010; #10; // AND
    a = 10; b = 5; op = 4'b0011; #10; // OR
    a = 10; b = 5; op = 4'b0100; #10; // XOR

    $finish;
end

endmodule
