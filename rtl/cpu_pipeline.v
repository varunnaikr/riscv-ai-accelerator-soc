`timescale 1ns/1ps

module cpu_pipeline(input clk);

reg [31:0] imem [0:255];
reg [31:0] dmem [0:255];
reg [31:0] regs [0:31];

integer i;
initial begin
for(i=0;i<32;i=i+1)
regs[i]=0;
end

integer j;
initial begin
for(j=0;j<256;j=j+1)
dmem[j]=0;
end

reg [31:0] pc=0;

reg [31:0] IF_ID_instr=0;
reg [31:0] IF_ID_pc=0;

reg [31:0] ID_EX_pc=0;
reg [31:0] ID_EX_rs1_val=0;
reg [31:0] ID_EX_rs2_val=0;
reg [4:0] ID_EX_rs1=0;
reg [4:0] ID_EX_rs2=0;
reg [4:0] ID_EX_rd=0;
reg [31:0] ID_EX_imm=0;

reg ID_EX_reg_write=0;
reg ID_EX_mem_read=0;
reg ID_EX_mem_write=0;
reg ID_EX_use_imm=0;
reg ID_EX_branch=0;

reg [3:0] ID_EX_alu_op=0;

reg [31:0] EX_MEM_result=0;
reg [31:0] EX_MEM_rs2_val=0;
reg [4:0] EX_MEM_rd=0;
reg EX_MEM_reg_write=0;
reg EX_MEM_mem_read=0;
reg EX_MEM_mem_write=0;

reg [31:0] MEM_WB_result=0;
reg [4:0] MEM_WB_rd=0;
reg MEM_WB_reg_write=0;

always @(posedge clk) begin
IF_ID_instr <= imem[pc[9:2]];
IF_ID_pc <= pc;
end

wire [6:0] opcode = IF_ID_instr[6:0];
wire [2:0] funct3 = IF_ID_instr[14:12];
wire [6:0] funct7 = IF_ID_instr[31:25];

wire [4:0] rs1 = IF_ID_instr[19:15];
wire [4:0] rs2 = IF_ID_instr[24:20];
wire [4:0] rd  = IF_ID_instr[11:7];

wire [31:0] imm_i = {{20{IF_ID_instr[31]}},IF_ID_instr[31:20]};
wire [31:0] imm_s = {{20{IF_ID_instr[31]}},IF_ID_instr[31:25],IF_ID_instr[11:7]};
wire [31:0] imm_b = {{19{IF_ID_instr[31]}},IF_ID_instr[31],IF_ID_instr[7],IF_ID_instr[30:25],IF_ID_instr[11:8],1'b0};
wire [31:0] imm_j = {{11{IF_ID_instr[31]}},IF_ID_instr[31],IF_ID_instr[19:12],IF_ID_instr[20],IF_ID_instr[30:21],1'b0};

wire [31:0] rs1_data = regs[rs1];
wire [31:0] rs2_data = regs[rs2];

reg reg_write;
reg mem_read;
reg mem_write;
reg use_imm;
reg branch;
reg [3:0] alu_op;

always @(*) begin

reg_write=0;
mem_read=0;
mem_write=0;
use_imm=0;
branch=0;
alu_op=0;

case(opcode)

7'b0110011: begin
reg_write=1;

case(funct3)
3'b000: begin
if(funct7==7'b0100000) alu_op=1;
else alu_op=0;
end
3'b111: alu_op=2;
3'b110: alu_op=3;
3'b100: alu_op=4;
3'b010: alu_op=5;
endcase
end

7'b0010011: begin
reg_write=1;
use_imm=1;
alu_op=0;
end

7'b0000011: begin
reg_write=1;
mem_read=1;
use_imm=1;
alu_op=0;
end

7'b0100011: begin
mem_write=1;
use_imm=1;
alu_op=0;
end

7'b1100011: begin
branch=1;
alu_op=1;
end

7'b1101111: begin
reg_write=1;
end

7'b1100111: begin
reg_write=1;
use_imm=1;
end

endcase

end

always @(posedge clk) begin

ID_EX_pc <= IF_ID_pc;
ID_EX_rs1_val <= rs1_data;
ID_EX_rs2_val <= rs2_data;
ID_EX_rs1 <= rs1;
ID_EX_rs2 <= rs2;
ID_EX_rd <= rd;

ID_EX_reg_write <= reg_write;
ID_EX_mem_read <= mem_read;
ID_EX_mem_write <= mem_write;
ID_EX_use_imm <= use_imm;
ID_EX_branch <= branch;
ID_EX_alu_op <= alu_op;

if(opcode==7'b0100011)
ID_EX_imm <= imm_s;
else if(opcode==7'b1100011)
ID_EX_imm <= imm_b;
else
ID_EX_imm <= imm_i;

end

wire forwardA_ex = (EX_MEM_reg_write && EX_MEM_rd!=0 && EX_MEM_rd==ID_EX_rs1);
wire forwardB_ex = (EX_MEM_reg_write && EX_MEM_rd!=0 && EX_MEM_rd==ID_EX_rs2);

wire forwardA_mem = (MEM_WB_reg_write && MEM_WB_rd!=0 && MEM_WB_rd==ID_EX_rs1);
wire forwardB_mem = (MEM_WB_reg_write && MEM_WB_rd!=0 && MEM_WB_rd==ID_EX_rs2);

reg [31:0] operandA;
reg [31:0] operandB;

always @(*) begin

operandA = ID_EX_rs1_val;
operandB = ID_EX_rs2_val;

if(forwardA_ex) operandA = EX_MEM_result;
if(forwardB_ex) operandB = EX_MEM_result;

if(forwardA_mem) operandA = MEM_WB_result;
if(forwardB_mem) operandB = MEM_WB_result;

if(ID_EX_use_imm)
operandB = ID_EX_imm;

end

reg [31:0] alu_result;

always @(*) begin

case(ID_EX_alu_op)

0: alu_result = operandA + operandB;
1: alu_result = operandA - operandB;
2: alu_result = operandA & operandB;
3: alu_result = operandA | operandB;
4: alu_result = operandA ^ operandB;
5: alu_result = (operandA < operandB);

default: alu_result = 0;

endcase

end

wire branch_taken = ID_EX_branch && (operandA==operandB);
wire [31:0] branch_target = ID_EX_pc + ID_EX_imm;

always @(posedge clk) begin

if(branch_taken)
pc <= branch_target;
else
pc <= pc + 4;

end

always @(posedge clk) begin

EX_MEM_result <= alu_result;
EX_MEM_rs2_val <= ID_EX_rs2_val;
EX_MEM_rd <= ID_EX_rd;

EX_MEM_reg_write <= ID_EX_reg_write;
EX_MEM_mem_read <= ID_EX_mem_read;
EX_MEM_mem_write <= ID_EX_mem_write;

end

reg [31:0] mem_data=0;

always @(posedge clk) begin

if(EX_MEM_mem_write)
dmem[EX_MEM_result[9:2]] <= EX_MEM_rs2_val;

if(EX_MEM_mem_read)
mem_data <= dmem[EX_MEM_result[9:2]];

end

always @(posedge clk) begin

if(EX_MEM_mem_read)
MEM_WB_result <= mem_data;
else
MEM_WB_result <= EX_MEM_result;

MEM_WB_rd <= EX_MEM_rd;
MEM_WB_reg_write <= EX_MEM_reg_write;

end

always @(posedge clk) begin

if(MEM_WB_reg_write && MEM_WB_rd!=0)
regs[MEM_WB_rd] <= MEM_WB_result;

end

endmodule
