// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xdense_gemv.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDense_gemv_CfgInitialize(XDense_gemv *InstancePtr, XDense_gemv_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDense_gemv_Start(XDense_gemv *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDense_gemv_IsDone(XDense_gemv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDense_gemv_IsIdle(XDense_gemv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDense_gemv_IsReady(XDense_gemv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDense_gemv_EnableAutoRestart(XDense_gemv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDense_gemv_DisableAutoRestart(XDense_gemv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_AP_CTRL, 0);
}

void XDense_gemv_Set_num_rows(XDense_gemv *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_NUM_ROWS_DATA, Data);
}

u32 XDense_gemv_Get_num_rows(XDense_gemv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_NUM_ROWS_DATA);
    return Data;
}

u32 XDense_gemv_Get_weights_0_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE);
}

u32 XDense_gemv_Get_weights_0_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_HIGH);
}

u32 XDense_gemv_Get_weights_0_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + 1);
}

u32 XDense_gemv_Get_weights_0_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_0;
}

u32 XDense_gemv_Get_weights_0_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_0;
}

u32 XDense_gemv_Write_weights_0_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_0_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_0_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_0_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_0_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_1_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE);
}

u32 XDense_gemv_Get_weights_1_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_HIGH);
}

u32 XDense_gemv_Get_weights_1_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + 1);
}

u32 XDense_gemv_Get_weights_1_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_1;
}

u32 XDense_gemv_Get_weights_1_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_1;
}

u32 XDense_gemv_Write_weights_1_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_1_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_1_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_1_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_1_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_2_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE);
}

u32 XDense_gemv_Get_weights_2_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_HIGH);
}

u32 XDense_gemv_Get_weights_2_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + 1);
}

u32 XDense_gemv_Get_weights_2_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_2;
}

u32 XDense_gemv_Get_weights_2_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_2;
}

u32 XDense_gemv_Write_weights_2_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_2_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_2_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_2_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_2_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_3_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE);
}

u32 XDense_gemv_Get_weights_3_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_HIGH);
}

u32 XDense_gemv_Get_weights_3_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + 1);
}

u32 XDense_gemv_Get_weights_3_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_3;
}

u32 XDense_gemv_Get_weights_3_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_3;
}

u32 XDense_gemv_Write_weights_3_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_3_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_3_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_3_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_3_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_4_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE);
}

u32 XDense_gemv_Get_weights_4_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_HIGH);
}

u32 XDense_gemv_Get_weights_4_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + 1);
}

u32 XDense_gemv_Get_weights_4_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_4;
}

u32 XDense_gemv_Get_weights_4_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_4;
}

u32 XDense_gemv_Write_weights_4_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_4_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_4_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_4_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_4_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_5_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE);
}

u32 XDense_gemv_Get_weights_5_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_HIGH);
}

u32 XDense_gemv_Get_weights_5_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + 1);
}

u32 XDense_gemv_Get_weights_5_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_5;
}

u32 XDense_gemv_Get_weights_5_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_5;
}

u32 XDense_gemv_Write_weights_5_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_5_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_5_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_5_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_5_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_6_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE);
}

u32 XDense_gemv_Get_weights_6_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_HIGH);
}

u32 XDense_gemv_Get_weights_6_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + 1);
}

u32 XDense_gemv_Get_weights_6_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_6;
}

u32 XDense_gemv_Get_weights_6_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_6;
}

u32 XDense_gemv_Write_weights_6_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_6_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_6_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_6_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_6_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_7_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE);
}

u32 XDense_gemv_Get_weights_7_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_HIGH);
}

u32 XDense_gemv_Get_weights_7_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + 1);
}

u32 XDense_gemv_Get_weights_7_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_7;
}

u32 XDense_gemv_Get_weights_7_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_7;
}

u32 XDense_gemv_Write_weights_7_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_7_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_7_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_7_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_7_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_8_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE);
}

u32 XDense_gemv_Get_weights_8_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_HIGH);
}

u32 XDense_gemv_Get_weights_8_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + 1);
}

u32 XDense_gemv_Get_weights_8_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_8;
}

u32 XDense_gemv_Get_weights_8_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_8;
}

u32 XDense_gemv_Write_weights_8_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_8_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_8_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_8_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_8_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_9_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE);
}

u32 XDense_gemv_Get_weights_9_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_HIGH);
}

u32 XDense_gemv_Get_weights_9_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + 1);
}

u32 XDense_gemv_Get_weights_9_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_9;
}

u32 XDense_gemv_Get_weights_9_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_9;
}

u32 XDense_gemv_Write_weights_9_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_9_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_9_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_9_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_9_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_10_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE);
}

u32 XDense_gemv_Get_weights_10_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_HIGH);
}

u32 XDense_gemv_Get_weights_10_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + 1);
}

