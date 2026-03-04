module systolic_array_8x8(
input clk,

input [15:0] a0,a1,a2,a3,a4,a5,a6,a7,
input [15:0] b0,b1,b2,b3,b4,b5,b6,b7,

output [31:0] c00,c01,c02,c03,c04,c05,c06,c07,
output [31:0] c10,c11,c12,c13,c14,c15,c16,c17,
output [31:0] c20,c21,c22,c23,c24,c25,c26,c27,
output [31:0] c30,c31,c32,c33,c34,c35,c36,c37,
output [31:0] c40,c41,c42,c43,c44,c45,c46,c47,
output [31:0] c50,c51,c52,c53,c54,c55,c56,c57,
output [31:0] c60,c61,c62,c63,c64,c65,c66,c67,
output [31:0] c70,c71,c72,c73,c74,c75,c76,c77
);

wire [15:0] a_bus [0:7][0:7];
wire [15:0] b_bus [0:7][0:7];
wire [31:0] c_bus [0:7][0:7];

genvar i,j;

generate
for(i=0;i<8;i=i+1) begin: rows
for(j=0;j<8;j=j+1) begin: cols

wire [15:0] a_in;
wire [15:0] b_in;

assign a_in = (j==0) ? 
              (i==0?a0:i==1?a1:i==2?a2:i==3?a3:i==4?a4:i==5?a5:i==6?a6:a7)
              : a_bus[i][j-1];

assign b_in = (i==0) ? 
              (j==0?b0:j==1?b1:j==2?b2:j==3?b3:j==4?b4:j==5?b5:j==6?b6:b7)
              : b_bus[i-1][j];

pe PE(
clk,
a_in,
b_in,
0,
a_bus[i][j],
b_bus[i][j],
c_bus[i][j]
);

end
end
endgenerate

assign c00=c_bus[0][0]; assign c01=c_bus[0][1]; assign c02=c_bus[0][2]; assign c03=c_bus[0][3];
assign c04=c_bus[0][4]; assign c05=c_bus[0][5]; assign c06=c_bus[0][6]; assign c07=c_bus[0][7];

assign c10=c_bus[1][0]; assign c11=c_bus[1][1]; assign c12=c_bus[1][2]; assign c13=c_bus[1][3];
assign c14=c_bus[1][4]; assign c15=c_bus[1][5]; assign c16=c_bus[1][6]; assign c17=c_bus[1][7];

assign c20=c_bus[2][0]; assign c21=c_bus[2][1]; assign c22=c_bus[2][2]; assign c23=c_bus[2][3];
assign c24=c_bus[2][4]; assign c25=c_bus[2][5]; assign c26=c_bus[2][6]; assign c27=c_bus[2][7];

assign c30=c_bus[3][0]; assign c31=c_bus[3][1]; assign c32=c_bus[3][2]; assign c33=c_bus[3][3];
assign c34=c_bus[3][4]; assign c35=c_bus[3][5]; assign c36=c_bus[3][6]; assign c37=c_bus[3][7];

assign c40=c_bus[4][0]; assign c41=c_bus[4][1]; assign c42=c_bus[4][2]; assign c43=c_bus[4][3];
assign c44=c_bus[4][4]; assign c45=c_bus[4][5]; assign c46=c_bus[4][6]; assign c47=c_bus[4][7];

assign c50=c_bus[5][0]; assign c51=c_bus[5][1]; assign c52=c_bus[5][2]; assign c53=c_bus[5][3];
assign c54=c_bus[5][4]; assign c55=c_bus[5][5]; assign c56=c_bus[5][6]; assign c57=c_bus[5][7];

assign c60=c_bus[6][0]; assign c61=c_bus[6][1]; assign c62=c_bus[6][2]; assign c63=c_bus[6][3];
assign c64=c_bus[6][4]; assign c65=c_bus[6][5]; assign c66=c_bus[6][6]; assign c67=c_bus[6][7];

assign c70=c_bus[7][0]; assign c71=c_bus[7][1]; assign c72=c_bus[7][2]; assign c73=c_bus[7][3];
assign c74=c_bus[7][4]; assign c75=c_bus[7][5]; assign c76=c_bus[7][6]; assign c77=c_bus[7][7];

endmodule
