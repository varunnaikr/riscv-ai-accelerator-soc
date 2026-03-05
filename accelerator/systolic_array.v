module systolic_array(
    input clk,
    input rst,

    input [7:0] a0,a1,a2,a3,
    input [7:0] b0,b1,b2,b3,

    output [15:0] c0,c1,c2,c3
);

wire [7:0] a_wire [0:3][0:3];
wire [7:0] b_wire [0:3][0:3];
wire [15:0] psum_wire [0:3][0:3];

genvar i,j;

generate
for(i=0;i<4;i=i+1) begin
    for(j=0;j<4;j=j+1) begin

        if(i==0 && j==0) begin

            pe pe_inst(
                .clk(clk),
                .rst(rst),
                .a_in(a0),
                .b_in(b0),
                .psum_in(16'd0),
                .a_out(a_wire[i][j]),
                .b_out(b_wire[i][j]),
                .psum_out(psum_wire[i][j])
            );

        end
        else if(i==0) begin

            pe pe_inst(
                .clk(clk),
                .rst(rst),
                .a_in(a_wire[i][j-1]),
                .b_in(j==1 ? b1 : j==2 ? b2 : b3),
                .psum_in(16'd0),
                .a_out(a_wire[i][j]),
                .b_out(b_wire[i][j]),
                .psum_out(psum_wire[i][j])
            );

        end
        else if(j==0) begin

            pe pe_inst(
                .clk(clk),
                .rst(rst),
                .a_in(i==1 ? a1 : i==2 ? a2 : a3),
                .b_in(b_wire[i-1][j]),
                .psum_in(16'd0),
                .a_out(a_wire[i][j]),
                .b_out(b_wire[i][j]),
                .psum_out(psum_wire[i][j])
            );

        end
        else begin

            pe pe_inst(
                .clk(clk),
                .rst(rst),
                .a_in(a_wire[i][j-1]),
                .b_in(b_wire[i-1][j]),
                .psum_in(psum_wire[i][j]),
                .a_out(a_wire[i][j]),
                .b_out(b_wire[i][j]),
                .psum_out(psum_wire[i][j])
            );

        end

    end
end
endgenerate

assign c0 = psum_wire[3][0];
assign c1 = psum_wire[3][1];
assign c2 = psum_wire[3][2];
assign c3 = psum_wire[3][3];

endmodule
