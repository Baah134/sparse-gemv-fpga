# Activation-Sparsity FPGA Accelerator (Simulation-Validated)

An INT8 sparse matrix-vector multiply (Sparse-GEMV) accelerator designed in Vitis HLS, targeting AMD Zynq UltraScale+ FPGAs. This project explores the architectural advantages of FPGAs for memory-bound, sparse Large Language Model (LLM) inference workloads.

> **Status:** 🚧 In Progress (Currently in Phase 2: Pipelined MAC Unit)

---

## 📖 Project Overview

During LLM inference (specifically the memory-bound decoding phase), activation vectors exhibit high sparsity—meaning a large fraction of their values are zero. On standard GPUs, this dynamic sparsity is difficult to exploit because it breaks dense matrix multiplication (GEMM) patterns. 

FPGAs, however, can be architected at the cycle level to **skip zero-valued activations entirely**, eliminating unnecessary memory fetches and DSP operations. This project implements a custom skip-zero datapath to benchmark the cycle-reduction and resource trade-offs of activation sparsity on FPGA fabric.

### Key Architectural Choices
* **Compute:** INT8 fixed-point arithmetic mapped to DSP48 slices.
* **Data Movement:** AXI-Stream handshaking for high-throughput, low-latency streaming.
* **Sparsity Method:** Bitmask-encoded skip-zero control logic.
* **Target Part:** `xczu3eg-sfva625-1-e` (Zynq UltraScale+ MPSoC - equivalent to Kria KV260).

---

## 🗺️ Project Roadmap

This project follows a structured, bottom-up development cycle to ensure foundational hardware concepts are verified before integrating complex sparsity logic.

| Phase | Description | Status |
| :--- | :--- | :---: |
| **1. Setup & Baseline** | Toolchain installation, target part setup, and Verilog FSM refresh. | ✅ Complete |
| **2. Pipelined MAC** | INT8 Multiply-Accumulate unit with `II=1` pipeline targeting DSP48s. | 🚧 In Progress |
| **3. AXI-Stream Mover** | Streaming FIFO with valid/ready handshaking and backpressure handling. | ⏳ Pending |
| **4. Dense GEMV** | 32x32 dense matrix-vector multiply integrating MAC and AXI-Stream. | ⏳ Pending |
| **5. Sparse GEMV** | Add bitmask skip-zero logic and generate sparsity-vs-speedup curve. | ⏳ Pending |

---

## 📊 Expected Outcomes & Methodology

The final deliverable is a cycle-accurate benchmark proving the efficiency of the skip-zero architecture.

**Methodology:**
1. **Reference Model:** A Python/NumPy script generates dense and sparse vectors, validating functional correctness.
2. **C/RTL Co-Simulation:** Vitis HLS validates the C++ logic and generates exact cycle counts for the hardware.
3. **Synthesis Reports:** Vivado synthesis provides LUT, DSP48, and BRAM utilization metrics.
4. **Benchmarking:** The sparse kernel will be tested across 0%, 25%, 50%, 75%, and 90% sparsity levels to map the speedup curve.

*Note: This project is currently simulation-validated. Post-synthesis timing and resource reports are generated targeting the ZU3EG part. Physical hardware validation is deferred to future work.*

---

## 📁 Repository Structure

```text
├── hdl/                # Verilog/SystemVerilog source files (FSMs, control logic)
├── hls/                # Vitis HLS C++ kernels (MAC, GEMV, Sparse GEMV)
├── tb/                 # C++ and Verilog testbenches for co-simulation
├── ref/                # Python/NumPy reference models for validation
└── docs/               # Architecture diagrams, notes, and result tables
