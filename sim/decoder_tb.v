`timescale 1ns/1ps

module decoder_tb;

reg [31:0] instr;
wire [3:0] alu_op;
wire reg_write;

decoder uut(
    .instr(instr),
    .alu_op(alu_op),
    .reg_write(reg_write)
);

initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0, decoder_tb);

    // ADD x1, x2, x3
    instr = 32'b0000000_00011_00010_000_00001_0110011;
    #10;

    // SUB x1, x2, x3
    instr = 32'b0100000_00011_00010_000_00001_0110011;
    #10;

    // AND
    instr = 32'b0000000_00011_00010_111_00001_0110011;
    #10;

    $finish;
end

endmodule
