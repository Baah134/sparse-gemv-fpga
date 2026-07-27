// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xstream_mover.h"

extern XStream_mover_Config XStream_mover_ConfigTable[];

#ifdef SDT
XStream_mover_Config *XStream_mover_LookupConfig(UINTPTR BaseAddress) {
	XStream_mover_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XStream_mover_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XStream_mover_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XStream_mover_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XStream_mover_Initialize(XStream_mover *InstancePtr, UINTPTR BaseAddress) {
	XStream_mover_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XStream_mover_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XStream_mover_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XStream_mover_Config *XStream_mover_LookupConfig(u16 DeviceId) {
	XStream_mover_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSTREAM_MOVER_NUM_INSTANCES; Index++) {
		if (XStream_mover_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XStream_mover_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XStream_mover_Initialize(XStream_mover *InstancePtr, u16 DeviceId) {
	XStream_mover_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XStream_mover_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XStream_mover_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

