# Project Summary

## Title

**RISC-V Based Low-Power Edge AI Accelerator SoC with 8×8 Systolic Array**

## Executive Technical Summary

This project delivers a complete frontend and substantially advanced backend implementation of an ASIC-oriented edge AI SoC. The system integrates a RISC-V control plane with a custom 8×8 systolic array accelerator (64 PEs), supported by controller FSM logic and memory interface blocks.

The design has been synthesized and physically implemented through floorplanning, placement, clock tree synthesis, and static timing analysis using open-source EDA tooling and Sky130 technology mapping. Post-CTS timing indicates an estimated performance near ~80 MHz against a 100 MHz target.

## Project Highlights

- ASIC-ready RTL and full verification coverage of the accelerator-centric architecture.
- Sky130-compatible synthesis and technology mapping.
- OpenROAD backend completion through CTS.
- Quantified physical QoR and timing metrics suitable for academic/industry review.
- Clear next-step roadmap toward route completion and signoff-level closure.

## Outcome

The repository serves as a research-grade VLSI portfolio artifact demonstrating end-to-end competency from microarchitecture design to near-signoff physical implementation analysis.
