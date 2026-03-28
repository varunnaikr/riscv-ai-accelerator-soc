# RISC-V Edge AI Accelerator SoC

A compact **RISC-V + AI accelerator SoC** implemented in Verilog for low-power edge inference workloads, centered on an **8×8 systolic-array matrix-multiply engine**.

---

## At a Glance

| Area | Details |
|---|---|
| CPU | RV32I-compatible pipelined core |
| Accelerator | 8×8 systolic array (64 PEs / MAC units) |
| Throughput (reported) | 1.536 GOPS |
| 8×8 Matmul latency (reported) | ~1.8 µs |
| Toolchain | Icarus Verilog, GTKWave, Yosys, nextpnr, IceStorm |

## Repository UX Map

Use this as the fastest way to find what you need:

- **Design RTL**: `rtl/`
- **Accelerator-focused RTL/TB**: `accelerator/`, `sim/systolic_tb.v`
- **Simulation testbenches**: `sim/`
- **Build/synthesis artifacts**: `build/`
- **Automation scripts**: `scripts/`
- **Documentation**: `docs/`
- **Performance results**: `results/benchmark.md`

## Current Project Phase

The repository is currently in **Phase 5: FPGA synthesis flow integration**, with module and subsystem simulation targets available.

### Phase Breakdown

1. CPU design (RV32I)
2. Neural accelerator design
3. SoC integration
4. Simulation & benchmarking
5. FPGA synthesis flow ✅

---

## Quick Start

### 1) Run targeted simulations

```bash
make sim-alu
make sim-decoder
make sim-regfile
make sim-cpu
make sim-cpu-pipeline
make sim-systolic
make sim-accel
```

### 2) Run the full simulation sweep

```bash
make sim-all
```

### 3) Run synthesis

```bash
make synth
```

### 4) Clean generated artifacts

```bash
make clean
```

---

## ASIC Flow Kickoff

```bash
bash scripts/start_asic_flow.sh --dry-run
bash scripts/start_asic_flow.sh
```

For milestones and details, see `docs/asic_flow.md`.

---

## Documentation Index

- Architecture overview: `docs/architecture.md`
- Systolic array details: `docs/systolic_array.md`
- Design/verification flow: `docs/design_flow.md`
- ASIC-oriented flow: `docs/asic_flow.md`

## Benchmark Summary

For CPU-vs-accelerator cycle comparisons and speedup table, see `results/benchmark.md`.

---

## Notes

This repository is hardware-first (RTL + verification + synthesis flow). There is no separate GUI/web dashboard; the primary user experience is through Make targets, documentation, and waveform/debug tooling.
