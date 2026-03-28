# RISC-V Edge AI Accelerator SoC

A compact **RISC-V + AI accelerator SoC** built in Verilog, focused on low-power edge inference and fast matrix multiplication using an 8×8 systolic array.

## Goal
Designed and implemented an 8×8 systolic-array based AI accelerator in Verilog for fast matrix multiplication.
The design integrates a RISC-V pipeline CPU, accelerator controller, and memory interface.

- 64 Processing Elements (MAC units)
- 1.536 GOPS compute throughput
- ~1.8 µs latency for 8×8 matrix multiplication
- Synthesized using open-source FPGA flow (Yosys + nextpnr + IceStorm)

## Project Phases
1. CPU Design (RV32I)
2. Neural Accelerator Design
3. SoC Integration
4. Simulation & Benchmarking
5. FPGA Synthesis Flow

**Current status:** Phase 5 (FPGA synthesis flow integrated, simulation benches available)

## Quick Start

### 1) Run simulation targets
```bash
make sim-alu
make sim-decoder
make sim-regfile
make sim-cpu
make sim-cpu-pipeline
make sim-systolic
make sim-accel
```

Run the full simulation sweep:
```bash
make sim-all
```

### 2) Run synthesis
```bash
make synth
```

### 3) Clean generated artifacts
```bash
make clean
```

## Documentation
Detailed documentation is available in the `docs` folder:

- `docs/architecture.md`
- `docs/systolic_array.md`
- `docs/design_flow.md`

## Benchmark Results
See `results/benchmark.md` for measured accelerator speedup data.

## Author

results/benchmark.md


## ASIC Flow Kickoff

To start the ASIC-oriented flow (synthesis-first):

```bash
bash scripts/start_asic_flow.sh --dry-run
bash scripts/start_asic_flow.sh
```

For a deeper flow description and next milestones, see:

- docs/asic_flow.md
