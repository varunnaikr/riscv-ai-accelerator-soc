# Design Flow

The project follows a standard hardware design and verification flow:

1. Architecture design
2. RTL implementation in Verilog
3. Testbench development
4. Simulation using Icarus Verilog
5. Waveform analysis using GTKWave
6. Performance evaluation
7. FPGA synthesis using Yosys + nextpnr + IceStorm

## Reproducible Commands

Use the Makefile targets to run the flow:

```bash
make sim-all
make synth
```

Individual simulation targets are also available (`sim-alu`, `sim-cpu`, `sim-accel`, etc.) for focused debugging.
The project follows a standard hardware design and validation flow.

## End-to-End Development Flowchart

```mermaid
flowchart TD
    A[Requirements & Workloads\nMatrix Multiplication Targets] --> B[Architecture Definition\nCPU + Accelerator Partitioning]
    B --> C[RTL Implementation\nVerilog Modules]
    C --> D[Testbench Development\nModule + SoC TB]
    D --> E[Simulation\nIcarus Verilog]
    E --> F[Waveform Debug\nGTKWave]
    F --> G[Performance Benchmarking\nLatency / Throughput]
    G --> H[Synthesis + PnR\nYosys + nextpnr + IceStorm]
    H --> I[Timing / Area / Power Review]
    I --> J{Targets Met?}
    J -- No --> B
    J -- Yes --> K[Documentation + Sign-off]
```

## Verification State Diagram

```mermaid
stateDiagram-v2
    [*] --> UnitTests
    UnitTests --> IntegrationTB : module tests pass
    IntegrationTB --> SoCSim : subsystem tests pass
    SoCSim --> Benchmark : functionality stable
    Benchmark --> Closure : KPIs met
    Closure --> [*]

    IntegrationTB --> UnitTests : bug found
    SoCSim --> IntegrationTB : interface mismatch
    Benchmark --> SoCSim : performance regression
```

## Tooling

- Architecture and presentation diagrams: **Figma**
- Fast editable engineering diagrams: **Mermaid**, **draw.io/diagrams.net**
- Simulation and debug: **Icarus Verilog + GTKWave**
- Synthesis and implementation: **Yosys + nextpnr + IceStorm**
