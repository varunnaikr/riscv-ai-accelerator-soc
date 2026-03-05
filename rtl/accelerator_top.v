module accelerator_top(

input clk,
input rst,
input start,

input [7:0] a0,a1,a2,a3,a4,a5,a6,a7,
input [7:0] b0,b1,b2,b3,b4,b5,b6,b7,

output busy,
output done,

output [31:0] cycle_count,

output [15:0] c0,c1,c2,c3,c4,c5,c6,c7

);

accelerator_controller ctrl(

.clk(clk),
.rst(rst),
.start(start),

.busy(busy),
.done(done),
.cycle_count(cycle_count)

);

systolic_array_8x8 array(

.clk(clk),
.rst(rst),

.a0(a0), .a1(a1), .a2(a2), .a3(a3),
.a4(a4), .a5(a5), .a6(a6), .a7(a7),

.b0(b0), .b1(b1), .b2(b2), .b3(b3),
.b4(b4), .b5(b5), .b6(b6), .b7(b7),

.c0(c0), .c1(c1), .c2(c2), .c3(c3),
.c4(c4), .c5(c5), .c6(c6), .c7(c7)

);

endmodule
