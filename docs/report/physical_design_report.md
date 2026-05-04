# Physical Design Report

## Overview

This report summarizes the physical implementation status of the RISC-V based edge AI accelerator SoC on the Sky130 technology stack using an OpenROAD-centered flow.

## Backend Flow Status

| Stage | Status |
|---|---|
| Synthesis | Completed |
| Tech mapping (Sky130) | Completed |
| Floorplanning | Completed |
| IO placement | Completed |
| Global placement | Completed |
| Clock Tree Synthesis | Completed |
| STA (post-CTS) | Completed |
| Detailed routing | Partially attempted (blocked) |

## Area and Design Statistics

| Metric | Value |
|---|---:|
| Standard cells | 90,586 |
| Nets | 90,281 |
| Connections | 313,671 |
| Cell area | 710,381 µm² |
| Core area | 1,180,176 µm² |
| Utilization | 64.2% |
| Die size | 1128.105 µm × 1128.105 µm |

## Clock Network Summary

| Metric | Value |
|---|---:|
| Clock sinks | 4,130 |
| Inserted CTS buffers | 589 |
| Clock tree depth | 5 stages |

## Notes

The implementation has progressed through major backend milestones and is suitable for portfolio-grade presentation of physical design competence. Detailed routing remains an open item due to infrastructure limitations rather than frontend incompleteness.
