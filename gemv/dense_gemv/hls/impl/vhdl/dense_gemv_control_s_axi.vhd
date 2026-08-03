-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
-- Tool Version Limit: 2025.11
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity dense_gemv_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 13;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    num_rows              :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_0_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_0_ce0         :in   STD_LOGIC;
    weights_0_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_1_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_1_ce0         :in   STD_LOGIC;
    weights_1_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_2_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_2_ce0         :in   STD_LOGIC;
    weights_2_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_3_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_3_ce0         :in   STD_LOGIC;
    weights_3_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_4_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_4_ce0         :in   STD_LOGIC;
    weights_4_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_5_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_5_ce0         :in   STD_LOGIC;
    weights_5_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_6_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_6_ce0         :in   STD_LOGIC;
    weights_6_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_7_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_7_ce0         :in   STD_LOGIC;
    weights_7_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_8_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_8_ce0         :in   STD_LOGIC;
    weights_8_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_9_address0    :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_9_ce0         :in   STD_LOGIC;
    weights_9_q0          :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_10_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_10_ce0        :in   STD_LOGIC;
    weights_10_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_11_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_11_ce0        :in   STD_LOGIC;
    weights_11_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_12_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_12_ce0        :in   STD_LOGIC;
    weights_12_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_13_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_13_ce0        :in   STD_LOGIC;
    weights_13_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_14_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_14_ce0        :in   STD_LOGIC;
    weights_14_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_15_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_15_ce0        :in   STD_LOGIC;
    weights_15_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_16_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_16_ce0        :in   STD_LOGIC;
    weights_16_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_17_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_17_ce0        :in   STD_LOGIC;
    weights_17_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_18_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_18_ce0        :in   STD_LOGIC;
    weights_18_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_19_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_19_ce0        :in   STD_LOGIC;
    weights_19_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_20_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_20_ce0        :in   STD_LOGIC;
    weights_20_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_21_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_21_ce0        :in   STD_LOGIC;
    weights_21_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_22_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_22_ce0        :in   STD_LOGIC;
    weights_22_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_23_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_23_ce0        :in   STD_LOGIC;
    weights_23_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_24_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_24_ce0        :in   STD_LOGIC;
    weights_24_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_25_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_25_ce0        :in   STD_LOGIC;
    weights_25_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_26_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_26_ce0        :in   STD_LOGIC;
    weights_26_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_27_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_27_ce0        :in   STD_LOGIC;
    weights_27_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_28_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_28_ce0        :in   STD_LOGIC;
    weights_28_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_29_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_29_ce0        :in   STD_LOGIC;
    weights_29_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_30_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_30_ce0        :in   STD_LOGIC;
    weights_30_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    weights_31_address0   :in   STD_LOGIC_VECTOR(4 downto 0);
    weights_31_ce0        :in   STD_LOGIC;
    weights_31_q0         :out  STD_LOGIC_VECTOR(31 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
);
end entity dense_gemv_control_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_hs
--
-- 0x0000 : Control signals
--          bit 0  - ap_start (Read/Write/COH)
--          bit 1  - ap_done (Read/COR)
--          bit 2  - ap_idle (Read)
--          bit 3  - ap_ready (Read/COR)
--          bit 7  - auto_restart (Read/Write)
--          bit 9  - interrupt (Read)
--          others - reserved
-- 0x0004 : Global Interrupt Enable Register
--          bit 0  - Global Interrupt Enable (Read/Write)
--          others - reserved
-- 0x0008 : IP Interrupt Enable Register (Read/Write)
--          bit 0 - enable ap_done interrupt (Read/Write)
--          bit 1 - enable ap_ready interrupt (Read/Write)
--          others - reserved
-- 0x000c : IP Interrupt Status Register (Read/TOW)
--          bit 0 - ap_done (Read/TOW)
--          bit 1 - ap_ready (Read/TOW)
--          others - reserved
-- 0x0010 : Data signal of num_rows
--          bit 31~0 - num_rows[31:0] (Read/Write)
-- 0x0014 : reserved
-- 0x0080 ~
-- 0x00ff : Memory 'weights_0' (32 * 32b)
--          Word n : bit [31:0] - weights_0[n]
-- 0x0100 ~
-- 0x017f : Memory 'weights_1' (32 * 32b)
--          Word n : bit [31:0] - weights_1[n]
-- 0x0180 ~
-- 0x01ff : Memory 'weights_2' (32 * 32b)
--          Word n : bit [31:0] - weights_2[n]
-- 0x0200 ~
-- 0x027f : Memory 'weights_3' (32 * 32b)
--          Word n : bit [31:0] - weights_3[n]
-- 0x0280 ~
-- 0x02ff : Memory 'weights_4' (32 * 32b)
--          Word n : bit [31:0] - weights_4[n]
-- 0x0300 ~
-- 0x037f : Memory 'weights_5' (32 * 32b)
--          Word n : bit [31:0] - weights_5[n]
-- 0x0380 ~
-- 0x03ff : Memory 'weights_6' (32 * 32b)
--          Word n : bit [31:0] - weights_6[n]
-- 0x0400 ~
-- 0x047f : Memory 'weights_7' (32 * 32b)
--          Word n : bit [31:0] - weights_7[n]
-- 0x0480 ~
-- 0x04ff : Memory 'weights_8' (32 * 32b)
--          Word n : bit [31:0] - weights_8[n]
-- 0x0500 ~
-- 0x057f : Memory 'weights_9' (32 * 32b)
--          Word n : bit [31:0] - weights_9[n]
-- 0x0580 ~
-- 0x05ff : Memory 'weights_10' (32 * 32b)
--          Word n : bit [31:0] - weights_10[n]
-- 0x0600 ~
-- 0x067f : Memory 'weights_11' (32 * 32b)
--          Word n : bit [31:0] - weights_11[n]
-- 0x0680 ~
-- 0x06ff : Memory 'weights_12' (32 * 32b)
--          Word n : bit [31:0] - weights_12[n]
-- 0x0700 ~
-- 0x077f : Memory 'weights_13' (32 * 32b)
--          Word n : bit [31:0] - weights_13[n]
-- 0x0780 ~
-- 0x07ff : Memory 'weights_14' (32 * 32b)
--          Word n : bit [31:0] - weights_14[n]
-- 0x0800 ~
-- 0x087f : Memory 'weights_15' (32 * 32b)
--          Word n : bit [31:0] - weights_15[n]
-- 0x0880 ~
-- 0x08ff : Memory 'weights_16' (32 * 32b)
--          Word n : bit [31:0] - weights_16[n]
-- 0x0900 ~
-- 0x097f : Memory 'weights_17' (32 * 32b)
--          Word n : bit [31:0] - weights_17[n]
-- 0x0980 ~
-- 0x09ff : Memory 'weights_18' (32 * 32b)
--          Word n : bit [31:0] - weights_18[n]
-- 0x0a00 ~
-- 0x0a7f : Memory 'weights_19' (32 * 32b)
--          Word n : bit [31:0] - weights_19[n]
-- 0x0a80 ~
-- 0x0aff : Memory 'weights_20' (32 * 32b)
--          Word n : bit [31:0] - weights_20[n]
-- 0x0b00 ~
-- 0x0b7f : Memory 'weights_21' (32 * 32b)
--          Word n : bit [31:0] - weights_21[n]
-- 0x0b80 ~
-- 0x0bff : Memory 'weights_22' (32 * 32b)
--          Word n : bit [31:0] - weights_22[n]
-- 0x0c00 ~
-- 0x0c7f : Memory 'weights_23' (32 * 32b)
--          Word n : bit [31:0] - weights_23[n]
-- 0x0c80 ~
-- 0x0cff : Memory 'weights_24' (32 * 32b)
--          Word n : bit [31:0] - weights_24[n]
-- 0x0d00 ~
-- 0x0d7f : Memory 'weights_25' (32 * 32b)
--          Word n : bit [31:0] - weights_25[n]
-- 0x0d80 ~
-- 0x0dff : Memory 'weights_26' (32 * 32b)
--          Word n : bit [31:0] - weights_26[n]
-- 0x0e00 ~
-- 0x0e7f : Memory 'weights_27' (32 * 32b)
--          Word n : bit [31:0] - weights_27[n]
-- 0x0e80 ~
-- 0x0eff : Memory 'weights_28' (32 * 32b)
--          Word n : bit [31:0] - weights_28[n]
-- 0x0f00 ~
-- 0x0f7f : Memory 'weights_29' (32 * 32b)
--          Word n : bit [31:0] - weights_29[n]
-- 0x0f80 ~
-- 0x0fff : Memory 'weights_30' (32 * 32b)
--          Word n : bit [31:0] - weights_30[n]
-- 0x1000 ~
-- 0x107f : Memory 'weights_31' (32 * 32b)
--          Word n : bit [31:0] - weights_31[n]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of dense_gemv_control_s_axi is
attribute DowngradeIPIdentifiedWarnings : STRING;
attribute DowngradeIPIdentifiedWarnings of behave : architecture is "yes";
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL         : INTEGER := 16#0000#;
    constant ADDR_GIE             : INTEGER := 16#0004#;
    constant ADDR_IER             : INTEGER := 16#0008#;
    constant ADDR_ISR             : INTEGER := 16#000c#;
    constant ADDR_NUM_ROWS_DATA_0 : INTEGER := 16#0010#;
    constant ADDR_NUM_ROWS_CTRL   : INTEGER := 16#0014#;
    constant ADDR_WEIGHTS_0_BASE  : INTEGER := 16#0080#;
    constant ADDR_WEIGHTS_0_HIGH  : INTEGER := 16#00ff#;
    constant ADDR_WEIGHTS_1_BASE  : INTEGER := 16#0100#;
    constant ADDR_WEIGHTS_1_HIGH  : INTEGER := 16#017f#;
    constant ADDR_WEIGHTS_2_BASE  : INTEGER := 16#0180#;
    constant ADDR_WEIGHTS_2_HIGH  : INTEGER := 16#01ff#;
    constant ADDR_WEIGHTS_3_BASE  : INTEGER := 16#0200#;
    constant ADDR_WEIGHTS_3_HIGH  : INTEGER := 16#027f#;
    constant ADDR_WEIGHTS_4_BASE  : INTEGER := 16#0280#;
    constant ADDR_WEIGHTS_4_HIGH  : INTEGER := 16#02ff#;
    constant ADDR_WEIGHTS_5_BASE  : INTEGER := 16#0300#;
    constant ADDR_WEIGHTS_5_HIGH  : INTEGER := 16#037f#;
    constant ADDR_WEIGHTS_6_BASE  : INTEGER := 16#0380#;
    constant ADDR_WEIGHTS_6_HIGH  : INTEGER := 16#03ff#;
    constant ADDR_WEIGHTS_7_BASE  : INTEGER := 16#0400#;
    constant ADDR_WEIGHTS_7_HIGH  : INTEGER := 16#047f#;
    constant ADDR_WEIGHTS_8_BASE  : INTEGER := 16#0480#;
    constant ADDR_WEIGHTS_8_HIGH  : INTEGER := 16#04ff#;
    constant ADDR_WEIGHTS_9_BASE  : INTEGER := 16#0500#;
    constant ADDR_WEIGHTS_9_HIGH  : INTEGER := 16#057f#;
    constant ADDR_WEIGHTS_10_BASE : INTEGER := 16#0580#;
    constant ADDR_WEIGHTS_10_HIGH : INTEGER := 16#05ff#;
    constant ADDR_WEIGHTS_11_BASE : INTEGER := 16#0600#;
    constant ADDR_WEIGHTS_11_HIGH : INTEGER := 16#067f#;
    constant ADDR_WEIGHTS_12_BASE : INTEGER := 16#0680#;
    constant ADDR_WEIGHTS_12_HIGH : INTEGER := 16#06ff#;
    constant ADDR_WEIGHTS_13_BASE : INTEGER := 16#0700#;
    constant ADDR_WEIGHTS_13_HIGH : INTEGER := 16#077f#;
    constant ADDR_WEIGHTS_14_BASE : INTEGER := 16#0780#;
    constant ADDR_WEIGHTS_14_HIGH : INTEGER := 16#07ff#;
    constant ADDR_WEIGHTS_15_BASE : INTEGER := 16#0800#;
    constant ADDR_WEIGHTS_15_HIGH : INTEGER := 16#087f#;
    constant ADDR_WEIGHTS_16_BASE : INTEGER := 16#0880#;
    constant ADDR_WEIGHTS_16_HIGH : INTEGER := 16#08ff#;
    constant ADDR_WEIGHTS_17_BASE : INTEGER := 16#0900#;
    constant ADDR_WEIGHTS_17_HIGH : INTEGER := 16#097f#;
    constant ADDR_WEIGHTS_18_BASE : INTEGER := 16#0980#;
    constant ADDR_WEIGHTS_18_HIGH : INTEGER := 16#09ff#;
    constant ADDR_WEIGHTS_19_BASE : INTEGER := 16#0a00#;
    constant ADDR_WEIGHTS_19_HIGH : INTEGER := 16#0a7f#;
    constant ADDR_WEIGHTS_20_BASE : INTEGER := 16#0a80#;
    constant ADDR_WEIGHTS_20_HIGH : INTEGER := 16#0aff#;
    constant ADDR_WEIGHTS_21_BASE : INTEGER := 16#0b00#;
    constant ADDR_WEIGHTS_21_HIGH : INTEGER := 16#0b7f#;
    constant ADDR_WEIGHTS_22_BASE : INTEGER := 16#0b80#;
    constant ADDR_WEIGHTS_22_HIGH : INTEGER := 16#0bff#;
    constant ADDR_WEIGHTS_23_BASE : INTEGER := 16#0c00#;
    constant ADDR_WEIGHTS_23_HIGH : INTEGER := 16#0c7f#;
    constant ADDR_WEIGHTS_24_BASE : INTEGER := 16#0c80#;
    constant ADDR_WEIGHTS_24_HIGH : INTEGER := 16#0cff#;
    constant ADDR_WEIGHTS_25_BASE : INTEGER := 16#0d00#;
    constant ADDR_WEIGHTS_25_HIGH : INTEGER := 16#0d7f#;
    constant ADDR_WEIGHTS_26_BASE : INTEGER := 16#0d80#;
    constant ADDR_WEIGHTS_26_HIGH : INTEGER := 16#0dff#;
    constant ADDR_WEIGHTS_27_BASE : INTEGER := 16#0e00#;
    constant ADDR_WEIGHTS_27_HIGH : INTEGER := 16#0e7f#;
    constant ADDR_WEIGHTS_28_BASE : INTEGER := 16#0e80#;
    constant ADDR_WEIGHTS_28_HIGH : INTEGER := 16#0eff#;
    constant ADDR_WEIGHTS_29_BASE : INTEGER := 16#0f00#;
    constant ADDR_WEIGHTS_29_HIGH : INTEGER := 16#0f7f#;
    constant ADDR_WEIGHTS_30_BASE : INTEGER := 16#0f80#;
    constant ADDR_WEIGHTS_30_HIGH : INTEGER := 16#0fff#;
    constant ADDR_WEIGHTS_31_BASE : INTEGER := 16#1000#;
    constant ADDR_WEIGHTS_31_HIGH : INTEGER := 16#107f#;
    constant ADDR_BITS         : INTEGER := 13;

    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    signal BVALID_t            : STD_LOGIC;
    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    -- internal registers
    signal int_ap_idle         : STD_LOGIC := '0';
    signal int_ap_ready        : STD_LOGIC := '0';
    signal task_ap_ready       : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal task_ap_done        : STD_LOGIC;
    signal int_task_ap_done    : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_interrupt       : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal auto_restart_status : STD_LOGIC := '0';
    signal auto_restart_done   : STD_LOGIC;
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_num_rows        : UNSIGNED(31 downto 0) := (others => '0');
    -- memory signals
    signal int_weights_0_address0 : UNSIGNED(4 downto 0);
    signal int_weights_0_ce0   : STD_LOGIC;
    signal int_weights_0_q0    : UNSIGNED(31 downto 0);
    signal int_weights_0_address1 : UNSIGNED(4 downto 0);
    signal int_weights_0_ce1   : STD_LOGIC;
    signal int_weights_0_be1   : UNSIGNED(3 downto 0);
    signal int_weights_0_we1   : STD_LOGIC;
    signal int_weights_0_d1    : UNSIGNED(31 downto 0);
    signal int_weights_0_q1    : UNSIGNED(31 downto 0);
    signal int_weights_0_read  : STD_LOGIC;
    signal int_weights_0_write : STD_LOGIC;
    signal int_weights_1_address0 : UNSIGNED(4 downto 0);
    signal int_weights_1_ce0   : STD_LOGIC;
    signal int_weights_1_q0    : UNSIGNED(31 downto 0);
    signal int_weights_1_address1 : UNSIGNED(4 downto 0);
    signal int_weights_1_ce1   : STD_LOGIC;
    signal int_weights_1_be1   : UNSIGNED(3 downto 0);
    signal int_weights_1_we1   : STD_LOGIC;
    signal int_weights_1_d1    : UNSIGNED(31 downto 0);
    signal int_weights_1_q1    : UNSIGNED(31 downto 0);
    signal int_weights_1_read  : STD_LOGIC;
    signal int_weights_1_write : STD_LOGIC;
    signal int_weights_2_address0 : UNSIGNED(4 downto 0);
    signal int_weights_2_ce0   : STD_LOGIC;
    signal int_weights_2_q0    : UNSIGNED(31 downto 0);
    signal int_weights_2_address1 : UNSIGNED(4 downto 0);
    signal int_weights_2_ce1   : STD_LOGIC;
    signal int_weights_2_be1   : UNSIGNED(3 downto 0);
    signal int_weights_2_we1   : STD_LOGIC;
    signal int_weights_2_d1    : UNSIGNED(31 downto 0);
    signal int_weights_2_q1    : UNSIGNED(31 downto 0);
    signal int_weights_2_read  : STD_LOGIC;
    signal int_weights_2_write : STD_LOGIC;
    signal int_weights_3_address0 : UNSIGNED(4 downto 0);
    signal int_weights_3_ce0   : STD_LOGIC;
    signal int_weights_3_q0    : UNSIGNED(31 downto 0);
    signal int_weights_3_address1 : UNSIGNED(4 downto 0);
    signal int_weights_3_ce1   : STD_LOGIC;
    signal int_weights_3_be1   : UNSIGNED(3 downto 0);
    signal int_weights_3_we1   : STD_LOGIC;
    signal int_weights_3_d1    : UNSIGNED(31 downto 0);
    signal int_weights_3_q1    : UNSIGNED(31 downto 0);
    signal int_weights_3_read  : STD_LOGIC;
    signal int_weights_3_write : STD_LOGIC;
    signal int_weights_4_address0 : UNSIGNED(4 downto 0);
    signal int_weights_4_ce0   : STD_LOGIC;
    signal int_weights_4_q0    : UNSIGNED(31 downto 0);
    signal int_weights_4_address1 : UNSIGNED(4 downto 0);
    signal int_weights_4_ce1   : STD_LOGIC;
    signal int_weights_4_be1   : UNSIGNED(3 downto 0);
    signal int_weights_4_we1   : STD_LOGIC;
    signal int_weights_4_d1    : UNSIGNED(31 downto 0);
    signal int_weights_4_q1    : UNSIGNED(31 downto 0);
    signal int_weights_4_read  : STD_LOGIC;
    signal int_weights_4_write : STD_LOGIC;
    signal int_weights_5_address0 : UNSIGNED(4 downto 0);
    signal int_weights_5_ce0   : STD_LOGIC;
    signal int_weights_5_q0    : UNSIGNED(31 downto 0);
    signal int_weights_5_address1 : UNSIGNED(4 downto 0);
    signal int_weights_5_ce1   : STD_LOGIC;
    signal int_weights_5_be1   : UNSIGNED(3 downto 0);
    signal int_weights_5_we1   : STD_LOGIC;
    signal int_weights_5_d1    : UNSIGNED(31 downto 0);
    signal int_weights_5_q1    : UNSIGNED(31 downto 0);
    signal int_weights_5_read  : STD_LOGIC;
    signal int_weights_5_write : STD_LOGIC;
    signal int_weights_6_address0 : UNSIGNED(4 downto 0);
    signal int_weights_6_ce0   : STD_LOGIC;
    signal int_weights_6_q0    : UNSIGNED(31 downto 0);
    signal int_weights_6_address1 : UNSIGNED(4 downto 0);
    signal int_weights_6_ce1   : STD_LOGIC;
    signal int_weights_6_be1   : UNSIGNED(3 downto 0);
    signal int_weights_6_we1   : STD_LOGIC;
    signal int_weights_6_d1    : UNSIGNED(31 downto 0);
    signal int_weights_6_q1    : UNSIGNED(31 downto 0);
    signal int_weights_6_read  : STD_LOGIC;
    signal int_weights_6_write : STD_LOGIC;
    signal int_weights_7_address0 : UNSIGNED(4 downto 0);
    signal int_weights_7_ce0   : STD_LOGIC;
    signal int_weights_7_q0    : UNSIGNED(31 downto 0);
    signal int_weights_7_address1 : UNSIGNED(4 downto 0);
    signal int_weights_7_ce1   : STD_LOGIC;
    signal int_weights_7_be1   : UNSIGNED(3 downto 0);
    signal int_weights_7_we1   : STD_LOGIC;
    signal int_weights_7_d1    : UNSIGNED(31 downto 0);
    signal int_weights_7_q1    : UNSIGNED(31 downto 0);
    signal int_weights_7_read  : STD_LOGIC;
    signal int_weights_7_write : STD_LOGIC;
    signal int_weights_8_address0 : UNSIGNED(4 downto 0);
    signal int_weights_8_ce0   : STD_LOGIC;
    signal int_weights_8_q0    : UNSIGNED(31 downto 0);
    signal int_weights_8_address1 : UNSIGNED(4 downto 0);
    signal int_weights_8_ce1   : STD_LOGIC;
    signal int_weights_8_be1   : UNSIGNED(3 downto 0);
    signal int_weights_8_we1   : STD_LOGIC;
    signal int_weights_8_d1    : UNSIGNED(31 downto 0);
    signal int_weights_8_q1    : UNSIGNED(31 downto 0);
    signal int_weights_8_read  : STD_LOGIC;
    signal int_weights_8_write : STD_LOGIC;
    signal int_weights_9_address0 : UNSIGNED(4 downto 0);
    signal int_weights_9_ce0   : STD_LOGIC;
    signal int_weights_9_q0    : UNSIGNED(31 downto 0);
    signal int_weights_9_address1 : UNSIGNED(4 downto 0);
    signal int_weights_9_ce1   : STD_LOGIC;
    signal int_weights_9_be1   : UNSIGNED(3 downto 0);
    signal int_weights_9_we1   : STD_LOGIC;
    signal int_weights_9_d1    : UNSIGNED(31 downto 0);
    signal int_weights_9_q1    : UNSIGNED(31 downto 0);
    signal int_weights_9_read  : STD_LOGIC;
    signal int_weights_9_write : STD_LOGIC;
    signal int_weights_10_address0 : UNSIGNED(4 downto 0);
    signal int_weights_10_ce0  : STD_LOGIC;
    signal int_weights_10_q0   : UNSIGNED(31 downto 0);
    signal int_weights_10_address1 : UNSIGNED(4 downto 0);
    signal int_weights_10_ce1  : STD_LOGIC;
    signal int_weights_10_be1  : UNSIGNED(3 downto 0);
    signal int_weights_10_we1  : STD_LOGIC;
    signal int_weights_10_d1   : UNSIGNED(31 downto 0);
    signal int_weights_10_q1   : UNSIGNED(31 downto 0);
    signal int_weights_10_read : STD_LOGIC;
    signal int_weights_10_write : STD_LOGIC;
    signal int_weights_11_address0 : UNSIGNED(4 downto 0);
    signal int_weights_11_ce0  : STD_LOGIC;
    signal int_weights_11_q0   : UNSIGNED(31 downto 0);
    signal int_weights_11_address1 : UNSIGNED(4 downto 0);
    signal int_weights_11_ce1  : STD_LOGIC;
    signal int_weights_11_be1  : UNSIGNED(3 downto 0);
    signal int_weights_11_we1  : STD_LOGIC;
    signal int_weights_11_d1   : UNSIGNED(31 downto 0);
    signal int_weights_11_q1   : UNSIGNED(31 downto 0);
    signal int_weights_11_read : STD_LOGIC;
    signal int_weights_11_write : STD_LOGIC;
    signal int_weights_12_address0 : UNSIGNED(4 downto 0);
    signal int_weights_12_ce0  : STD_LOGIC;
    signal int_weights_12_q0   : UNSIGNED(31 downto 0);
    signal int_weights_12_address1 : UNSIGNED(4 downto 0);
    signal int_weights_12_ce1  : STD_LOGIC;
    signal int_weights_12_be1  : UNSIGNED(3 downto 0);
    signal int_weights_12_we1  : STD_LOGIC;
    signal int_weights_12_d1   : UNSIGNED(31 downto 0);
    signal int_weights_12_q1   : UNSIGNED(31 downto 0);
    signal int_weights_12_read : STD_LOGIC;
    signal int_weights_12_write : STD_LOGIC;
    signal int_weights_13_address0 : UNSIGNED(4 downto 0);
    signal int_weights_13_ce0  : STD_LOGIC;
    signal int_weights_13_q0   : UNSIGNED(31 downto 0);
    signal int_weights_13_address1 : UNSIGNED(4 downto 0);
    signal int_weights_13_ce1  : STD_LOGIC;
    signal int_weights_13_be1  : UNSIGNED(3 downto 0);
    signal int_weights_13_we1  : STD_LOGIC;
    signal int_weights_13_d1   : UNSIGNED(31 downto 0);
    signal int_weights_13_q1   : UNSIGNED(31 downto 0);
    signal int_weights_13_read : STD_LOGIC;
    signal int_weights_13_write : STD_LOGIC;
    signal int_weights_14_address0 : UNSIGNED(4 downto 0);
    signal int_weights_14_ce0  : STD_LOGIC;
    signal int_weights_14_q0   : UNSIGNED(31 downto 0);
    signal int_weights_14_address1 : UNSIGNED(4 downto 0);
    signal int_weights_14_ce1  : STD_LOGIC;
    signal int_weights_14_be1  : UNSIGNED(3 downto 0);
    signal int_weights_14_we1  : STD_LOGIC;
    signal int_weights_14_d1   : UNSIGNED(31 downto 0);
    signal int_weights_14_q1   : UNSIGNED(31 downto 0);
    signal int_weights_14_read : STD_LOGIC;
    signal int_weights_14_write : STD_LOGIC;
    signal int_weights_15_address0 : UNSIGNED(4 downto 0);
    signal int_weights_15_ce0  : STD_LOGIC;
    signal int_weights_15_q0   : UNSIGNED(31 downto 0);
    signal int_weights_15_address1 : UNSIGNED(4 downto 0);
    signal int_weights_15_ce1  : STD_LOGIC;
    signal int_weights_15_be1  : UNSIGNED(3 downto 0);
    signal int_weights_15_we1  : STD_LOGIC;
    signal int_weights_15_d1   : UNSIGNED(31 downto 0);
    signal int_weights_15_q1   : UNSIGNED(31 downto 0);
    signal int_weights_15_read : STD_LOGIC;
    signal int_weights_15_write : STD_LOGIC;
    signal int_weights_16_address0 : UNSIGNED(4 downto 0);
    signal int_weights_16_ce0  : STD_LOGIC;
    signal int_weights_16_q0   : UNSIGNED(31 downto 0);
    signal int_weights_16_address1 : UNSIGNED(4 downto 0);
    signal int_weights_16_ce1  : STD_LOGIC;
    signal int_weights_16_be1  : UNSIGNED(3 downto 0);
    signal int_weights_16_we1  : STD_LOGIC;
    signal int_weights_16_d1   : UNSIGNED(31 downto 0);
    signal int_weights_16_q1   : UNSIGNED(31 downto 0);
    signal int_weights_16_read : STD_LOGIC;
    signal int_weights_16_write : STD_LOGIC;
    signal int_weights_17_address0 : UNSIGNED(4 downto 0);
    signal int_weights_17_ce0  : STD_LOGIC;
    signal int_weights_17_q0   : UNSIGNED(31 downto 0);
    signal int_weights_17_address1 : UNSIGNED(4 downto 0);
    signal int_weights_17_ce1  : STD_LOGIC;
    signal int_weights_17_be1  : UNSIGNED(3 downto 0);
    signal int_weights_17_we1  : STD_LOGIC;
    signal int_weights_17_d1   : UNSIGNED(31 downto 0);
    signal int_weights_17_q1   : UNSIGNED(31 downto 0);
    signal int_weights_17_read : STD_LOGIC;
    signal int_weights_17_write : STD_LOGIC;
    signal int_weights_18_address0 : UNSIGNED(4 downto 0);
    signal int_weights_18_ce0  : STD_LOGIC;
    signal int_weights_18_q0   : UNSIGNED(31 downto 0);
    signal int_weights_18_address1 : UNSIGNED(4 downto 0);
    signal int_weights_18_ce1  : STD_LOGIC;
    signal int_weights_18_be1  : UNSIGNED(3 downto 0);
    signal int_weights_18_we1  : STD_LOGIC;
    signal int_weights_18_d1   : UNSIGNED(31 downto 0);
    signal int_weights_18_q1   : UNSIGNED(31 downto 0);
    signal int_weights_18_read : STD_LOGIC;
    signal int_weights_18_write : STD_LOGIC;
    signal int_weights_19_address0 : UNSIGNED(4 downto 0);
    signal int_weights_19_ce0  : STD_LOGIC;
    signal int_weights_19_q0   : UNSIGNED(31 downto 0);
    signal int_weights_19_address1 : UNSIGNED(4 downto 0);
    signal int_weights_19_ce1  : STD_LOGIC;
    signal int_weights_19_be1  : UNSIGNED(3 downto 0);
    signal int_weights_19_we1  : STD_LOGIC;
    signal int_weights_19_d1   : UNSIGNED(31 downto 0);
    signal int_weights_19_q1   : UNSIGNED(31 downto 0);
    signal int_weights_19_read : STD_LOGIC;
    signal int_weights_19_write : STD_LOGIC;
    signal int_weights_20_address0 : UNSIGNED(4 downto 0);
    signal int_weights_20_ce0  : STD_LOGIC;
    signal int_weights_20_q0   : UNSIGNED(31 downto 0);
    signal int_weights_20_address1 : UNSIGNED(4 downto 0);
    signal int_weights_20_ce1  : STD_LOGIC;
    signal int_weights_20_be1  : UNSIGNED(3 downto 0);
    signal int_weights_20_we1  : STD_LOGIC;
    signal int_weights_20_d1   : UNSIGNED(31 downto 0);
    signal int_weights_20_q1   : UNSIGNED(31 downto 0);
    signal int_weights_20_read : STD_LOGIC;
    signal int_weights_20_write : STD_LOGIC;
    signal int_weights_21_address0 : UNSIGNED(4 downto 0);
    signal int_weights_21_ce0  : STD_LOGIC;
    signal int_weights_21_q0   : UNSIGNED(31 downto 0);
    signal int_weights_21_address1 : UNSIGNED(4 downto 0);
    signal int_weights_21_ce1  : STD_LOGIC;
    signal int_weights_21_be1  : UNSIGNED(3 downto 0);
    signal int_weights_21_we1  : STD_LOGIC;
    signal int_weights_21_d1   : UNSIGNED(31 downto 0);
    signal int_weights_21_q1   : UNSIGNED(31 downto 0);
    signal int_weights_21_read : STD_LOGIC;
    signal int_weights_21_write : STD_LOGIC;
    signal int_weights_22_address0 : UNSIGNED(4 downto 0);
    signal int_weights_22_ce0  : STD_LOGIC;
    signal int_weights_22_q0   : UNSIGNED(31 downto 0);
    signal int_weights_22_address1 : UNSIGNED(4 downto 0);
    signal int_weights_22_ce1  : STD_LOGIC;
    signal int_weights_22_be1  : UNSIGNED(3 downto 0);
    signal int_weights_22_we1  : STD_LOGIC;
    signal int_weights_22_d1   : UNSIGNED(31 downto 0);
    signal int_weights_22_q1   : UNSIGNED(31 downto 0);
    signal int_weights_22_read : STD_LOGIC;
    signal int_weights_22_write : STD_LOGIC;
    signal int_weights_23_address0 : UNSIGNED(4 downto 0);
    signal int_weights_23_ce0  : STD_LOGIC;
    signal int_weights_23_q0   : UNSIGNED(31 downto 0);
    signal int_weights_23_address1 : UNSIGNED(4 downto 0);
    signal int_weights_23_ce1  : STD_LOGIC;
    signal int_weights_23_be1  : UNSIGNED(3 downto 0);
    signal int_weights_23_we1  : STD_LOGIC;
    signal int_weights_23_d1   : UNSIGNED(31 downto 0);
    signal int_weights_23_q1   : UNSIGNED(31 downto 0);
    signal int_weights_23_read : STD_LOGIC;
    signal int_weights_23_write : STD_LOGIC;
    signal int_weights_24_address0 : UNSIGNED(4 downto 0);
    signal int_weights_24_ce0  : STD_LOGIC;
    signal int_weights_24_q0   : UNSIGNED(31 downto 0);
    signal int_weights_24_address1 : UNSIGNED(4 downto 0);
    signal int_weights_24_ce1  : STD_LOGIC;
    signal int_weights_24_be1  : UNSIGNED(3 downto 0);
    signal int_weights_24_we1  : STD_LOGIC;
    signal int_weights_24_d1   : UNSIGNED(31 downto 0);
    signal int_weights_24_q1   : UNSIGNED(31 downto 0);
    signal int_weights_24_read : STD_LOGIC;
    signal int_weights_24_write : STD_LOGIC;
    signal int_weights_25_address0 : UNSIGNED(4 downto 0);
    signal int_weights_25_ce0  : STD_LOGIC;
    signal int_weights_25_q0   : UNSIGNED(31 downto 0);
    signal int_weights_25_address1 : UNSIGNED(4 downto 0);
    signal int_weights_25_ce1  : STD_LOGIC;
    signal int_weights_25_be1  : UNSIGNED(3 downto 0);
    signal int_weights_25_we1  : STD_LOGIC;
    signal int_weights_25_d1   : UNSIGNED(31 downto 0);
    signal int_weights_25_q1   : UNSIGNED(31 downto 0);
    signal int_weights_25_read : STD_LOGIC;
    signal int_weights_25_write : STD_LOGIC;
    signal int_weights_26_address0 : UNSIGNED(4 downto 0);
    signal int_weights_26_ce0  : STD_LOGIC;
    signal int_weights_26_q0   : UNSIGNED(31 downto 0);
    signal int_weights_26_address1 : UNSIGNED(4 downto 0);
    signal int_weights_26_ce1  : STD_LOGIC;
    signal int_weights_26_be1  : UNSIGNED(3 downto 0);
    signal int_weights_26_we1  : STD_LOGIC;
    signal int_weights_26_d1   : UNSIGNED(31 downto 0);
    signal int_weights_26_q1   : UNSIGNED(31 downto 0);
    signal int_weights_26_read : STD_LOGIC;
    signal int_weights_26_write : STD_LOGIC;
    signal int_weights_27_address0 : UNSIGNED(4 downto 0);
    signal int_weights_27_ce0  : STD_LOGIC;
    signal int_weights_27_q0   : UNSIGNED(31 downto 0);
    signal int_weights_27_address1 : UNSIGNED(4 downto 0);
    signal int_weights_27_ce1  : STD_LOGIC;
    signal int_weights_27_be1  : UNSIGNED(3 downto 0);
    signal int_weights_27_we1  : STD_LOGIC;
    signal int_weights_27_d1   : UNSIGNED(31 downto 0);
    signal int_weights_27_q1   : UNSIGNED(31 downto 0);
    signal int_weights_27_read : STD_LOGIC;
    signal int_weights_27_write : STD_LOGIC;
    signal int_weights_28_address0 : UNSIGNED(4 downto 0);
    signal int_weights_28_ce0  : STD_LOGIC;
    signal int_weights_28_q0   : UNSIGNED(31 downto 0);
    signal int_weights_28_address1 : UNSIGNED(4 downto 0);
    signal int_weights_28_ce1  : STD_LOGIC;
    signal int_weights_28_be1  : UNSIGNED(3 downto 0);
    signal int_weights_28_we1  : STD_LOGIC;
    signal int_weights_28_d1   : UNSIGNED(31 downto 0);
    signal int_weights_28_q1   : UNSIGNED(31 downto 0);
    signal int_weights_28_read : STD_LOGIC;
    signal int_weights_28_write : STD_LOGIC;
    signal int_weights_29_address0 : UNSIGNED(4 downto 0);
    signal int_weights_29_ce0  : STD_LOGIC;
    signal int_weights_29_q0   : UNSIGNED(31 downto 0);
    signal int_weights_29_address1 : UNSIGNED(4 downto 0);
    signal int_weights_29_ce1  : STD_LOGIC;
    signal int_weights_29_be1  : UNSIGNED(3 downto 0);
    signal int_weights_29_we1  : STD_LOGIC;
    signal int_weights_29_d1   : UNSIGNED(31 downto 0);
    signal int_weights_29_q1   : UNSIGNED(31 downto 0);
    signal int_weights_29_read : STD_LOGIC;
    signal int_weights_29_write : STD_LOGIC;
    signal int_weights_30_address0 : UNSIGNED(4 downto 0);
    signal int_weights_30_ce0  : STD_LOGIC;
    signal int_weights_30_q0   : UNSIGNED(31 downto 0);
    signal int_weights_30_address1 : UNSIGNED(4 downto 0);
    signal int_weights_30_ce1  : STD_LOGIC;
    signal int_weights_30_be1  : UNSIGNED(3 downto 0);
    signal int_weights_30_we1  : STD_LOGIC;
    signal int_weights_30_d1   : UNSIGNED(31 downto 0);
    signal int_weights_30_q1   : UNSIGNED(31 downto 0);
    signal int_weights_30_read : STD_LOGIC;
    signal int_weights_30_write : STD_LOGIC;
    signal int_weights_31_address0 : UNSIGNED(4 downto 0);
    signal int_weights_31_ce0  : STD_LOGIC;
    signal int_weights_31_q0   : UNSIGNED(31 downto 0);
    signal int_weights_31_address1 : UNSIGNED(4 downto 0);
    signal int_weights_31_ce1  : STD_LOGIC;
    signal int_weights_31_be1  : UNSIGNED(3 downto 0);
    signal int_weights_31_we1  : STD_LOGIC;
    signal int_weights_31_d1   : UNSIGNED(31 downto 0);
    signal int_weights_31_q1   : UNSIGNED(31 downto 0);
    signal int_weights_31_read : STD_LOGIC;
    signal int_weights_31_write : STD_LOGIC;

    component dense_gemv_control_s_axi_ram is
        generic (
            MEM_STYLE : STRING :="auto";
            MEM_TYPE  : STRING :="S2P";
            BYTE_WIDTH : INTEGER :=8;
            WIDTH   : INTEGER :=32;
            BYTES   : INTEGER :=4;
            DEPTH   : INTEGER :=256;
            AWIDTH  : INTEGER :=8);
        port (
            clk0    : in  STD_LOGIC;
            address0: in  UNSIGNED(AWIDTH-1 downto 0);
            ce0     : in  STD_LOGIC;
            we0     : in  UNSIGNED(BYTES-1 downto 0);
            d0      : in  UNSIGNED(WIDTH-1 downto 0);
            q0      : out UNSIGNED(WIDTH-1 downto 0);
            clk1    : in  STD_LOGIC;
            address1: in  UNSIGNED(AWIDTH-1 downto 0);
            ce1     : in  STD_LOGIC;
            we1     : in  UNSIGNED(BYTES-1 downto 0);
            d1      : in  UNSIGNED(WIDTH-1 downto 0);
            q1      : out UNSIGNED(WIDTH-1 downto 0));
    end component dense_gemv_control_s_axi_ram;

    function log2 (x : INTEGER) return INTEGER is
        variable n, m : INTEGER;
    begin
        n := 1;
        m := 2;
        while m < x loop
            n := n + 1;
            m := m * 2;
        end loop;
        return n;
    end function log2;

