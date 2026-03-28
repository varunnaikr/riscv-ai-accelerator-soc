# RISC-V Edge AI Accelerator SoC

A compact **RISC-V + AI accelerator SoC** built in Verilog, focused on low-power edge inference and fast matrix multiplication using an 8×8 systolic array.

---

## At a Glance

| Item | Value |
|---|---|
| CPU | RV32I pipeline |
| Accelerator | 8×8 systolic array |
| Processing Elements | 64 MAC units |
| Peak Throughput | 1.536 GOPS |
| 8×8 MatMul Latency | ~1.8 µs |
| Toolchain | Yosys + nextpnr + IceStorm |

---

## Why this project?

This SoC demonstrates how a lightweight programmable CPU can offload dense compute to a purpose-built accelerator for better performance per watt on edge-class hardware.

Core building blocks:
- **RISC-V pipeline CPU** for control and orchestration
- **Accelerator controller + interface** for dispatch and synchronization
- **Parameterized systolic arrays** for scalable matrix compute
- **Simulation and benchmarking flow** to validate speed and correctness

---

## Repository Map

```text
rtl/          Core SoC RTL (CPU, accelerator, memory, top-level integration)
accelerator/  Standalone accelerator-focused modules and testbench
sim/          Testbenches and generated simulation binaries
scripts/      Synthesis and plotting scripts
docs/         Architecture, design-flow, and subsystem documentation
results/      Benchmark notes and generated result artifacts
software/     Software-side test payloads
```

---

## Project Phases

- [x] Phase 1: CPU design (RV32I foundation)
- [x] Phase 2: Neural accelerator design
- [x] Phase 3: SoC integration
- [x] Phase 4: Simulation & benchmarking
- [ ] Phase 5: ASIC synthesis & PPA deep-dive

> Current status: **Phase 4 complete; Phase 5 in progress**.

---

## Quick Start

### 1) Run simulation testbenches

Use your preferred Verilog simulator (for example, Icarus Verilog) against files in `sim/` and `rtl/`.

### 2) Run synthesis flow

```bash
yosys -s scripts/synth.ys
```

### 3) View benchmark notes

See [`results/benchmark.md`](results/benchmark.md).

---

## Documentation

- [System Architecture](docs/architecture.md)
- [Systolic Array Design](docs/systolic_array.md)
- [Design Flow](docs/design_flow.md)

---

## Design Highlights

- Modular RTL structure with clear SoC boundaries
- Multiple array variants (`3x3`, `8x8`, and parameterized)
- CPU + accelerator co-design for realistic heterogeneous compute
- Results artifacts included for reproducibility and reporting

---

## Author

**Varun R**
