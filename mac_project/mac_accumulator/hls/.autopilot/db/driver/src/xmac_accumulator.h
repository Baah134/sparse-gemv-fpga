// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMAC_ACCUMULATOR_H
#define XMAC_ACCUMULATOR_H

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
#include "xmac_accumulator_hw.h"

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
} XMac_accumulator_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMac_accumulator;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMac_accumulator_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMac_accumulator_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMac_accumulator_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMac_accumulator_ReadReg(BaseAddress, RegOffset) \
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
int XMac_accumulator_Initialize(XMac_accumulator *InstancePtr, UINTPTR BaseAddress);
XMac_accumulator_Config* XMac_accumulator_LookupConfig(UINTPTR BaseAddress);
#else
int XMac_accumulator_Initialize(XMac_accumulator *InstancePtr, u16 DeviceId);
XMac_accumulator_Config* XMac_accumulator_LookupConfig(u16 DeviceId);
#endif
int XMac_accumulator_CfgInitialize(XMac_accumulator *InstancePtr, XMac_accumulator_Config *ConfigPtr);
#else
int XMac_accumulator_Initialize(XMac_accumulator *InstancePtr, const char* InstanceName);
int XMac_accumulator_Release(XMac_accumulator *InstancePtr);
#endif

void XMac_accumulator_Start(XMac_accumulator *InstancePtr);
u32 XMac_accumulator_IsDone(XMac_accumulator *InstancePtr);
u32 XMac_accumulator_IsIdle(XMac_accumulator *InstancePtr);
u32 XMac_accumulator_IsReady(XMac_accumulator *InstancePtr);
void XMac_accumulator_EnableAutoRestart(XMac_accumulator *InstancePtr);
void XMac_accumulator_DisableAutoRestart(XMac_accumulator *InstancePtr);

void XMac_accumulator_Set_N(XMac_accumulator *InstancePtr, u32 Data);
u32 XMac_accumulator_Get_N(XMac_accumulator *InstancePtr);
u32 XMac_accumulator_Get_final_sum(XMac_accumulator *InstancePtr);
u32 XMac_accumulator_Get_final_sum_vld(XMac_accumulator *InstancePtr);

void XMac_accumulator_InterruptGlobalEnable(XMac_accumulator *InstancePtr);
void XMac_accumulator_InterruptGlobalDisable(XMac_accumulator *InstancePtr);
void XMac_accumulator_InterruptEnable(XMac_accumulator *InstancePtr, u32 Mask);
void XMac_accumulator_InterruptDisable(XMac_accumulator *InstancePtr, u32 Mask);
void XMac_accumulator_InterruptClear(XMac_accumulator *InstancePtr, u32 Mask);
u32 XMac_accumulator_InterruptGetEnabled(XMac_accumulator *InstancePtr);
u32 XMac_accumulator_InterruptGetStatus(XMac_accumulator *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