begin
-- ----------------------- Instantiation------------------
-- int_weights_0
int_weights_0 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_0_address0,
     ce0        => int_weights_0_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_0_q0,
     clk1       => ACLK,
     address1   => int_weights_0_address1,
     ce1        => int_weights_0_ce1,
     we1        => int_weights_0_be1,
     d1         => int_weights_0_d1,
     q1         => int_weights_0_q1);
-- int_weights_1
int_weights_1 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_1_address0,
     ce0        => int_weights_1_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_1_q0,
     clk1       => ACLK,
     address1   => int_weights_1_address1,
     ce1        => int_weights_1_ce1,
     we1        => int_weights_1_be1,
     d1         => int_weights_1_d1,
     q1         => int_weights_1_q1);
-- int_weights_2
int_weights_2 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_2_address0,
     ce0        => int_weights_2_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_2_q0,
     clk1       => ACLK,
     address1   => int_weights_2_address1,
     ce1        => int_weights_2_ce1,
     we1        => int_weights_2_be1,
     d1         => int_weights_2_d1,
     q1         => int_weights_2_q1);
-- int_weights_3
int_weights_3 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_3_address0,
     ce0        => int_weights_3_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_3_q0,
     clk1       => ACLK,
     address1   => int_weights_3_address1,
     ce1        => int_weights_3_ce1,
     we1        => int_weights_3_be1,
     d1         => int_weights_3_d1,
     q1         => int_weights_3_q1);
