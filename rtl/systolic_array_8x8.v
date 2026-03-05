module systolic_array_8x8(

input clk,
input rst,

input [7:0] a0,a1,a2,a3,a4,a5,a6,a7,
input [7:0] b0,b1,b2,b3,b4,b5,b6,b7,

output [15:0] c0,c1,c2,c3,c4,c5,c6,c7

);

wire [7:0] a_wire [0:7][0:7];
wire [7:0] b_wire [0:7][0:7];
wire [15:0] psum_wire [0:7][0:7];

genvar i,j;

generate
for(i=0;i<8;i=i+1) begin
for(j=0;j<8;j=j+1) begin

pe pe_inst(

.clk(clk),
.rst(rst),

.a_in((j==0) ? 
(i==0?a0:i==1?a1:i==2?a2:i==3?a3:i==4?a4:i==5?a5:i==6?a6:a7)
: a_wire[i][j-1]),

.b_in((i==0) ? 
(j==0?b0:j==1?b1:j==2?b2:j==3?b3:j==4?b4:j==5?b5:j==6?b6:b7)
: b_wire[i-1][j]),

.psum_in((i==0 || j==0) ? 16'd0 : psum_wire[i][j]),

.a_out(a_wire[i][j]),
.b_out(b_wire[i][j]),
.psum_out(psum_wire[i][j])

);

end
end
endgenerate

assign c0 = psum_wire[7][0];
assign c1 = psum_wire[7][1];
assign c2 = psum_wire[7][2];
assign c3 = psum_wire[7][3];
assign c4 = psum_wire[7][4];
assign c5 = psum_wire[7][5];
assign c6 = psum_wire[7][6];
assign c7 = psum_wire[7][7];

endmodule
