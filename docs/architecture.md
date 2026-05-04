# SoC Architecture

This SoC integrates a **RISC-V CPU pipeline** with a **memory-mapped AI accelerator subsystem** for matrix-multiply workloads.

## Component Responsibilities

- **CPU (RV32I pipeline)**: runs control code, programs accelerator registers, and handles system tasks.
- **System interconnect**: routes memory and MMIO transactions.
- **Memory interface / SRAM**: stores operands and output tiles.
- **Accelerator interface (MMIO)**: exposes configuration and status registers to software.
- **Accelerator controller**: sequences load, compute, and writeback phases.
- **8×8 systolic array**: performs highly parallel MAC operations.

## Architecture Overview

```mermaid
flowchart LR
    CPU[RISC-V CPU\nRV32I Pipeline]
    BUS[System Bus / Interconnect]
    MEM[On-chip SRAM / Memory Interface]
    ACC[AI Accelerator Subsystem]
    CTRL[Accelerator Controller]
    IFACE[Accelerator Interface\nMMIO Registers]
    SA[8x8 Systolic Array\n64 PEs]

    CPU --> BUS
    BUS --> MEM
    BUS --> IFACE
    IFACE --> CTRL
    CTRL --> SA
    SA --> MEM
    MEM --> CPU
```

## Accelerator Control State Diagram

```mermaid
stateDiagram-v2
    [*] --> IDLE
    IDLE --> LOAD : start=1
    LOAD --> COMPUTE : tiles buffered
    COMPUTE --> WRITEBACK : done_mac=1
    WRITEBACK --> DONE : results committed
    DONE --> IDLE : ack=1

    LOAD --> IDLE : reset
    COMPUTE --> IDLE : reset
    WRITEBACK --> IDLE : reset
```

## Software-to-Hardware Control Sequence

1. CPU writes source/destination pointers and tile metadata into MMIO registers.
2. CPU asserts `start` through the accelerator interface.
3. Controller transitions `IDLE → LOAD → COMPUTE → WRITEBACK`.
4. CPU polls/receives `done` and acknowledges completion.

This separation keeps software control simple while preserving high compute density in hardware.
