module sram(

input clk,
input we,
input [7:0] addr,
input [15:0] data_in,
output reg [15:0] data_out

);

reg [15:0] mem [0:255];

always @(posedge clk)
begin
    if(we)
        mem[addr] <= data_in;

    data_out <= mem[addr];
end

endmodule
