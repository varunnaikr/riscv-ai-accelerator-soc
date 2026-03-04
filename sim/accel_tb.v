`timescale 1ns/1ps

module accel_tb;

reg clk;
reg reset;

reg [31:0] addr;
reg [31:0] write_data;
reg write_en;
reg read_en;

wire [31:0] read_data;

accelerator_interface uut(
clk,
reset,
addr,
write_data,
write_en,
read_en,
read_data
);

always #5 clk = ~clk;

initial begin

$dumpfile("accelerator.vcd");
$dumpvars(0,accel_tb);

clk = 0;
reset = 1;

#10 reset = 0;

write_en = 1;
read_en = 0;

addr = 32'h00; write_data = 1; #10;
addr = 32'h04; write_data = 2; #10;
addr = 32'h08; write_data = 3; #10;

addr = 32'h0C; write_data = 4; #10;
addr = 32'h10; write_data = 5; #10;
addr = 32'h14; write_data = 6; #10;

write_en = 0;
read_en = 1;

addr = 32'h20; #10;
addr = 32'h24; #10;
addr = 32'h28; #10;

addr = 32'h2C; #10;
addr = 32'h30; #10;
addr = 32'h34; #10;

addr = 32'h38; #10;
addr = 32'h3C; #10;
addr = 32'h40; #10;

#100;

$finish;

end

endmodule
