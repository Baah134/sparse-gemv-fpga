// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x0000 : Control signals
//          bit 0  - ap_start (Read/Write/COH)
//          bit 1  - ap_done (Read/COR)
//          bit 2  - ap_idle (Read)
//          bit 3  - ap_ready (Read/COR)
//          bit 7  - auto_restart (Read/Write)
//          bit 9  - interrupt (Read)
//          others - reserved
// 0x0004 : Global Interrupt Enable Register
//          bit 0  - Global Interrupt Enable (Read/Write)
//          others - reserved
// 0x0008 : IP Interrupt Enable Register (Read/Write)
//          bit 0 - enable ap_done interrupt (Read/Write)
//          bit 1 - enable ap_ready interrupt (Read/Write)
//          others - reserved
// 0x000c : IP Interrupt Status Register (Read/TOW)
//          bit 0 - ap_done (Read/TOW)
//          bit 1 - ap_ready (Read/TOW)
//          others - reserved
// 0x0010 : Data signal of num_rows
//          bit 31~0 - num_rows[31:0] (Read/Write)
// 0x0014 : reserved
// 0x0080 ~
// 0x00ff : Memory 'weights_0' (32 * 32b)
//          Word n : bit [31:0] - weights_0[n]
// 0x0100 ~
// 0x017f : Memory 'weights_1' (32 * 32b)
//          Word n : bit [31:0] - weights_1[n]
// 0x0180 ~
// 0x01ff : Memory 'weights_2' (32 * 32b)
//          Word n : bit [31:0] - weights_2[n]
// 0x0200 ~
// 0x027f : Memory 'weights_3' (32 * 32b)
//          Word n : bit [31:0] - weights_3[n]
// 0x0280 ~
// 0x02ff : Memory 'weights_4' (32 * 32b)
//          Word n : bit [31:0] - weights_4[n]
// 0x0300 ~
// 0x037f : Memory 'weights_5' (32 * 32b)
//          Word n : bit [31:0] - weights_5[n]
// 0x0380 ~
// 0x03ff : Memory 'weights_6' (32 * 32b)
//          Word n : bit [31:0] - weights_6[n]
// 0x0400 ~
// 0x047f : Memory 'weights_7' (32 * 32b)
//          Word n : bit [31:0] - weights_7[n]
// 0x0480 ~
// 0x04ff : Memory 'weights_8' (32 * 32b)
//          Word n : bit [31:0] - weights_8[n]
// 0x0500 ~
// 0x057f : Memory 'weights_9' (32 * 32b)
//          Word n : bit [31:0] - weights_9[n]
// 0x0580 ~
// 0x05ff : Memory 'weights_10' (32 * 32b)
//          Word n : bit [31:0] - weights_10[n]
// 0x0600 ~
// 0x067f : Memory 'weights_11' (32 * 32b)
//          Word n : bit [31:0] - weights_11[n]
// 0x0680 ~
// 0x06ff : Memory 'weights_12' (32 * 32b)
//          Word n : bit [31:0] - weights_12[n]
// 0x0700 ~
// 0x077f : Memory 'weights_13' (32 * 32b)
//          Word n : bit [31:0] - weights_13[n]
// 0x0780 ~
// 0x07ff : Memory 'weights_14' (32 * 32b)
//          Word n : bit [31:0] - weights_14[n]
// 0x0800 ~
// 0x087f : Memory 'weights_15' (32 * 32b)
//          Word n : bit [31:0] - weights_15[n]
// 0x0880 ~
// 0x08ff : Memory 'weights_16' (32 * 32b)
//          Word n : bit [31:0] - weights_16[n]
// 0x0900 ~
// 0x097f : Memory 'weights_17' (32 * 32b)
//          Word n : bit [31:0] - weights_17[n]
// 0x0980 ~
// 0x09ff : Memory 'weights_18' (32 * 32b)
//          Word n : bit [31:0] - weights_18[n]
// 0x0a00 ~
// 0x0a7f : Memory 'weights_19' (32 * 32b)
//          Word n : bit [31:0] - weights_19[n]
// 0x0a80 ~
// 0x0aff : Memory 'weights_20' (32 * 32b)
//          Word n : bit [31:0] - weights_20[n]
// 0x0b00 ~
// 0x0b7f : Memory 'weights_21' (32 * 32b)
//          Word n : bit [31:0] - weights_21[n]
// 0x0b80 ~
// 0x0bff : Memory 'weights_22' (32 * 32b)
//          Word n : bit [31:0] - weights_22[n]
// 0x0c00 ~
// 0x0c7f : Memory 'weights_23' (32 * 32b)
//          Word n : bit [31:0] - weights_23[n]
// 0x0c80 ~
// 0x0cff : Memory 'weights_24' (32 * 32b)
//          Word n : bit [31:0] - weights_24[n]
// 0x0d00 ~
// 0x0d7f : Memory 'weights_25' (32 * 32b)
//          Word n : bit [31:0] - weights_25[n]
// 0x0d80 ~
// 0x0dff : Memory 'weights_26' (32 * 32b)
//          Word n : bit [31:0] - weights_26[n]
// 0x0e00 ~
// 0x0e7f : Memory 'weights_27' (32 * 32b)
//          Word n : bit [31:0] - weights_27[n]
// 0x0e80 ~
// 0x0eff : Memory 'weights_28' (32 * 32b)
//          Word n : bit [31:0] - weights_28[n]
// 0x0f00 ~
// 0x0f7f : Memory 'weights_29' (32 * 32b)
//          Word n : bit [31:0] - weights_29[n]
// 0x0f80 ~
// 0x0fff : Memory 'weights_30' (32 * 32b)
//          Word n : bit [31:0] - weights_30[n]
// 0x1000 ~
// 0x107f : Memory 'weights_31' (32 * 32b)
//          Word n : bit [31:0] - weights_31[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDENSE_GEMV_CONTROL_ADDR_AP_CTRL         0x0000
#define XDENSE_GEMV_CONTROL_ADDR_GIE             0x0004
#define XDENSE_GEMV_CONTROL_ADDR_IER             0x0008
#define XDENSE_GEMV_CONTROL_ADDR_ISR             0x000c
#define XDENSE_GEMV_CONTROL_ADDR_NUM_ROWS_DATA   0x0010
#define XDENSE_GEMV_CONTROL_BITS_NUM_ROWS_DATA   32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE  0x0080
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_HIGH  0x00ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_0      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_0      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE  0x0100
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_HIGH  0x017f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_1      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_1      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE  0x0180
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_HIGH  0x01ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_2      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_2      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE  0x0200
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_HIGH  0x027f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_3      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_3      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE  0x0280
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_HIGH  0x02ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_4      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_4      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE  0x0300
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_HIGH  0x037f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_5      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_5      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE  0x0380
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_HIGH  0x03ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_6      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_6      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE  0x0400
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_HIGH  0x047f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_7      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_7      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE  0x0480
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_HIGH  0x04ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_8      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_8      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE  0x0500
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_HIGH  0x057f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_9      32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_9      32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE 0x0580
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_HIGH 0x05ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_10     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_10     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE 0x0600
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_HIGH 0x067f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_11     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_11     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE 0x0680
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_HIGH 0x06ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_12     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_12     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE 0x0700
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_HIGH 0x077f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_13     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_13     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE 0x0780
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_HIGH 0x07ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_14     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_14     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE 0x0800
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_HIGH 0x087f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_15     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_15     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE 0x0880
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_HIGH 0x08ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_16     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_16     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE 0x0900
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_HIGH 0x097f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_17     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_17     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE 0x0980
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_HIGH 0x09ff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_18     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_18     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE 0x0a00
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_HIGH 0x0a7f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_19     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_19     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE 0x0a80
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_HIGH 0x0aff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_20     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_20     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE 0x0b00
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_HIGH 0x0b7f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_21     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_21     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE 0x0b80
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_HIGH 0x0bff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_22     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_22     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE 0x0c00
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_HIGH 0x0c7f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_23     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_23     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE 0x0c80
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_HIGH 0x0cff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_24     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_24     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE 0x0d00
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_HIGH 0x0d7f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_25     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_25     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE 0x0d80
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_HIGH 0x0dff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_26     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_26     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE 0x0e00
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_HIGH 0x0e7f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_27     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_27     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE 0x0e80
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_HIGH 0x0eff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_28     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_28     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE 0x0f00
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_HIGH 0x0f7f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_29     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_29     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE 0x0f80
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_HIGH 0x0fff
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_30     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_30     32
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE 0x1000
#define XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_HIGH 0x107f
#define XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_31     32
#define XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_31     32

