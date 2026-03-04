module accelerator_interface(
input clk,
input reset,

input [31:0] addr,
input [31:0] write_data,
input write_en,
input read_en,

output reg [31:0] read_data
);

reg [15:0] a0,a1,a2;
reg [15:0] b0,b1,b2;

wire [31:0] c00,c01,c02;
wire [31:0] c10,c11,c12;
wire [31:0] c20,c21,c22;

systolic_array_3x3 accel(
clk,
a0,a1,a2,
b0,b1,b2,
c00,c01,c02,
c10,c11,c12,
c20,c21,c22
);

always @(posedge clk) begin

if(reset) begin
a0<=0;
a1<=0;
a2<=0;
b0<=0;
b1<=0;
b2<=0;
end

if(write_en) begin

case(addr)

32'h00: a0 <= write_data[15:0];
32'h04: a1 <= write_data[15:0];
32'h08: a2 <= write_data[15:0];

32'h0C: b0 <= write_data[15:0];
32'h10: b1 <= write_data[15:0];
32'h14: b2 <= write_data[15:0];

endcase

end

end

always @(*) begin

if(read_en) begin

case(addr)

32'h20: read_data = c00;
32'h24: read_data = c01;
32'h28: read_data = c02;

32'h2C: read_data = c10;
32'h30: read_data = c11;
32'h34: read_data = c12;

32'h38: read_data = c20;
32'h3C: read_data = c21;
32'h40: read_data = c22;

default: read_data = 0;

endcase

end

else
read_data = 0;

end

endmodule
