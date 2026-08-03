// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
(* DowngradeIPIdentifiedWarnings="yes" *) module dense_gemv_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 13,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [31:0]                   num_rows,
    input  wire [4:0]                    weights_0_address0,
    input  wire                          weights_0_ce0,
    output wire [31:0]                   weights_0_q0,
    input  wire [4:0]                    weights_1_address0,
    input  wire                          weights_1_ce0,
    output wire [31:0]                   weights_1_q0,
    input  wire [4:0]                    weights_2_address0,
    input  wire                          weights_2_ce0,
    output wire [31:0]                   weights_2_q0,
    input  wire [4:0]                    weights_3_address0,
    input  wire                          weights_3_ce0,
    output wire [31:0]                   weights_3_q0,
    input  wire [4:0]                    weights_4_address0,
    input  wire                          weights_4_ce0,
    output wire [31:0]                   weights_4_q0,
    input  wire [4:0]                    weights_5_address0,
    input  wire                          weights_5_ce0,
    output wire [31:0]                   weights_5_q0,
    input  wire [4:0]                    weights_6_address0,
    input  wire                          weights_6_ce0,
    output wire [31:0]                   weights_6_q0,
    input  wire [4:0]                    weights_7_address0,
    input  wire                          weights_7_ce0,
    output wire [31:0]                   weights_7_q0,
    input  wire [4:0]                    weights_8_address0,
    input  wire                          weights_8_ce0,
    output wire [31:0]                   weights_8_q0,
    input  wire [4:0]                    weights_9_address0,
    input  wire                          weights_9_ce0,
    output wire [31:0]                   weights_9_q0,
    input  wire [4:0]                    weights_10_address0,
    input  wire                          weights_10_ce0,
    output wire [31:0]                   weights_10_q0,
    input  wire [4:0]                    weights_11_address0,
    input  wire                          weights_11_ce0,
    output wire [31:0]                   weights_11_q0,
    input  wire [4:0]                    weights_12_address0,
    input  wire                          weights_12_ce0,
    output wire [31:0]                   weights_12_q0,
    input  wire [4:0]                    weights_13_address0,
    input  wire                          weights_13_ce0,
    output wire [31:0]                   weights_13_q0,
    input  wire [4:0]                    weights_14_address0,
    input  wire                          weights_14_ce0,
    output wire [31:0]                   weights_14_q0,
    input  wire [4:0]                    weights_15_address0,
    input  wire                          weights_15_ce0,
    output wire [31:0]                   weights_15_q0,
    input  wire [4:0]                    weights_16_address0,
    input  wire                          weights_16_ce0,
    output wire [31:0]                   weights_16_q0,
    input  wire [4:0]                    weights_17_address0,
    input  wire                          weights_17_ce0,
    output wire [31:0]                   weights_17_q0,
    input  wire [4:0]                    weights_18_address0,
    input  wire                          weights_18_ce0,
    output wire [31:0]                   weights_18_q0,
    input  wire [4:0]                    weights_19_address0,
    input  wire                          weights_19_ce0,
    output wire [31:0]                   weights_19_q0,
    input  wire [4:0]                    weights_20_address0,
    input  wire                          weights_20_ce0,
    output wire [31:0]                   weights_20_q0,
    input  wire [4:0]                    weights_21_address0,
    input  wire                          weights_21_ce0,
    output wire [31:0]                   weights_21_q0,
    input  wire [4:0]                    weights_22_address0,
    input  wire                          weights_22_ce0,
    output wire [31:0]                   weights_22_q0,
    input  wire [4:0]                    weights_23_address0,
    input  wire                          weights_23_ce0,
    output wire [31:0]                   weights_23_q0,
    input  wire [4:0]                    weights_24_address0,
    input  wire                          weights_24_ce0,
    output wire [31:0]                   weights_24_q0,
    input  wire [4:0]                    weights_25_address0,
    input  wire                          weights_25_ce0,
    output wire [31:0]                   weights_25_q0,
    input  wire [4:0]                    weights_26_address0,
    input  wire                          weights_26_ce0,
    output wire [31:0]                   weights_26_q0,
    input  wire [4:0]                    weights_27_address0,
    input  wire                          weights_27_ce0,
    output wire [31:0]                   weights_27_q0,
    input  wire [4:0]                    weights_28_address0,
    input  wire                          weights_28_ce0,
    output wire [31:0]                   weights_28_q0,
    input  wire [4:0]                    weights_29_address0,
    input  wire                          weights_29_ce0,
    output wire [31:0]                   weights_29_q0,
    input  wire [4:0]                    weights_30_address0,
    input  wire                          weights_30_ce0,
    output wire [31:0]                   weights_30_q0,
    input  wire [4:0]                    weights_31_address0,
    input  wire                          weights_31_ce0,
    output wire [31:0]                   weights_31_q0,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL         = 13'h0000,
    ADDR_GIE             = 13'h0004,
    ADDR_IER             = 13'h0008,
    ADDR_ISR             = 13'h000c,
    ADDR_NUM_ROWS_DATA_0 = 13'h0010,
    ADDR_NUM_ROWS_CTRL   = 13'h0014,
    ADDR_WEIGHTS_0_BASE  = 13'h0080,
    ADDR_WEIGHTS_0_HIGH  = 13'h00ff,
    ADDR_WEIGHTS_1_BASE  = 13'h0100,
    ADDR_WEIGHTS_1_HIGH  = 13'h017f,
    ADDR_WEIGHTS_2_BASE  = 13'h0180,
    ADDR_WEIGHTS_2_HIGH  = 13'h01ff,
    ADDR_WEIGHTS_3_BASE  = 13'h0200,
    ADDR_WEIGHTS_3_HIGH  = 13'h027f,
    ADDR_WEIGHTS_4_BASE  = 13'h0280,
    ADDR_WEIGHTS_4_HIGH  = 13'h02ff,
    ADDR_WEIGHTS_5_BASE  = 13'h0300,
    ADDR_WEIGHTS_5_HIGH  = 13'h037f,
    ADDR_WEIGHTS_6_BASE  = 13'h0380,
    ADDR_WEIGHTS_6_HIGH  = 13'h03ff,
    ADDR_WEIGHTS_7_BASE  = 13'h0400,
    ADDR_WEIGHTS_7_HIGH  = 13'h047f,
    ADDR_WEIGHTS_8_BASE  = 13'h0480,
    ADDR_WEIGHTS_8_HIGH  = 13'h04ff,
    ADDR_WEIGHTS_9_BASE  = 13'h0500,
    ADDR_WEIGHTS_9_HIGH  = 13'h057f,
    ADDR_WEIGHTS_10_BASE = 13'h0580,
    ADDR_WEIGHTS_10_HIGH = 13'h05ff,
    ADDR_WEIGHTS_11_BASE = 13'h0600,
    ADDR_WEIGHTS_11_HIGH = 13'h067f,
    ADDR_WEIGHTS_12_BASE = 13'h0680,
    ADDR_WEIGHTS_12_HIGH = 13'h06ff,
    ADDR_WEIGHTS_13_BASE = 13'h0700,
    ADDR_WEIGHTS_13_HIGH = 13'h077f,
    ADDR_WEIGHTS_14_BASE = 13'h0780,
    ADDR_WEIGHTS_14_HIGH = 13'h07ff,
    ADDR_WEIGHTS_15_BASE = 13'h0800,
    ADDR_WEIGHTS_15_HIGH = 13'h087f,
    ADDR_WEIGHTS_16_BASE = 13'h0880,
    ADDR_WEIGHTS_16_HIGH = 13'h08ff,
    ADDR_WEIGHTS_17_BASE = 13'h0900,
    ADDR_WEIGHTS_17_HIGH = 13'h097f,
    ADDR_WEIGHTS_18_BASE = 13'h0980,
    ADDR_WEIGHTS_18_HIGH = 13'h09ff,
    ADDR_WEIGHTS_19_BASE = 13'h0a00,
    ADDR_WEIGHTS_19_HIGH = 13'h0a7f,
    ADDR_WEIGHTS_20_BASE = 13'h0a80,
    ADDR_WEIGHTS_20_HIGH = 13'h0aff,
    ADDR_WEIGHTS_21_BASE = 13'h0b00,
    ADDR_WEIGHTS_21_HIGH = 13'h0b7f,
    ADDR_WEIGHTS_22_BASE = 13'h0b80,
    ADDR_WEIGHTS_22_HIGH = 13'h0bff,
    ADDR_WEIGHTS_23_BASE = 13'h0c00,
    ADDR_WEIGHTS_23_HIGH = 13'h0c7f,
    ADDR_WEIGHTS_24_BASE = 13'h0c80,
    ADDR_WEIGHTS_24_HIGH = 13'h0cff,
    ADDR_WEIGHTS_25_BASE = 13'h0d00,
    ADDR_WEIGHTS_25_HIGH = 13'h0d7f,
    ADDR_WEIGHTS_26_BASE = 13'h0d80,
    ADDR_WEIGHTS_26_HIGH = 13'h0dff,
    ADDR_WEIGHTS_27_BASE = 13'h0e00,
    ADDR_WEIGHTS_27_HIGH = 13'h0e7f,
    ADDR_WEIGHTS_28_BASE = 13'h0e80,
    ADDR_WEIGHTS_28_HIGH = 13'h0eff,
    ADDR_WEIGHTS_29_BASE = 13'h0f00,
    ADDR_WEIGHTS_29_HIGH = 13'h0f7f,
    ADDR_WEIGHTS_30_BASE = 13'h0f80,
    ADDR_WEIGHTS_30_HIGH = 13'h0fff,
    ADDR_WEIGHTS_31_BASE = 13'h1000,
    ADDR_WEIGHTS_31_HIGH = 13'h107f,
    WRIDLE               = 2'd0,
    WRDATA               = 2'd1,
    WRRESP               = 2'd2,
    WRRESET              = 2'd3,
    RDIDLE               = 2'd0,
    RDDATA               = 2'd1,
    RDRESET              = 2'd2,
    ADDR_BITS                = 13;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle = 1'b0;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [31:0]                   int_num_rows = 'b0;
    // memory signals
    wire [4:0]                    int_weights_0_address0;
    wire                          int_weights_0_ce0;
    wire [31:0]                   int_weights_0_q0;
    wire [4:0]                    int_weights_0_address1;
    wire                          int_weights_0_ce1;
    wire [3:0]                    int_weights_0_be1;
    wire                          int_weights_0_we1;
    wire [31:0]                   int_weights_0_d1;
    wire [31:0]                   int_weights_0_q1;
    reg                           int_weights_0_read;
    reg                           int_weights_0_write;
    wire [4:0]                    int_weights_1_address0;
    wire                          int_weights_1_ce0;
    wire [31:0]                   int_weights_1_q0;
    wire [4:0]                    int_weights_1_address1;
    wire                          int_weights_1_ce1;
    wire [3:0]                    int_weights_1_be1;
    wire                          int_weights_1_we1;
    wire [31:0]                   int_weights_1_d1;
    wire [31:0]                   int_weights_1_q1;
    reg                           int_weights_1_read;
    reg                           int_weights_1_write;
    wire [4:0]                    int_weights_2_address0;
    wire                          int_weights_2_ce0;
    wire [31:0]                   int_weights_2_q0;
    wire [4:0]                    int_weights_2_address1;
    wire                          int_weights_2_ce1;
    wire [3:0]                    int_weights_2_be1;
    wire                          int_weights_2_we1;
    wire [31:0]                   int_weights_2_d1;
    wire [31:0]                   int_weights_2_q1;
    reg                           int_weights_2_read;
    reg                           int_weights_2_write;
    wire [4:0]                    int_weights_3_address0;
    wire                          int_weights_3_ce0;
    wire [31:0]                   int_weights_3_q0;
    wire [4:0]                    int_weights_3_address1;
    wire                          int_weights_3_ce1;
    wire [3:0]                    int_weights_3_be1;
    wire                          int_weights_3_we1;
    wire [31:0]                   int_weights_3_d1;
    wire [31:0]                   int_weights_3_q1;
    reg                           int_weights_3_read;
    reg                           int_weights_3_write;
    wire [4:0]                    int_weights_4_address0;
    wire                          int_weights_4_ce0;
    wire [31:0]                   int_weights_4_q0;
    wire [4:0]                    int_weights_4_address1;
    wire                          int_weights_4_ce1;
    wire [3:0]                    int_weights_4_be1;
    wire                          int_weights_4_we1;
    wire [31:0]                   int_weights_4_d1;
    wire [31:0]                   int_weights_4_q1;
    reg                           int_weights_4_read;
    reg                           int_weights_4_write;
    wire [4:0]                    int_weights_5_address0;
    wire                          int_weights_5_ce0;
    wire [31:0]                   int_weights_5_q0;
    wire [4:0]                    int_weights_5_address1;
    wire                          int_weights_5_ce1;
    wire [3:0]                    int_weights_5_be1;
    wire                          int_weights_5_we1;
    wire [31:0]                   int_weights_5_d1;
    wire [31:0]                   int_weights_5_q1;
    reg                           int_weights_5_read;
    reg                           int_weights_5_write;
    wire [4:0]                    int_weights_6_address0;
    wire                          int_weights_6_ce0;
    wire [31:0]                   int_weights_6_q0;
    wire [4:0]                    int_weights_6_address1;
    wire                          int_weights_6_ce1;
    wire [3:0]                    int_weights_6_be1;
    wire                          int_weights_6_we1;
    wire [31:0]                   int_weights_6_d1;
    wire [31:0]                   int_weights_6_q1;
    reg                           int_weights_6_read;
    reg                           int_weights_6_write;
    wire [4:0]                    int_weights_7_address0;
    wire                          int_weights_7_ce0;
    wire [31:0]                   int_weights_7_q0;
    wire [4:0]                    int_weights_7_address1;
    wire                          int_weights_7_ce1;
    wire [3:0]                    int_weights_7_be1;
    wire                          int_weights_7_we1;
    wire [31:0]                   int_weights_7_d1;
    wire [31:0]                   int_weights_7_q1;
    reg                           int_weights_7_read;
    reg                           int_weights_7_write;
    wire [4:0]                    int_weights_8_address0;
    wire                          int_weights_8_ce0;
    wire [31:0]                   int_weights_8_q0;
    wire [4:0]                    int_weights_8_address1;
    wire                          int_weights_8_ce1;
    wire [3:0]                    int_weights_8_be1;
    wire                          int_weights_8_we1;
    wire [31:0]                   int_weights_8_d1;
    wire [31:0]                   int_weights_8_q1;
    reg                           int_weights_8_read;
    reg                           int_weights_8_write;
    wire [4:0]                    int_weights_9_address0;
    wire                          int_weights_9_ce0;
    wire [31:0]                   int_weights_9_q0;
    wire [4:0]                    int_weights_9_address1;
    wire                          int_weights_9_ce1;
    wire [3:0]                    int_weights_9_be1;
    wire                          int_weights_9_we1;
    wire [31:0]                   int_weights_9_d1;
    wire [31:0]                   int_weights_9_q1;
    reg                           int_weights_9_read;
    reg                           int_weights_9_write;
    wire [4:0]                    int_weights_10_address0;
    wire                          int_weights_10_ce0;
    wire [31:0]                   int_weights_10_q0;
    wire [4:0]                    int_weights_10_address1;
    wire                          int_weights_10_ce1;
    wire [3:0]                    int_weights_10_be1;
    wire                          int_weights_10_we1;
    wire [31:0]                   int_weights_10_d1;
    wire [31:0]                   int_weights_10_q1;
    reg                           int_weights_10_read;
    reg                           int_weights_10_write;
    wire [4:0]                    int_weights_11_address0;
    wire                          int_weights_11_ce0;
    wire [31:0]                   int_weights_11_q0;
    wire [4:0]                    int_weights_11_address1;
    wire                          int_weights_11_ce1;
    wire [3:0]                    int_weights_11_be1;
    wire                          int_weights_11_we1;
    wire [31:0]                   int_weights_11_d1;
    wire [31:0]                   int_weights_11_q1;
    reg                           int_weights_11_read;
    reg                           int_weights_11_write;
    wire [4:0]                    int_weights_12_address0;
    wire                          int_weights_12_ce0;
    wire [31:0]                   int_weights_12_q0;
    wire [4:0]                    int_weights_12_address1;
    wire                          int_weights_12_ce1;
    wire [3:0]                    int_weights_12_be1;
    wire                          int_weights_12_we1;
    wire [31:0]                   int_weights_12_d1;
    wire [31:0]                   int_weights_12_q1;
    reg                           int_weights_12_read;
    reg                           int_weights_12_write;
    wire [4:0]                    int_weights_13_address0;
    wire                          int_weights_13_ce0;
    wire [31:0]                   int_weights_13_q0;
    wire [4:0]                    int_weights_13_address1;
    wire                          int_weights_13_ce1;
    wire [3:0]                    int_weights_13_be1;
    wire                          int_weights_13_we1;
    wire [31:0]                   int_weights_13_d1;
    wire [31:0]                   int_weights_13_q1;
    reg                           int_weights_13_read;
    reg                           int_weights_13_write;
    wire [4:0]                    int_weights_14_address0;
    wire                          int_weights_14_ce0;
    wire [31:0]                   int_weights_14_q0;
    wire [4:0]                    int_weights_14_address1;
    wire                          int_weights_14_ce1;
    wire [3:0]                    int_weights_14_be1;
    wire                          int_weights_14_we1;
    wire [31:0]                   int_weights_14_d1;
    wire [31:0]                   int_weights_14_q1;
    reg                           int_weights_14_read;
    reg                           int_weights_14_write;
    wire [4:0]                    int_weights_15_address0;
    wire                          int_weights_15_ce0;
    wire [31:0]                   int_weights_15_q0;
    wire [4:0]                    int_weights_15_address1;
    wire                          int_weights_15_ce1;
    wire [3:0]                    int_weights_15_be1;
    wire                          int_weights_15_we1;
    wire [31:0]                   int_weights_15_d1;
    wire [31:0]                   int_weights_15_q1;
    reg                           int_weights_15_read;
    reg                           int_weights_15_write;
    wire [4:0]                    int_weights_16_address0;
    wire                          int_weights_16_ce0;
    wire [31:0]                   int_weights_16_q0;
    wire [4:0]                    int_weights_16_address1;
    wire                          int_weights_16_ce1;
    wire [3:0]                    int_weights_16_be1;
    wire                          int_weights_16_we1;
    wire [31:0]                   int_weights_16_d1;
    wire [31:0]                   int_weights_16_q1;
    reg                           int_weights_16_read;
    reg                           int_weights_16_write;
    wire [4:0]                    int_weights_17_address0;
    wire                          int_weights_17_ce0;
    wire [31:0]                   int_weights_17_q0;
    wire [4:0]                    int_weights_17_address1;
    wire                          int_weights_17_ce1;
    wire [3:0]                    int_weights_17_be1;
    wire                          int_weights_17_we1;
    wire [31:0]                   int_weights_17_d1;
    wire [31:0]                   int_weights_17_q1;
    reg                           int_weights_17_read;
    reg                           int_weights_17_write;
    wire [4:0]                    int_weights_18_address0;
    wire                          int_weights_18_ce0;
    wire [31:0]                   int_weights_18_q0;
    wire [4:0]                    int_weights_18_address1;
    wire                          int_weights_18_ce1;
    wire [3:0]                    int_weights_18_be1;
    wire                          int_weights_18_we1;
    wire [31:0]                   int_weights_18_d1;
    wire [31:0]                   int_weights_18_q1;
    reg                           int_weights_18_read;
    reg                           int_weights_18_write;
    wire [4:0]                    int_weights_19_address0;
    wire                          int_weights_19_ce0;
    wire [31:0]                   int_weights_19_q0;
    wire [4:0]                    int_weights_19_address1;
    wire                          int_weights_19_ce1;
    wire [3:0]                    int_weights_19_be1;
    wire                          int_weights_19_we1;
    wire [31:0]                   int_weights_19_d1;
    wire [31:0]                   int_weights_19_q1;
    reg                           int_weights_19_read;
    reg                           int_weights_19_write;
    wire [4:0]                    int_weights_20_address0;
    wire                          int_weights_20_ce0;
    wire [31:0]                   int_weights_20_q0;
    wire [4:0]                    int_weights_20_address1;
    wire                          int_weights_20_ce1;
    wire [3:0]                    int_weights_20_be1;
    wire                          int_weights_20_we1;
    wire [31:0]                   int_weights_20_d1;
    wire [31:0]                   int_weights_20_q1;
    reg                           int_weights_20_read;
    reg                           int_weights_20_write;
    wire [4:0]                    int_weights_21_address0;
    wire                          int_weights_21_ce0;
    wire [31:0]                   int_weights_21_q0;
    wire [4:0]                    int_weights_21_address1;
    wire                          int_weights_21_ce1;
    wire [3:0]                    int_weights_21_be1;
    wire                          int_weights_21_we1;
    wire [31:0]                   int_weights_21_d1;
    wire [31:0]                   int_weights_21_q1;
    reg                           int_weights_21_read;
    reg                           int_weights_21_write;
    wire [4:0]                    int_weights_22_address0;
    wire                          int_weights_22_ce0;
    wire [31:0]                   int_weights_22_q0;
    wire [4:0]                    int_weights_22_address1;
    wire                          int_weights_22_ce1;
    wire [3:0]                    int_weights_22_be1;
    wire                          int_weights_22_we1;
    wire [31:0]                   int_weights_22_d1;
    wire [31:0]                   int_weights_22_q1;
    reg                           int_weights_22_read;
    reg                           int_weights_22_write;
    wire [4:0]                    int_weights_23_address0;
    wire                          int_weights_23_ce0;
    wire [31:0]                   int_weights_23_q0;
    wire [4:0]                    int_weights_23_address1;
    wire                          int_weights_23_ce1;
    wire [3:0]                    int_weights_23_be1;
    wire                          int_weights_23_we1;
    wire [31:0]                   int_weights_23_d1;
    wire [31:0]                   int_weights_23_q1;
    reg                           int_weights_23_read;
    reg                           int_weights_23_write;
    wire [4:0]                    int_weights_24_address0;
    wire                          int_weights_24_ce0;
    wire [31:0]                   int_weights_24_q0;
    wire [4:0]                    int_weights_24_address1;
    wire                          int_weights_24_ce1;
    wire [3:0]                    int_weights_24_be1;
    wire                          int_weights_24_we1;
    wire [31:0]                   int_weights_24_d1;
    wire [31:0]                   int_weights_24_q1;
    reg                           int_weights_24_read;
    reg                           int_weights_24_write;
    wire [4:0]                    int_weights_25_address0;
    wire                          int_weights_25_ce0;
    wire [31:0]                   int_weights_25_q0;
    wire [4:0]                    int_weights_25_address1;
    wire                          int_weights_25_ce1;
    wire [3:0]                    int_weights_25_be1;
    wire                          int_weights_25_we1;
    wire [31:0]                   int_weights_25_d1;
    wire [31:0]                   int_weights_25_q1;
    reg                           int_weights_25_read;
    reg                           int_weights_25_write;
    wire [4:0]                    int_weights_26_address0;
    wire                          int_weights_26_ce0;
    wire [31:0]                   int_weights_26_q0;
    wire [4:0]                    int_weights_26_address1;
    wire                          int_weights_26_ce1;
    wire [3:0]                    int_weights_26_be1;
    wire                          int_weights_26_we1;
    wire [31:0]                   int_weights_26_d1;
    wire [31:0]                   int_weights_26_q1;
    reg                           int_weights_26_read;
    reg                           int_weights_26_write;
    wire [4:0]                    int_weights_27_address0;
    wire                          int_weights_27_ce0;
    wire [31:0]                   int_weights_27_q0;
    wire [4:0]                    int_weights_27_address1;
    wire                          int_weights_27_ce1;
    wire [3:0]                    int_weights_27_be1;
    wire                          int_weights_27_we1;
    wire [31:0]                   int_weights_27_d1;
    wire [31:0]                   int_weights_27_q1;
    reg                           int_weights_27_read;
    reg                           int_weights_27_write;
    wire [4:0]                    int_weights_28_address0;
    wire                          int_weights_28_ce0;
    wire [31:0]                   int_weights_28_q0;
    wire [4:0]                    int_weights_28_address1;
    wire                          int_weights_28_ce1;
    wire [3:0]                    int_weights_28_be1;
    wire                          int_weights_28_we1;
    wire [31:0]                   int_weights_28_d1;
    wire [31:0]                   int_weights_28_q1;
    reg                           int_weights_28_read;
    reg                           int_weights_28_write;
    wire [4:0]                    int_weights_29_address0;
    wire                          int_weights_29_ce0;
    wire [31:0]                   int_weights_29_q0;
    wire [4:0]                    int_weights_29_address1;
    wire                          int_weights_29_ce1;
    wire [3:0]                    int_weights_29_be1;
    wire                          int_weights_29_we1;
    wire [31:0]                   int_weights_29_d1;
    wire [31:0]                   int_weights_29_q1;
    reg                           int_weights_29_read;
    reg                           int_weights_29_write;
    wire [4:0]                    int_weights_30_address0;
    wire                          int_weights_30_ce0;
    wire [31:0]                   int_weights_30_q0;
    wire [4:0]                    int_weights_30_address1;
    wire                          int_weights_30_ce1;
    wire [3:0]                    int_weights_30_be1;
    wire                          int_weights_30_we1;
    wire [31:0]                   int_weights_30_d1;
    wire [31:0]                   int_weights_30_q1;
    reg                           int_weights_30_read;
    reg                           int_weights_30_write;
    wire [4:0]                    int_weights_31_address0;
    wire                          int_weights_31_ce0;
    wire [31:0]                   int_weights_31_q0;
    wire [4:0]                    int_weights_31_address1;
    wire                          int_weights_31_ce1;
    wire [3:0]                    int_weights_31_be1;
    wire                          int_weights_31_we1;
    wire [31:0]                   int_weights_31_d1;
    wire [31:0]                   int_weights_31_q1;
    reg                           int_weights_31_read;
    reg                           int_weights_31_write;

