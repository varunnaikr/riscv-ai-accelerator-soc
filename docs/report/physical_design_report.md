# Physical Design Report

## Flow Context
Backend implementation used a manual/scripted OpenROAD flow with Sky130 standard cells.

## Physical Design Stages Completed
1. Netlist mapping to Sky130 library
2. Floorplan initialization and core shaping
3. IO pin placement for 293 pads/pins
4. Global placement for ~90k cells
5. Clock Tree Synthesis and buffering
6. Post-CTS STA

## Key Physical Metrics
| Parameter | Value |
|---|---:|
| Standard cells | 90,586 |
| Nets | 90,281 |
| Connections | 313,671 |
| Cell area | 710,381.312 µm² |
| Core area | 1,180,176.883 µm² |
| Utilization | 60.2% |
| Die dimensions | 1128.105 µm × 1128.105 µm |

## CTS Outcome
| Parameter | Value |
|---|---:|
| Clock sinks | 4,130 |
| Inserted buffers | 589 |
| Clock tree depth | 5 |

## Routing Status
Detailed routing was attempted but not fully closed due to pin-access and collateral limitations in minimal manual-flow conditions.
