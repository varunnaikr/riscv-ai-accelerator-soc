module systolic_array_param
#(parameter N = 8)

(
input clk,
input rst,

input [15:0] a [0:N-1],
input [15:0] b [0:N-1],

output [31:0] c [0:N-1]

);

genvar i,j;

wire [15:0] a_wire [0:N-1][0:N-1];
wire [15:0] b_wire [0:N-1][0:N-1];
wire [31:0] psum_wire [0:N-1][0:N-1];

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

        .c_in((i==0 || j==0) ? 32'd0 : psum_wire[i][j-1]),

        .a_out(a_wire[i][j]),
        .b_out(b_wire[i][j]),
        .c_out(psum_wire[i][j])

        );

    end
end

for(i=0;i<N;i=i+1)
begin
    assign c[i] = psum_wire[i][N-1];
end

endgenerate

endmodule
