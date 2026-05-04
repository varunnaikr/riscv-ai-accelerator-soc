<div align="center">

# RISC-V Based Low-Power Edge AI Accelerator SoC  
### RTL-to-Physical Design Implementation in Sky130

![Project Stage](https://img.shields.io/badge/ASIC%20Flow-RTL%20to%20STA-0A66C2?style=for-the-badge)
![OpenROAD](https://img.shields.io/badge/OpenROAD-Physical%20Design-2E8B57?style=for-the-badge)
![Sky130](https://img.shields.io/badge/PDK-Sky130-8A2BE2?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-informational?style=for-the-badge)

![Project Banner Placeholder](docs/figures/architecture.png)

</div>

> [!IMPORTANT]
> **Portfolio Highlights**  
> ✅ 64-PE accelerator  
> ✅ ~90k standard-cell implementation  
> ✅ Clock Tree Synthesis completed  
> ✅ Static Timing Analysis completed  
> ✅ ~80 MHz achieved post-CTS Fmax  
> ✅ Sky130-mapped open-source ASIC backend

---

## Abstract
This repository presents a research-oriented implementation of a low-power edge AI SoC integrating a custom RISC-V subsystem with an 8×8 systolic-array accelerator. The design was carried from RTL through logic synthesis, floorplanning, placement, CTS, and STA using an open-source Sky130 ASIC flow. The work is structured to support academic review, internship applications, and reproducible VLSI portfolio presentation.

## Motivation
Edge intelligence requires energy-efficient compute near data sources. Systolic arrays provide regular dataflow and high MAC density suitable for matrix workloads. This project explores end-to-end integration challenges of accelerator-centric SoCs and demonstrates physical design closure progress in a realistic open-source PDK flow.

## Architecture Overview
- **Compute fabric:** 8×8 systolic matrix accelerator (64 PEs).
- **Control path:** accelerator controller FSM with cycle-count support.
- **Memory path:** dedicated memory interface for accelerator transactions.
- **System context:** RISC-V-based integration for benchmark-driven co-processing.

![Architecture](docs/figures/architecture.png)

## Processing Element (PE) Architecture
Each PE performs multiply-accumulate operations with local forwarding and accumulation behavior suitable for systolic wavefront propagation. The repeated `maj3` carry-chain in the accumulation datapath is the dominant timing limiter in post-CTS timing analysis.

## Systolic Array Dataflow (8×8)
- 64 PEs arranged in a regular nearest-neighbor topology.
- Spatial reuse and pipelined data movement for matrix multiplication.
- Deterministic cycle behavior enabling benchmark-oriented performance characterization.

## ASIC Implementation Flow (Sky130)
1. RTL Design and Verification
2. Generic Synthesis (Yosys)
3. Sky130 Standard-Cell Mapping
4. Floorplanning
5. IO Pin Placement
6. Global Placement
7. Clock Tree Synthesis
8. Static Timing Analysis
9. Detailed Routing (partial attempt)

![ASIC Flow](docs/figures/asic_flow.png)

## Physical Design Snapshots
### Floorplanning
- Core area established for ~60% target utilization regime.
- IO strategy defined for 293 pins.

### Placement
- Global placement completed with high cell count design density.
- Congestion/timing tradeoffs captured for backend iteration.

### Clock Tree Synthesis (CTS)
- 4,130 clock sinks handled.
- 589 buffers inserted.
- Clock depth reached 5 levels.

![CTS Stats](docs/figures/cts_stats.png)

## STA Results and Timing Bottleneck
The design misses 100 MHz timing target after CTS/STA due to a recurring arithmetic carry-chain path in PE accumulation logic.

- **Target frequency:** 100 MHz
- **Critical path delay:** 12.362 ns
- **Achieved Fmax:** ~80.9 MHz
- **WNS:** -2.491 ns
- **TNS:** -604.82

![Critical Timing Path](docs/figures/timing_path.png)

## Routing Limitation Status
Detailed routing was **partially attempted** but blocked by pin-access/collateral limitations in a minimal manual OpenROAD flow setup. This repository documents a near-complete open-source backend trajectory with clearly identified closure blockers.

## Final Measured ASIC Results
| Metric | Value |
|---|---:|
| Processing Elements | 64 |
| Standard Cells | 90,586 |
| Nets | 90,281 |
| Connections | 313,671 |
| IO Pins | 293 |
| Clock Sinks | 4,130 |
| CTS Inserted Buffers | 589 |
| Clock Tree Depth | 5 |
| Cell Area | 710,381.312 µm² |
| Core Area | 1,180,176.883 µm² |
| Utilization | 60.2% |
| Die Size | 1128.105 µm × 1128.105 µm |
| Target Frequency | 100 MHz |
| Critical Path Delay | 12.362 ns |
| Achieved Fmax | ≈ 80.9 MHz |
| WNS | -2.491 ns |
| TNS | -604.82 |
| Primary Bottleneck | `maj3` carry-chain accumulation path |

![Design Stats](docs/figures/design_stats.png)
![Utilization](docs/figures/utilization.png)
![Fmax](docs/figures/fmax.png)

## Tools Used
- Yosys
- OpenROAD
- Sky130 PDK
- Verilog HDL
- Docker
- TCL automation scripts

## Repository Structure
```text
.
├── accelerator/
├── asic/
├── constraints/
├── docs/
│   ├── figures/
│   └── report/
├── pdk/
├── results/
│   ├── logs/
│   ├── reports/
│   └── screenshots/
├── rtl/
├── scripts/
└── sim/
```

## Future Work
- Timing-driven PE microarchitecture refinement to break long carry chains.
- Placement/routing constraint refinement for pin-access closure.
- Automated QoR tracking across flow checkpoints.
- Power estimation and workload-aware energy reporting.
- Macro-aware floorplan exploration for scalable array variants.

## Citation
If you use this repository in academic or technical work, please cite:

```bibtex
@misc{riscv_edge_ai_accelerator_sky130,
  title        = {RISC-V Based Low-Power Edge AI Accelerator SoC: RTL-to-Physical Design Implementation in Sky130},
  author       = {Varun Naik R},
  year         = {2026},
  howpublished = {GitHub repository},
  note         = {Open-source RTL-to-ASIC flow portfolio project}
}
```
