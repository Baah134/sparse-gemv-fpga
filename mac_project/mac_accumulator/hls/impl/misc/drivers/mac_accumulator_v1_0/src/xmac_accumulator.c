// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xmac_accumulator.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMac_accumulator_CfgInitialize(XMac_accumulator *InstancePtr, XMac_accumulator_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMac_accumulator_Start(XMac_accumulator *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMac_accumulator_IsDone(XMac_accumulator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMac_accumulator_IsIdle(XMac_accumulator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMac_accumulator_IsReady(XMac_accumulator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMac_accumulator_EnableAutoRestart(XMac_accumulator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMac_accumulator_DisableAutoRestart(XMac_accumulator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_AP_CTRL, 0);
}

void XMac_accumulator_Set_N(XMac_accumulator *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_N_DATA, Data);
}

u32 XMac_accumulator_Get_N(XMac_accumulator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_N_DATA);
    return Data;
}

u32 XMac_accumulator_Get_final_sum(XMac_accumulator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_FINAL_SUM_DATA);
    return Data;
}

u32 XMac_accumulator_Get_final_sum_vld(XMac_accumulator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_FINAL_SUM_CTRL);
    return Data & 0x1;
}

void XMac_accumulator_InterruptGlobalEnable(XMac_accumulator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_GIE, 1);
}

void XMac_accumulator_InterruptGlobalDisable(XMac_accumulator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_GIE, 0);
}

void XMac_accumulator_InterruptEnable(XMac_accumulator *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_IER);
    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_IER, Register | Mask);
}

void XMac_accumulator_InterruptDisable(XMac_accumulator *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_IER);
    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMac_accumulator_InterruptClear(XMac_accumulator *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMac_accumulator_WriteReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_ISR, Mask);
}

u32 XMac_accumulator_InterruptGetEnabled(XMac_accumulator *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_IER);
}

u32 XMac_accumulator_InterruptGetStatus(XMac_accumulator *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMac_accumulator_ReadReg(InstancePtr->Control_BaseAddress, XMAC_ACCUMULATOR_CONTROL_ADDR_ISR);
}