-- int_weights_4
int_weights_4 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_4_address0,
     ce0        => int_weights_4_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_4_q0,
     clk1       => ACLK,
     address1   => int_weights_4_address1,
     ce1        => int_weights_4_ce1,
     we1        => int_weights_4_be1,
     d1         => int_weights_4_d1,
     q1         => int_weights_4_q1);
-- int_weights_5
int_weights_5 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_5_address0,
     ce0        => int_weights_5_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_5_q0,
     clk1       => ACLK,
     address1   => int_weights_5_address1,
     ce1        => int_weights_5_ce1,
     we1        => int_weights_5_be1,
     d1         => int_weights_5_d1,
     q1         => int_weights_5_q1);
-- int_weights_6
int_weights_6 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_6_address0,
     ce0        => int_weights_6_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_6_q0,
     clk1       => ACLK,
     address1   => int_weights_6_address1,
     ce1        => int_weights_6_ce1,
     we1        => int_weights_6_be1,
     d1         => int_weights_6_d1,
     q1         => int_weights_6_q1);
-- int_weights_7
int_weights_7 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_7_address0,
     ce0        => int_weights_7_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_7_q0,
     clk1       => ACLK,
     address1   => int_weights_7_address1,
     ce1        => int_weights_7_ce1,
     we1        => int_weights_7_be1,
     d1         => int_weights_7_d1,
     q1         => int_weights_7_q1);
