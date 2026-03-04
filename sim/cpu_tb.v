`timescale 1ns/1ps

module cpu_tb;

reg clk = 0;

cpu uut(
    .clk(clk)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, cpu_tb.uut);

    // Initialize registers
    uut.rf.registers[1] = 5;
    uut.rf.registers[2] = 5;

    // BEQ x1,x2,+8  (correct encoding)
    uut.imem[0] = 32'h00208663;

    // This should be skipped
    uut.imem[1] = 32'b0000000_00010_00001_000_00011_0110011;

    // This should execute
    uut.imem[2] = 32'b0000000_00010_00001_000_00100_0110011;

    #100;
    $finish;
end

endmodule
