module accelerator_controller(

input clk,
input rst,
input start,

output reg busy,
output reg done,
output reg [31:0] cycle_count

);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        busy <= 0;
        done <= 0;
        cycle_count <= 0;
    end

    else
    begin

        if(start && !busy)
        begin
            busy <= 1;
            done <= 0;
            cycle_count <= 0;
        end

        else if(busy)
        begin
            cycle_count <= cycle_count + 1;

            if(cycle_count == 20)
            begin
                busy <= 0;
                done <= 1;
            end
        end

    end

end

endmodule
