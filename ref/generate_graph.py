import matplotlib.pyplot as plt
import numpy as np

# Sparsity levels from 0% to 90%
sparsity = np.array([0, 0.25, 0.50, 0.75, 0.90])

# 1. Dense GEMV: Always takes the same amount of time/cycles (1.0x baseline)
dense_cycles = np.ones_like(sparsity)

# 2. Our FPGA Design (II=1 Pipeline): Also takes the same amount of time (1.0x)
# But it gates the DSPs, so power drops. We will represent this as "Power Saved"
our_fpga_power_saved = sparsity * 100  # 50% sparsity = 50% power saved on MACs

# 3. Ideal Sparse Engine (Dynamic Indexing): Cycles drop proportionally
# e.g., 50% sparsity means 50% less work, so 0.5x cycles (2x speedup)
ideal_sparse_cycles = 1.0 - sparsity

# Create the plot
fig, ax1 = plt.subplots(figsize=(8, 5))

# Plot Cycle Reduction (Speedup)
ax1.plot(sparsity * 100, dense_cycles, 'o-', color='red', label='Dense GEMV (Baseline)', linewidth=2)
ax1.plot(sparsity * 100, ideal_sparse_cycles, 's--', color='green', label='Ideal Sparse (Dynamic Index)', linewidth=2)
ax1.set_xlabel('Activation Sparsity (%)', fontsize=12)
ax1.set_ylabel('Relative Compute Cycles', fontsize=12, color='black')
ax1.set_ylim(0, 1.2)
ax1.grid(True, linestyle=':', alpha=0.7)
ax1.legend(loc='upper right')

# Plot Power Saving on a secondary axis to represent our II=1 design
ax2 = ax1.twinx()
ax2.plot(sparsity * 100, our_fpga_power_saved, '^:', color='blue', label='Our Design (DSP Power Gated)', linewidth=2)
ax2.set_ylabel('DSP Dynamic Power Saved (%)', fontsize=12, color='blue')
ax2.set_ylim(0, 100)
ax2.legend(loc='lower left')

plt.title('FPGA Sparse-GEMV: Architectural Tradeoffs', fontsize=14)
plt.tight_layout()

# Save the figure
plt.savefig('sparsity_tradeoff_graph.png', dpi=300)
print("Graph generated successfully: sparsity_tradeoff_graph.png")