u32 XDense_gemv_Get_weights_10_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_10;
}

u32 XDense_gemv_Get_weights_10_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_10;
}

u32 XDense_gemv_Write_weights_10_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_10_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_10_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_10_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_10_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_11_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE);
}

u32 XDense_gemv_Get_weights_11_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_HIGH);
}

u32 XDense_gemv_Get_weights_11_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + 1);
}

u32 XDense_gemv_Get_weights_11_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_11;
}

u32 XDense_gemv_Get_weights_11_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_11;
}

u32 XDense_gemv_Write_weights_11_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_11_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_11_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_11_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_11_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_12_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE);
}

u32 XDense_gemv_Get_weights_12_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_HIGH);
}

u32 XDense_gemv_Get_weights_12_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + 1);
}

u32 XDense_gemv_Get_weights_12_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_12;
}

u32 XDense_gemv_Get_weights_12_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_12;
}

u32 XDense_gemv_Write_weights_12_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_12_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_12_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_12_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_12_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_13_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE);
}

u32 XDense_gemv_Get_weights_13_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_HIGH);
}

u32 XDense_gemv_Get_weights_13_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + 1);
}

u32 XDense_gemv_Get_weights_13_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_13;
}

u32 XDense_gemv_Get_weights_13_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_13;
}

u32 XDense_gemv_Write_weights_13_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_13_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_13_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_13_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_13_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_14_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE);
}

u32 XDense_gemv_Get_weights_14_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_HIGH);
}

u32 XDense_gemv_Get_weights_14_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + 1);
}

u32 XDense_gemv_Get_weights_14_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_14;
}

u32 XDense_gemv_Get_weights_14_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_14;
}

u32 XDense_gemv_Write_weights_14_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_14_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_14_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_14_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_14_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_15_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE);
}

u32 XDense_gemv_Get_weights_15_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_HIGH);
}

u32 XDense_gemv_Get_weights_15_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + 1);
}

u32 XDense_gemv_Get_weights_15_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_15;
}

u32 XDense_gemv_Get_weights_15_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_15;
}

u32 XDense_gemv_Write_weights_15_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_15_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_15_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_15_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_15_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_16_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE);
}

u32 XDense_gemv_Get_weights_16_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_HIGH);
}

u32 XDense_gemv_Get_weights_16_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + 1);
}

u32 XDense_gemv_Get_weights_16_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_16;
}

u32 XDense_gemv_Get_weights_16_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_16;
}

u32 XDense_gemv_Write_weights_16_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_16_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_16_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_16_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_16_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_17_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE);
}

u32 XDense_gemv_Get_weights_17_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_HIGH);
}

u32 XDense_gemv_Get_weights_17_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + 1);
}

u32 XDense_gemv_Get_weights_17_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_17;
}

u32 XDense_gemv_Get_weights_17_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_17;
}

u32 XDense_gemv_Write_weights_17_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_17_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_17_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_17_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_17_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_18_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE);
}

u32 XDense_gemv_Get_weights_18_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_HIGH);
}

u32 XDense_gemv_Get_weights_18_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + 1);
}

u32 XDense_gemv_Get_weights_18_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_18;
}

u32 XDense_gemv_Get_weights_18_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_18;
}

u32 XDense_gemv_Write_weights_18_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_18_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_18_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_18_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_18_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_19_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE);
}

u32 XDense_gemv_Get_weights_19_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_HIGH);
}

u32 XDense_gemv_Get_weights_19_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + 1);
}

u32 XDense_gemv_Get_weights_19_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_19;
}

u32 XDense_gemv_Get_weights_19_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_19;
}

u32 XDense_gemv_Write_weights_19_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_19_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_19_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_19_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_19_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_20_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE);
}

u32 XDense_gemv_Get_weights_20_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_HIGH);
}

u32 XDense_gemv_Get_weights_20_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + 1);
}

u32 XDense_gemv_Get_weights_20_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_20;
}

u32 XDense_gemv_Get_weights_20_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_20;
}

u32 XDense_gemv_Write_weights_20_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_20_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_20_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_20_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_20_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_21_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE);
}

u32 XDense_gemv_Get_weights_21_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_HIGH);
}

u32 XDense_gemv_Get_weights_21_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + 1);
}

u32 XDense_gemv_Get_weights_21_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_21;
}

u32 XDense_gemv_Get_weights_21_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_21;
}

u32 XDense_gemv_Write_weights_21_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_21_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_21_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_21_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_21_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_22_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE);
}

u32 XDense_gemv_Get_weights_22_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_HIGH);
}

u32 XDense_gemv_Get_weights_22_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + 1);
}

u32 XDense_gemv_Get_weights_22_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_22;
}

u32 XDense_gemv_Get_weights_22_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_22;
}