-- int_weights_8
int_weights_8 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_8_address0,
     ce0        => int_weights_8_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_8_q0,
     clk1       => ACLK,
     address1   => int_weights_8_address1,
     ce1        => int_weights_8_ce1,
     we1        => int_weights_8_be1,
     d1         => int_weights_8_d1,
     q1         => int_weights_8_q1);
-- int_weights_9
int_weights_9 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_9_address0,
     ce0        => int_weights_9_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_9_q0,
     clk1       => ACLK,
     address1   => int_weights_9_address1,
     ce1        => int_weights_9_ce1,
     we1        => int_weights_9_be1,
     d1         => int_weights_9_d1,
     q1         => int_weights_9_q1);
-- int_weights_10
int_weights_10 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_10_address0,
     ce0        => int_weights_10_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_10_q0,
     clk1       => ACLK,
     address1   => int_weights_10_address1,
     ce1        => int_weights_10_ce1,
     we1        => int_weights_10_be1,
     d1         => int_weights_10_d1,
     q1         => int_weights_10_q1);
-- int_weights_11
int_weights_11 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_11_address0,
     ce0        => int_weights_11_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_11_q0,
     clk1       => ACLK,
     address1   => int_weights_11_address1,
     ce1        => int_weights_11_ce1,
     we1        => int_weights_11_be1,
     d1         => int_weights_11_d1,
     q1         => int_weights_11_q1);
-- int_weights_12
int_weights_12 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_12_address0,
     ce0        => int_weights_12_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_12_q0,
     clk1       => ACLK,
     address1   => int_weights_12_address1,
     ce1        => int_weights_12_ce1,
     we1        => int_weights_12_be1,
     d1         => int_weights_12_d1,
     q1         => int_weights_12_q1);
-- int_weights_13
int_weights_13 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_13_address0,
     ce0        => int_weights_13_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_13_q0,
     clk1       => ACLK,
     address1   => int_weights_13_address1,
     ce1        => int_weights_13_ce1,
     we1        => int_weights_13_be1,
     d1         => int_weights_13_d1,
     q1         => int_weights_13_q1);
-- int_weights_14
int_weights_14 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_14_address0,
     ce0        => int_weights_14_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_14_q0,
     clk1       => ACLK,
     address1   => int_weights_14_address1,
     ce1        => int_weights_14_ce1,
     we1        => int_weights_14_be1,
     d1         => int_weights_14_d1,
     q1         => int_weights_14_q1);
-- int_weights_15
int_weights_15 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_15_address0,
     ce0        => int_weights_15_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_15_q0,
     clk1       => ACLK,
     address1   => int_weights_15_address1,
     ce1        => int_weights_15_ce1,
     we1        => int_weights_15_be1,
     d1         => int_weights_15_d1,
     q1         => int_weights_15_q1);
-- int_weights_16
int_weights_16 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_16_address0,
     ce0        => int_weights_16_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_16_q0,
     clk1       => ACLK,
     address1   => int_weights_16_address1,
     ce1        => int_weights_16_ce1,
     we1        => int_weights_16_be1,
     d1         => int_weights_16_d1,
     q1         => int_weights_16_q1);
