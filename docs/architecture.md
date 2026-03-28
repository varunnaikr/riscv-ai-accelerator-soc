# SoC Architecture

The system integrates a RISC-V compatible processor with a custom AI accelerator.

## Architecture Overview (Flowchart)

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

The CPU configures control registers through MMIO, the controller sequences data movement and compute, and the systolic array performs matrix multiplication.

## Figma / Tooling Notes

- Use **Figma** to polish this architecture with component frames for CPU, memory, controller, and array.
- Use **Mermaid Live Editor** or **draw.io / diagrams.net** to iterate on flow/state diagrams quickly, then paste exported SVGs into design reviews.
- Keep naming aligned with RTL modules (`cpu_pipeline`, `accelerator_controller`, `systolic_array_8x8`) for traceability.