//------------------------Instantiation------------------
// int_weights_0
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_0 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_0_address0 ),
    .ce0        ( int_weights_0_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_0_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_0_address1 ),
    .ce1        ( int_weights_0_ce1 ),
    .we1        ( int_weights_0_be1 ),
    .d1         ( int_weights_0_d1 ),
    .q1         ( int_weights_0_q1 )
);
// int_weights_1
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_1 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_1_address0 ),
    .ce0        ( int_weights_1_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_1_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_1_address1 ),
    .ce1        ( int_weights_1_ce1 ),
    .we1        ( int_weights_1_be1 ),
    .d1         ( int_weights_1_d1 ),
    .q1         ( int_weights_1_q1 )
);
// int_weights_2
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_2 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_2_address0 ),
    .ce0        ( int_weights_2_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_2_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_2_address1 ),
    .ce1        ( int_weights_2_ce1 ),
    .we1        ( int_weights_2_be1 ),
    .d1         ( int_weights_2_d1 ),
    .q1         ( int_weights_2_q1 )
);
// int_weights_3
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_3 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_3_address0 ),
    .ce0        ( int_weights_3_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_3_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_3_address1 ),
    .ce1        ( int_weights_3_ce1 ),
    .we1        ( int_weights_3_be1 ),
    .d1         ( int_weights_3_d1 ),
    .q1         ( int_weights_3_q1 )
);
// int_weights_4
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_4 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_4_address0 ),
    .ce0        ( int_weights_4_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_4_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_4_address1 ),
    .ce1        ( int_weights_4_ce1 ),
    .we1        ( int_weights_4_be1 ),
    .d1         ( int_weights_4_d1 ),
    .q1         ( int_weights_4_q1 )
);
// int_weights_5
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_5 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_5_address0 ),
    .ce0        ( int_weights_5_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_5_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_5_address1 ),
    .ce1        ( int_weights_5_ce1 ),
    .we1        ( int_weights_5_be1 ),
    .d1         ( int_weights_5_d1 ),
    .q1         ( int_weights_5_q1 )
);
// int_weights_6
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_6 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_6_address0 ),
    .ce0        ( int_weights_6_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_6_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_6_address1 ),
    .ce1        ( int_weights_6_ce1 ),
    .we1        ( int_weights_6_be1 ),
    .d1         ( int_weights_6_d1 ),
    .q1         ( int_weights_6_q1 )
);
// int_weights_7
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_7 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_7_address0 ),
    .ce0        ( int_weights_7_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_7_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_7_address1 ),
    .ce1        ( int_weights_7_ce1 ),
    .we1        ( int_weights_7_be1 ),
    .d1         ( int_weights_7_d1 ),
    .q1         ( int_weights_7_q1 )
);
// int_weights_8
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_8 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_8_address0 ),
    .ce0        ( int_weights_8_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_8_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_8_address1 ),
    .ce1        ( int_weights_8_ce1 ),
    .we1        ( int_weights_8_be1 ),
    .d1         ( int_weights_8_d1 ),
    .q1         ( int_weights_8_q1 )
);
// int_weights_9
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_9 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_9_address0 ),
    .ce0        ( int_weights_9_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_9_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_9_address1 ),
    .ce1        ( int_weights_9_ce1 ),
    .we1        ( int_weights_9_be1 ),
    .d1         ( int_weights_9_d1 ),
    .q1         ( int_weights_9_q1 )
);
// int_weights_10
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_10 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_10_address0 ),
    .ce0        ( int_weights_10_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_10_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_10_address1 ),
    .ce1        ( int_weights_10_ce1 ),
    .we1        ( int_weights_10_be1 ),
    .d1         ( int_weights_10_d1 ),
    .q1         ( int_weights_10_q1 )
);
// int_weights_11
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_11 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_11_address0 ),
    .ce0        ( int_weights_11_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_11_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_11_address1 ),
    .ce1        ( int_weights_11_ce1 ),
    .we1        ( int_weights_11_be1 ),
    .d1         ( int_weights_11_d1 ),
    .q1         ( int_weights_11_q1 )
);
// int_weights_12
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_12 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_12_address0 ),
    .ce0        ( int_weights_12_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_12_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_12_address1 ),
    .ce1        ( int_weights_12_ce1 ),
    .we1        ( int_weights_12_be1 ),
    .d1         ( int_weights_12_d1 ),
    .q1         ( int_weights_12_q1 )
);
// int_weights_13
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_13 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_13_address0 ),
    .ce0        ( int_weights_13_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_13_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_13_address1 ),
    .ce1        ( int_weights_13_ce1 ),
    .we1        ( int_weights_13_be1 ),
    .d1         ( int_weights_13_d1 ),
    .q1         ( int_weights_13_q1 )
);
// int_weights_14
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_14 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_14_address0 ),
    .ce0        ( int_weights_14_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_14_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_14_address1 ),
    .ce1        ( int_weights_14_ce1 ),
    .we1        ( int_weights_14_be1 ),
    .d1         ( int_weights_14_d1 ),
    .q1         ( int_weights_14_q1 )
);
// int_weights_15
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_15 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_15_address0 ),
    .ce0        ( int_weights_15_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_15_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_15_address1 ),
    .ce1        ( int_weights_15_ce1 ),
    .we1        ( int_weights_15_be1 ),
    .d1         ( int_weights_15_d1 ),
    .q1         ( int_weights_15_q1 )
);
// int_weights_16
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_16 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_16_address0 ),
    .ce0        ( int_weights_16_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_16_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_16_address1 ),
    .ce1        ( int_weights_16_ce1 ),
    .we1        ( int_weights_16_be1 ),
    .d1         ( int_weights_16_d1 ),
    .q1         ( int_weights_16_q1 )
);
// int_weights_17
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_17 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_17_address0 ),
    .ce0        ( int_weights_17_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_17_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_17_address1 ),
    .ce1        ( int_weights_17_ce1 ),
    .we1        ( int_weights_17_be1 ),
    .d1         ( int_weights_17_d1 ),
    .q1         ( int_weights_17_q1 )
);
// int_weights_18
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_18 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_18_address0 ),
    .ce0        ( int_weights_18_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_18_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_18_address1 ),
    .ce1        ( int_weights_18_ce1 ),
    .we1        ( int_weights_18_be1 ),
    .d1         ( int_weights_18_d1 ),
    .q1         ( int_weights_18_q1 )
);
// int_weights_19
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_19 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_19_address0 ),
    .ce0        ( int_weights_19_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_19_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_19_address1 ),
    .ce1        ( int_weights_19_ce1 ),
    .we1        ( int_weights_19_be1 ),
    .d1         ( int_weights_19_d1 ),
    .q1         ( int_weights_19_q1 )
);
// int_weights_20
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_20 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_20_address0 ),
    .ce0        ( int_weights_20_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_20_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_20_address1 ),
    .ce1        ( int_weights_20_ce1 ),
    .we1        ( int_weights_20_be1 ),
    .d1         ( int_weights_20_d1 ),
    .q1         ( int_weights_20_q1 )
);
// int_weights_21
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_21 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_21_address0 ),
    .ce0        ( int_weights_21_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_21_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_21_address1 ),
    .ce1        ( int_weights_21_ce1 ),
    .we1        ( int_weights_21_be1 ),
    .d1         ( int_weights_21_d1 ),
    .q1         ( int_weights_21_q1 )
);
// int_weights_22
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_22 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_22_address0 ),
    .ce0        ( int_weights_22_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_22_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_22_address1 ),
    .ce1        ( int_weights_22_ce1 ),
    .we1        ( int_weights_22_be1 ),
    .d1         ( int_weights_22_d1 ),
    .q1         ( int_weights_22_q1 )
);
// int_weights_23
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_23 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_23_address0 ),
    .ce0        ( int_weights_23_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_23_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_23_address1 ),
    .ce1        ( int_weights_23_ce1 ),
    .we1        ( int_weights_23_be1 ),
    .d1         ( int_weights_23_d1 ),
    .q1         ( int_weights_23_q1 )
);
// int_weights_24
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_24 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_24_address0 ),
    .ce0        ( int_weights_24_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_24_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_24_address1 ),
    .ce1        ( int_weights_24_ce1 ),
    .we1        ( int_weights_24_be1 ),
    .d1         ( int_weights_24_d1 ),
    .q1         ( int_weights_24_q1 )
);
// int_weights_25
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_25 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_25_address0 ),
    .ce0        ( int_weights_25_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_25_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_25_address1 ),
    .ce1        ( int_weights_25_ce1 ),
    .we1        ( int_weights_25_be1 ),
    .d1         ( int_weights_25_d1 ),
    .q1         ( int_weights_25_q1 )
);
// int_weights_26
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_26 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_26_address0 ),
    .ce0        ( int_weights_26_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_26_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_26_address1 ),
    .ce1        ( int_weights_26_ce1 ),
    .we1        ( int_weights_26_be1 ),
    .d1         ( int_weights_26_d1 ),
    .q1         ( int_weights_26_q1 )
);
// int_weights_27
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_27 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_27_address0 ),
    .ce0        ( int_weights_27_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_27_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_27_address1 ),
    .ce1        ( int_weights_27_ce1 ),
    .we1        ( int_weights_27_be1 ),
    .d1         ( int_weights_27_d1 ),
    .q1         ( int_weights_27_q1 )
);
// int_weights_28
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_28 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_28_address0 ),
    .ce0        ( int_weights_28_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_28_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_28_address1 ),
    .ce1        ( int_weights_28_ce1 ),
    .we1        ( int_weights_28_be1 ),
    .d1         ( int_weights_28_d1 ),
    .q1         ( int_weights_28_q1 )
);
// int_weights_29
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_29 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_29_address0 ),
    .ce0        ( int_weights_29_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_29_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_29_address1 ),
    .ce1        ( int_weights_29_ce1 ),
    .we1        ( int_weights_29_be1 ),
    .d1         ( int_weights_29_d1 ),
    .q1         ( int_weights_29_q1 )
);
// int_weights_30
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_30 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_30_address0 ),
    .ce0        ( int_weights_30_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_30_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_30_address1 ),
    .ce1        ( int_weights_30_ce1 ),
    .we1        ( int_weights_30_be1 ),
    .d1         ( int_weights_30_d1 ),
    .q1         ( int_weights_30_q1 )
);
// int_weights_31
dense_gemv_control_s_axi_ram #(
    .MEM_STYLE  ( "auto" ),
    .MEM_TYPE   ( "2P" ),
    .BYTE_WIDTH ( 8 ),
    .WIDTH      ( 32 ),
    .BYTES      ( 4 ),
    .DEPTH      ( 32 )
) int_weights_31 (
    .clk0       ( ACLK ),
    .address0   ( int_weights_31_address0 ),
    .ce0        ( int_weights_31_ce0 ),
    .we0        ( {4{1'b0}} ),
    .d0         ( {32{1'b0}} ),
    .q0         ( int_weights_31_q0 ),
    .clk1       ( ACLK ),
    .address1   ( int_weights_31_address1 ),
    .ce1        ( int_weights_31_ce1 ),
    .we1        ( int_weights_31_be1 ),
    .d1         ( int_weights_31_d1 ),
    .q1         ( int_weights_31_q1 )
);


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA) && (!ar_hs);
assign BVALID  = (wstate == WRRESP);
assign BRESP   = 2'b00;  // OKAY
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (w_hs)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY & BVALID)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_weights_0_read & !int_weights_1_read & !int_weights_2_read & !int_weights_3_read & !int_weights_4_read & !int_weights_5_read & !int_weights_6_read & !int_weights_7_read & !int_weights_8_read & !int_weights_9_read & !int_weights_10_read & !int_weights_11_read & !int_weights_12_read & !int_weights_13_read & !int_weights_14_read & !int_weights_15_read & !int_weights_16_read & !int_weights_17_read & !int_weights_18_read & !int_weights_19_read & !int_weights_20_read & !int_weights_21_read & !int_weights_22_read & !int_weights_23_read & !int_weights_24_read & !int_weights_25_read & !int_weights_26_read & !int_weights_27_read & !int_weights_28_read & !int_weights_29_read & !int_weights_30_read & !int_weights_31_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_NUM_ROWS_DATA_0: begin
                    rdata <= int_num_rows[31:0];
                end
            endcase
        end
        else if (int_weights_0_read) begin
            rdata <= int_weights_0_q1;
        end
        else if (int_weights_1_read) begin
            rdata <= int_weights_1_q1;
        end
        else if (int_weights_2_read) begin
            rdata <= int_weights_2_q1;
        end
        else if (int_weights_3_read) begin
            rdata <= int_weights_3_q1;
        end
        else if (int_weights_4_read) begin
            rdata <= int_weights_4_q1;
        end
        else if (int_weights_5_read) begin
            rdata <= int_weights_5_q1;
        end
        else if (int_weights_6_read) begin
            rdata <= int_weights_6_q1;
        end
        else if (int_weights_7_read) begin
            rdata <= int_weights_7_q1;
        end
        else if (int_weights_8_read) begin
            rdata <= int_weights_8_q1;
        end
        else if (int_weights_9_read) begin
            rdata <= int_weights_9_q1;
        end
        else if (int_weights_10_read) begin
            rdata <= int_weights_10_q1;
        end
        else if (int_weights_11_read) begin
            rdata <= int_weights_11_q1;
        end
        else if (int_weights_12_read) begin
            rdata <= int_weights_12_q1;
        end
        else if (int_weights_13_read) begin
            rdata <= int_weights_13_q1;
        end
        else if (int_weights_14_read) begin
            rdata <= int_weights_14_q1;
        end
        else if (int_weights_15_read) begin
            rdata <= int_weights_15_q1;
        end
        else if (int_weights_16_read) begin
            rdata <= int_weights_16_q1;
        end
        else if (int_weights_17_read) begin
            rdata <= int_weights_17_q1;
        end
        else if (int_weights_18_read) begin
            rdata <= int_weights_18_q1;
        end
        else if (int_weights_19_read) begin
            rdata <= int_weights_19_q1;
        end
        else if (int_weights_20_read) begin
            rdata <= int_weights_20_q1;
        end
        else if (int_weights_21_read) begin
            rdata <= int_weights_21_q1;
        end
        else if (int_weights_22_read) begin
            rdata <= int_weights_22_q1;
        end
        else if (int_weights_23_read) begin
            rdata <= int_weights_23_q1;
        end
        else if (int_weights_24_read) begin
            rdata <= int_weights_24_q1;
        end
        else if (int_weights_25_read) begin
            rdata <= int_weights_25_q1;
        end
        else if (int_weights_26_read) begin
            rdata <= int_weights_26_q1;
        end
        else if (int_weights_27_read) begin
            rdata <= int_weights_27_q1;
        end
        else if (int_weights_28_read) begin
            rdata <= int_weights_28_q1;
        end
        else if (int_weights_29_read) begin
            rdata <= int_weights_29_q1;
        end
        else if (int_weights_30_read) begin
            rdata <= int_weights_30_q1;
        end
        else if (int_weights_31_read) begin
            rdata <= int_weights_31_q1;
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign num_rows          = int_num_rows;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <= WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_num_rows[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_num_rows[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NUM_ROWS_DATA_0)
            int_num_rows[31:0] <= (WDATA[31:0] & wmask) | (int_num_rows[31:0] & ~wmask);
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------
// weights_0
assign int_weights_0_address0  = weights_0_address0;
assign int_weights_0_ce0       = weights_0_ce0;
assign weights_0_q0            = int_weights_0_q0;
assign int_weights_0_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_0_ce1       = ar_hs | (int_weights_0_write & WVALID);
assign int_weights_0_we1       = int_weights_0_write & w_hs;
assign int_weights_0_be1       = int_weights_0_we1 ? WSTRB : 4'd0;
assign int_weights_0_d1        = WDATA;
// weights_1
assign int_weights_1_address0  = weights_1_address0;
assign int_weights_1_ce0       = weights_1_ce0;
assign weights_1_q0            = int_weights_1_q0;
assign int_weights_1_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_1_ce1       = ar_hs | (int_weights_1_write & WVALID);
assign int_weights_1_we1       = int_weights_1_write & w_hs;
assign int_weights_1_be1       = int_weights_1_we1 ? WSTRB : 4'd0;
assign int_weights_1_d1        = WDATA;
// weights_2
assign int_weights_2_address0  = weights_2_address0;
assign int_weights_2_ce0       = weights_2_ce0;
assign weights_2_q0            = int_weights_2_q0;
assign int_weights_2_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_2_ce1       = ar_hs | (int_weights_2_write & WVALID);
assign int_weights_2_we1       = int_weights_2_write & w_hs;
assign int_weights_2_be1       = int_weights_2_we1 ? WSTRB : 4'd0;
assign int_weights_2_d1        = WDATA;
// weights_3
assign int_weights_3_address0  = weights_3_address0;
assign int_weights_3_ce0       = weights_3_ce0;
assign weights_3_q0            = int_weights_3_q0;
assign int_weights_3_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_3_ce1       = ar_hs | (int_weights_3_write & WVALID);
assign int_weights_3_we1       = int_weights_3_write & w_hs;
assign int_weights_3_be1       = int_weights_3_we1 ? WSTRB : 4'd0;
assign int_weights_3_d1        = WDATA;
// weights_4
assign int_weights_4_address0  = weights_4_address0;
assign int_weights_4_ce0       = weights_4_ce0;
assign weights_4_q0            = int_weights_4_q0;
assign int_weights_4_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_4_ce1       = ar_hs | (int_weights_4_write & WVALID);
assign int_weights_4_we1       = int_weights_4_write & w_hs;
assign int_weights_4_be1       = int_weights_4_we1 ? WSTRB : 4'd0;
assign int_weights_4_d1        = WDATA;
// weights_5
assign int_weights_5_address0  = weights_5_address0;
assign int_weights_5_ce0       = weights_5_ce0;
assign weights_5_q0            = int_weights_5_q0;
assign int_weights_5_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_5_ce1       = ar_hs | (int_weights_5_write & WVALID);
assign int_weights_5_we1       = int_weights_5_write & w_hs;
assign int_weights_5_be1       = int_weights_5_we1 ? WSTRB : 4'd0;
assign int_weights_5_d1        = WDATA;
// weights_6
assign int_weights_6_address0  = weights_6_address0;
assign int_weights_6_ce0       = weights_6_ce0;
assign weights_6_q0            = int_weights_6_q0;
assign int_weights_6_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_6_ce1       = ar_hs | (int_weights_6_write & WVALID);
assign int_weights_6_we1       = int_weights_6_write & w_hs;
assign int_weights_6_be1       = int_weights_6_we1 ? WSTRB : 4'd0;
assign int_weights_6_d1        = WDATA;
// weights_7
assign int_weights_7_address0  = weights_7_address0;
assign int_weights_7_ce0       = weights_7_ce0;
assign weights_7_q0            = int_weights_7_q0;
assign int_weights_7_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_7_ce1       = ar_hs | (int_weights_7_write & WVALID);
assign int_weights_7_we1       = int_weights_7_write & w_hs;
assign int_weights_7_be1       = int_weights_7_we1 ? WSTRB : 4'd0;
assign int_weights_7_d1        = WDATA;
// weights_8
assign int_weights_8_address0  = weights_8_address0;
assign int_weights_8_ce0       = weights_8_ce0;
assign weights_8_q0            = int_weights_8_q0;
assign int_weights_8_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_8_ce1       = ar_hs | (int_weights_8_write & WVALID);
assign int_weights_8_we1       = int_weights_8_write & w_hs;
assign int_weights_8_be1       = int_weights_8_we1 ? WSTRB : 4'd0;
assign int_weights_8_d1        = WDATA;
// weights_9
assign int_weights_9_address0  = weights_9_address0;
assign int_weights_9_ce0       = weights_9_ce0;
assign weights_9_q0            = int_weights_9_q0;
assign int_weights_9_address1  = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_9_ce1       = ar_hs | (int_weights_9_write & WVALID);
assign int_weights_9_we1       = int_weights_9_write & w_hs;
assign int_weights_9_be1       = int_weights_9_we1 ? WSTRB : 4'd0;
assign int_weights_9_d1        = WDATA;
// weights_10
assign int_weights_10_address0 = weights_10_address0;
assign int_weights_10_ce0      = weights_10_ce0;
assign weights_10_q0           = int_weights_10_q0;
assign int_weights_10_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_10_ce1      = ar_hs | (int_weights_10_write & WVALID);
assign int_weights_10_we1      = int_weights_10_write & w_hs;
assign int_weights_10_be1      = int_weights_10_we1 ? WSTRB : 4'd0;
assign int_weights_10_d1       = WDATA;
// weights_11
assign int_weights_11_address0 = weights_11_address0;
assign int_weights_11_ce0      = weights_11_ce0;
assign weights_11_q0           = int_weights_11_q0;
assign int_weights_11_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_11_ce1      = ar_hs | (int_weights_11_write & WVALID);
assign int_weights_11_we1      = int_weights_11_write & w_hs;
assign int_weights_11_be1      = int_weights_11_we1 ? WSTRB : 4'd0;
assign int_weights_11_d1       = WDATA;
// weights_12
assign int_weights_12_address0 = weights_12_address0;
assign int_weights_12_ce0      = weights_12_ce0;
assign weights_12_q0           = int_weights_12_q0;
assign int_weights_12_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_12_ce1      = ar_hs | (int_weights_12_write & WVALID);
assign int_weights_12_we1      = int_weights_12_write & w_hs;
assign int_weights_12_be1      = int_weights_12_we1 ? WSTRB : 4'd0;
assign int_weights_12_d1       = WDATA;
// weights_13
assign int_weights_13_address0 = weights_13_address0;
assign int_weights_13_ce0      = weights_13_ce0;
assign weights_13_q0           = int_weights_13_q0;
assign int_weights_13_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_13_ce1      = ar_hs | (int_weights_13_write & WVALID);
assign int_weights_13_we1      = int_weights_13_write & w_hs;
assign int_weights_13_be1      = int_weights_13_we1 ? WSTRB : 4'd0;
assign int_weights_13_d1       = WDATA;
// weights_14
assign int_weights_14_address0 = weights_14_address0;
assign int_weights_14_ce0      = weights_14_ce0;
assign weights_14_q0           = int_weights_14_q0;
assign int_weights_14_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_14_ce1      = ar_hs | (int_weights_14_write & WVALID);
assign int_weights_14_we1      = int_weights_14_write & w_hs;
assign int_weights_14_be1      = int_weights_14_we1 ? WSTRB : 4'd0;
assign int_weights_14_d1       = WDATA;
// weights_15
assign int_weights_15_address0 = weights_15_address0;
assign int_weights_15_ce0      = weights_15_ce0;
assign weights_15_q0           = int_weights_15_q0;
assign int_weights_15_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_15_ce1      = ar_hs | (int_weights_15_write & WVALID);
assign int_weights_15_we1      = int_weights_15_write & w_hs;
assign int_weights_15_be1      = int_weights_15_we1 ? WSTRB : 4'd0;
assign int_weights_15_d1       = WDATA;
// weights_16
assign int_weights_16_address0 = weights_16_address0;
assign int_weights_16_ce0      = weights_16_ce0;
assign weights_16_q0           = int_weights_16_q0;
assign int_weights_16_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_16_ce1      = ar_hs | (int_weights_16_write & WVALID);
assign int_weights_16_we1      = int_weights_16_write & w_hs;
assign int_weights_16_be1      = int_weights_16_we1 ? WSTRB : 4'd0;
assign int_weights_16_d1       = WDATA;
// weights_17
assign int_weights_17_address0 = weights_17_address0;
assign int_weights_17_ce0      = weights_17_ce0;
assign weights_17_q0           = int_weights_17_q0;
assign int_weights_17_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_17_ce1      = ar_hs | (int_weights_17_write & WVALID);
assign int_weights_17_we1      = int_weights_17_write & w_hs;
assign int_weights_17_be1      = int_weights_17_we1 ? WSTRB : 4'd0;
assign int_weights_17_d1       = WDATA;
// weights_18
assign int_weights_18_address0 = weights_18_address0;
assign int_weights_18_ce0      = weights_18_ce0;
assign weights_18_q0           = int_weights_18_q0;
assign int_weights_18_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_18_ce1      = ar_hs | (int_weights_18_write & WVALID);
assign int_weights_18_we1      = int_weights_18_write & w_hs;
assign int_weights_18_be1      = int_weights_18_we1 ? WSTRB : 4'd0;
assign int_weights_18_d1       = WDATA;
// weights_19
assign int_weights_19_address0 = weights_19_address0;
assign int_weights_19_ce0      = weights_19_ce0;
assign weights_19_q0           = int_weights_19_q0;
assign int_weights_19_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_19_ce1      = ar_hs | (int_weights_19_write & WVALID);
assign int_weights_19_we1      = int_weights_19_write & w_hs;
assign int_weights_19_be1      = int_weights_19_we1 ? WSTRB : 4'd0;
assign int_weights_19_d1       = WDATA;
// weights_20
assign int_weights_20_address0 = weights_20_address0;
assign int_weights_20_ce0      = weights_20_ce0;
assign weights_20_q0           = int_weights_20_q0;
assign int_weights_20_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_20_ce1      = ar_hs | (int_weights_20_write & WVALID);
assign int_weights_20_we1      = int_weights_20_write & w_hs;
assign int_weights_20_be1      = int_weights_20_we1 ? WSTRB : 4'd0;
assign int_weights_20_d1       = WDATA;
// weights_21
assign int_weights_21_address0 = weights_21_address0;
assign int_weights_21_ce0      = weights_21_ce0;
assign weights_21_q0           = int_weights_21_q0;
assign int_weights_21_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_21_ce1      = ar_hs | (int_weights_21_write & WVALID);
assign int_weights_21_we1      = int_weights_21_write & w_hs;
assign int_weights_21_be1      = int_weights_21_we1 ? WSTRB : 4'd0;
assign int_weights_21_d1       = WDATA;
// weights_22
assign int_weights_22_address0 = weights_22_address0;
assign int_weights_22_ce0      = weights_22_ce0;
assign weights_22_q0           = int_weights_22_q0;
assign int_weights_22_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_22_ce1      = ar_hs | (int_weights_22_write & WVALID);
assign int_weights_22_we1      = int_weights_22_write & w_hs;
assign int_weights_22_be1      = int_weights_22_we1 ? WSTRB : 4'd0;
assign int_weights_22_d1       = WDATA;
// weights_23
assign int_weights_23_address0 = weights_23_address0;
assign int_weights_23_ce0      = weights_23_ce0;
assign weights_23_q0           = int_weights_23_q0;
assign int_weights_23_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_23_ce1      = ar_hs | (int_weights_23_write & WVALID);
assign int_weights_23_we1      = int_weights_23_write & w_hs;
assign int_weights_23_be1      = int_weights_23_we1 ? WSTRB : 4'd0;
assign int_weights_23_d1       = WDATA;
// weights_24
assign int_weights_24_address0 = weights_24_address0;
assign int_weights_24_ce0      = weights_24_ce0;
assign weights_24_q0           = int_weights_24_q0;
assign int_weights_24_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_24_ce1      = ar_hs | (int_weights_24_write & WVALID);
assign int_weights_24_we1      = int_weights_24_write & w_hs;
assign int_weights_24_be1      = int_weights_24_we1 ? WSTRB : 4'd0;
assign int_weights_24_d1       = WDATA;
// weights_25
assign int_weights_25_address0 = weights_25_address0;
assign int_weights_25_ce0      = weights_25_ce0;
assign weights_25_q0           = int_weights_25_q0;
assign int_weights_25_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_25_ce1      = ar_hs | (int_weights_25_write & WVALID);
assign int_weights_25_we1      = int_weights_25_write & w_hs;
assign int_weights_25_be1      = int_weights_25_we1 ? WSTRB : 4'd0;
assign int_weights_25_d1       = WDATA;
// weights_26
assign int_weights_26_address0 = weights_26_address0;
assign int_weights_26_ce0      = weights_26_ce0;
assign weights_26_q0           = int_weights_26_q0;
assign int_weights_26_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_26_ce1      = ar_hs | (int_weights_26_write & WVALID);
assign int_weights_26_we1      = int_weights_26_write & w_hs;
assign int_weights_26_be1      = int_weights_26_we1 ? WSTRB : 4'd0;
assign int_weights_26_d1       = WDATA;
// weights_27
assign int_weights_27_address0 = weights_27_address0;
assign int_weights_27_ce0      = weights_27_ce0;
assign weights_27_q0           = int_weights_27_q0;
assign int_weights_27_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_27_ce1      = ar_hs | (int_weights_27_write & WVALID);
assign int_weights_27_we1      = int_weights_27_write & w_hs;
assign int_weights_27_be1      = int_weights_27_we1 ? WSTRB : 4'd0;
assign int_weights_27_d1       = WDATA;
// weights_28
assign int_weights_28_address0 = weights_28_address0;
assign int_weights_28_ce0      = weights_28_ce0;
assign weights_28_q0           = int_weights_28_q0;
assign int_weights_28_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_28_ce1      = ar_hs | (int_weights_28_write & WVALID);
assign int_weights_28_we1      = int_weights_28_write & w_hs;
assign int_weights_28_be1      = int_weights_28_we1 ? WSTRB : 4'd0;
assign int_weights_28_d1       = WDATA;
// weights_29
assign int_weights_29_address0 = weights_29_address0;
assign int_weights_29_ce0      = weights_29_ce0;
assign weights_29_q0           = int_weights_29_q0;
assign int_weights_29_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_29_ce1      = ar_hs | (int_weights_29_write & WVALID);
assign int_weights_29_we1      = int_weights_29_write & w_hs;
assign int_weights_29_be1      = int_weights_29_we1 ? WSTRB : 4'd0;
assign int_weights_29_d1       = WDATA;
// weights_30
assign int_weights_30_address0 = weights_30_address0;
assign int_weights_30_ce0      = weights_30_ce0;
assign weights_30_q0           = int_weights_30_q0;
assign int_weights_30_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_30_ce1      = ar_hs | (int_weights_30_write & WVALID);
assign int_weights_30_we1      = int_weights_30_write & w_hs;
assign int_weights_30_be1      = int_weights_30_we1 ? WSTRB : 4'd0;
assign int_weights_30_d1       = WDATA;
// weights_31
assign int_weights_31_address0 = weights_31_address0;
assign int_weights_31_ce0      = weights_31_ce0;
assign weights_31_q0           = int_weights_31_q0;
assign int_weights_31_address1 = ar_hs ? raddr[6:2] : waddr[6:2];
assign int_weights_31_ce1      = ar_hs | (int_weights_31_write & WVALID);
assign int_weights_31_we1      = int_weights_31_write & w_hs;
assign int_weights_31_be1      = int_weights_31_we1 ? WSTRB : 4'd0;
assign int_weights_31_d1       = WDATA;
// int_weights_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_0_BASE && raddr <= ADDR_WEIGHTS_0_HIGH)
            int_weights_0_read <= 1'b1;
        else
            int_weights_0_read <= 1'b0;
    end
end

// int_weights_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_0_HIGH)
            int_weights_0_write <= 1'b1;
        else if (w_hs)
            int_weights_0_write <= 1'b0;
    end
end

// int_weights_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_1_BASE && raddr <= ADDR_WEIGHTS_1_HIGH)
            int_weights_1_read <= 1'b1;
        else
            int_weights_1_read <= 1'b0;
    end
end

// int_weights_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_1_HIGH)
            int_weights_1_write <= 1'b1;
        else if (w_hs)
            int_weights_1_write <= 1'b0;
    end
end

// int_weights_2_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_2_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_2_BASE && raddr <= ADDR_WEIGHTS_2_HIGH)
            int_weights_2_read <= 1'b1;
        else
            int_weights_2_read <= 1'b0;
    end
end

// int_weights_2_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_2_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_2_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_2_HIGH)
            int_weights_2_write <= 1'b1;
        else if (w_hs)
            int_weights_2_write <= 1'b0;
    end
end

// int_weights_3_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_3_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_3_BASE && raddr <= ADDR_WEIGHTS_3_HIGH)
            int_weights_3_read <= 1'b1;
        else
            int_weights_3_read <= 1'b0;
    end
end

// int_weights_3_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_3_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_3_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_3_HIGH)
            int_weights_3_write <= 1'b1;
        else if (w_hs)
            int_weights_3_write <= 1'b0;
    end
end

// int_weights_4_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_4_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_4_BASE && raddr <= ADDR_WEIGHTS_4_HIGH)
            int_weights_4_read <= 1'b1;
        else
            int_weights_4_read <= 1'b0;
    end
end

// int_weights_4_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_4_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_4_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_4_HIGH)
            int_weights_4_write <= 1'b1;
        else if (w_hs)
            int_weights_4_write <= 1'b0;
    end
end

// int_weights_5_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_5_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_5_BASE && raddr <= ADDR_WEIGHTS_5_HIGH)
            int_weights_5_read <= 1'b1;
        else
            int_weights_5_read <= 1'b0;
    end
end

// int_weights_5_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_5_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_5_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_5_HIGH)
            int_weights_5_write <= 1'b1;
        else if (w_hs)
            int_weights_5_write <= 1'b0;
    end
end

// int_weights_6_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_6_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_6_BASE && raddr <= ADDR_WEIGHTS_6_HIGH)
            int_weights_6_read <= 1'b1;
        else
            int_weights_6_read <= 1'b0;
    end
end

// int_weights_6_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_6_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_6_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_6_HIGH)
            int_weights_6_write <= 1'b1;
        else if (w_hs)
            int_weights_6_write <= 1'b0;
    end
end

// int_weights_7_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_7_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_7_BASE && raddr <= ADDR_WEIGHTS_7_HIGH)
            int_weights_7_read <= 1'b1;
        else
            int_weights_7_read <= 1'b0;
    end
end

// int_weights_7_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_7_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_7_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_7_HIGH)
            int_weights_7_write <= 1'b1;
        else if (w_hs)
            int_weights_7_write <= 1'b0;
    end
end

// int_weights_8_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_8_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_8_BASE && raddr <= ADDR_WEIGHTS_8_HIGH)
            int_weights_8_read <= 1'b1;
        else
            int_weights_8_read <= 1'b0;
    end
end

// int_weights_8_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_8_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_8_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_8_HIGH)
            int_weights_8_write <= 1'b1;
        else if (w_hs)
            int_weights_8_write <= 1'b0;
    end
end

// int_weights_9_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_9_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_9_BASE && raddr <= ADDR_WEIGHTS_9_HIGH)
            int_weights_9_read <= 1'b1;
        else
            int_weights_9_read <= 1'b0;
    end
end

// int_weights_9_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_9_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_9_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_9_HIGH)
            int_weights_9_write <= 1'b1;
        else if (w_hs)
            int_weights_9_write <= 1'b0;
    end
end

// int_weights_10_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_10_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_10_BASE && raddr <= ADDR_WEIGHTS_10_HIGH)
            int_weights_10_read <= 1'b1;
        else
            int_weights_10_read <= 1'b0;
    end
end

// int_weights_10_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_10_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_10_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_10_HIGH)
            int_weights_10_write <= 1'b1;
        else if (w_hs)
            int_weights_10_write <= 1'b0;
    end
end

// int_weights_11_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_11_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_11_BASE && raddr <= ADDR_WEIGHTS_11_HIGH)
            int_weights_11_read <= 1'b1;
        else
            int_weights_11_read <= 1'b0;
    end
end

// int_weights_11_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_11_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_11_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_11_HIGH)
            int_weights_11_write <= 1'b1;
        else if (w_hs)
            int_weights_11_write <= 1'b0;
    end
end

// int_weights_12_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_12_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_12_BASE && raddr <= ADDR_WEIGHTS_12_HIGH)
            int_weights_12_read <= 1'b1;
        else
            int_weights_12_read <= 1'b0;
    end
end

// int_weights_12_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_12_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_12_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_12_HIGH)
            int_weights_12_write <= 1'b1;
        else if (w_hs)
            int_weights_12_write <= 1'b0;
    end
end

// int_weights_13_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_13_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_13_BASE && raddr <= ADDR_WEIGHTS_13_HIGH)
            int_weights_13_read <= 1'b1;
        else
            int_weights_13_read <= 1'b0;
    end
end

// int_weights_13_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_13_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_13_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_13_HIGH)
            int_weights_13_write <= 1'b1;
        else if (w_hs)
            int_weights_13_write <= 1'b0;
    end
end

// int_weights_14_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_14_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_14_BASE && raddr <= ADDR_WEIGHTS_14_HIGH)
            int_weights_14_read <= 1'b1;
        else
            int_weights_14_read <= 1'b0;
    end
end

// int_weights_14_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_14_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_14_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_14_HIGH)
            int_weights_14_write <= 1'b1;
        else if (w_hs)
            int_weights_14_write <= 1'b0;
    end
end

// int_weights_15_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_15_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_15_BASE && raddr <= ADDR_WEIGHTS_15_HIGH)
            int_weights_15_read <= 1'b1;
        else
            int_weights_15_read <= 1'b0;
    end
end

// int_weights_15_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_15_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_15_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_15_HIGH)
            int_weights_15_write <= 1'b1;
        else if (w_hs)
            int_weights_15_write <= 1'b0;
    end
end

// int_weights_16_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_16_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_16_BASE && raddr <= ADDR_WEIGHTS_16_HIGH)
            int_weights_16_read <= 1'b1;
        else
            int_weights_16_read <= 1'b0;
    end
end

// int_weights_16_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_16_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_16_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_16_HIGH)
            int_weights_16_write <= 1'b1;
        else if (w_hs)
            int_weights_16_write <= 1'b0;
    end
end

// int_weights_17_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_17_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_17_BASE && raddr <= ADDR_WEIGHTS_17_HIGH)
            int_weights_17_read <= 1'b1;
        else
            int_weights_17_read <= 1'b0;
    end
end

// int_weights_17_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_17_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_17_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_17_HIGH)
            int_weights_17_write <= 1'b1;
        else if (w_hs)
            int_weights_17_write <= 1'b0;
    end
end

// int_weights_18_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_18_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_18_BASE && raddr <= ADDR_WEIGHTS_18_HIGH)
            int_weights_18_read <= 1'b1;
        else
            int_weights_18_read <= 1'b0;
    end
end

// int_weights_18_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_18_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_18_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_18_HIGH)
            int_weights_18_write <= 1'b1;
        else if (w_hs)
            int_weights_18_write <= 1'b0;
    end
end

// int_weights_19_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_19_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_19_BASE && raddr <= ADDR_WEIGHTS_19_HIGH)
            int_weights_19_read <= 1'b1;
        else
            int_weights_19_read <= 1'b0;
    end
end

// int_weights_19_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_19_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_19_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_19_HIGH)
            int_weights_19_write <= 1'b1;
        else if (w_hs)
            int_weights_19_write <= 1'b0;
    end
end

// int_weights_20_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_20_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_20_BASE && raddr <= ADDR_WEIGHTS_20_HIGH)
            int_weights_20_read <= 1'b1;
        else
            int_weights_20_read <= 1'b0;
    end
end

// int_weights_20_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_20_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_20_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_20_HIGH)
            int_weights_20_write <= 1'b1;
        else if (w_hs)
            int_weights_20_write <= 1'b0;
    end
end

// int_weights_21_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_21_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_21_BASE && raddr <= ADDR_WEIGHTS_21_HIGH)
            int_weights_21_read <= 1'b1;
        else
            int_weights_21_read <= 1'b0;
    end
end

// int_weights_21_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_21_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_21_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_21_HIGH)
            int_weights_21_write <= 1'b1;
        else if (w_hs)
            int_weights_21_write <= 1'b0;
    end
end

// int_weights_22_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_22_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_22_BASE && raddr <= ADDR_WEIGHTS_22_HIGH)
            int_weights_22_read <= 1'b1;
        else
            int_weights_22_read <= 1'b0;
    end
end

// int_weights_22_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_22_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_22_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_22_HIGH)
            int_weights_22_write <= 1'b1;
        else if (w_hs)
            int_weights_22_write <= 1'b0;
    end
end

// int_weights_23_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_23_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_23_BASE && raddr <= ADDR_WEIGHTS_23_HIGH)
            int_weights_23_read <= 1'b1;
        else
            int_weights_23_read <= 1'b0;
    end
end

// int_weights_23_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_23_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_23_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_23_HIGH)
            int_weights_23_write <= 1'b1;
        else if (w_hs)
            int_weights_23_write <= 1'b0;
    end
end

// int_weights_24_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_24_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_24_BASE && raddr <= ADDR_WEIGHTS_24_HIGH)
            int_weights_24_read <= 1'b1;
        else
            int_weights_24_read <= 1'b0;
    end
end

// int_weights_24_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_24_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_24_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_24_HIGH)
            int_weights_24_write <= 1'b1;
        else if (w_hs)
            int_weights_24_write <= 1'b0;
    end
end

// int_weights_25_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_25_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_25_BASE && raddr <= ADDR_WEIGHTS_25_HIGH)
            int_weights_25_read <= 1'b1;
        else
            int_weights_25_read <= 1'b0;
    end
end

// int_weights_25_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_25_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_25_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_25_HIGH)
            int_weights_25_write <= 1'b1;
        else if (w_hs)
            int_weights_25_write <= 1'b0;
    end
end

// int_weights_26_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_26_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_26_BASE && raddr <= ADDR_WEIGHTS_26_HIGH)
            int_weights_26_read <= 1'b1;
        else
            int_weights_26_read <= 1'b0;
    end
end

// int_weights_26_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_26_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_26_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_26_HIGH)
            int_weights_26_write <= 1'b1;
        else if (w_hs)
            int_weights_26_write <= 1'b0;
    end
end

// int_weights_27_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_27_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_27_BASE && raddr <= ADDR_WEIGHTS_27_HIGH)
            int_weights_27_read <= 1'b1;
        else
            int_weights_27_read <= 1'b0;
    end
end

// int_weights_27_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_27_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_27_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_27_HIGH)
            int_weights_27_write <= 1'b1;
        else if (w_hs)
            int_weights_27_write <= 1'b0;
    end
end

// int_weights_28_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_28_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_28_BASE && raddr <= ADDR_WEIGHTS_28_HIGH)
            int_weights_28_read <= 1'b1;
        else
            int_weights_28_read <= 1'b0;
    end
end

// int_weights_28_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_28_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_28_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_28_HIGH)
            int_weights_28_write <= 1'b1;
        else if (w_hs)
            int_weights_28_write <= 1'b0;
    end
end

// int_weights_29_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_29_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_29_BASE && raddr <= ADDR_WEIGHTS_29_HIGH)
            int_weights_29_read <= 1'b1;
        else
            int_weights_29_read <= 1'b0;
    end
end

// int_weights_29_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_29_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_29_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_29_HIGH)
            int_weights_29_write <= 1'b1;
        else if (w_hs)
            int_weights_29_write <= 1'b0;
    end
end

// int_weights_30_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_30_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_30_BASE && raddr <= ADDR_WEIGHTS_30_HIGH)
            int_weights_30_read <= 1'b1;
        else
            int_weights_30_read <= 1'b0;
    end
end

// int_weights_30_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_30_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_30_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_30_HIGH)
            int_weights_30_write <= 1'b1;
        else if (w_hs)
            int_weights_30_write <= 1'b0;
    end
end

// int_weights_31_read
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_31_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_WEIGHTS_31_BASE && raddr <= ADDR_WEIGHTS_31_HIGH)
            int_weights_31_read <= 1'b1;
        else
            int_weights_31_read <= 1'b0;
    end
end

// int_weights_31_write
always @(posedge ACLK) begin
    if (ARESET)
        int_weights_31_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_WEIGHTS_31_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_WEIGHTS_31_HIGH)
            int_weights_31_write <= 1'b1;
        else if (w_hs)
            int_weights_31_write <= 1'b0;
    end
end


endmodule


`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings="yes" *)
module dense_gemv_control_s_axi_ram
#(parameter
    MEM_STYLE  = "auto",
    MEM_TYPE   = "S2P",
    BYTE_WIDTH = 8,
    WIDTH  = 32,
    DEPTH  = 256,
    BYTES  = 4,
    AWIDTH = log2(DEPTH)
) (
    input  wire              clk0,
    input  wire [AWIDTH-1:0] address0,
    input  wire              ce0,
    input  wire [BYTES-1:0]  we0,
    input  wire [WIDTH-1:0]  d0,
    output reg  [WIDTH-1:0]  q0,
    input  wire              clk1,
    input  wire [AWIDTH-1:0] address1,
    input  wire              ce1,
    input  wire [BYTES-1:0]  we1,
    input  wire [WIDTH-1:0]  d1,
    output reg  [WIDTH-1:0]  q1
);
//------------------------ Parameters -------------------
localparam
    PORT0 = (MEM_TYPE == "S2P") ? "WO" : ((MEM_TYPE == "2P") ? "RO" : "RW"),
    PORT1 = (MEM_TYPE == "S2P") ? "RO" : "RW";
//------------------------Local signal-------------------
(* ram_style = MEM_STYLE*)
reg  [WIDTH-1:0] mem[0:DEPTH-1];
wire re0, re1;
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
generate
    if (MEM_STYLE == "hls_ultra" && PORT0 == "RW") begin
        assign re0 = ce0 & ~|we0;
    end else begin
        assign re0 = ce0;
    end
endgenerate

generate
    if (MEM_STYLE == "hls_ultra" && PORT1 == "RW") begin
        assign re1 = ce1 & ~|we1;
    end else begin
        assign re1 = ce1;
    end
endgenerate

// read port 0
generate if (PORT0 != "WO") begin
    always @(posedge clk0) begin
        if (re0) q0 <= mem[address0];
    end
end
endgenerate

// read port 1
generate if (PORT1 != "WO") begin
    always @(posedge clk1) begin
        if (re1) q1 <= mem[address1];
    end
end
endgenerate

integer i;
// write port 0
generate if (PORT0 != "RO") begin
    always @(posedge clk0) begin
        if (ce0)
        for (i = 0; i < BYTES; i = i + 1)
            if (we0[i])
                mem[address0][i*BYTE_WIDTH +: BYTE_WIDTH] <= d0[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

// write port 1
generate if (PORT1 != "RO") begin
    always @(posedge clk1) begin
        if (ce1)
        for (i = 0; i < BYTES; i = i + 1)
            if (we1[i])
                mem[address1][i*BYTE_WIDTH +: BYTE_WIDTH] <= d1[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

endmodule