-- int_weights_17
int_weights_17 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_17_address0,
     ce0        => int_weights_17_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_17_q0,
     clk1       => ACLK,
     address1   => int_weights_17_address1,
     ce1        => int_weights_17_ce1,
     we1        => int_weights_17_be1,
     d1         => int_weights_17_d1,
     q1         => int_weights_17_q1);
-- int_weights_18
int_weights_18 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_18_address0,
     ce0        => int_weights_18_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_18_q0,
     clk1       => ACLK,
     address1   => int_weights_18_address1,
     ce1        => int_weights_18_ce1,
     we1        => int_weights_18_be1,
     d1         => int_weights_18_d1,
     q1         => int_weights_18_q1);
-- int_weights_19
int_weights_19 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_19_address0,
     ce0        => int_weights_19_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_19_q0,
     clk1       => ACLK,
     address1   => int_weights_19_address1,
     ce1        => int_weights_19_ce1,
     we1        => int_weights_19_be1,
     d1         => int_weights_19_d1,
     q1         => int_weights_19_q1);
-- int_weights_20
int_weights_20 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_20_address0,
     ce0        => int_weights_20_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_20_q0,
     clk1       => ACLK,
     address1   => int_weights_20_address1,
     ce1        => int_weights_20_ce1,
     we1        => int_weights_20_be1,
     d1         => int_weights_20_d1,
     q1         => int_weights_20_q1);
-- int_weights_21
int_weights_21 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_21_address0,
     ce0        => int_weights_21_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_21_q0,
     clk1       => ACLK,
     address1   => int_weights_21_address1,
     ce1        => int_weights_21_ce1,
     we1        => int_weights_21_be1,
     d1         => int_weights_21_d1,
     q1         => int_weights_21_q1);
-- int_weights_22
int_weights_22 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_22_address0,
     ce0        => int_weights_22_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_22_q0,
     clk1       => ACLK,
     address1   => int_weights_22_address1,
     ce1        => int_weights_22_ce1,
     we1        => int_weights_22_be1,
     d1         => int_weights_22_d1,
     q1         => int_weights_22_q1);
-- int_weights_23
int_weights_23 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_23_address0,
     ce0        => int_weights_23_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_23_q0,
     clk1       => ACLK,
     address1   => int_weights_23_address1,
     ce1        => int_weights_23_ce1,
     we1        => int_weights_23_be1,
     d1         => int_weights_23_d1,
     q1         => int_weights_23_q1);
-- int_weights_24
int_weights_24 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_24_address0,
     ce0        => int_weights_24_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_24_q0,
     clk1       => ACLK,
     address1   => int_weights_24_address1,
     ce1        => int_weights_24_ce1,
     we1        => int_weights_24_be1,
     d1         => int_weights_24_d1,
     q1         => int_weights_24_q1);
-- int_weights_25
int_weights_25 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_25_address0,
     ce0        => int_weights_25_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_25_q0,
     clk1       => ACLK,
     address1   => int_weights_25_address1,
     ce1        => int_weights_25_ce1,
     we1        => int_weights_25_be1,
     d1         => int_weights_25_d1,
     q1         => int_weights_25_q1);
-- int_weights_26
int_weights_26 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_26_address0,
     ce0        => int_weights_26_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_26_q0,
     clk1       => ACLK,
     address1   => int_weights_26_address1,
     ce1        => int_weights_26_ce1,
     we1        => int_weights_26_be1,
     d1         => int_weights_26_d1,
     q1         => int_weights_26_q1);
-- int_weights_27
int_weights_27 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_27_address0,
     ce0        => int_weights_27_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_27_q0,
     clk1       => ACLK,
     address1   => int_weights_27_address1,
     ce1        => int_weights_27_ce1,
     we1        => int_weights_27_be1,
     d1         => int_weights_27_d1,
     q1         => int_weights_27_q1);
-- int_weights_28
int_weights_28 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_28_address0,
     ce0        => int_weights_28_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_28_q0,
     clk1       => ACLK,
     address1   => int_weights_28_address1,
     ce1        => int_weights_28_ce1,
     we1        => int_weights_28_be1,
     d1         => int_weights_28_d1,
     q1         => int_weights_28_q1);
-- int_weights_29
int_weights_29 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_29_address0,
     ce0        => int_weights_29_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_29_q0,
     clk1       => ACLK,
     address1   => int_weights_29_address1,
     ce1        => int_weights_29_ce1,
     we1        => int_weights_29_be1,
     d1         => int_weights_29_d1,
     q1         => int_weights_29_q1);
-- int_weights_30
int_weights_30 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_30_address0,
     ce0        => int_weights_30_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_30_q0,
     clk1       => ACLK,
     address1   => int_weights_30_address1,
     ce1        => int_weights_30_ce1,
     we1        => int_weights_30_be1,
     d1         => int_weights_30_d1,
     q1         => int_weights_30_q1);
-- int_weights_31
int_weights_31 : dense_gemv_control_s_axi_ram
generic map (
     MEM_STYLE  => "auto",
     MEM_TYPE   => "2P",
     BYTE_WIDTH => 8,
     WIDTH      => 32,
     BYTES      => 4,
     DEPTH      => 32,
     AWIDTH     => log2(32))
