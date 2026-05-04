`timescale 1ns/1ps

module decoder(
    input  [31:0] instr,
    output reg [3:0] alu_op,
    output reg reg_write,
    output reg alu_src,
    output reg mem_read,
    output reg mem_write,
    output reg mem_to_reg,
    output reg branch
);

wire [6:0] opcode = instr[6:0];
wire [2:0] funct3 = instr[14:12];
wire [6:0] funct7 = instr[31:25];

always @(*) begin
    alu_op     = 4'b0000;
    reg_write  = 0;
    alu_src    = 0;
    mem_read   = 0;
    mem_write  = 0;
    mem_to_reg = 0;
    branch     = 0;

    // R-type
    if (opcode == 7'b0110011) begin
        reg_write = 1;
        case({funct7, funct3})
            10'b0000000_000: alu_op = 4'b0000; // ADD
            10'b0100000_000: alu_op = 4'b0001; // SUB
            10'b0000000_111: alu_op = 4'b0010;
            10'b0000000_110: alu_op = 4'b0011;
            10'b0000000_100: alu_op = 4'b0100;
        endcase
    end

    // ADDI
    else if (opcode == 7'b0010011) begin
        reg_write = 1;
        alu_src   = 1;
        alu_op    = 4'b0000;
    end

    // LW
    else if (opcode == 7'b0000011 && funct3 == 3'b010) begin
        reg_write  = 1;
        alu_src    = 1;
        mem_read   = 1;
        mem_to_reg = 1;
        alu_op     = 4'b0000;
    end

    // SW
    else if (opcode == 7'b0100011 && funct3 == 3'b010) begin
        alu_src   = 1;
        mem_write = 1;
        alu_op    = 4'b0000;
    end

    // BEQ
    else if (opcode == 7'b1100011 && funct3 == 3'b000) begin
        branch = 1;
        alu_op = 4'b0001; // SUB for comparison
    end
end

endmodule
