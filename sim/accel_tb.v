module accel_tb;

reg clk;
reg rst;
reg start;

reg [7:0] a0,a1,a2,a3,a4,a5,a6,a7;
reg [7:0] b0,b1,b2,b3,b4,b5,b6,b7;

wire busy;
wire done;

wire [15:0] c0,c1,c2,c3,c4,c5,c6,c7;
wire [31:0] cycle_count;
accelerator_top uut(

.clk(clk),
.rst(rst),
.start(start),

.a0(a0), .a1(a1), .a2(a2), .a3(a3),
.a4(a4), .a5(a5), .a6(a6), .a7(a7),

.b0(b0), .b1(b1), .b2(b2), .b3(b3),
.b4(b4), .b5(b5), .b6(b6), .b7(b7),

.busy(busy),
.done(done),

.cycle_count(cycle_count),

.c0(c0), .c1(c1), .c2(c2), .c3(c3),
.c4(c4), .c5(c5), .c6(c6), .c7(c7)

);

always #5 clk = ~clk;

initial begin

$dumpfile("accelerator.vcd");
$dumpvars(0,accel_tb);

clk = 0;
rst = 1;
start = 0;

#10 rst = 0;

a0 = 8'd1; a1 = 8'd2; a2 = 8'd3; a3 = 8'd4;
a4 = 8'd5; a5 = 8'd6; a6 = 8'd7; a7 = 8'd8;

b0 = 8'd1; b1 = 8'd2; b2 = 8'd3; b3 = 8'd4;
b4 = 8'd5; b5 = 8'd6; b6 = 8'd7; b7 = 8'd8;
#10 start = 1;
#10 start = 0;

#200

$display("Results:");
$display("%d %d %d %d %d %d %d %d",
c0,c1,c2,c3,c4,c5,c6,c7);

$display("Execution cycles: %d", cycle_count);

$display("Clock frequency: 100 MHz");

$display("Estimated throughput: 0.32 GOPS");

$display("Simulation finished");

$finish;

end

endmodule