port map (
     clk0       => ACLK,
     address0   => int_weights_31_address0,
     ce0        => int_weights_31_ce0,
     we0        => (others=>'0'),
     d0         => (others=>'0'),
     q0         => int_weights_31_q0,
     clk1       => ACLK,
     address1   => int_weights_31_address1,
     ce1        => int_weights_31_ce1,
     we1        => int_weights_31_be1,
     d1         => int_weights_31_d1,
     q1         => int_weights_31_q1);


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata and ar_hs = '0' else '0';
    WREADY    <=  WREADY_t;
    BVALID_t  <=  '1' when wstate = wrresp else '0';
    BVALID    <=  BVALID_t;
    BRESP     <=  "00";  -- OKAY
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, w_hs, BREADY, BVALID_t)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (w_hs = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1' and BVALID_t = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 2) & (1 downto 0 => '0'));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) and (int_weights_0_read = '0') and (int_weights_1_read = '0') and (int_weights_2_read = '0') and (int_weights_3_read = '0') and (int_weights_4_read = '0') and (int_weights_5_read = '0') and (int_weights_6_read = '0') and (int_weights_7_read = '0') and (int_weights_8_read = '0') and (int_weights_9_read = '0') and (int_weights_10_read = '0') and (int_weights_11_read = '0') and (int_weights_12_read = '0') and (int_weights_13_read = '0') and (int_weights_14_read = '0') and (int_weights_15_read = '0') and (int_weights_16_read = '0') and (int_weights_17_read = '0') and (int_weights_18_read = '0') and (int_weights_19_read = '0') and (int_weights_20_read = '0') and (int_weights_21_read = '0') and (int_weights_22_read = '0') and (int_weights_23_read = '0') and (int_weights_24_read = '0') and (int_weights_25_read = '0') and (int_weights_26_read = '0') and (int_weights_27_read = '0') and (int_weights_28_read = '0') and (int_weights_29_read = '0') and (int_weights_30_read = '0') and (int_weights_31_read = '0') else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(9) <= int_interrupt;
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_task_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
                    when ADDR_NUM_ROWS_DATA_0 =>
                        rdata_data <= RESIZE(int_num_rows(31 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                elsif (int_weights_0_read = '1') then
                    rdata_data <= RESIZE(int_weights_0_q1, 32);
                elsif (int_weights_1_read = '1') then
                    rdata_data <= RESIZE(int_weights_1_q1, 32);
                elsif (int_weights_2_read = '1') then
                    rdata_data <= RESIZE(int_weights_2_q1, 32);
                elsif (int_weights_3_read = '1') then
                    rdata_data <= RESIZE(int_weights_3_q1, 32);
                elsif (int_weights_4_read = '1') then
                    rdata_data <= RESIZE(int_weights_4_q1, 32);
                elsif (int_weights_5_read = '1') then
                    rdata_data <= RESIZE(int_weights_5_q1, 32);
                elsif (int_weights_6_read = '1') then
                    rdata_data <= RESIZE(int_weights_6_q1, 32);
                elsif (int_weights_7_read = '1') then
                    rdata_data <= RESIZE(int_weights_7_q1, 32);
                elsif (int_weights_8_read = '1') then
                    rdata_data <= RESIZE(int_weights_8_q1, 32);
                elsif (int_weights_9_read = '1') then
                    rdata_data <= RESIZE(int_weights_9_q1, 32);
                elsif (int_weights_10_read = '1') then
                    rdata_data <= RESIZE(int_weights_10_q1, 32);
                elsif (int_weights_11_read = '1') then
                    rdata_data <= RESIZE(int_weights_11_q1, 32);
                elsif (int_weights_12_read = '1') then
                    rdata_data <= RESIZE(int_weights_12_q1, 32);
                elsif (int_weights_13_read = '1') then
                    rdata_data <= RESIZE(int_weights_13_q1, 32);
                elsif (int_weights_14_read = '1') then
                    rdata_data <= RESIZE(int_weights_14_q1, 32);
                elsif (int_weights_15_read = '1') then
                    rdata_data <= RESIZE(int_weights_15_q1, 32);
                elsif (int_weights_16_read = '1') then
                    rdata_data <= RESIZE(int_weights_16_q1, 32);
                elsif (int_weights_17_read = '1') then
                    rdata_data <= RESIZE(int_weights_17_q1, 32);
                elsif (int_weights_18_read = '1') then
                    rdata_data <= RESIZE(int_weights_18_q1, 32);
                elsif (int_weights_19_read = '1') then
                    rdata_data <= RESIZE(int_weights_19_q1, 32);
                elsif (int_weights_20_read = '1') then
                    rdata_data <= RESIZE(int_weights_20_q1, 32);
                elsif (int_weights_21_read = '1') then
                    rdata_data <= RESIZE(int_weights_21_q1, 32);
                elsif (int_weights_22_read = '1') then
                    rdata_data <= RESIZE(int_weights_22_q1, 32);
                elsif (int_weights_23_read = '1') then
                    rdata_data <= RESIZE(int_weights_23_q1, 32);
                elsif (int_weights_24_read = '1') then
                    rdata_data <= RESIZE(int_weights_24_q1, 32);
                elsif (int_weights_25_read = '1') then
                    rdata_data <= RESIZE(int_weights_25_q1, 32);
                elsif (int_weights_26_read = '1') then
                    rdata_data <= RESIZE(int_weights_26_q1, 32);
                elsif (int_weights_27_read = '1') then
                    rdata_data <= RESIZE(int_weights_27_q1, 32);
                elsif (int_weights_28_read = '1') then
                    rdata_data <= RESIZE(int_weights_28_q1, 32);
                elsif (int_weights_29_read = '1') then
                    rdata_data <= RESIZE(int_weights_29_q1, 32);
                elsif (int_weights_30_read = '1') then
                    rdata_data <= RESIZE(int_weights_30_q1, 32);
                elsif (int_weights_31_read = '1') then
                    rdata_data <= RESIZE(int_weights_31_q1, 32);
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_interrupt;
    ap_start             <= int_ap_start;
    task_ap_done         <= (ap_done and not auto_restart_status) or auto_restart_done;
    task_ap_ready        <= ap_ready and not int_auto_restart;
    auto_restart_done    <= auto_restart_status and (ap_idle and not int_ap_idle);
    num_rows             <= STD_LOGIC_VECTOR(int_num_rows);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_interrupt <= '0';
            elsif (ACLK_EN = '1') then
                if (int_gie = '1' and (int_isr(0) or int_isr(1)) = '1') then
                    int_interrupt <= '1';
                else
                    int_interrupt <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_done <= ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_task_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_done = '1') then
                    int_task_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_task_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_ready = '1') then
                    int_ap_ready <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_status <= '0';
            elsif (ACLK_EN = '1') then
                if (int_auto_restart = '1') then
                    auto_restart_status <= '1';
                elsif (ap_idle = '1') then
                    auto_restart_status <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_num_rows(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NUM_ROWS_DATA_0) then
                    int_num_rows(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_num_rows(31 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------
    -- weights_0
    int_weights_0_address0 <= RESIZE(UNSIGNED(weights_0_address0), 5);
    int_weights_0_ce0    <= weights_0_ce0;
    weights_0_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_0_q0, 32));
    int_weights_0_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_0_ce1    <= '1' when ar_hs = '1' or (int_weights_0_write = '1' and WVALID  = '1') else '0';
    int_weights_0_we1    <= '1' when int_weights_0_write = '1' and w_hs = '1' else '0';
    int_weights_0_be1    <= UNSIGNED(WSTRB) when int_weights_0_we1 = '1' else (others=>'0');
    int_weights_0_d1     <= UNSIGNED(WDATA);
    -- weights_1
    int_weights_1_address0 <= RESIZE(UNSIGNED(weights_1_address0), 5);
    int_weights_1_ce0    <= weights_1_ce0;
    weights_1_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_1_q0, 32));
    int_weights_1_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_1_ce1    <= '1' when ar_hs = '1' or (int_weights_1_write = '1' and WVALID  = '1') else '0';
    int_weights_1_we1    <= '1' when int_weights_1_write = '1' and w_hs = '1' else '0';
    int_weights_1_be1    <= UNSIGNED(WSTRB) when int_weights_1_we1 = '1' else (others=>'0');
    int_weights_1_d1     <= UNSIGNED(WDATA);
    -- weights_2
    int_weights_2_address0 <= RESIZE(UNSIGNED(weights_2_address0), 5);
    int_weights_2_ce0    <= weights_2_ce0;
    weights_2_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_2_q0, 32));
    int_weights_2_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_2_ce1    <= '1' when ar_hs = '1' or (int_weights_2_write = '1' and WVALID  = '1') else '0';
    int_weights_2_we1    <= '1' when int_weights_2_write = '1' and w_hs = '1' else '0';
    int_weights_2_be1    <= UNSIGNED(WSTRB) when int_weights_2_we1 = '1' else (others=>'0');
    int_weights_2_d1     <= UNSIGNED(WDATA);
    -- weights_3
    int_weights_3_address0 <= RESIZE(UNSIGNED(weights_3_address0), 5);
    int_weights_3_ce0    <= weights_3_ce0;
    weights_3_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_3_q0, 32));
    int_weights_3_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_3_ce1    <= '1' when ar_hs = '1' or (int_weights_3_write = '1' and WVALID  = '1') else '0';
    int_weights_3_we1    <= '1' when int_weights_3_write = '1' and w_hs = '1' else '0';
    int_weights_3_be1    <= UNSIGNED(WSTRB) when int_weights_3_we1 = '1' else (others=>'0');
    int_weights_3_d1     <= UNSIGNED(WDATA);
    -- weights_4
    int_weights_4_address0 <= RESIZE(UNSIGNED(weights_4_address0), 5);
    int_weights_4_ce0    <= weights_4_ce0;
    weights_4_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_4_q0, 32));
    int_weights_4_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_4_ce1    <= '1' when ar_hs = '1' or (int_weights_4_write = '1' and WVALID  = '1') else '0';
    int_weights_4_we1    <= '1' when int_weights_4_write = '1' and w_hs = '1' else '0';
    int_weights_4_be1    <= UNSIGNED(WSTRB) when int_weights_4_we1 = '1' else (others=>'0');
    int_weights_4_d1     <= UNSIGNED(WDATA);
    -- weights_5
    int_weights_5_address0 <= RESIZE(UNSIGNED(weights_5_address0), 5);
    int_weights_5_ce0    <= weights_5_ce0;
    weights_5_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_5_q0, 32));
    int_weights_5_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_5_ce1    <= '1' when ar_hs = '1' or (int_weights_5_write = '1' and WVALID  = '1') else '0';
    int_weights_5_we1    <= '1' when int_weights_5_write = '1' and w_hs = '1' else '0';
    int_weights_5_be1    <= UNSIGNED(WSTRB) when int_weights_5_we1 = '1' else (others=>'0');
    int_weights_5_d1     <= UNSIGNED(WDATA);
    -- weights_6
    int_weights_6_address0 <= RESIZE(UNSIGNED(weights_6_address0), 5);
    int_weights_6_ce0    <= weights_6_ce0;
    weights_6_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_6_q0, 32));
    int_weights_6_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_6_ce1    <= '1' when ar_hs = '1' or (int_weights_6_write = '1' and WVALID  = '1') else '0';
    int_weights_6_we1    <= '1' when int_weights_6_write = '1' and w_hs = '1' else '0';
    int_weights_6_be1    <= UNSIGNED(WSTRB) when int_weights_6_we1 = '1' else (others=>'0');
    int_weights_6_d1     <= UNSIGNED(WDATA);
    -- weights_7
    int_weights_7_address0 <= RESIZE(UNSIGNED(weights_7_address0), 5);
    int_weights_7_ce0    <= weights_7_ce0;
    weights_7_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_7_q0, 32));
    int_weights_7_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_7_ce1    <= '1' when ar_hs = '1' or (int_weights_7_write = '1' and WVALID  = '1') else '0';
    int_weights_7_we1    <= '1' when int_weights_7_write = '1' and w_hs = '1' else '0';
    int_weights_7_be1    <= UNSIGNED(WSTRB) when int_weights_7_we1 = '1' else (others=>'0');
    int_weights_7_d1     <= UNSIGNED(WDATA);
    -- weights_8
    int_weights_8_address0 <= RESIZE(UNSIGNED(weights_8_address0), 5);
    int_weights_8_ce0    <= weights_8_ce0;
    weights_8_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_8_q0, 32));
    int_weights_8_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_8_ce1    <= '1' when ar_hs = '1' or (int_weights_8_write = '1' and WVALID  = '1') else '0';
    int_weights_8_we1    <= '1' when int_weights_8_write = '1' and w_hs = '1' else '0';
    int_weights_8_be1    <= UNSIGNED(WSTRB) when int_weights_8_we1 = '1' else (others=>'0');
    int_weights_8_d1     <= UNSIGNED(WDATA);
    -- weights_9
    int_weights_9_address0 <= RESIZE(UNSIGNED(weights_9_address0), 5);
    int_weights_9_ce0    <= weights_9_ce0;
    weights_9_q0         <= STD_LOGIC_VECTOR(RESIZE(int_weights_9_q0, 32));
    int_weights_9_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_9_ce1    <= '1' when ar_hs = '1' or (int_weights_9_write = '1' and WVALID  = '1') else '0';
    int_weights_9_we1    <= '1' when int_weights_9_write = '1' and w_hs = '1' else '0';
    int_weights_9_be1    <= UNSIGNED(WSTRB) when int_weights_9_we1 = '1' else (others=>'0');
    int_weights_9_d1     <= UNSIGNED(WDATA);
    -- weights_10
    int_weights_10_address0 <= RESIZE(UNSIGNED(weights_10_address0), 5);
    int_weights_10_ce0   <= weights_10_ce0;
    weights_10_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_10_q0, 32));
    int_weights_10_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_10_ce1   <= '1' when ar_hs = '1' or (int_weights_10_write = '1' and WVALID  = '1') else '0';
    int_weights_10_we1   <= '1' when int_weights_10_write = '1' and w_hs = '1' else '0';
    int_weights_10_be1   <= UNSIGNED(WSTRB) when int_weights_10_we1 = '1' else (others=>'0');
    int_weights_10_d1    <= UNSIGNED(WDATA);
    -- weights_11
    int_weights_11_address0 <= RESIZE(UNSIGNED(weights_11_address0), 5);
    int_weights_11_ce0   <= weights_11_ce0;
    weights_11_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_11_q0, 32));
    int_weights_11_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_11_ce1   <= '1' when ar_hs = '1' or (int_weights_11_write = '1' and WVALID  = '1') else '0';
    int_weights_11_we1   <= '1' when int_weights_11_write = '1' and w_hs = '1' else '0';
    int_weights_11_be1   <= UNSIGNED(WSTRB) when int_weights_11_we1 = '1' else (others=>'0');
    int_weights_11_d1    <= UNSIGNED(WDATA);
    -- weights_12
    int_weights_12_address0 <= RESIZE(UNSIGNED(weights_12_address0), 5);
    int_weights_12_ce0   <= weights_12_ce0;
    weights_12_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_12_q0, 32));
    int_weights_12_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_12_ce1   <= '1' when ar_hs = '1' or (int_weights_12_write = '1' and WVALID  = '1') else '0';
    int_weights_12_we1   <= '1' when int_weights_12_write = '1' and w_hs = '1' else '0';
    int_weights_12_be1   <= UNSIGNED(WSTRB) when int_weights_12_we1 = '1' else (others=>'0');
    int_weights_12_d1    <= UNSIGNED(WDATA);
    -- weights_13
    int_weights_13_address0 <= RESIZE(UNSIGNED(weights_13_address0), 5);
    int_weights_13_ce0   <= weights_13_ce0;
    weights_13_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_13_q0, 32));
    int_weights_13_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_13_ce1   <= '1' when ar_hs = '1' or (int_weights_13_write = '1' and WVALID  = '1') else '0';
    int_weights_13_we1   <= '1' when int_weights_13_write = '1' and w_hs = '1' else '0';
    int_weights_13_be1   <= UNSIGNED(WSTRB) when int_weights_13_we1 = '1' else (others=>'0');
    int_weights_13_d1    <= UNSIGNED(WDATA);
    -- weights_14
    int_weights_14_address0 <= RESIZE(UNSIGNED(weights_14_address0), 5);
    int_weights_14_ce0   <= weights_14_ce0;
    weights_14_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_14_q0, 32));
    int_weights_14_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_14_ce1   <= '1' when ar_hs = '1' or (int_weights_14_write = '1' and WVALID  = '1') else '0';
    int_weights_14_we1   <= '1' when int_weights_14_write = '1' and w_hs = '1' else '0';
    int_weights_14_be1   <= UNSIGNED(WSTRB) when int_weights_14_we1 = '1' else (others=>'0');
    int_weights_14_d1    <= UNSIGNED(WDATA);
    -- weights_15
    int_weights_15_address0 <= RESIZE(UNSIGNED(weights_15_address0), 5);
    int_weights_15_ce0   <= weights_15_ce0;
    weights_15_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_15_q0, 32));
    int_weights_15_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_15_ce1   <= '1' when ar_hs = '1' or (int_weights_15_write = '1' and WVALID  = '1') else '0';
    int_weights_15_we1   <= '1' when int_weights_15_write = '1' and w_hs = '1' else '0';
    int_weights_15_be1   <= UNSIGNED(WSTRB) when int_weights_15_we1 = '1' else (others=>'0');
    int_weights_15_d1    <= UNSIGNED(WDATA);
    -- weights_16
    int_weights_16_address0 <= RESIZE(UNSIGNED(weights_16_address0), 5);
    int_weights_16_ce0   <= weights_16_ce0;
    weights_16_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_16_q0, 32));
    int_weights_16_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_16_ce1   <= '1' when ar_hs = '1' or (int_weights_16_write = '1' and WVALID  = '1') else '0';
    int_weights_16_we1   <= '1' when int_weights_16_write = '1' and w_hs = '1' else '0';
    int_weights_16_be1   <= UNSIGNED(WSTRB) when int_weights_16_we1 = '1' else (others=>'0');
    int_weights_16_d1    <= UNSIGNED(WDATA);
    -- weights_17
    int_weights_17_address0 <= RESIZE(UNSIGNED(weights_17_address0), 5);
    int_weights_17_ce0   <= weights_17_ce0;
    weights_17_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_17_q0, 32));
    int_weights_17_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_17_ce1   <= '1' when ar_hs = '1' or (int_weights_17_write = '1' and WVALID  = '1') else '0';
    int_weights_17_we1   <= '1' when int_weights_17_write = '1' and w_hs = '1' else '0';
    int_weights_17_be1   <= UNSIGNED(WSTRB) when int_weights_17_we1 = '1' else (others=>'0');
    int_weights_17_d1    <= UNSIGNED(WDATA);
    -- weights_18
    int_weights_18_address0 <= RESIZE(UNSIGNED(weights_18_address0), 5);
    int_weights_18_ce0   <= weights_18_ce0;
    weights_18_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_18_q0, 32));
    int_weights_18_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_18_ce1   <= '1' when ar_hs = '1' or (int_weights_18_write = '1' and WVALID  = '1') else '0';
    int_weights_18_we1   <= '1' when int_weights_18_write = '1' and w_hs = '1' else '0';
    int_weights_18_be1   <= UNSIGNED(WSTRB) when int_weights_18_we1 = '1' else (others=>'0');
    int_weights_18_d1    <= UNSIGNED(WDATA);
    -- weights_19
    int_weights_19_address0 <= RESIZE(UNSIGNED(weights_19_address0), 5);
    int_weights_19_ce0   <= weights_19_ce0;
    weights_19_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_19_q0, 32));
    int_weights_19_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_19_ce1   <= '1' when ar_hs = '1' or (int_weights_19_write = '1' and WVALID  = '1') else '0';
    int_weights_19_we1   <= '1' when int_weights_19_write = '1' and w_hs = '1' else '0';
    int_weights_19_be1   <= UNSIGNED(WSTRB) when int_weights_19_we1 = '1' else (others=>'0');
    int_weights_19_d1    <= UNSIGNED(WDATA);
    -- weights_20
    int_weights_20_address0 <= RESIZE(UNSIGNED(weights_20_address0), 5);
    int_weights_20_ce0   <= weights_20_ce0;
    weights_20_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_20_q0, 32));
    int_weights_20_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_20_ce1   <= '1' when ar_hs = '1' or (int_weights_20_write = '1' and WVALID  = '1') else '0';
    int_weights_20_we1   <= '1' when int_weights_20_write = '1' and w_hs = '1' else '0';
    int_weights_20_be1   <= UNSIGNED(WSTRB) when int_weights_20_we1 = '1' else (others=>'0');
    int_weights_20_d1    <= UNSIGNED(WDATA);
    -- weights_21
    int_weights_21_address0 <= RESIZE(UNSIGNED(weights_21_address0), 5);
    int_weights_21_ce0   <= weights_21_ce0;
    weights_21_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_21_q0, 32));
    int_weights_21_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_21_ce1   <= '1' when ar_hs = '1' or (int_weights_21_write = '1' and WVALID  = '1') else '0';
    int_weights_21_we1   <= '1' when int_weights_21_write = '1' and w_hs = '1' else '0';
    int_weights_21_be1   <= UNSIGNED(WSTRB) when int_weights_21_we1 = '1' else (others=>'0');
    int_weights_21_d1    <= UNSIGNED(WDATA);
    -- weights_22
    int_weights_22_address0 <= RESIZE(UNSIGNED(weights_22_address0), 5);
    int_weights_22_ce0   <= weights_22_ce0;
    weights_22_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_22_q0, 32));
    int_weights_22_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_22_ce1   <= '1' when ar_hs = '1' or (int_weights_22_write = '1' and WVALID  = '1') else '0';
    int_weights_22_we1   <= '1' when int_weights_22_write = '1' and w_hs = '1' else '0';
    int_weights_22_be1   <= UNSIGNED(WSTRB) when int_weights_22_we1 = '1' else (others=>'0');
    int_weights_22_d1    <= UNSIGNED(WDATA);
    -- weights_23
    int_weights_23_address0 <= RESIZE(UNSIGNED(weights_23_address0), 5);
    int_weights_23_ce0   <= weights_23_ce0;
    weights_23_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_23_q0, 32));
    int_weights_23_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_23_ce1   <= '1' when ar_hs = '1' or (int_weights_23_write = '1' and WVALID  = '1') else '0';
    int_weights_23_we1   <= '1' when int_weights_23_write = '1' and w_hs = '1' else '0';
    int_weights_23_be1   <= UNSIGNED(WSTRB) when int_weights_23_we1 = '1' else (others=>'0');
    int_weights_23_d1    <= UNSIGNED(WDATA);
    -- weights_24
    int_weights_24_address0 <= RESIZE(UNSIGNED(weights_24_address0), 5);
    int_weights_24_ce0   <= weights_24_ce0;
    weights_24_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_24_q0, 32));
    int_weights_24_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_24_ce1   <= '1' when ar_hs = '1' or (int_weights_24_write = '1' and WVALID  = '1') else '0';
    int_weights_24_we1   <= '1' when int_weights_24_write = '1' and w_hs = '1' else '0';
    int_weights_24_be1   <= UNSIGNED(WSTRB) when int_weights_24_we1 = '1' else (others=>'0');
    int_weights_24_d1    <= UNSIGNED(WDATA);
    -- weights_25
    int_weights_25_address0 <= RESIZE(UNSIGNED(weights_25_address0), 5);
    int_weights_25_ce0   <= weights_25_ce0;
    weights_25_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_25_q0, 32));
    int_weights_25_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_25_ce1   <= '1' when ar_hs = '1' or (int_weights_25_write = '1' and WVALID  = '1') else '0';
    int_weights_25_we1   <= '1' when int_weights_25_write = '1' and w_hs = '1' else '0';
    int_weights_25_be1   <= UNSIGNED(WSTRB) when int_weights_25_we1 = '1' else (others=>'0');
    int_weights_25_d1    <= UNSIGNED(WDATA);
    -- weights_26
    int_weights_26_address0 <= RESIZE(UNSIGNED(weights_26_address0), 5);
    int_weights_26_ce0   <= weights_26_ce0;
    weights_26_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_26_q0, 32));
    int_weights_26_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_26_ce1   <= '1' when ar_hs = '1' or (int_weights_26_write = '1' and WVALID  = '1') else '0';
    int_weights_26_we1   <= '1' when int_weights_26_write = '1' and w_hs = '1' else '0';
    int_weights_26_be1   <= UNSIGNED(WSTRB) when int_weights_26_we1 = '1' else (others=>'0');
    int_weights_26_d1    <= UNSIGNED(WDATA);
    -- weights_27
    int_weights_27_address0 <= RESIZE(UNSIGNED(weights_27_address0), 5);
    int_weights_27_ce0   <= weights_27_ce0;
    weights_27_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_27_q0, 32));
    int_weights_27_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_27_ce1   <= '1' when ar_hs = '1' or (int_weights_27_write = '1' and WVALID  = '1') else '0';
    int_weights_27_we1   <= '1' when int_weights_27_write = '1' and w_hs = '1' else '0';
    int_weights_27_be1   <= UNSIGNED(WSTRB) when int_weights_27_we1 = '1' else (others=>'0');
    int_weights_27_d1    <= UNSIGNED(WDATA);
    -- weights_28
    int_weights_28_address0 <= RESIZE(UNSIGNED(weights_28_address0), 5);
    int_weights_28_ce0   <= weights_28_ce0;
    weights_28_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_28_q0, 32));
    int_weights_28_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_28_ce1   <= '1' when ar_hs = '1' or (int_weights_28_write = '1' and WVALID  = '1') else '0';
    int_weights_28_we1   <= '1' when int_weights_28_write = '1' and w_hs = '1' else '0';
    int_weights_28_be1   <= UNSIGNED(WSTRB) when int_weights_28_we1 = '1' else (others=>'0');
    int_weights_28_d1    <= UNSIGNED(WDATA);
    -- weights_29
    int_weights_29_address0 <= RESIZE(UNSIGNED(weights_29_address0), 5);
    int_weights_29_ce0   <= weights_29_ce0;
    weights_29_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_29_q0, 32));
    int_weights_29_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_29_ce1   <= '1' when ar_hs = '1' or (int_weights_29_write = '1' and WVALID  = '1') else '0';
    int_weights_29_we1   <= '1' when int_weights_29_write = '1' and w_hs = '1' else '0';
    int_weights_29_be1   <= UNSIGNED(WSTRB) when int_weights_29_we1 = '1' else (others=>'0');
    int_weights_29_d1    <= UNSIGNED(WDATA);
    -- weights_30
    int_weights_30_address0 <= RESIZE(UNSIGNED(weights_30_address0), 5);
    int_weights_30_ce0   <= weights_30_ce0;
    weights_30_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_30_q0, 32));
    int_weights_30_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_30_ce1   <= '1' when ar_hs = '1' or (int_weights_30_write = '1' and WVALID  = '1') else '0';
    int_weights_30_we1   <= '1' when int_weights_30_write = '1' and w_hs = '1' else '0';
    int_weights_30_be1   <= UNSIGNED(WSTRB) when int_weights_30_we1 = '1' else (others=>'0');
    int_weights_30_d1    <= UNSIGNED(WDATA);
    -- weights_31
    int_weights_31_address0 <= RESIZE(UNSIGNED(weights_31_address0), 5);
    int_weights_31_ce0   <= weights_31_ce0;
    weights_31_q0        <= STD_LOGIC_VECTOR(RESIZE(int_weights_31_q0, 32));
    int_weights_31_address1 <= raddr(6 downto 2) when ar_hs = '1' else waddr(6 downto 2);
    int_weights_31_ce1   <= '1' when ar_hs = '1' or (int_weights_31_write = '1' and WVALID  = '1') else '0';
    int_weights_31_we1   <= '1' when int_weights_31_write = '1' and w_hs = '1' else '0';
    int_weights_31_be1   <= UNSIGNED(WSTRB) when int_weights_31_we1 = '1' else (others=>'0');
    int_weights_31_d1    <= UNSIGNED(WDATA);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_0_BASE and raddr <= ADDR_WEIGHTS_0_HIGH) then
                    int_weights_0_read <= '1';
                else
                    int_weights_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_0_HIGH) then
                    int_weights_0_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_1_BASE and raddr <= ADDR_WEIGHTS_1_HIGH) then
                    int_weights_1_read <= '1';
                else
                    int_weights_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_1_HIGH) then
                    int_weights_1_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_2_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_2_BASE and raddr <= ADDR_WEIGHTS_2_HIGH) then
                    int_weights_2_read <= '1';
                else
                    int_weights_2_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_2_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_2_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_2_HIGH) then
                    int_weights_2_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_2_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_3_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_3_BASE and raddr <= ADDR_WEIGHTS_3_HIGH) then
                    int_weights_3_read <= '1';
                else
                    int_weights_3_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_3_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_3_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_3_HIGH) then
                    int_weights_3_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_3_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_4_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_4_BASE and raddr <= ADDR_WEIGHTS_4_HIGH) then
                    int_weights_4_read <= '1';
                else
                    int_weights_4_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_4_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_4_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_4_HIGH) then
                    int_weights_4_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_4_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_5_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_5_BASE and raddr <= ADDR_WEIGHTS_5_HIGH) then
                    int_weights_5_read <= '1';
                else
                    int_weights_5_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_5_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_5_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_5_HIGH) then
                    int_weights_5_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_5_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_6_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_6_BASE and raddr <= ADDR_WEIGHTS_6_HIGH) then
                    int_weights_6_read <= '1';
                else
                    int_weights_6_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_6_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_6_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_6_HIGH) then
                    int_weights_6_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_6_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_7_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_7_BASE and raddr <= ADDR_WEIGHTS_7_HIGH) then
                    int_weights_7_read <= '1';
                else
                    int_weights_7_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_7_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_7_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_7_HIGH) then
                    int_weights_7_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_7_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_8_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_8_BASE and raddr <= ADDR_WEIGHTS_8_HIGH) then
                    int_weights_8_read <= '1';
                else
                    int_weights_8_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_8_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_8_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_8_HIGH) then
                    int_weights_8_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_8_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_9_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_9_BASE and raddr <= ADDR_WEIGHTS_9_HIGH) then
                    int_weights_9_read <= '1';
                else
                    int_weights_9_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_9_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_9_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_9_HIGH) then
                    int_weights_9_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_9_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_10_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_10_BASE and raddr <= ADDR_WEIGHTS_10_HIGH) then
                    int_weights_10_read <= '1';
                else
                    int_weights_10_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_10_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_10_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_10_HIGH) then
                    int_weights_10_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_10_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_11_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_11_BASE and raddr <= ADDR_WEIGHTS_11_HIGH) then
                    int_weights_11_read <= '1';
                else
                    int_weights_11_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_11_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_11_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_11_HIGH) then
                    int_weights_11_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_11_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_12_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_12_BASE and raddr <= ADDR_WEIGHTS_12_HIGH) then
                    int_weights_12_read <= '1';
                else
                    int_weights_12_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_12_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_12_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_12_HIGH) then
                    int_weights_12_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_12_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_13_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_13_BASE and raddr <= ADDR_WEIGHTS_13_HIGH) then
                    int_weights_13_read <= '1';
                else
                    int_weights_13_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_13_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_13_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_13_HIGH) then
                    int_weights_13_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_13_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_14_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_14_BASE and raddr <= ADDR_WEIGHTS_14_HIGH) then
                    int_weights_14_read <= '1';
                else
                    int_weights_14_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_14_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_14_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_14_HIGH) then
                    int_weights_14_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_14_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_15_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_15_BASE and raddr <= ADDR_WEIGHTS_15_HIGH) then
                    int_weights_15_read <= '1';
                else
                    int_weights_15_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_15_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_15_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_15_HIGH) then
                    int_weights_15_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_15_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_16_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_16_BASE and raddr <= ADDR_WEIGHTS_16_HIGH) then
                    int_weights_16_read <= '1';
                else
                    int_weights_16_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_16_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_16_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_16_HIGH) then
                    int_weights_16_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_16_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_17_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_17_BASE and raddr <= ADDR_WEIGHTS_17_HIGH) then
                    int_weights_17_read <= '1';
                else
                    int_weights_17_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_17_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_17_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_17_HIGH) then
                    int_weights_17_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_17_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_18_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_18_BASE and raddr <= ADDR_WEIGHTS_18_HIGH) then
                    int_weights_18_read <= '1';
                else
                    int_weights_18_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_18_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_18_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_18_HIGH) then
                    int_weights_18_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_18_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_19_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_19_BASE and raddr <= ADDR_WEIGHTS_19_HIGH) then
                    int_weights_19_read <= '1';
                else
                    int_weights_19_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_19_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_19_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_19_HIGH) then
                    int_weights_19_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_19_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_20_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_20_BASE and raddr <= ADDR_WEIGHTS_20_HIGH) then
                    int_weights_20_read <= '1';
                else
                    int_weights_20_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_20_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_20_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_20_HIGH) then
                    int_weights_20_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_20_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_21_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_21_BASE and raddr <= ADDR_WEIGHTS_21_HIGH) then
                    int_weights_21_read <= '1';
                else
                    int_weights_21_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_21_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_21_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_21_HIGH) then
                    int_weights_21_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_21_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_22_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_22_BASE and raddr <= ADDR_WEIGHTS_22_HIGH) then
                    int_weights_22_read <= '1';
                else
                    int_weights_22_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_22_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_22_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_22_HIGH) then
                    int_weights_22_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_22_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_23_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_23_BASE and raddr <= ADDR_WEIGHTS_23_HIGH) then
                    int_weights_23_read <= '1';
                else
                    int_weights_23_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_23_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_23_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_23_HIGH) then
                    int_weights_23_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_23_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_24_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_24_BASE and raddr <= ADDR_WEIGHTS_24_HIGH) then
                    int_weights_24_read <= '1';
                else
                    int_weights_24_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_24_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_24_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_24_HIGH) then
                    int_weights_24_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_24_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_25_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_25_BASE and raddr <= ADDR_WEIGHTS_25_HIGH) then
                    int_weights_25_read <= '1';
                else
                    int_weights_25_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_25_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_25_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_25_HIGH) then
                    int_weights_25_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_25_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_26_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_26_BASE and raddr <= ADDR_WEIGHTS_26_HIGH) then
                    int_weights_26_read <= '1';
                else
                    int_weights_26_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_26_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_26_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_26_HIGH) then
                    int_weights_26_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_26_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_27_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_27_BASE and raddr <= ADDR_WEIGHTS_27_HIGH) then
                    int_weights_27_read <= '1';
                else
                    int_weights_27_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_27_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_27_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_27_HIGH) then
                    int_weights_27_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_27_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_28_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_28_BASE and raddr <= ADDR_WEIGHTS_28_HIGH) then
                    int_weights_28_read <= '1';
                else
                    int_weights_28_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_28_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_28_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_28_HIGH) then
                    int_weights_28_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_28_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_29_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_29_BASE and raddr <= ADDR_WEIGHTS_29_HIGH) then
                    int_weights_29_read <= '1';
                else
                    int_weights_29_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_29_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_29_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_29_HIGH) then
                    int_weights_29_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_29_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_30_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_30_BASE and raddr <= ADDR_WEIGHTS_30_HIGH) then
                    int_weights_30_read <= '1';
                else
                    int_weights_30_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_30_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_30_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_30_HIGH) then
                    int_weights_30_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_30_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_31_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_WEIGHTS_31_BASE and raddr <= ADDR_WEIGHTS_31_HIGH) then
                    int_weights_31_read <= '1';
                else
                    int_weights_31_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_weights_31_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_WEIGHTS_31_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_WEIGHTS_31_HIGH) then
                    int_weights_31_write <= '1';
                elsif (w_hs = '1') then
                    int_weights_31_write <= '0';
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity dense_gemv_control_s_axi_ram is
    generic (
        MEM_STYLE  : STRING :="auto";
        MEM_TYPE   : STRING :="S2P";
        BYTE_WIDTH : INTEGER :=8;
        WIDTH   : INTEGER :=32;
        DEPTH   : INTEGER :=256;
        BYTES   : INTEGER :=4;
        AWIDTH  : INTEGER :=8);
    port (
        clk0    : in  STD_LOGIC;
        address0: in  UNSIGNED(AWIDTH-1 downto 0);
        ce0     : in  STD_LOGIC;
        we0     : in  UNSIGNED(BYTES-1 downto 0);
        d0      : in  UNSIGNED(WIDTH-1 downto 0);
        q0      : out UNSIGNED(WIDTH-1 downto 0);
        clk1    : in  STD_LOGIC;
        address1: in  UNSIGNED(AWIDTH-1 downto 0);
        ce1     : in  STD_LOGIC;
        we1     : in  UNSIGNED(BYTES-1 downto 0);
        d1      : in  UNSIGNED(WIDTH-1 downto 0);
        q1      : out UNSIGNED(WIDTH-1 downto 0));

