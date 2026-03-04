`timescale 1ns/1ps

module cpu(
    input clk
);

reg [31:0] pc = 0;

reg [31:0] imem [0:31];
reg [31:0] dmem [0:31];

wire [31:0] instr = imem[pc[6:2]];

// Fields
wire [4:0] rs1 = instr[19:15];
wire [4:0] rs2 = instr[24:20];
wire [4:0] rd  = instr[11:7];

// Immediates
wire [31:0] imm_i = {{20{instr[31]}}, instr[31:20]};
wire [31:0] imm_s = {{20{instr[31]}}, instr[31:25], instr[11:7]};
wire [31:0] imm_b = {{19{instr[31]}},
                     instr[31],
                     instr[7],
                     instr[30:25],
                     instr[11:8],
                     1'b0};

// Control
wire [3:0] alu_op;
wire reg_write;
wire alu_src;
wire mem_read;
wire mem_write;
wire mem_to_reg;
wire branch;

// Data
wire [31:0] rs1_data;
wire [31:0] rs2_data;
wire [31:0] alu_result;
wire [31:0] mem_data;

// Decoder
decoder dec(
    .instr(instr),
    .alu_op(alu_op),
    .reg_write(reg_write),
    .alu_src(alu_src),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .mem_to_reg(mem_to_reg),
    .branch(branch)
);

// Register file
regfile rf(
    .clk(clk),
    .we(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(mem_to_reg ? mem_data : alu_result),
    .rd1(rs1_data),
    .rd2(rs2_data)
);

// Immediate select
wire [31:0] imm =
    mem_write ? imm_s :
    branch    ? imm_b :
                imm_i;

// ALU input select
wire [31:0] alu_b = alu_src ? imm : rs2_data;

// ALU
alu alu_unit(
    .a(rs1_data),
    .b(alu_b),
    .op(alu_op),
    .result(alu_result)
);

// Memory read
assign mem_data = mem_read ? dmem[alu_result[6:2]] : 32'b0;

// PC update
always @(posedge clk) begin

    if (mem_write)
        dmem[alu_result[6:2]] <= rs2_data;

    if (branch && (alu_result == 0))
        pc <= pc + imm_b;
    else
        pc <= pc + 4;

end

endmodule
