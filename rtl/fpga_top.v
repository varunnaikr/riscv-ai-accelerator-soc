module fpga_top(
input clk
);

wire [31:0] c0,c1,c2,c3,c4,c5,c6,c7;

systolic_array_8x8 array(

.clk(clk),

.a0(16'd1),
.a1(16'd2),
.a2(16'd3),
.a3(16'd4),
.a4(16'd5),
.a5(16'd6),
.a6(16'd7),
.a7(16'd8),

.b0(16'd1),
.b1(16'd2),
.b2(16'd3),
.b3(16'd4),
.b4(16'd5),
.b5(16'd6),
.b6(16'd7),
.b7(16'd8),

.c0(c0),
.c1(c1),
.c2(c2),
.c3(c3),
.c4(c4),
.c5(c5),
.c6(c6),
.c7(c7)

);

endmodule
