# Accelerator Benchmark Results

Matrix-multiplication workloads were used to compare CPU-only execution versus accelerator-assisted execution.

## Cycle Comparison

| Matrix Size | CPU Cycles | Accelerator Cycles | Speedup |
|---|---:|---:|---:|
| 2×2 | 20 | 5 | 4.0× |
| 4×4 | 120 | 20 | 6.0× |
| 8×8 | 600 | 80 | 7.5× |

## Reading the Trend

- The accelerator outperforms the CPU baseline across all tested matrix sizes.
- Speedup increases with workload size in this sample set.
- The largest tested case (8×8) shows **7.5×** cycle-level improvement.

## Conclusion

The systolic-array accelerator provides a substantial performance gain over sequential CPU execution for matrix-multiply kernels.
