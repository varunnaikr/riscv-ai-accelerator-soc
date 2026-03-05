module systolic_array_param
#(parameter N = 8)

(
input clk,
input rst,

input [7:0] a [0:N-1],
input [7:0] b [0:N-1],

output [15:0] c [0:N-1]

);

genvar i,j;

wire [7:0] a_wire [0:N-1][0:N-1];
wire [7:0] b_wire [0:N-1][0:N-1];
wire [15:0] psum_wire [0:N-1][0:N-1];

generate

for(i=0;i<N;i=i+1)
begin
    for(j=0;j<N;j=j+1)
    begin

        pe pe_inst(

        .clk(clk),
        .rst(rst),

        .a_in((j==0) ? a[i] : a_wire[i][j-1]),
        .b_in((i==0) ? b[j] : b_wire[i-1][j]),

        .psum_in((i==0 || j==0) ? 0 : psum_wire[i][j]),

        .a_out(a_wire[i][j]),
        .b_out(b_wire[i][j]),
        .psum_out(psum_wire[i][j])

        );

    end
end

endgenerate

assign c[0] = psum_wire[N-1][0];

endmodule
