import os
import matplotlib.pyplot as plt

# Create docs directory if it does not exist
os.makedirs("docs", exist_ok=True)

# Data for benchmark
matrix_sizes = ["2x2", "4x4", "8x8"]
cpu_cycles = [20, 120, 600]
accelerator_cycles = [5, 20, 80]

# X-axis positions
x = range(len(matrix_sizes))

# Create figure
plt.figure()

# Bar plots
plt.bar(x, cpu_cycles, width=0.4, label="CPU")
plt.bar(x, accelerator_cycles, width=0.4, label="Accelerator")

# Labels and title
plt.xticks(x, matrix_sizes)
plt.xlabel("Matrix Size")
plt.ylabel("Clock Cycles")
plt.title("CPU vs AI Accelerator Performance")
plt.legend()

# Save graph
plt.savefig("docs/performance_graph.png")

# Show graph
plt.show()

print("Performance graph saved to docs/performance_graph.png")
