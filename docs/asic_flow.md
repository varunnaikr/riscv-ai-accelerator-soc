# ASIC Flow Deep-Dive + Starter Plan

This document defines a practical ASIC flow for this RISC-V + AI accelerator SoC and explains how to **start now** with an open-source toolchain.

## 1) Target and assumptions

- **Top module for ASIC exploration:** `soc_top`
- **Language:** Verilog RTL
- **Primary open flow:** Yosys (synthesis) + OpenROAD (PnR + CTS + STA)
- **Reference PDK target:** SkyWater SKY130 (when available)

> Note: this repository already contains FPGA-oriented scripts (`synth_ice40`). The ASIC flow below is a separate path.

## 2) End-to-end ASIC flow stages

### Stage A — RTL quality gates

1. Lint (structural/synthesis lint)
2. CDC/RDC checks (if multiple domains/resets are introduced)
3. Reset strategy checks (async/sync, deassertion)
4. Simulation regression + coverage (directed and random)

### Stage B — Constraint definition

1. Primary clocks (`create_clock`)
2. I/O delays (`set_input_delay`, `set_output_delay`)
3. Driving cell/load assumptions
4. False/multicycle paths

### Stage C — Logic synthesis

1. Read RTL + constraints
2. Map to standard cells with liberty timing files
3. Report area/timing/power proxies
4. Netlist + SDC + reports archived

### Stage D — Floorplan + power planning

1. Die/core sizing from utilization target
2. Macro placement (if SRAMs/macros are hardened)
3. Power grid design
4. IO pin planning

### Stage E — Place, CTS, route

1. Global and detailed placement
2. Clock tree synthesis
3. Global + detailed routing
4. Congestion and DRC convergence

### Stage F — Signoff checks

1. STA (setup/hold across corners/modes)
2. DRC/LVS
3. IR drop/EM checks
4. Antenna + density checks

### Stage G — Tapeout package

1. GDSII
2. Final netlists + timing models
3. Documentation and waivers

## 3) What we can start immediately in this repo

- Build an **ASIC synthesis entry point** for `soc_top`.
- Add a reusable launch script that:
  - checks tool availability,
  - runs generic synthesis,
  - optionally runs liberty-mapped synthesis if a standard-cell library is provided,
  - stores reports in `build/asic/`.

This gives immediate visibility into hierarchy, cell counts, area proxy, and timing proxy.

## 4) Quick-start commands

### Minimal (tool/path sanity)

```bash
bash scripts/start_asic_flow.sh --dry-run
```

### Generic synthesis (no liberty required)

```bash
bash scripts/start_asic_flow.sh
```

### Tech-mapped synthesis (liberty-aware)

```bash
bash scripts/start_asic_flow.sh --liberty /path/to/sky130_fd_sc_hd__tt_025C_1v80.lib
```

## 5) Constraints starter template

Create `constraints/soc_top.sdc` (example):

```tcl
create_clock -name clk -period 10 [get_ports clk]
set_input_delay 1.0 -clock clk [all_inputs]
set_output_delay 1.0 -clock clk [all_outputs]
```

Tune these values using your board/package/system timing budget.

## 6) Next milestones

1. Add a complete SDC for all clocks/interfaces.
2. Integrate OpenROAD flow script (floorplan → route).
3. Add CI jobs for lint + synthesis regression.
4. Add PPA trend tracking under `results/`.
