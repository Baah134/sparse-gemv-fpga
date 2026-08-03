set moduleName dense_gemv
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 5
set C_modelName {dense_gemv}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict weights_0 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_1 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_2 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_3 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_4 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_5 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_6 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_7 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_8 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_9 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_10 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_11 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_12 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_13 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_14 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_15 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_16 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_17 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_18 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_19 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_20 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_21 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_22 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_23 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_24 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_25 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_26 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_27 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_28 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_29 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_30 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict weights_31 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ in_stream int 8 regular {axi_s 0 volatile  { in_stream Data } }  }
	{ weights_0 int 32 regular {axi_slave 0}  }
	{ weights_1 int 32 regular {axi_slave 0}  }
	{ weights_2 int 32 regular {axi_slave 0}  }
	{ weights_3 int 32 regular {axi_slave 0}  }
	{ weights_4 int 32 regular {axi_slave 0}  }
	{ weights_5 int 32 regular {axi_slave 0}  }
	{ weights_6 int 32 regular {axi_slave 0}  }
	{ weights_7 int 32 regular {axi_slave 0}  }
	{ weights_8 int 32 regular {axi_slave 0}  }
	{ weights_9 int 32 regular {axi_slave 0}  }
	{ weights_10 int 32 regular {axi_slave 0}  }
	{ weights_11 int 32 regular {axi_slave 0}  }
	{ weights_12 int 32 regular {axi_slave 0}  }
	{ weights_13 int 32 regular {axi_slave 0}  }
	{ weights_14 int 32 regular {axi_slave 0}  }
	{ weights_15 int 32 regular {axi_slave 0}  }
	{ weights_16 int 32 regular {axi_slave 0}  }
	{ weights_17 int 32 regular {axi_slave 0}  }
	{ weights_18 int 32 regular {axi_slave 0}  }
	{ weights_19 int 32 regular {axi_slave 0}  }
	{ weights_20 int 32 regular {axi_slave 0}  }
	{ weights_21 int 32 regular {axi_slave 0}  }
	{ weights_22 int 32 regular {axi_slave 0}  }
	{ weights_23 int 32 regular {axi_slave 0}  }
	{ weights_24 int 32 regular {axi_slave 0}  }
	{ weights_25 int 32 regular {axi_slave 0}  }
	{ weights_26 int 32 regular {axi_slave 0}  }
	{ weights_27 int 32 regular {axi_slave 0}  }
	{ weights_28 int 32 regular {axi_slave 0}  }
	{ weights_29 int 32 regular {axi_slave 0}  }
	{ weights_30 int 32 regular {axi_slave 0}  }
	{ weights_31 int 32 regular {axi_slave 0}  }
	{ out_stream int 32 regular {axi_s 1 volatile  { out_stream Data } }  }
	{ num_rows int 32 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "in_stream", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "weights_0", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":128}, "offset_end" : {"in":255}} , 
 	{ "Name" : "weights_1", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":256}, "offset_end" : {"in":383}} , 
 	{ "Name" : "weights_2", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":384}, "offset_end" : {"in":511}} , 
 	{ "Name" : "weights_3", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":512}, "offset_end" : {"in":639}} , 
 	{ "Name" : "weights_4", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":640}, "offset_end" : {"in":767}} , 
 	{ "Name" : "weights_5", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":768}, "offset_end" : {"in":895}} , 
 	{ "Name" : "weights_6", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":896}, "offset_end" : {"in":1023}} , 
 	{ "Name" : "weights_7", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1024}, "offset_end" : {"in":1151}} , 
 	{ "Name" : "weights_8", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1152}, "offset_end" : {"in":1279}} , 
 	{ "Name" : "weights_9", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1280}, "offset_end" : {"in":1407}} , 
 	{ "Name" : "weights_10", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1408}, "offset_end" : {"in":1535}} , 
 	{ "Name" : "weights_11", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1536}, "offset_end" : {"in":1663}} , 
 	{ "Name" : "weights_12", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1664}, "offset_end" : {"in":1791}} , 
 	{ "Name" : "weights_13", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1792}, "offset_end" : {"in":1919}} , 
 	{ "Name" : "weights_14", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":1920}, "offset_end" : {"in":2047}} , 
 	{ "Name" : "weights_15", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2048}, "offset_end" : {"in":2175}} , 
 	{ "Name" : "weights_16", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2176}, "offset_end" : {"in":2303}} , 
 	{ "Name" : "weights_17", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2304}, "offset_end" : {"in":2431}} , 
 	{ "Name" : "weights_18", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2432}, "offset_end" : {"in":2559}} , 
 	{ "Name" : "weights_19", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2560}, "offset_end" : {"in":2687}} , 
 	{ "Name" : "weights_20", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2688}, "offset_end" : {"in":2815}} , 
 	{ "Name" : "weights_21", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2816}, "offset_end" : {"in":2943}} , 
 	{ "Name" : "weights_22", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":2944}, "offset_end" : {"in":3071}} , 
 	{ "Name" : "weights_23", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3072}, "offset_end" : {"in":3199}} , 
 	{ "Name" : "weights_24", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3200}, "offset_end" : {"in":3327}} , 
 	{ "Name" : "weights_25", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3328}, "offset_end" : {"in":3455}} , 
 	{ "Name" : "weights_26", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3456}, "offset_end" : {"in":3583}} , 
 	{ "Name" : "weights_27", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3584}, "offset_end" : {"in":3711}} , 
 	{ "Name" : "weights_28", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3712}, "offset_end" : {"in":3839}} , 
 	{ "Name" : "weights_29", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3840}, "offset_end" : {"in":3967}} , 
 	{ "Name" : "weights_30", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":3968}, "offset_end" : {"in":4095}} , 
 	{ "Name" : "weights_31", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":4096}, "offset_end" : {"in":4223}} , 
 	{ "Name" : "out_stream", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "num_rows", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_stream_TDATA sc_in sc_lv 8 signal 0 } 
	{ in_stream_TVALID sc_in sc_logic 1 invld 0 } 
	{ in_stream_TREADY sc_out sc_logic 1 inacc 0 } 
	{ out_stream_TDATA sc_out sc_lv 32 signal 33 } 
	{ out_stream_TVALID sc_out sc_logic 1 outvld 33 } 
	{ out_stream_TREADY sc_in sc_logic 1 outacc 33 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 13 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 13 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"dense_gemv","role":"start","value":"0","valid_bit":"0"},{"name":"dense_gemv","role":"continue","value":"0","valid_bit":"4"},{"name":"dense_gemv","role":"auto_start","value":"0","valid_bit":"7"},{"name":"num_rows","role":"data","value":"16"},{"name":"weights_0","role":"data","value":"128"},{"name":"weights_1","role":"data","value":"256"},{"name":"weights_2","role":"data","value":"384"},{"name":"weights_3","role":"data","value":"512"},{"name":"weights_4","role":"data","value":"640"},{"name":"weights_5","role":"data","value":"768"},{"name":"weights_6","role":"data","value":"896"},{"name":"weights_7","role":"data","value":"1024"},{"name":"weights_8","role":"data","value":"1152"},{"name":"weights_9","role":"data","value":"1280"},{"name":"weights_10","role":"data","value":"1408"},{"name":"weights_11","role":"data","value":"1536"},{"name":"weights_12","role":"data","value":"1664"},{"name":"weights_13","role":"data","value":"1792"},{"name":"weights_14","role":"data","value":"1920"},{"name":"weights_15","role":"data","value":"2048"},{"name":"weights_16","role":"data","value":"2176"},{"name":"weights_17","role":"data","value":"2304"},{"name":"weights_18","role":"data","value":"2432"},{"name":"weights_19","role":"data","value":"2560"},{"name":"weights_20","role":"data","value":"2688"},{"name":"weights_21","role":"data","value":"2816"},{"name":"weights_22","role":"data","value":"2944"},{"name":"weights_23","role":"data","value":"3072"},{"name":"weights_24","role":"data","value":"3200"},{"name":"weights_25","role":"data","value":"3328"},{"name":"weights_26","role":"data","value":"3456"},{"name":"weights_27","role":"data","value":"3584"},{"name":"weights_28","role":"data","value":"3712"},{"name":"weights_29","role":"data","value":"3840"},{"name":"weights_30","role":"data","value":"3968"},{"name":"weights_31","role":"data","value":"4096"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"dense_gemv","role":"start","value":"0","valid_bit":"0"},{"name":"dense_gemv","role":"done","value":"0","valid_bit":"1"},{"name":"dense_gemv","role":"idle","value":"0","valid_bit":"2"},{"name":"dense_gemv","role":"ready","value":"0","valid_bit":"3"},{"name":"dense_gemv","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_stream", "role": "TDATA" }} , 
 	{ "name": "in_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_stream", "role": "TVALID" }} , 
 	{ "name": "in_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_stream", "role": "TREADY" }} , 
 	{ "name": "out_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_stream", "role": "TDATA" }} , 
 	{ "name": "out_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream", "role": "TVALID" }} , 
 	{ "name": "out_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream", "role": "TREADY" }}  ]}

