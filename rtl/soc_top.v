module soc_top(
input clk,
input reset
);

wire [31:0] addr;
wire [31:0] write_data;
wire [31:0] read_data;
wire mem_write;
wire mem_read;

wire [31:0] accel_read_data;

cpu_pipeline cpu(
.clk(clk),
.reset(reset),
.addr(addr),
.write_data(write_data),
.read_data(read_data),
.mem_write(mem_write),
.mem_read(mem_read)
);

accelerator_interface accel(
.clk(clk),
.reset(reset),
.addr(addr),
.write_data(write_data),
.write_en(mem_write),
.read_en(mem_read),
.read_data(accel_read_data)
);

assign read_data = accel_read_data;

endmodule
