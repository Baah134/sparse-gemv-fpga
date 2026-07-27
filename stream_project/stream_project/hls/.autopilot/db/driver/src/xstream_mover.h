// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XSTREAM_MOVER_H
#define XSTREAM_MOVER_H

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
#include "xstream_mover_hw.h"

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
} XStream_mover_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XStream_mover;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XStream_mover_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XStream_mover_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XStream_mover_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XStream_mover_ReadReg(BaseAddress, RegOffset) \
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
int XStream_mover_Initialize(XStream_mover *InstancePtr, UINTPTR BaseAddress);
XStream_mover_Config* XStream_mover_LookupConfig(UINTPTR BaseAddress);
#else
int XStream_mover_Initialize(XStream_mover *InstancePtr, u16 DeviceId);
XStream_mover_Config* XStream_mover_LookupConfig(u16 DeviceId);
#endif
int XStream_mover_CfgInitialize(XStream_mover *InstancePtr, XStream_mover_Config *ConfigPtr);
#else
int XStream_mover_Initialize(XStream_mover *InstancePtr, const char* InstanceName);
int XStream_mover_Release(XStream_mover *InstancePtr);
#endif

void XStream_mover_Start(XStream_mover *InstancePtr);
u32 XStream_mover_IsDone(XStream_mover *InstancePtr);
u32 XStream_mover_IsIdle(XStream_mover *InstancePtr);
u32 XStream_mover_IsReady(XStream_mover *InstancePtr);
void XStream_mover_EnableAutoRestart(XStream_mover *InstancePtr);
void XStream_mover_DisableAutoRestart(XStream_mover *InstancePtr);

void XStream_mover_Set_N(XStream_mover *InstancePtr, u32 Data);
u32 XStream_mover_Get_N(XStream_mover *InstancePtr);

void XStream_mover_InterruptGlobalEnable(XStream_mover *InstancePtr);
void XStream_mover_InterruptGlobalDisable(XStream_mover *InstancePtr);
void XStream_mover_InterruptEnable(XStream_mover *InstancePtr, u32 Mask);
void XStream_mover_InterruptDisable(XStream_mover *InstancePtr, u32 Mask);
void XStream_mover_InterruptClear(XStream_mover *InstancePtr, u32 Mask);
u32 XStream_mover_InterruptGetEnabled(XStream_mover *InstancePtr);
u32 XStream_mover_InterruptGetStatus(XStream_mover *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
