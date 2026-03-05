module soc_top(

input clk,
input rst,

input cpu_write,
input [1:0] cpu_addr,
input [31:0] cpu_data,

output [15:0] c0,c1,c2,c3,c4,c5,c6,c7

);

wire start_signal;
wire [31:0] status;

accelerator_interface accel_if(

.clk(clk),
.rst(rst),

.write_enable(cpu_write),
.addr(cpu_addr),
.data_in(cpu_data),

.start(start_signal),
.status(status)

);

accelerator_top accel(

.clk(clk),
.rst(rst),
.start(start_signal),

.a0(1),.a1(2),.a2(3),.a3(4),
.a4(5),.a5(6),.a6(7),.a7(8),

.b0(1),.b1(2),.b2(3),.b3(4),
.b4(5),.b5(6),.b6(7),.b7(8),

.c0(c0),.c1(c1),.c2(c2),.c3(c3),
.c4(c4),.c5(c5),.c6(c6),.c7(c7)

);

endmodule
