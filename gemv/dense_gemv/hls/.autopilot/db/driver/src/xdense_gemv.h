// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XDENSE_GEMV_H
#define XDENSE_GEMV_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdense_gemv_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XDense_gemv_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDense_gemv;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDense_gemv_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDense_gemv_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDense_gemv_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDense_gemv_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XDense_gemv_Initialize(XDense_gemv *InstancePtr, UINTPTR BaseAddress);
XDense_gemv_Config* XDense_gemv_LookupConfig(UINTPTR BaseAddress);
#else
int XDense_gemv_Initialize(XDense_gemv *InstancePtr, u16 DeviceId);
XDense_gemv_Config* XDense_gemv_LookupConfig(u16 DeviceId);
#endif
int XDense_gemv_CfgInitialize(XDense_gemv *InstancePtr, XDense_gemv_Config *ConfigPtr);
#else
int XDense_gemv_Initialize(XDense_gemv *InstancePtr, const char* InstanceName);
int XDense_gemv_Release(XDense_gemv *InstancePtr);
#endif

void XDense_gemv_Start(XDense_gemv *InstancePtr);
u32 XDense_gemv_IsDone(XDense_gemv *InstancePtr);
u32 XDense_gemv_IsIdle(XDense_gemv *InstancePtr);
u32 XDense_gemv_IsReady(XDense_gemv *InstancePtr);
void XDense_gemv_EnableAutoRestart(XDense_gemv *InstancePtr);
void XDense_gemv_DisableAutoRestart(XDense_gemv *InstancePtr);

void XDense_gemv_Set_num_rows(XDense_gemv *InstancePtr, u32 Data);
u32 XDense_gemv_Get_num_rows(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_0_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_0_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_0_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_0_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_0_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_0_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_0_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_0_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_0_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_1_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_1_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_1_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_1_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_1_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_1_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_1_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_1_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_1_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_2_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_2_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_2_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_2_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_2_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_2_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_2_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_2_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_2_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_3_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_3_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_3_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_3_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_3_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_3_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_3_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_3_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_3_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_4_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_4_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_4_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_4_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_4_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_4_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_4_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_4_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_4_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_5_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_5_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_5_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_5_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_5_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_5_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_5_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_5_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_5_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_6_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_6_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_6_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_6_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_6_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_6_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_6_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_6_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_6_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_7_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_7_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_7_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_7_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_7_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_7_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_7_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_7_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_7_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_8_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_8_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_8_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_8_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_8_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_8_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_8_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_8_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_8_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_9_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_9_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_9_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_9_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_9_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_9_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_9_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_9_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_9_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_10_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_10_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_10_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_10_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_10_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_10_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_10_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_10_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_10_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_11_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_11_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_11_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_11_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_11_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_11_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_11_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_11_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_11_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_12_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_12_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_12_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_12_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_12_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_12_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_12_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_12_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_12_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_13_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_13_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_13_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_13_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_13_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_13_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_13_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_13_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_13_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_14_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_14_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_14_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_14_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_14_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_14_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_14_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_14_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_14_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_15_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_15_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_15_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_15_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_15_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_15_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_15_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_15_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_15_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_16_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_16_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_16_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_16_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_16_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_16_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_16_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_16_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_16_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_17_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_17_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_17_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_17_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_17_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_17_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_17_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_17_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_17_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_18_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_18_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_18_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_18_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_18_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_18_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_18_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_18_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_18_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_19_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_19_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_19_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_19_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_19_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_19_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_19_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_19_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_19_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_20_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_20_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_20_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_20_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_20_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_20_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_20_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_20_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_20_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_21_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_21_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_21_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_21_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_21_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_21_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_21_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_21_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_21_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_22_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_22_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_22_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_22_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_22_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_22_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_22_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_22_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_22_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_23_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_23_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_23_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_23_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_23_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_23_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_23_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_23_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_23_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_24_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_24_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_24_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_24_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_24_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_24_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_24_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_24_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_24_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_25_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_25_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_25_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_25_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_25_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_25_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_25_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_25_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_25_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_26_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_26_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_26_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_26_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_26_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_26_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_26_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_26_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_26_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_27_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_27_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_27_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_27_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_27_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_27_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_27_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_27_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_27_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_28_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_28_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_28_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_28_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_28_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_28_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_28_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_28_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_28_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_29_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_29_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_29_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_29_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_29_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_29_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_29_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_29_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_29_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_30_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_30_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_30_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_30_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_30_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_30_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_30_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_30_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_30_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Get_weights_31_BaseAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_31_HighAddress(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_31_TotalBytes(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_31_BitWidth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Get_weights_31_Depth(XDense_gemv *InstancePtr);
u32 XDense_gemv_Write_weights_31_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Read_weights_31_Words(XDense_gemv *InstancePtr, int offset, word_type *data, int length);
u32 XDense_gemv_Write_weights_31_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);
u32 XDense_gemv_Read_weights_31_Bytes(XDense_gemv *InstancePtr, int offset, char *data, int length);

void XDense_gemv_InterruptGlobalEnable(XDense_gemv *InstancePtr);
void XDense_gemv_InterruptGlobalDisable(XDense_gemv *InstancePtr);
void XDense_gemv_InterruptEnable(XDense_gemv *InstancePtr, u32 Mask);
void XDense_gemv_InterruptDisable(XDense_gemv *InstancePtr, u32 Mask);
void XDense_gemv_InterruptClear(XDense_gemv *InstancePtr, u32 Mask);
u32 XDense_gemv_InterruptGetEnabled(XDense_gemv *InstancePtr);
u32 XDense_gemv_InterruptGetStatus(XDense_gemv *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
