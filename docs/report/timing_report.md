# Timing Report

## Timing Target
- Target clock frequency: **100 MHz**

## Post-CTS Timing Summary
| Metric | Value |
|---|---:|
| Critical path delay | 12.362 ns |
| Achieved Fmax | ~80.9 MHz |
| WNS | -2.491 ns |
| TNS | -604.82 |

## Critical Path Observation
The dominant setup path repeatedly traverses arithmetic carry-chain logic (`maj3`) within the PE accumulation datapath.

## Interpretation
- Current backend quality demonstrates strong implementation progress but misses 100 MHz closure.
- Timing is limited by arithmetic depth rather than clock-tree collapse.

## Improvement Directions
- Refactor PE datapath to reduce combinational carry depth.
- Explore retiming/pipelining boundaries around accumulation paths.
- Add path-focused synthesis and physical optimization constraints.