set ArgLastReadFirstWriteLatency {
	dense_gemv {
		in_stream {Type I LastRead 1 FirstWrite -1}
		weights_0 {Type I LastRead 2 FirstWrite -1}
		weights_1 {Type I LastRead 2 FirstWrite -1}
		weights_2 {Type I LastRead 2 FirstWrite -1}
		weights_3 {Type I LastRead 2 FirstWrite -1}
		weights_4 {Type I LastRead 1 FirstWrite -1}
		weights_5 {Type I LastRead 1 FirstWrite -1}
		weights_6 {Type I LastRead 1 FirstWrite -1}
		weights_7 {Type I LastRead 1 FirstWrite -1}
		weights_8 {Type I LastRead 2 FirstWrite -1}
		weights_9 {Type I LastRead 2 FirstWrite -1}
		weights_10 {Type I LastRead 2 FirstWrite -1}
		weights_11 {Type I LastRead 2 FirstWrite -1}
		weights_12 {Type I LastRead 1 FirstWrite -1}
		weights_13 {Type I LastRead 1 FirstWrite -1}
		weights_14 {Type I LastRead 1 FirstWrite -1}
		weights_15 {Type I LastRead 1 FirstWrite -1}
		weights_16 {Type I LastRead 1 FirstWrite -1}
		weights_17 {Type I LastRead 1 FirstWrite -1}
		weights_18 {Type I LastRead 1 FirstWrite -1}
		weights_19 {Type I LastRead 1 FirstWrite -1}
		weights_20 {Type I LastRead 1 FirstWrite -1}
		weights_21 {Type I LastRead 1 FirstWrite -1}
		weights_22 {Type I LastRead 1 FirstWrite -1}
		weights_23 {Type I LastRead 1 FirstWrite -1}
		weights_24 {Type I LastRead 1 FirstWrite -1}
		weights_25 {Type I LastRead 1 FirstWrite -1}
		weights_26 {Type I LastRead 1 FirstWrite -1}
		weights_27 {Type I LastRead 1 FirstWrite -1}
		weights_28 {Type I LastRead 0 FirstWrite -1}
		weights_29 {Type I LastRead 0 FirstWrite -1}
		weights_30 {Type I LastRead 0 FirstWrite -1}
		weights_31 {Type I LastRead 0 FirstWrite -1}
		out_stream {Type O LastRead -1 FirstWrite 6}
		num_rows {Type I LastRead 3 FirstWrite -1}}
	dense_gemv_Pipeline_VITIS_LOOP_25_1 {
		in_stream {Type I LastRead 1 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 0}
		p_out1 {Type O LastRead -1 FirstWrite 0}
		p_out2 {Type O LastRead -1 FirstWrite 0}
		p_out3 {Type O LastRead -1 FirstWrite 0}
		p_out4 {Type O LastRead -1 FirstWrite 0}
		p_out5 {Type O LastRead -1 FirstWrite 0}
		p_out6 {Type O LastRead -1 FirstWrite 0}
		p_out7 {Type O LastRead -1 FirstWrite 0}
		p_out8 {Type O LastRead -1 FirstWrite 0}
		p_out9 {Type O LastRead -1 FirstWrite 0}
		p_out10 {Type O LastRead -1 FirstWrite 0}
		p_out11 {Type O LastRead -1 FirstWrite 0}
		p_out12 {Type O LastRead -1 FirstWrite 0}
		p_out13 {Type O LastRead -1 FirstWrite 0}
		p_out14 {Type O LastRead -1 FirstWrite 0}
		p_out15 {Type O LastRead -1 FirstWrite 0}
		p_out16 {Type O LastRead -1 FirstWrite 0}
		p_out17 {Type O LastRead -1 FirstWrite 0}
		p_out18 {Type O LastRead -1 FirstWrite 0}
		p_out19 {Type O LastRead -1 FirstWrite 0}
		p_out20 {Type O LastRead -1 FirstWrite 0}
		p_out21 {Type O LastRead -1 FirstWrite 0}
		p_out22 {Type O LastRead -1 FirstWrite 0}
		p_out23 {Type O LastRead -1 FirstWrite 0}
		p_out24 {Type O LastRead -1 FirstWrite 0}
		p_out25 {Type O LastRead -1 FirstWrite 0}
		p_out26 {Type O LastRead -1 FirstWrite 0}
		p_out27 {Type O LastRead -1 FirstWrite 0}
		p_out28 {Type O LastRead -1 FirstWrite 0}
		p_out29 {Type O LastRead -1 FirstWrite 0}
		p_out30 {Type O LastRead -1 FirstWrite 0}
		p_out31 {Type O LastRead -1 FirstWrite 0}}
	dense_gemv_Pipeline_VITIS_LOOP_30_2 {
		num_rows {Type I LastRead 0 FirstWrite -1}
		weights_0 {Type I LastRead 2 FirstWrite -1}
		weights_1 {Type I LastRead 2 FirstWrite -1}
		weights_2 {Type I LastRead 2 FirstWrite -1}
		weights_3 {Type I LastRead 2 FirstWrite -1}
		weights_4 {Type I LastRead 1 FirstWrite -1}
		weights_5 {Type I LastRead 1 FirstWrite -1}
		weights_6 {Type I LastRead 1 FirstWrite -1}
		weights_7 {Type I LastRead 1 FirstWrite -1}
		weights_8 {Type I LastRead 2 FirstWrite -1}
		weights_9 {Type I LastRead 2 FirstWrite -1}
		weights_10 {Type I LastRead 2 FirstWrite -1}
		weights_11 {Type I LastRead 2 FirstWrite -1}
		weights_12 {Type I LastRead 1 FirstWrite -1}
		weights_13 {Type I LastRead 1 FirstWrite -1}
		weights_14 {Type I LastRead 1 FirstWrite -1}
		weights_15 {Type I LastRead 1 FirstWrite -1}
		weights_16 {Type I LastRead 1 FirstWrite -1}
		weights_17 {Type I LastRead 1 FirstWrite -1}
		weights_18 {Type I LastRead 1 FirstWrite -1}
		weights_19 {Type I LastRead 1 FirstWrite -1}
		weights_20 {Type I LastRead 1 FirstWrite -1}
		weights_21 {Type I LastRead 1 FirstWrite -1}
		weights_22 {Type I LastRead 1 FirstWrite -1}
		weights_23 {Type I LastRead 1 FirstWrite -1}
		weights_24 {Type I LastRead 1 FirstWrite -1}
		weights_25 {Type I LastRead 1 FirstWrite -1}
		weights_26 {Type I LastRead 1 FirstWrite -1}
		weights_27 {Type I LastRead 1 FirstWrite -1}
		weights_28 {Type I LastRead 0 FirstWrite -1}
		weights_29 {Type I LastRead 0 FirstWrite -1}
		weights_30 {Type I LastRead 0 FirstWrite -1}
		weights_31 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_31 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_30 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_29 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_28 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_27 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_26 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_25 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_24 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_23 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_22 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_21 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_20 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_19 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_17 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_15 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_13 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_11 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln36 {Type I LastRead 0 FirstWrite -1}
		sext_ln36_1 {Type I LastRead 0 FirstWrite -1}
		out_stream {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_stream { axis {  { in_stream_TDATA in_data 0 8 }  { in_stream_TVALID in_vld 0 1 }  { in_stream_TREADY in_acc 1 1 } } }
	out_stream { axis {  { out_stream_TDATA out_data 1 32 }  { out_stream_TVALID out_vld 1 1 }  { out_stream_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
