.PHONY: help sim-alu sim-decoder sim-regfile sim-cpu sim-cpu-pipeline sim-systolic sim-accel sim-all synth clean

IVERILOG ?= iverilog
VVP ?= vvp
YOSYS ?= yosys

help:
	@echo "Available targets:"
	@echo "  sim-alu           - Run ALU testbench"
	@echo "  sim-decoder       - Run decoder testbench"
	@echo "  sim-regfile       - Run register-file testbench"
	@echo "  sim-cpu           - Run single-cycle CPU testbench"
	@echo "  sim-cpu-pipeline  - Run pipelined CPU testbench"
	@echo "  sim-systolic      - Run 8x8 systolic array testbench"
	@echo "  sim-accel         - Run accelerator top-level testbench"
	@echo "  sim-all           - Run all simulation targets"
	@echo "  synth             - Run synthesis script (Yosys)"
	@echo "  clean             - Remove generated simulation/synthesis artifacts"

sim-alu:
	$(IVERILOG) -o sim/alu_test sim/alu_tb.v rtl/alu.v
	$(VVP) sim/alu_test

sim-decoder:
	$(IVERILOG) -o sim/decoder_test sim/decoder_tb.v rtl/decoder.v
	$(VVP) sim/decoder_test

sim-regfile:
	$(IVERILOG) -o sim/regfile_test sim/regfile_tb.v rtl/regfile.v
	$(VVP) sim/regfile_test

sim-cpu:
	$(IVERILOG) -o sim/cpu_test sim/cpu_tb.v rtl/cpu.v rtl/regfile.v rtl/alu.v rtl/decoder.v
	$(VVP) sim/cpu_test

sim-cpu-pipeline:
	$(IVERILOG) -o sim/pipe_test sim/cpu_pipeline_tb.v rtl/cpu_pipeline.v rtl/regfile.v rtl/alu.v rtl/decoder.v rtl/sram.v
	$(VVP) sim/pipe_test

sim-systolic:
	$(IVERILOG) -o sim/systolic_test sim/systolic_tb.v rtl/systolic_array_8x8.v rtl/pe.v
	$(VVP) sim/systolic_test

sim-accel:
	$(IVERILOG) -o sim/accel_test sim/accel_tb.v rtl/accelerator_top.v rtl/accelerator_controller.v rtl/systolic_array_8x8.v rtl/pe.v
	$(VVP) sim/accel_test

sim-all: sim-alu sim-decoder sim-regfile sim-cpu sim-cpu-pipeline sim-systolic sim-accel

synth:
	$(YOSYS) scripts/synth.ys

clean:
	rm -f sim/*_test *.vcd
	rm -f build/*.json build/*.asc build/*.bin