u32 XDense_gemv_Write_weights_22_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_22_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_22_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_22_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_22_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_23_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE);
}

u32 XDense_gemv_Get_weights_23_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_HIGH);
}

u32 XDense_gemv_Get_weights_23_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + 1);
}

u32 XDense_gemv_Get_weights_23_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_23;
}

u32 XDense_gemv_Get_weights_23_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_23;
}

u32 XDense_gemv_Write_weights_23_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_23_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_23_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_23_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_23_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_24_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE);
}

u32 XDense_gemv_Get_weights_24_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_HIGH);
}

u32 XDense_gemv_Get_weights_24_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + 1);
}

u32 XDense_gemv_Get_weights_24_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_24;
}

u32 XDense_gemv_Get_weights_24_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_24;
}

u32 XDense_gemv_Write_weights_24_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_24_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_24_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_24_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_24_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_25_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE);
}

u32 XDense_gemv_Get_weights_25_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_HIGH);
}

u32 XDense_gemv_Get_weights_25_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + 1);
}

u32 XDense_gemv_Get_weights_25_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_25;
}

u32 XDense_gemv_Get_weights_25_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_25;
}

u32 XDense_gemv_Write_weights_25_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_25_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_25_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_25_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_25_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_26_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE);
}

u32 XDense_gemv_Get_weights_26_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_HIGH);
}

u32 XDense_gemv_Get_weights_26_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + 1);
}

u32 XDense_gemv_Get_weights_26_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_26;
}

u32 XDense_gemv_Get_weights_26_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_26;
}

u32 XDense_gemv_Write_weights_26_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_26_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_26_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_26_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_26_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_27_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE);
}

u32 XDense_gemv_Get_weights_27_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_HIGH);
}

u32 XDense_gemv_Get_weights_27_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + 1);
}

u32 XDense_gemv_Get_weights_27_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_27;
}

u32 XDense_gemv_Get_weights_27_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_27;
}

u32 XDense_gemv_Write_weights_27_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_27_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_27_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_27_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_27_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_28_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE);
}

u32 XDense_gemv_Get_weights_28_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_HIGH);
}

u32 XDense_gemv_Get_weights_28_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + 1);
}

u32 XDense_gemv_Get_weights_28_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_28;
}

u32 XDense_gemv_Get_weights_28_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_28;
}

u32 XDense_gemv_Write_weights_28_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_28_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_28_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_28_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_28_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_29_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE);
}

u32 XDense_gemv_Get_weights_29_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_HIGH);
}

u32 XDense_gemv_Get_weights_29_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + 1);
}

u32 XDense_gemv_Get_weights_29_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_29;
}

u32 XDense_gemv_Get_weights_29_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_29;
}

u32 XDense_gemv_Write_weights_29_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_29_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_29_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_29_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_29_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_30_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE);
}

u32 XDense_gemv_Get_weights_30_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_HIGH);
}

u32 XDense_gemv_Get_weights_30_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + 1);
}

u32 XDense_gemv_Get_weights_30_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_30;
}

u32 XDense_gemv_Get_weights_30_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_30;
}

u32 XDense_gemv_Write_weights_30_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_30_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_30_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_30_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_30_BASE + offset + i);
    }
    return length;
}

u32 XDense_gemv_Get_weights_31_BaseAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE);
}

u32 XDense_gemv_Get_weights_31_HighAddress(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_HIGH);
}

u32 XDense_gemv_Get_weights_31_TotalBytes(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + 1);
}

u32 XDense_gemv_Get_weights_31_BitWidth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_WIDTH_WEIGHTS_31;
}

u32 XDense_gemv_Get_weights_31_Depth(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDENSE_GEMV_CONTROL_DEPTH_WEIGHTS_31;
}

u32 XDense_gemv_Write_weights_31_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_31_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDense_gemv_Write_weights_31_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDense_gemv_Read_weights_31_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_HIGH - XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDENSE_GEMV_CONTROL_ADDR_WEIGHTS_31_BASE + offset + i);
    }
    return length;
}

void XDense_gemv_InterruptGlobalEnable(XDense_gemv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_GIE, 1);
}

void XDense_gemv_InterruptGlobalDisable(XDense_gemv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_GIE, 0);
}

void XDense_gemv_InterruptEnable(XDense_gemv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_IER);
    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_IER, Register | Mask);
}

void XDense_gemv_InterruptDisable(XDense_gemv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_IER);
    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDense_gemv_InterruptClear(XDense_gemv *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDense_gemv_WriteReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_ISR, Mask);
}

u32 XDense_gemv_InterruptGetEnabled(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_IER);
}

u32 XDense_gemv_InterruptGetStatus(XDense_gemv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDense_gemv_ReadReg(InstancePtr->Control_BaseAddress, XDENSE_GEMV_CONTROL_ADDR_ISR);
}

