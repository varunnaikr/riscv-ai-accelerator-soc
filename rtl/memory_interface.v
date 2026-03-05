module memory_interface(

input clk,
input rst,
input start,

output reg [7:0] a0,a1,a2,a3,
output reg [7:0] b0,b1,b2,b3,

output reg done

);

reg [3:0] counter;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        counter <= 0;
        done <= 0;
    end

    else if(start)
    begin
        counter <= counter + 1;

        a0 <= counter;
        a1 <= counter + 1;
        a2 <= counter + 2;
        a3 <= counter + 3;

        b0 <= counter;
        b1 <= counter + 1;
        b2 <= counter + 2;
        b3 <= counter + 3;

        if(counter == 8)
            done <= 1;
    end

end

endmodule
