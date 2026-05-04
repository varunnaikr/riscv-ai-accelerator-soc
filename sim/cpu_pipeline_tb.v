`timescale 1ns/1ps

module cpu_pipeline_tb;

reg clk;

cpu_pipeline uut(
    .clk(clk)
);

always #5 clk = ~clk;

initial begin

$dumpfile("cpu_pipeline.vcd");
$dumpvars(0,cpu_pipeline_tb);

clk = 0;

/////////////////////////////////////////////////
// PROGRAM
/////////////////////////////////////////////////

// ADDI x1, x0, 5
uut.imem[0] = 32'h00500093;

// ADDI x2, x0, 7
uut.imem[1] = 32'h00700113;

// SW x2,0(x1)
uut.imem[2] = 32'h0020A023;

// LW x3,0(x1)
uut.imem[3] = 32'h0000A183;

// ADD x4,x2,x3
uut.imem[4] = 32'h00310233;

// BEQ x4,x3,8
uut.imem[5] = 32'h00320463;

// ADDI x5,1
uut.imem[6] = 32'h00100293;

// ADDI x6,9
uut.imem[7] = 32'h00900313;

/////////////////////////////////////////////////

#200;

$finish;

end

endmodule
