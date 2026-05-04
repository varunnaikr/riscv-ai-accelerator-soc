# RISC-V Based Low-Power Edge AI Accelerator SoC: An ASIC-Oriented Research Portfolio

![Status](https://img.shields.io/badge/Project-Research%20Portfolio-1f6feb)
![RTL](https://img.shields.io/badge/RTL-Complete-2ea043)
![Verification](https://img.shields.io/badge/Verification-Complete-2ea043)
![Flow](https://img.shields.io/badge/ASIC%20Flow-OpenROAD%20%2B%20Sky130-8250df)
![CTS](https://img.shields.io/badge/CTS-Completed-2ea043)
![Timing](https://img.shields.io/badge/Post--CTS%20Fmax-~80%20MHz-f0883e)

## Table of Contents

- [Abstract](#abstract)
- [Project Highlights](#project-highlights)
- [Motivation](#motivation)
- [Architecture Overview](#architecture-overview)
- [Processing Element Design](#processing-element-design)
- [8×8 Systolic Array Architecture](#88-systolic-array-architecture)
- [Controller FSM](#controller-fsm)
- [ASIC Implementation Flow](#asic-implementation-flow)
- [Physical Design Results](#physical-design-results)
- [Static Timing Analysis](#static-timing-analysis)
- [Routing Limitation Discussion](#routing-limitation-discussion)
- [Future Work](#future-work)
- [Tools Used](#tools-used)
- [Repository Structure](#repository-structure)
- [Citation / Acknowledgements](#citation--acknowledgements)

## Abstract

This repository presents a **RISC-V based low-power edge AI System-on-Chip (SoC)** integrating a custom **8×8 systolic array accelerator** for matrix-intensive workloads. The design is developed as an end-to-end VLSI project spanning RTL microarchitecture, verification, and ASIC backend implementation using open-source tooling. The frontend is complete, with validated accelerator functionality, controller integration, and benchmarking support. The backend flow progresses through synthesis, floorplanning, placement, clock tree synthesis (CTS), and timing analysis on the Sky130 technology node. Post-CTS timing indicates an achievable operating point near **~80 MHz** against a 100 MHz target, demonstrating practical closure potential and a strong baseline for future tapeout-grade optimization.

## Project Highlights

- **ASIC-ready RTL** for a RISC-V + AI accelerator SoC.
- **Sky130 implementation** with standard-cell mapping and physical realization.
- **OpenROAD backend flow** completed through floorplan, placement, and CTS.
- **CTS completion** with quantified insertion depth and buffering.
- **~80 MHz timing closure estimate** from post-CTS timing analysis.

## Motivation

Edge AI requires energy-efficient compute primitives that minimize memory movement while maintaining programmable system control. Systolic arrays are effective for dense linear algebra operations due to regular dataflow and high local reuse. This project explores a compact, research-grade SoC architecture that combines:

1. A lightweight RISC-V compute substrate for orchestration,
2. A dedicated systolic accelerator for throughput-critical kernels, and
3. A reproducible ASIC flow for physical implementation evidence.

The result is intended for academic review, internship applications, and research portfolio demonstration of complete frontend-to-backend VLSI competence.

## Architecture Overview

The SoC architecture combines a programmable processing path with domain-specific acceleration:

- **RISC-V subsystem** for control and software-managed operation,
- **Accelerator interface and controller** for launch/sync of matrix operations,
- **8×8 systolic array** as the compute engine,
- **Memory interface blocks** coordinating operand and result movement.

Design components are partitioned to preserve modular verification and ease ASIC implementation. The hierarchy supports both standalone accelerator testing and integrated SoC-level validation.

## Processing Element Design

Each Processing Element (PE) performs core multiply-accumulate (MAC) functionality under synchronized dataflow. PE microarchitecture emphasizes:

- Local accumulation with registered pipeline behavior,
- Horizontal/vertical operand forwarding for systolic propagation,
- Deterministic cycle-level operation for predictable latency.

The array instantiates **64 PEs**, enabling parallel tile-level matrix computation while preserving a regular physical structure favorable for placement and clock distribution.

## 8×8 Systolic Array Architecture

The accelerator employs a two-dimensional **8×8 systolic mesh**:

- **Dimension:** 8 rows × 8 columns,
- **PE count:** 64,
- **Dataflow:** wavefront propagation with nearest-neighbor communication,
- **Target workload:** matrix multiplication and tensor-style MAC kernels.

The array-level design balances throughput and implementation complexity. Its regular interconnect pattern is advantageous for structured floorplanning and scalable extensions (e.g., 16×16 variants).

## Controller FSM

The accelerator controller FSM coordinates operation sequencing:

- Idle / configuration,
- Operand loading and synchronization,
- Compute window control,
- Completion signaling and handoff.

This control abstraction enables clean coupling between software-visible control paths and deterministic array execution timelines.

## ASIC Implementation Flow

The backend methodology follows a standard open-source ASIC flow:

1. **RTL Synthesis (Yosys)**
2. **Technology Mapping (Sky130 standard cells)**
3. **Floorplanning (OpenROAD)**
4. **IO Placement**
5. **Global Placement**
6. **Clock Tree Synthesis (CTS)**
7. **Static Timing Analysis (STA)**
8. **Detailed Routing (partially attempted)**

This flow establishes practical backend proficiency and exposes real implementation constraints for research-driven iteration.

## Physical Design Results

| Metric | Value |
|---|---:|
| PE count | 64 |
| Standard cells | 90,586 |
| Nets | 90,281 |
| Connections | 313,671 |
| Cell area | 710,381 µm² |
| Core area | 1,180,176 µm² |
| Utilization | 64.2% |
| Clock sinks | 4,130 |
| CTS inserted buffers | 589 |
| Clock depth | 5 stages |
| Die size | 1128.105 µm × 1128.105 µm |

These results indicate a dense, non-trivial physical implementation with clock distribution completed and measurable timing closure trajectory.

## Static Timing Analysis

Timing was evaluated against a **100 MHz** target clock (10 ns period):

- **Post-CTS estimated Fmax:** ~80 MHz,
- **WNS:** -2.491 ns,
- **TNS:** -604.82.

The timing profile reflects an advanced but not fully closed backend state, typical for first-pass implementations before final route and iterative physical optimization.

## Routing Limitation Discussion

Detailed routing was partially attempted but blocked by environmental constraints related to available PDK collateral and pin-access limitations. Consequently, the project is intentionally documented as **route-incomplete** rather than overstating tapeout readiness. This preserves technical transparency while still demonstrating substantial frontend and backend execution depth.

## Future Work

- Resolve PDK/pin-access blockers and complete signoff-quality detailed routing.
- Perform timing ECO and placement refinement for 100 MHz closure.
- Add power analysis (dynamic/leakage) across representative workloads.
- Evaluate floorplan alternatives for congestion and clock QoR improvement.
- Extend accelerator ISA/control hooks for richer software benchmarking.
- Explore array scaling, mixed precision, and sparsity-aware dataflows.

## Tools Used

- **HDL / Verification:** Verilog, simulation testbenches
- **Synthesis:** Yosys
- **PDK / Cells:** Sky130
- **Physical Design:** OpenROAD
- **Timing:** OpenSTA (within OpenROAD flow)
- **Build / Automation:** Make, shell scripts, Python utility scripts

## Repository Structure

```text
riscv-ai-accelerator-soc/
├── rtl/                      # SoC and accelerator RTL
├── sim/                      # Verification testbenches
├── accelerator/              # Standalone accelerator modules/tests
├── scripts/                  # Synthesis and flow automation scripts
├── constraints/              # Physical/placement constraints
├── docs/
│   ├── report/               # Research-style technical reports
│   └── figures/              # Figures for documentation/manuscripts
├── results/
│   ├── reports/              # Exported QoR/timing reports
│   ├── logs/                 # Flow execution logs
│   └── screenshots/          # Layout/timing screenshots
└── README.md
```

## Citation / Acknowledgements

If you use this repository in academic work, technical reports, or portfolio review packages, please cite it as an open-source educational/research implementation of an edge-AI ASIC flow prototype.

**Suggested citation:**

> Varun Naik, *RISC-V Based Low-Power Edge AI Accelerator SoC (8×8 Systolic Array) — ASIC-Oriented Research Portfolio*, GitHub repository.

Acknowledgements to the open-source hardware ecosystem, including the developers and maintainers of **Yosys**, **OpenROAD**, and **SkyWater Sky130** resources.
