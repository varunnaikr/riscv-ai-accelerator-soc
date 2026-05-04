import os
import matplotlib.pyplot as plt

# Get project root directory
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)

docs_dir = os.path.join(project_root, "docs")
os.makedirs(docs_dir, exist_ok=True)

output_file = os.path.join(docs_dir, "performance_graph.png")

array_sizes = [4, 8]
cpu_time = [100, 100]
accelerator_time = [20, 5]

speedup = [c/a for c, a in zip(cpu_time, accelerator_time)]

plt.figure()
plt.plot(array_sizes, speedup, marker="o")

plt.title("AI Accelerator Speedup vs CPU")
plt.xlabel("Systolic Array Size")
plt.ylabel("Speedup")

plt.grid(True)

plt.savefig(output_file)

print("Graph saved to:", output_file)