end entity dense_gemv_control_s_axi_ram;

architecture behave of dense_gemv_control_s_axi_ram is
    signal address0_tmp : UNSIGNED(AWIDTH-1 downto 0);
    signal address1_tmp : UNSIGNED(AWIDTH-1 downto 0);
    type RAM_T is array (0 to DEPTH - 1) of UNSIGNED(WIDTH - 1 downto 0);
    shared variable mem : RAM_T := (others => (others => '0'));
    attribute ram_style: string;
    attribute ram_style of mem: variable is MEM_STYLE;

    function port_type_gen( MEM_TYPE: STRING; MEM_STYLE: STRING; PORT_NAME: STRING) return STRING is
    begin
        if (MEM_TYPE = "S2P") and (PORT_NAME = "PORT0") then
            return "WO";
        elsif((MEM_TYPE = "S2P") and (PORT_NAME = "PORT1")) or ((MEM_TYPE = "2P") and (PORT_NAME = "PORT0")) then
            return "RO";
        elsif (MEM_STYLE = "hls_ultra") then
            return "RWNC";
        else
            return "RWRF";
        end if;
    end port_type_gen;
    constant PORT0 :STRING := port_type_gen(MEM_TYPE, MEM_STYLE, "PORT0");
    constant PORT1 :STRING := port_type_gen(MEM_TYPE, MEM_STYLE, "PORT1");

    function or_reduce( V: UNSIGNED) return std_logic is
    variable result: std_logic;
    begin
        for i in V'range loop
            if i = V'left then
                result := V(i);
            else
                result := result OR V(i);
            end if;
            exit when result = '1';
        end loop;
        return result;
    end or_reduce;

