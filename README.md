# Activation-Sparsity FPGA Accelerator (Simulation-Validated)

An INT8 sparse matrix-vector multiply (Sparse-GEMV) accelerator designed in Vitis HLS, targeting AMD Artix-7 FPGAs. This project explores the architectural advantages of FPGAs for memory-bound, sparse Large Language Model (LLM) inference workloads.

**Status:** ✅ Complete (All Phases Finished)

---

## 📖 Project Overview

During LLM inference (specifically the memory-bound decoding phase), activation vectors exhibit high sparsity—meaning a large fraction of their values are zero. On standard GPUs, this dynamic sparsity is difficult to exploit because it breaks dense matrix multiplication (GEMM) patterns.

FPGAs, however, can be architected at the cycle level to skip zero-valued activations entirely, eliminating unnecessary memory fetches and DSP operations. This project implements a custom skip-zero datapath to benchmark the cycle-reduction and resource trade-offs of activation sparsity on FPGA fabric.

### Key Architectural Choices
* **Compute:** INT8 fixed-point arithmetic mapped to DSP48 slices.
* **Data Movement:** AXI-Stream handshaking for high-throughput, low-latency streaming.
* **Sparsity Method:** Bitmask-encoded skip-zero control logic (MUX-based DSP gating).
* **Target Part:** `xc7a100t-fgg484-1` (Artix-7 FPGA, 100MHz target clock).

---

## 🗺️ Project Roadmap

This project followed a structured, bottom-up development cycle to ensure foundational hardware concepts were verified before integrating complex sparsity logic.

| Phase | Description | Status |
| :--- | :--- | :--- |
| **1. Setup & Baseline** | Toolchain installation, target part setup, and Verilog FSM refresh. | ✅ Complete |
| **2. Pipelined MAC** | INT8 Multiply-Accumulate unit with II=1 pipeline targeting DSP48s. | ✅ Complete |
| **3. AXI-Stream Mover** | Streaming FIFO with valid/ready handshaking and backpressure handling. | ✅ Complete |
| **4. Dense GEMV** | 32x32 dense matrix-vector multiply integrating MAC and AXI-Stream. | ✅ Complete |
| **5. Sparse GEMV** | Add bitmask skip-zero logic and benchmark architectural tradeoffs. | ✅ Complete |

---

## 📊 Final Synthesis Results

The design was synthesized in Vitis HLS targeting an Artix-7 FPGA (`xc7a100t-fgg484-1`) at 100MHz.

| Metric | Dense GEMV (Phase 4) | Sparse GEMV (Phase 5) |
| :--- | :--- | :--- |
| **Throughput (II)** | 1 cycle | 1 cycle |
| **Latency** | ~34 cycles | ~34 cycles |
| **DSP48 Slices** | 64 | 64 |
| **Sparsity Handling** | None | Bitmask Skip-Zero (MUX gating) |

---

## 🔬 Architectural Insights & Tradeoffs

While a fixed-loop sparse GEMV does not reduce clock cycle latency (because the hardware must still iterate through the loop indices), the `if (mask == 1)` statement synthesizes into a physical multiplexer. When an activation is zero, the DSP inputs are forced to zero. This achieves dynamic power gating on the DSP slices, significantly reducing energy consumption during highly sparse LLM inference phases without sacrificing the maximum throughput of II=1.

> **Note:** True cycle reduction would require a compressed data format with dynamic indexing, which is identified as future work for this architecture.

---

## 📁 Repository Structure

```text
.
├── hls/                # Vitis HLS source code and directives
│   ├── src/            # Accelerator kernels (MAC, GEMV, Sparse Logic)
│   └── tb/             # C/C++ testbenches and verification vectors
├── docs/               # Architecture diagrams and synthesis reports
├── scripts/            # Tcl synthesis and automation scripts
└── README.md           # Project documentation