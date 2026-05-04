module systolic_tb;

reg clk;
reg rst;

reg [7:0] a0,a1,a2,a3;
reg [7:0] b0,b1,b2,b3;

wire [15:0] c0,c1,c2,c3;

systolic_array uut(
    .clk(clk),
    .rst(rst),
    .a0(a0),.a1(a1),.a2(a2),.a3(a3),
    .b0(b0),.b1(b1),.b2(b2),.b3(b3),
    .c0(c0),.c1(c1),.c2(c2),.c3(c3)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;

    #10 rst = 0;

    a0=1; a1=2; a2=3; a3=4;
    b0=1; b1=2; b2=3; b3=4;

    #200;

    $display("Outputs: %d %d %d %d",c0,c1,c2,c3);

    $finish;

end

endmodule
