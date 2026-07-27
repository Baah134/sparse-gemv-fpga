// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xstream_mover.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XStream_mover_CfgInitialize(XStream_mover *InstancePtr, XStream_mover_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XStream_mover_Start(XStream_mover *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_AP_CTRL) & 0x80;
    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XStream_mover_IsDone(XStream_mover *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XStream_mover_IsIdle(XStream_mover *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XStream_mover_IsReady(XStream_mover *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XStream_mover_EnableAutoRestart(XStream_mover *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XStream_mover_DisableAutoRestart(XStream_mover *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_AP_CTRL, 0);
}

void XStream_mover_Set_N(XStream_mover *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_N_DATA, Data);
}

u32 XStream_mover_Get_N(XStream_mover *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_N_DATA);
    return Data;
}

void XStream_mover_InterruptGlobalEnable(XStream_mover *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_GIE, 1);
}

void XStream_mover_InterruptGlobalDisable(XStream_mover *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_GIE, 0);
}

void XStream_mover_InterruptEnable(XStream_mover *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_IER);
    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_IER, Register | Mask);
}

void XStream_mover_InterruptDisable(XStream_mover *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_IER);
    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_IER, Register & (~Mask));
}

void XStream_mover_InterruptClear(XStream_mover *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_mover_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_ISR, Mask);
}

u32 XStream_mover_InterruptGetEnabled(XStream_mover *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_IER);
}

u32 XStream_mover_InterruptGetStatus(XStream_mover *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XStream_mover_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_MOVER_CONTROL_ADDR_ISR);
}

