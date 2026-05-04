module accelerator_interface(

input clk,
input rst,

input write_enable,
input [1:0] addr,
input [31:0] data_in,

output reg start,
output reg [31:0] status

);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        start <= 0;
        status <= 0;
    end

    else if(write_enable)
    begin
        case(addr)

        2'b00: start <= data_in[0];    // start register
        2'b01: status <= data_in;      // status register

        endcase
    end

end

endmodule
