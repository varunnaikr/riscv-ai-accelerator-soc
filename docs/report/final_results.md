# Final Results

## ASIC Results Summary
| Metric | Value |
|---|---:|
| PE Count | 64 |
| Standard Cells | 90,586 |
| Nets | 90,281 |
| Connections | 313,671 |
| IO Pins | 293 |
| Clock Sinks | 4,130 |
| CTS Buffers | 589 |
| Clock Tree Depth | 5 |
| Cell Area | 710,381.312 µm² |
| Core Area | 1,180,176.883 µm² |
| Utilization | 60.2% |
| Die Size | 1128.105 µm × 1128.105 µm |
| Target Frequency | 100 MHz |
| Critical Path Delay | 12.362 ns |
| Achieved Fmax | ~80.9 MHz |
| WNS | -2.491 ns |
| TNS | -604.82 |

## Bottleneck
Primary timing limiter is the repeated `maj3` carry-chain accumulation path in the PE datapath.

## Status Statement
This repository demonstrates complete progression from RTL to post-CTS STA in Sky130 with clearly documented routing closure limitations under minimal-manual-flow conditions.
