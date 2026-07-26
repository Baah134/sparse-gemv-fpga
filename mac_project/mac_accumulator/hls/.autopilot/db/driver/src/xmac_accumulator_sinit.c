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
#include "xmac_accumulator.h"

extern XMac_accumulator_Config XMac_accumulator_ConfigTable[];

#ifdef SDT
XMac_accumulator_Config *XMac_accumulator_LookupConfig(UINTPTR BaseAddress) {
	XMac_accumulator_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XMac_accumulator_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XMac_accumulator_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XMac_accumulator_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMac_accumulator_Initialize(XMac_accumulator *InstancePtr, UINTPTR BaseAddress) {
	XMac_accumulator_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMac_accumulator_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMac_accumulator_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XMac_accumulator_Config *XMac_accumulator_LookupConfig(u16 DeviceId) {
	XMac_accumulator_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMAC_ACCUMULATOR_NUM_INSTANCES; Index++) {
		if (XMac_accumulator_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMac_accumulator_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMac_accumulator_Initialize(XMac_accumulator *InstancePtr, u16 DeviceId) {
	XMac_accumulator_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMac_accumulator_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMac_accumulator_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

