# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
num_rows { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
weights_0 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 128
	offset_end 255
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_1 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 256
	offset_end 383
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_2 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 384
	offset_end 511
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_3 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 512
	offset_end 639
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_4 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 640
	offset_end 767
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_5 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 768
	offset_end 895
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_6 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 896
	offset_end 1023
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_7 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1024
	offset_end 1151
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_8 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1152
	offset_end 1279
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_9 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1280
	offset_end 1407
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_10 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1408
	offset_end 1535
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_11 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1536
	offset_end 1663
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_12 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1664
	offset_end 1791
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_13 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1792
	offset_end 1919
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_14 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 1920
	offset_end 2047
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_15 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2048
	offset_end 2175
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_16 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2176
	offset_end 2303
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_17 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2304
	offset_end 2431
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_18 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2432
	offset_end 2559
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_19 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2560
	offset_end 2687
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_20 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2688
	offset_end 2815
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_21 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2816
	offset_end 2943
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_22 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 2944
	offset_end 3071
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_23 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3072
	offset_end 3199
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_24 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3200
	offset_end 3327
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_25 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3328
	offset_end 3455
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_26 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3456
	offset_end 3583
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_27 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3584
	offset_end 3711
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_28 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3712
	offset_end 3839
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_29 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3840
	offset_end 3967
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_30 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 3968
	offset_end 4095
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
weights_31 { 
	dir I
	width 32
	depth 32
	mode ap_memory
	offset 4096
	offset_end 4223
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 133 \
			corename dense_gemv_control_axilite \
			name dense_gemv_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
			enable_mem_auto_widen 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler dense_gemv_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 134 \
    name in_stream \
    reset_level 0 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { in_stream_TDATA { I 8 vector } in_stream_TVALID { I 1 bit } in_stream_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 135 \
    name out_stream \
    reset_level 0 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { out_stream_TDATA { O 32 vector } out_stream_TVALID { O 1 bit } out_stream_TREADY { I 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream'"
}
}



# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler dense_gemv_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler dense_gemv_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


