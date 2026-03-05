# RISC-V Based Low-Power Edge AI Accelerator SoC

Author: Varun R

## Goal
Designed and implemented an 8×8 systolic-array based AI accelerator in Verilog for fast matrix multiplication. 
The design integrates a RISC-V pipeline CPU, accelerator controller, and memory interface.

• 64 Processing Elements (MAC units)
• 1.536 GOPS compute throughput
• ~1.8 µs latency for 8×8 matrix multiplication
• Synthesized using open-source FPGA flow (Yosys + nextpnr + IceStorm)

## Phases
1. CPU Design (RV32I)
2. Neural Accelerator Design
3. SoC Integration
4. Simulation & Benchmarking
5. ASIC Synthesis & PPA Analysis

Status: Phase 1 - Foundation
## Documentation

Detailed documentation can be found in the docs folder:

- docs/architecture.md
- docs/systolic_array.md
- docs/design_flow.md

## Benchmark Results

See:

results/benchmark.md
