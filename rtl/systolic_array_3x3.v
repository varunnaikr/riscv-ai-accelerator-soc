module systolic_array_3x3(
input clk,

input [15:0] a0,a1,a2,
input [15:0] b0,b1,b2,

output [31:0] c00,c01,c02,
output [31:0] c10,c11,c12,
output [31:0] c20,c21,c22
);

wire [15:0] a00,a01,a02,a10,a11,a12,a20,a21,a22;
wire [15:0] b00,b01,b02,b10,b11,b12,b20,b21,b22;

wire [31:0] c00_w,c01_w,c02_w;
wire [31:0] c10_w,c11_w,c12_w;
wire [31:0] c20_w,c21_w,c22_w;

pe PE00(clk,a0,b0,0,a00,b00,c00_w);
pe PE01(clk,a00,b1,0,a01,b01,c01_w);
pe PE02(clk,a01,b2,0,a02,b02,c02_w);

pe PE10(clk,a1,b00,0,a10,b10,c10_w);
pe PE11(clk,a10,b01,0,a11,b11,c11_w);
pe PE12(clk,a11,b02,0,a12,b12,c12_w);

pe PE20(clk,a2,b10,0,a20,b20,c20_w);
pe PE21(clk,a20,b11,0,a21,b21,c21_w);
pe PE22(clk,a21,b12,0,a22,b22,c22_w);

assign c00 = c00_w;
assign c01 = c01_w;
assign c02 = c02_w;

assign c10 = c10_w;
assign c11 = c11_w;
assign c12 = c12_w;

assign c20 = c20_w;
assign c21 = c21_w;
assign c22 = c22_w;

endmodule