begin

    process (address0)
    begin
    address0_tmp <= address0;
    --synthesis translate_off
        if (address0 > DEPTH-1) then
            address0_tmp <= (others => '0');
        else
            address0_tmp <= address0;
        end if;
    --synthesis translate_on
    end process;

    process (address1)
    begin
    address1_tmp <= address1;
    --synthesis translate_off
        if (address1 > DEPTH-1) then
            address1_tmp <= (others => '0');
        else
            address1_tmp <= address1;
        end if;
    --synthesis translate_on
    end process;

    --read port 0
    read_p0_rf : if (PORT0 = "RO" or PORT0 = "RWRF") generate
        process (clk0) begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1') then
                    q0 <= mem(to_integer(address0_tmp));
                end if;
            end if;
        end process;
    end generate read_p0_rf;

    read_p0_nc : if (PORT0 = "RWNC") generate
        process (clk0) begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1') then
                    if (we0 = (we0'range => '0')) then
                        q0 <= mem(to_integer(address0_tmp));
                    end if;
                end if;
            end if;
        end process;
    end generate read_p0_nc;

    --read port 1
    read_p1_rf : if (PORT1 = "RO" or PORT1 = "RWRF") generate
        process (clk1) begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1') then
                    q1 <= mem(to_integer(address1_tmp));
                end if;
            end if;
        end process;
    end generate read_p1_rf;

    read_p1_nc : if (PORT1 = "RWNC") generate
        process (clk1) begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1') then
                    if (we1 = (we1'range => '0')) then
                        q1 <= mem(to_integer(address1_tmp));
                    end if;
                end if;
            end if;
        end process;
    end generate read_p1_nc;

    --write port 0
    write_p0 : if (PORT0 /= "RO") generate
        process (clk0)
        begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1') then
                for i in 0 to BYTES - 1 loop
                    if (we0(i) = '1') then
                        mem(to_integer(address0_tmp))((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH) := d0((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH);
                    end if;
                end loop;
                end if;
            end if;
        end process;
    end generate write_p0;

    --write port 1
    write_p1 : if (PORT1 /= "RO") generate
        process (clk1)
        begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1') then
                for i in 0 to BYTES - 1 loop
                    if (we1(i) = '1') then
                        mem(to_integer(address1_tmp))((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH) := d1((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH);
                    end if;
                end loop;
                end if;
            end if;
        end process;
    end generate write_p1;

end architecture behave;


