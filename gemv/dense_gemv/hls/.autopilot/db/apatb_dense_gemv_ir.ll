; ModuleID = 'C:/fpga_project/gemv/dense_gemv/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<ap_int<8>>" = type { %"struct.ap_int<8>" }
%"struct.ap_int<8>" = type { %"struct.ap_int_base<8, true>" }
%"struct.ap_int_base<8, true>" = type { %"struct.ssdm_int<8, true>" }
%"struct.ssdm_int<8, true>" = type { i8 }
%"class.hls::stream<ap_int<32>>" = type { %"struct.ap_int<32>" }
%"struct.ap_int<32>" = type { %"struct.ap_int_base<32, true>" }
%"struct.ap_int_base<32, true>" = type { %"struct.ssdm_int<32, true>" }
%"struct.ssdm_int<32, true>" = type { i32 }

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_dense_gemv_ir(%"class.hls::stream<ap_int<8>>"* noalias nocapture nonnull align 1 dereferenceable(1) %in_stream, [32 x i32]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" "partition" %weights, %"class.hls::stream<ap_int<32>>"* noalias nocapture nonnull align 4 dereferenceable(4) %out_stream, i32 %num_rows) local_unnamed_addr #1 {
entry:
  %in_stream_copy = alloca i8, align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(i8* %in_stream_copy, i32 0) ]
  %0 = bitcast [32 x i32]* %weights to [32 x [32 x i32]]*
  %_0 = call i8* @malloc(i64 128)
  %_1 = call i8* @malloc(i64 128)
  %_2 = call i8* @malloc(i64 128)
  %_3 = call i8* @malloc(i64 128)
  %_4 = call i8* @malloc(i64 128)
  %_5 = call i8* @malloc(i64 128)
  %_6 = call i8* @malloc(i64 128)
  %_7 = call i8* @malloc(i64 128)
  %_8 = call i8* @malloc(i64 128)
  %_9 = call i8* @malloc(i64 128)
  %_10 = call i8* @malloc(i64 128)
  %_11 = call i8* @malloc(i64 128)
  %_12 = call i8* @malloc(i64 128)
  %_13 = call i8* @malloc(i64 128)
  %_14 = call i8* @malloc(i64 128)
  %_15 = call i8* @malloc(i64 128)
  %_16 = call i8* @malloc(i64 128)
  %_17 = call i8* @malloc(i64 128)
  %_18 = call i8* @malloc(i64 128)
  %_19 = call i8* @malloc(i64 128)
  %_20 = call i8* @malloc(i64 128)
  %_21 = call i8* @malloc(i64 128)
  %_22 = call i8* @malloc(i64 128)
  %_23 = call i8* @malloc(i64 128)
  %_24 = call i8* @malloc(i64 128)
  %_25 = call i8* @malloc(i64 128)
  %_26 = call i8* @malloc(i64 128)
  %_27 = call i8* @malloc(i64 128)
  %_28 = call i8* @malloc(i64 128)
  %_29 = call i8* @malloc(i64 128)
  %_30 = call i8* @malloc(i64 128)
  %_31 = call i8* @malloc(i64 128)
  %weights_copy_0 = bitcast i8* %_0 to [32 x i32]*
  %weights_copy_1 = bitcast i8* %_1 to [32 x i32]*
  %weights_copy_2 = bitcast i8* %_2 to [32 x i32]*
  %weights_copy_3 = bitcast i8* %_3 to [32 x i32]*
  %weights_copy_4 = bitcast i8* %_4 to [32 x i32]*
  %weights_copy_5 = bitcast i8* %_5 to [32 x i32]*
  %weights_copy_6 = bitcast i8* %_6 to [32 x i32]*
  %weights_copy_7 = bitcast i8* %_7 to [32 x i32]*
  %weights_copy_8 = bitcast i8* %_8 to [32 x i32]*
  %weights_copy_9 = bitcast i8* %_9 to [32 x i32]*
  %weights_copy_10 = bitcast i8* %_10 to [32 x i32]*
  %weights_copy_11 = bitcast i8* %_11 to [32 x i32]*
  %weights_copy_12 = bitcast i8* %_12 to [32 x i32]*
  %weights_copy_13 = bitcast i8* %_13 to [32 x i32]*
  %weights_copy_14 = bitcast i8* %_14 to [32 x i32]*
  %weights_copy_15 = bitcast i8* %_15 to [32 x i32]*
  %weights_copy_16 = bitcast i8* %_16 to [32 x i32]*
  %weights_copy_17 = bitcast i8* %_17 to [32 x i32]*
  %weights_copy_18 = bitcast i8* %_18 to [32 x i32]*
  %weights_copy_19 = bitcast i8* %_19 to [32 x i32]*
  %weights_copy_20 = bitcast i8* %_20 to [32 x i32]*
  %weights_copy_21 = bitcast i8* %_21 to [32 x i32]*
  %weights_copy_22 = bitcast i8* %_22 to [32 x i32]*
  %weights_copy_23 = bitcast i8* %_23 to [32 x i32]*
  %weights_copy_24 = bitcast i8* %_24 to [32 x i32]*
  %weights_copy_25 = bitcast i8* %_25 to [32 x i32]*
  %weights_copy_26 = bitcast i8* %_26 to [32 x i32]*
  %weights_copy_27 = bitcast i8* %_27 to [32 x i32]*
  %weights_copy_28 = bitcast i8* %_28 to [32 x i32]*
  %weights_copy_29 = bitcast i8* %_29 to [32 x i32]*
  %weights_copy_30 = bitcast i8* %_30 to [32 x i32]*
  %weights_copy_31 = bitcast i8* %_31 to [32 x i32]*
  %_03 = getelementptr [32 x i32], [32 x i32]* %weights_copy_0, i64 0, i64 0
  %_110 = getelementptr [32 x i32], [32 x i32]* %weights_copy_1, i64 0, i64 0
  %_211 = getelementptr [32 x i32], [32 x i32]* %weights_copy_2, i64 0, i64 0
  %_312 = getelementptr [32 x i32], [32 x i32]* %weights_copy_3, i64 0, i64 0
  %_413 = getelementptr [32 x i32], [32 x i32]* %weights_copy_4, i64 0, i64 0
  %_514 = getelementptr [32 x i32], [32 x i32]* %weights_copy_5, i64 0, i64 0
  %_615 = getelementptr [32 x i32], [32 x i32]* %weights_copy_6, i64 0, i64 0
  %_716 = getelementptr [32 x i32], [32 x i32]* %weights_copy_7, i64 0, i64 0
  %_817 = getelementptr [32 x i32], [32 x i32]* %weights_copy_8, i64 0, i64 0
  %_918 = getelementptr [32 x i32], [32 x i32]* %weights_copy_9, i64 0, i64 0
  %_1019 = getelementptr [32 x i32], [32 x i32]* %weights_copy_10, i64 0, i64 0
  %_1120 = getelementptr [32 x i32], [32 x i32]* %weights_copy_11, i64 0, i64 0
  %_1221 = getelementptr [32 x i32], [32 x i32]* %weights_copy_12, i64 0, i64 0
  %_1322 = getelementptr [32 x i32], [32 x i32]* %weights_copy_13, i64 0, i64 0
  %_1423 = getelementptr [32 x i32], [32 x i32]* %weights_copy_14, i64 0, i64 0
  %_1524 = getelementptr [32 x i32], [32 x i32]* %weights_copy_15, i64 0, i64 0
  %_1625 = getelementptr [32 x i32], [32 x i32]* %weights_copy_16, i64 0, i64 0
  %_1726 = getelementptr [32 x i32], [32 x i32]* %weights_copy_17, i64 0, i64 0
  %_1827 = getelementptr [32 x i32], [32 x i32]* %weights_copy_18, i64 0, i64 0
  %_1928 = getelementptr [32 x i32], [32 x i32]* %weights_copy_19, i64 0, i64 0
  %_2029 = getelementptr [32 x i32], [32 x i32]* %weights_copy_20, i64 0, i64 0
  %_2130 = getelementptr [32 x i32], [32 x i32]* %weights_copy_21, i64 0, i64 0
  %_2231 = getelementptr [32 x i32], [32 x i32]* %weights_copy_22, i64 0, i64 0
  %_2332 = getelementptr [32 x i32], [32 x i32]* %weights_copy_23, i64 0, i64 0
  %_2433 = getelementptr [32 x i32], [32 x i32]* %weights_copy_24, i64 0, i64 0
  %_2534 = getelementptr [32 x i32], [32 x i32]* %weights_copy_25, i64 0, i64 0
  %_2635 = getelementptr [32 x i32], [32 x i32]* %weights_copy_26, i64 0, i64 0
  %_2736 = getelementptr [32 x i32], [32 x i32]* %weights_copy_27, i64 0, i64 0
  %_2837 = getelementptr [32 x i32], [32 x i32]* %weights_copy_28, i64 0, i64 0
  %_2938 = getelementptr [32 x i32], [32 x i32]* %weights_copy_29, i64 0, i64 0
  %_3039 = getelementptr [32 x i32], [32 x i32]* %weights_copy_30, i64 0, i64 0
  %_3140 = getelementptr [32 x i32], [32 x i32]* %weights_copy_31, i64 0, i64 0
  %out_stream_copy = alloca i32, align 512
  call void @llvm.sideeffect() #10 [ "stream_interface"(i32* %out_stream_copy, i32 0) ]
  call void @copy_in(%"class.hls::stream<ap_int<8>>"* nonnull %in_stream, i8* nonnull align 512 %in_stream_copy, [32 x [32 x i32]]* nonnull %0, [32 x i32]* %weights_copy_0, [32 x i32]* %weights_copy_1, [32 x i32]* %weights_copy_2, [32 x i32]* %weights_copy_3, [32 x i32]* %weights_copy_4, [32 x i32]* %weights_copy_5, [32 x i32]* %weights_copy_6, [32 x i32]* %weights_copy_7, [32 x i32]* %weights_copy_8, [32 x i32]* %weights_copy_9, [32 x i32]* %weights_copy_10, [32 x i32]* %weights_copy_11, [32 x i32]* %weights_copy_12, [32 x i32]* %weights_copy_13, [32 x i32]* %weights_copy_14, [32 x i32]* %weights_copy_15, [32 x i32]* %weights_copy_16, [32 x i32]* %weights_copy_17, [32 x i32]* %weights_copy_18, [32 x i32]* %weights_copy_19, [32 x i32]* %weights_copy_20, [32 x i32]* %weights_copy_21, [32 x i32]* %weights_copy_22, [32 x i32]* %weights_copy_23, [32 x i32]* %weights_copy_24, [32 x i32]* %weights_copy_25, [32 x i32]* %weights_copy_26, [32 x i32]* %weights_copy_27, [32 x i32]* %weights_copy_28, [32 x i32]* %weights_copy_29, [32 x i32]* %weights_copy_30, [32 x i32]* %weights_copy_31, %"class.hls::stream<ap_int<32>>"* nonnull %out_stream, i32* nonnull align 512 %out_stream_copy)
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_03, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_110, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_211, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_312, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_413, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_514, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_615, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_716, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_817, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_918, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1019, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1120, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1221, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1322, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1423, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1524, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1625, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1726, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1827, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_1928, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2029, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2130, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2231, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2332, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2433, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2534, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2635, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2736, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2837, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_2938, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_3039, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @llvm.sideeffect() #11 [ "xlx_array_partition"(i32* %_3140, i32 998, i32 1, i32 0, i1 false) ], !dbg !44
  call void @apatb_dense_gemv_hw(i8* %in_stream_copy, [32 x i32]* %weights_copy_0, [32 x i32]* %weights_copy_1, [32 x i32]* %weights_copy_2, [32 x i32]* %weights_copy_3, [32 x i32]* %weights_copy_4, [32 x i32]* %weights_copy_5, [32 x i32]* %weights_copy_6, [32 x i32]* %weights_copy_7, [32 x i32]* %weights_copy_8, [32 x i32]* %weights_copy_9, [32 x i32]* %weights_copy_10, [32 x i32]* %weights_copy_11, [32 x i32]* %weights_copy_12, [32 x i32]* %weights_copy_13, [32 x i32]* %weights_copy_14, [32 x i32]* %weights_copy_15, [32 x i32]* %weights_copy_16, [32 x i32]* %weights_copy_17, [32 x i32]* %weights_copy_18, [32 x i32]* %weights_copy_19, [32 x i32]* %weights_copy_20, [32 x i32]* %weights_copy_21, [32 x i32]* %weights_copy_22, [32 x i32]* %weights_copy_23, [32 x i32]* %weights_copy_24, [32 x i32]* %weights_copy_25, [32 x i32]* %weights_copy_26, [32 x i32]* %weights_copy_27, [32 x i32]* %weights_copy_28, [32 x i32]* %weights_copy_29, [32 x i32]* %weights_copy_30, [32 x i32]* %weights_copy_31, i32* %out_stream_copy, i32 %num_rows)
  call void @copy_back(%"class.hls::stream<ap_int<8>>"* %in_stream, i8* %in_stream_copy, [32 x [32 x i32]]* %0, [32 x i32]* %weights_copy_0, [32 x i32]* %weights_copy_1, [32 x i32]* %weights_copy_2, [32 x i32]* %weights_copy_3, [32 x i32]* %weights_copy_4, [32 x i32]* %weights_copy_5, [32 x i32]* %weights_copy_6, [32 x i32]* %weights_copy_7, [32 x i32]* %weights_copy_8, [32 x i32]* %weights_copy_9, [32 x i32]* %weights_copy_10, [32 x i32]* %weights_copy_11, [32 x i32]* %weights_copy_12, [32 x i32]* %weights_copy_13, [32 x i32]* %weights_copy_14, [32 x i32]* %weights_copy_15, [32 x i32]* %weights_copy_16, [32 x i32]* %weights_copy_17, [32 x i32]* %weights_copy_18, [32 x i32]* %weights_copy_19, [32 x i32]* %weights_copy_20, [32 x i32]* %weights_copy_21, [32 x i32]* %weights_copy_22, [32 x i32]* %weights_copy_23, [32 x i32]* %weights_copy_24, [32 x i32]* %weights_copy_25, [32 x i32]* %weights_copy_26, [32 x i32]* %weights_copy_27, [32 x i32]* %weights_copy_28, [32 x i32]* %weights_copy_29, [32 x i32]* %weights_copy_30, [32 x i32]* %weights_copy_31, %"class.hls::stream<ap_int<32>>"* %out_stream, i32* %out_stream_copy)
  call void @free(i8* %_0)
  call void @free(i8* %_1)
  call void @free(i8* %_2)
  call void @free(i8* %_3)
  call void @free(i8* %_4)
  call void @free(i8* %_5)
  call void @free(i8* %_6)
  call void @free(i8* %_7)
  call void @free(i8* %_8)
  call void @free(i8* %_9)
  call void @free(i8* %_10)
  call void @free(i8* %_11)
  call void @free(i8* %_12)
  call void @free(i8* %_13)
  call void @free(i8* %_14)
  call void @free(i8* %_15)
  call void @free(i8* %_16)
  call void @free(i8* %_17)
  call void @free(i8* %_18)
  call void @free(i8* %_19)
  call void @free(i8* %_20)
  call void @free(i8* %_21)
  call void @free(i8* %_22)
  call void @free(i8* %_23)
  call void @free(i8* %_24)
  call void @free(i8* %_25)
  call void @free(i8* %_26)
  call void @free(i8* %_27)
  call void @free(i8* %_28)
  call void @free(i8* %_29)
  call void @free(i8* %_30)
  call void @free(i8* %_31)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* noalias "unpacked"="0" %dst, i8* noalias nocapture align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<ap_int<8>>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* nonnull %dst, i8* align 512 %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* noalias nocapture "unpacked"="0", i8* noalias nocapture align 512 "unpacked"="1.0") unnamed_addr #3 {
entry:
  %2 = alloca i8
  %3 = alloca %"class.hls::stream<ap_int<8>>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %1)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  call void @fpga_fifo_pop_1(i8* %2, i8* %1)
  %5 = load volatile i8, i8* %2
  %.ivi = insertvalue %"class.hls::stream<ap_int<8>>" undef, i8 %5, 0, 0, 0, 0
  store %"class.hls::stream<ap_int<8>>" %.ivi, %"class.hls::stream<ap_int<8>>"* %3
  %6 = bitcast %"class.hls::stream<ap_int<8>>"* %3 to i8*
  %7 = bitcast %"class.hls::stream<ap_int<8>>"* %0 to i8*
  call void @fpga_fifo_push_1(i8* %6, i8* %7)
  br label %empty, !llvm.loop !1421

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32a32i32([32 x [32 x i32]]* "orig.arg.no"="0" %dst, [32 x [32 x i32]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #4 {
entry:
  %0 = icmp eq [32 x [32 x i32]]* %src, null
  %1 = icmp eq [32 x [32 x i32]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x [32 x i32]], [32 x [32 x i32]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x [32 x i32]], [32 x [32 x i32]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a32i32([32 x i32]* %dst.addr, [32 x i32]* %src.addr, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32i32([32 x i32]* "orig.arg.no"="0" %dst, [32 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #4 {
entry:
  %0 = icmp eq [32 x i32]* %src, null
  %1 = icmp eq [32 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x i32], [32 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x i32], [32 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<32>>"(i32* noalias nocapture align 512 "unpacked"="0.0" %dst, %"class.hls::stream<ap_int<32>>"* noalias "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<ap_int<32>>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<32>>"(i32* align 512 %dst, %"class.hls::stream<ap_int<32>>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<32>>"(i32* noalias nocapture align 512 "unpacked"="0.0", %"class.hls::stream<ap_int<32>>"* noalias nocapture "unpacked"="1") unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream<ap_int<32>>"
  %3 = alloca i32
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream<ap_int<32>>"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_4(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream<ap_int<32>>"* %2 to i8*
  %7 = bitcast %"class.hls::stream<ap_int<32>>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream<ap_int<32>>", %"class.hls::stream<ap_int<32>>"* %2
  %.evi = extractvalue %"class.hls::stream<ap_int<32>>" %8, 0, 0, 0, 0
  store i32 %.evi, i32* %3
  %9 = bitcast i32* %3 to i8*
  %10 = bitcast i32* %0 to i8*
  call void @fpga_fifo_push_4(i8* %9, i8* %10)
  br label %empty, !llvm.loop !1423

ret:                                              ; preds = %empty
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<32>>.4"(%"class.hls::stream<ap_int<32>>"* noalias "unpacked"="0" %dst, i32* noalias nocapture align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<ap_int<32>>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<32>>.7"(%"class.hls::stream<ap_int<32>>"* nonnull %dst, i32* align 512 %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<32>>.7"(%"class.hls::stream<ap_int<32>>"* noalias nocapture "unpacked"="0", i32* noalias nocapture align 512 "unpacked"="1.0") unnamed_addr #3 {
entry:
  %2 = alloca i32
  %3 = alloca %"class.hls::stream<ap_int<32>>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast i32* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_4(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast i32* %2 to i8*
  %7 = bitcast i32* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %6, i8* %7)
  %8 = load volatile i32, i32* %2
  %.ivi = insertvalue %"class.hls::stream<ap_int<32>>" undef, i32 %8, 0, 0, 0, 0
  store %"class.hls::stream<ap_int<32>>" %.ivi, %"class.hls::stream<ap_int<32>>"* %3
  %9 = bitcast %"class.hls::stream<ap_int<32>>"* %3 to i8*
  %10 = bitcast %"class.hls::stream<ap_int<32>>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %9, i8* %10)
  br label %empty, !llvm.loop !1424

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>.15"(i8* noalias nocapture align 512 "unpacked"="0.0" %dst, %"class.hls::stream<ap_int<8>>"* noalias "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<ap_int<8>>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>.18"(i8* align 512 %dst, %"class.hls::stream<ap_int<8>>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>.18"(i8* noalias nocapture align 512 "unpacked"="0.0", %"class.hls::stream<ap_int<8>>"* noalias nocapture "unpacked"="1") unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream<ap_int<8>>"
  %3 = alloca i8
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream<ap_int<8>>"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_1(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream<ap_int<8>>"* %2 to i8*
  %7 = bitcast %"class.hls::stream<ap_int<8>>"* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream<ap_int<8>>", %"class.hls::stream<ap_int<8>>"* %2
  %.evi = extractvalue %"class.hls::stream<ap_int<8>>" %8, 0, 0, 0, 0
  store i8 %.evi, i8* %3
  call void @fpga_fifo_push_1(i8* %3, i8* %0)
  br label %empty, !llvm.loop !1425

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32i32.27.28(i32* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, i32* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, i32* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, i32* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, i32* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, i32* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, i32* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, i32* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, i32* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, i32* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, i32* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, i32* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, i32* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, i32* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, i32* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, i32* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, i32* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, i32* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, i32* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, i32* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, i32* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, i32* "orig.arg.no"="0" "unpacked"="0.21" %dst_21, i32* "orig.arg.no"="0" "unpacked"="0.22" %dst_22, i32* "orig.arg.no"="0" "unpacked"="0.23" %dst_23, i32* "orig.arg.no"="0" "unpacked"="0.24" %dst_24, i32* "orig.arg.no"="0" "unpacked"="0.25" %dst_25, i32* "orig.arg.no"="0" "unpacked"="0.26" %dst_26, i32* "orig.arg.no"="0" "unpacked"="0.27" %dst_27, i32* "orig.arg.no"="0" "unpacked"="0.28" %dst_28, i32* "orig.arg.no"="0" "unpacked"="0.29" %dst_29, i32* "orig.arg.no"="0" "unpacked"="0.30" %dst_30, i32* "orig.arg.no"="0" "unpacked"="0.31" %dst_31, [32 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #4 {
entry:
  %0 = icmp eq [32 x i32]* %src, null
  %1 = icmp eq i32* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [32 x i32], [32 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  switch i64 %for.loop.idx2, label %dst.addr.exit [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
    i64 3, label %dst.addr.case.3
    i64 4, label %dst.addr.case.4
    i64 5, label %dst.addr.case.5
    i64 6, label %dst.addr.case.6
    i64 7, label %dst.addr.case.7
    i64 8, label %dst.addr.case.8
    i64 9, label %dst.addr.case.9
    i64 10, label %dst.addr.case.10
    i64 11, label %dst.addr.case.11
    i64 12, label %dst.addr.case.12
    i64 13, label %dst.addr.case.13
    i64 14, label %dst.addr.case.14
    i64 15, label %dst.addr.case.15
    i64 16, label %dst.addr.case.16
    i64 17, label %dst.addr.case.17
    i64 18, label %dst.addr.case.18
    i64 19, label %dst.addr.case.19
    i64 20, label %dst.addr.case.20
    i64 21, label %dst.addr.case.21
    i64 22, label %dst.addr.case.22
    i64 23, label %dst.addr.case.23
    i64 24, label %dst.addr.case.24
    i64 25, label %dst.addr.case.25
    i64 26, label %dst.addr.case.26
    i64 27, label %dst.addr.case.27
    i64 28, label %dst.addr.case.28
    i64 29, label %dst.addr.case.29
    i64 30, label %dst.addr.case.30
    i64 31, label %dst.addr.case.31
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_1, align 4
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_2, align 4
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_3, align 4
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_4, align 4
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_5, align 4
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_6, align 4
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_7, align 4
  br label %dst.addr.exit

dst.addr.case.8:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_8, align 4
  br label %dst.addr.exit

dst.addr.case.9:                                  ; preds = %for.loop
  store i32 %3, i32* %dst_9, align 4
  br label %dst.addr.exit

dst.addr.case.10:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_10, align 4
  br label %dst.addr.exit

dst.addr.case.11:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_11, align 4
  br label %dst.addr.exit

dst.addr.case.12:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_12, align 4
  br label %dst.addr.exit

dst.addr.case.13:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_13, align 4
  br label %dst.addr.exit

dst.addr.case.14:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_14, align 4
  br label %dst.addr.exit

dst.addr.case.15:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_15, align 4
  br label %dst.addr.exit

dst.addr.case.16:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_16, align 4
  br label %dst.addr.exit

dst.addr.case.17:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_17, align 4
  br label %dst.addr.exit

dst.addr.case.18:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_18, align 4
  br label %dst.addr.exit

dst.addr.case.19:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_19, align 4
  br label %dst.addr.exit

dst.addr.case.20:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_20, align 4
  br label %dst.addr.exit

dst.addr.case.21:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_21, align 4
  br label %dst.addr.exit

dst.addr.case.22:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_22, align 4
  br label %dst.addr.exit

dst.addr.case.23:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_23, align 4
  br label %dst.addr.exit

dst.addr.case.24:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_24, align 4
  br label %dst.addr.exit

dst.addr.case.25:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_25, align 4
  br label %dst.addr.exit

dst.addr.case.26:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_26, align 4
  br label %dst.addr.exit

dst.addr.case.27:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_27, align 4
  br label %dst.addr.exit

dst.addr.case.28:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_28, align 4
  br label %dst.addr.exit

dst.addr.case.29:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_29, align 4
  br label %dst.addr.exit

dst.addr.case.30:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_30, align 4
  br label %dst.addr.exit

dst.addr.case.31:                                 ; preds = %for.loop
  store i32 %3, i32* %dst_31, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.31, %dst.addr.case.30, %dst.addr.case.29, %dst.addr.case.28, %dst.addr.case.27, %dst.addr.case.26, %dst.addr.case.25, %dst.addr.case.24, %dst.addr.case.23, %dst.addr.case.22, %dst.addr.case.21, %dst.addr.case.20, %dst.addr.case.19, %dst.addr.case.18, %dst.addr.case.17, %dst.addr.case.16, %dst.addr.case.15, %dst.addr.case.14, %dst.addr.case.13, %dst.addr.case.12, %dst.addr.case.11, %dst.addr.case.10, %dst.addr.case.9, %dst.addr.case.8, %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0, %for.loop
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32a32i32.26.29([32 x i32]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.21" %dst_21, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.22" %dst_22, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.23" %dst_23, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.24" %dst_24, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.25" %dst_25, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.26" %dst_26, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.27" %dst_27, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.28" %dst_28, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.29" %dst_29, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.30" %dst_30, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.31" %dst_31, [32 x [32 x i32]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #4 {
entry:
  %0 = icmp eq [32 x [32 x i32]]* %src, null
  %1 = icmp eq [32 x i32]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr_0 = getelementptr [32 x i32], [32 x i32]* %dst_0, i64 0, i64 %for.loop.idx2
  %dst.addr_1 = getelementptr [32 x i32], [32 x i32]* %dst_1, i64 0, i64 %for.loop.idx2
  %dst.addr_2 = getelementptr [32 x i32], [32 x i32]* %dst_2, i64 0, i64 %for.loop.idx2
  %dst.addr_3 = getelementptr [32 x i32], [32 x i32]* %dst_3, i64 0, i64 %for.loop.idx2
  %dst.addr_4 = getelementptr [32 x i32], [32 x i32]* %dst_4, i64 0, i64 %for.loop.idx2
  %dst.addr_5 = getelementptr [32 x i32], [32 x i32]* %dst_5, i64 0, i64 %for.loop.idx2
  %dst.addr_6 = getelementptr [32 x i32], [32 x i32]* %dst_6, i64 0, i64 %for.loop.idx2
  %dst.addr_7 = getelementptr [32 x i32], [32 x i32]* %dst_7, i64 0, i64 %for.loop.idx2
  %dst.addr_8 = getelementptr [32 x i32], [32 x i32]* %dst_8, i64 0, i64 %for.loop.idx2
  %dst.addr_9 = getelementptr [32 x i32], [32 x i32]* %dst_9, i64 0, i64 %for.loop.idx2
  %dst.addr_10 = getelementptr [32 x i32], [32 x i32]* %dst_10, i64 0, i64 %for.loop.idx2
  %dst.addr_11 = getelementptr [32 x i32], [32 x i32]* %dst_11, i64 0, i64 %for.loop.idx2
  %dst.addr_12 = getelementptr [32 x i32], [32 x i32]* %dst_12, i64 0, i64 %for.loop.idx2
  %dst.addr_13 = getelementptr [32 x i32], [32 x i32]* %dst_13, i64 0, i64 %for.loop.idx2
  %dst.addr_14 = getelementptr [32 x i32], [32 x i32]* %dst_14, i64 0, i64 %for.loop.idx2
  %dst.addr_15 = getelementptr [32 x i32], [32 x i32]* %dst_15, i64 0, i64 %for.loop.idx2
  %dst.addr_16 = getelementptr [32 x i32], [32 x i32]* %dst_16, i64 0, i64 %for.loop.idx2
  %dst.addr_17 = getelementptr [32 x i32], [32 x i32]* %dst_17, i64 0, i64 %for.loop.idx2
  %dst.addr_18 = getelementptr [32 x i32], [32 x i32]* %dst_18, i64 0, i64 %for.loop.idx2
  %dst.addr_19 = getelementptr [32 x i32], [32 x i32]* %dst_19, i64 0, i64 %for.loop.idx2
  %dst.addr_20 = getelementptr [32 x i32], [32 x i32]* %dst_20, i64 0, i64 %for.loop.idx2
  %dst.addr_21 = getelementptr [32 x i32], [32 x i32]* %dst_21, i64 0, i64 %for.loop.idx2
  %dst.addr_22 = getelementptr [32 x i32], [32 x i32]* %dst_22, i64 0, i64 %for.loop.idx2
  %dst.addr_23 = getelementptr [32 x i32], [32 x i32]* %dst_23, i64 0, i64 %for.loop.idx2
  %dst.addr_24 = getelementptr [32 x i32], [32 x i32]* %dst_24, i64 0, i64 %for.loop.idx2
  %dst.addr_25 = getelementptr [32 x i32], [32 x i32]* %dst_25, i64 0, i64 %for.loop.idx2
  %dst.addr_26 = getelementptr [32 x i32], [32 x i32]* %dst_26, i64 0, i64 %for.loop.idx2
  %dst.addr_27 = getelementptr [32 x i32], [32 x i32]* %dst_27, i64 0, i64 %for.loop.idx2
  %dst.addr_28 = getelementptr [32 x i32], [32 x i32]* %dst_28, i64 0, i64 %for.loop.idx2
  %dst.addr_29 = getelementptr [32 x i32], [32 x i32]* %dst_29, i64 0, i64 %for.loop.idx2
  %dst.addr_30 = getelementptr [32 x i32], [32 x i32]* %dst_30, i64 0, i64 %for.loop.idx2
  %dst.addr_31 = getelementptr [32 x i32], [32 x i32]* %dst_31, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x [32 x i32]], [32 x [32 x i32]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a32i32.27.28(i32* %dst.addr_0, i32* %dst.addr_1, i32* %dst.addr_2, i32* %dst.addr_3, i32* %dst.addr_4, i32* %dst.addr_5, i32* %dst.addr_6, i32* %dst.addr_7, i32* %dst.addr_8, i32* %dst.addr_9, i32* %dst.addr_10, i32* %dst.addr_11, i32* %dst.addr_12, i32* %dst.addr_13, i32* %dst.addr_14, i32* %dst.addr_15, i32* %dst.addr_16, i32* %dst.addr_17, i32* %dst.addr_18, i32* %dst.addr_19, i32* %dst.addr_20, i32* %dst.addr_21, i32* %dst.addr_22, i32* %dst.addr_23, i32* %dst.addr_24, i32* %dst.addr_25, i32* %dst.addr_26, i32* %dst.addr_27, i32* %dst.addr_28, i32* %dst.addr_29, i32* %dst.addr_30, i32* %dst.addr_31, [32 x i32]* %src.addr, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a32a32i32.25.30([32 x i32]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.21" %dst_21, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.22" %dst_22, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.23" %dst_23, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.24" %dst_24, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.25" %dst_25, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.26" %dst_26, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.27" %dst_27, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.28" %dst_28, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.29" %dst_29, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.30" %dst_30, [32 x i32]* "orig.arg.no"="0" "unpacked"="0.31" %dst_31, [32 x [32 x i32]]* readonly "orig.arg.no"="1" %src) #5 {
entry:
  %0 = icmp eq [32 x i32]* %dst_0, null
  %1 = icmp eq [32 x [32 x i32]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a32a32i32.26.29([32 x i32]* nonnull %dst_0, [32 x i32]* %dst_1, [32 x i32]* %dst_2, [32 x i32]* %dst_3, [32 x i32]* %dst_4, [32 x i32]* %dst_5, [32 x i32]* %dst_6, [32 x i32]* %dst_7, [32 x i32]* %dst_8, [32 x i32]* %dst_9, [32 x i32]* %dst_10, [32 x i32]* %dst_11, [32 x i32]* %dst_12, [32 x i32]* %dst_13, [32 x i32]* %dst_14, [32 x i32]* %dst_15, [32 x i32]* %dst_16, [32 x i32]* %dst_17, [32 x i32]* %dst_18, [32 x i32]* %dst_19, [32 x i32]* %dst_20, [32 x i32]* %dst_21, [32 x i32]* %dst_22, [32 x i32]* %dst_23, [32 x i32]* %dst_24, [32 x i32]* %dst_25, [32 x i32]* %dst_26, [32 x i32]* %dst_27, [32 x i32]* %dst_28, [32 x i32]* %dst_29, [32 x i32]* %dst_30, [32 x i32]* %dst_31, [32 x [32 x i32]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_in(%"class.hls::stream<ap_int<8>>"* "orig.arg.no"="0" "unpacked"="0", i8* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0", [32 x [32 x i32]]* readonly "orig.arg.no"="2" "unpacked"="2", [32 x i32]* "orig.arg.no"="3" "unpacked"="3.0" %_0, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.1" %_1, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.2" %_2, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.3" %_3, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.4" %_4, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.5" %_5, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.6" %_6, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.7" %_7, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.8" %_8, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.9" %_9, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.10" %_10, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.11" %_11, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.12" %_12, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.13" %_13, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.14" %_14, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.15" %_15, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.16" %_16, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.17" %_17, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.18" %_18, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.19" %_19, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.20" %_20, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.21" %_21, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.22" %_22, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.23" %_23, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.24" %_24, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.25" %_25, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.26" %_26, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.27" %_27, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.28" %_28, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.29" %_29, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.30" %_30, [32 x i32]* "orig.arg.no"="3" "unpacked"="3.31" %_31, %"class.hls::stream<ap_int<32>>"* "orig.arg.no"="4" "unpacked"="4", i32* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0") #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>.15"(i8* align 512 %1, %"class.hls::stream<ap_int<8>>"* %0)
  call void @onebyonecpy_hls.p0a32a32i32.25.30([32 x i32]* %_0, [32 x i32]* %_1, [32 x i32]* %_2, [32 x i32]* %_3, [32 x i32]* %_4, [32 x i32]* %_5, [32 x i32]* %_6, [32 x i32]* %_7, [32 x i32]* %_8, [32 x i32]* %_9, [32 x i32]* %_10, [32 x i32]* %_11, [32 x i32]* %_12, [32 x i32]* %_13, [32 x i32]* %_14, [32 x i32]* %_15, [32 x i32]* %_16, [32 x i32]* %_17, [32 x i32]* %_18, [32 x i32]* %_19, [32 x i32]* %_20, [32 x i32]* %_21, [32 x i32]* %_22, [32 x i32]* %_23, [32 x i32]* %_24, [32 x i32]* %_25, [32 x i32]* %_26, [32 x i32]* %_27, [32 x i32]* %_28, [32 x i32]* %_29, [32 x i32]* %_30, [32 x i32]* %_31, [32 x [32 x i32]]* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<32>>"(i32* align 512 %4, %"class.hls::stream<ap_int<32>>"* %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32i32.37.38([32 x i32]* "orig.arg.no"="0" %dst, i32* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, i32* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i32* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, i32* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, i32* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, i32* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, i32* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, i32* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, i32* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, i32* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, i32* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, i32* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, i32* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, i32* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, i32* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, i32* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, i32* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, i32* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, i32* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, i32* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, i32* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20, i32* readonly "orig.arg.no"="1" "unpacked"="1.21" %src_21, i32* readonly "orig.arg.no"="1" "unpacked"="1.22" %src_22, i32* readonly "orig.arg.no"="1" "unpacked"="1.23" %src_23, i32* readonly "orig.arg.no"="1" "unpacked"="1.24" %src_24, i32* readonly "orig.arg.no"="1" "unpacked"="1.25" %src_25, i32* readonly "orig.arg.no"="1" "unpacked"="1.26" %src_26, i32* readonly "orig.arg.no"="1" "unpacked"="1.27" %src_27, i32* readonly "orig.arg.no"="1" "unpacked"="1.28" %src_28, i32* readonly "orig.arg.no"="1" "unpacked"="1.29" %src_29, i32* readonly "orig.arg.no"="1" "unpacked"="1.30" %src_30, i32* readonly "orig.arg.no"="1" "unpacked"="1.31" %src_31, i64 "orig.arg.no"="2" %num) #4 {
entry:
  %0 = icmp eq i32* %src_0, null
  %1 = icmp eq [32 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [32 x i32], [32 x i32]* %dst, i64 0, i64 %for.loop.idx2
  switch i64 %for.loop.idx2, label %src.addr.exit [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
    i64 3, label %src.addr.case.3
    i64 4, label %src.addr.case.4
    i64 5, label %src.addr.case.5
    i64 6, label %src.addr.case.6
    i64 7, label %src.addr.case.7
    i64 8, label %src.addr.case.8
    i64 9, label %src.addr.case.9
    i64 10, label %src.addr.case.10
    i64 11, label %src.addr.case.11
    i64 12, label %src.addr.case.12
    i64 13, label %src.addr.case.13
    i64 14, label %src.addr.case.14
    i64 15, label %src.addr.case.15
    i64 16, label %src.addr.case.16
    i64 17, label %src.addr.case.17
    i64 18, label %src.addr.case.18
    i64 19, label %src.addr.case.19
    i64 20, label %src.addr.case.20
    i64 21, label %src.addr.case.21
    i64 22, label %src.addr.case.22
    i64 23, label %src.addr.case.23
    i64 24, label %src.addr.case.24
    i64 25, label %src.addr.case.25
    i64 26, label %src.addr.case.26
    i64 27, label %src.addr.case.27
    i64 28, label %src.addr.case.28
    i64 29, label %src.addr.case.29
    i64 30, label %src.addr.case.30
    i64 31, label %src.addr.case.31
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load i32, i32* %src_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_1 = load i32, i32* %src_1, align 4
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_2 = load i32, i32* %src_2, align 4
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %_3 = load i32, i32* %src_3, align 4
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  %_4 = load i32, i32* %src_4, align 4
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  %_5 = load i32, i32* %src_5, align 4
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  %_6 = load i32, i32* %src_6, align 4
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  %_7 = load i32, i32* %src_7, align 4
  br label %src.addr.exit

src.addr.case.8:                                  ; preds = %for.loop
  %_8 = load i32, i32* %src_8, align 4
  br label %src.addr.exit

src.addr.case.9:                                  ; preds = %for.loop
  %_9 = load i32, i32* %src_9, align 4
  br label %src.addr.exit

src.addr.case.10:                                 ; preds = %for.loop
  %_10 = load i32, i32* %src_10, align 4
  br label %src.addr.exit

src.addr.case.11:                                 ; preds = %for.loop
  %_11 = load i32, i32* %src_11, align 4
  br label %src.addr.exit

src.addr.case.12:                                 ; preds = %for.loop
  %_12 = load i32, i32* %src_12, align 4
  br label %src.addr.exit

src.addr.case.13:                                 ; preds = %for.loop
  %_13 = load i32, i32* %src_13, align 4
  br label %src.addr.exit

src.addr.case.14:                                 ; preds = %for.loop
  %_14 = load i32, i32* %src_14, align 4
  br label %src.addr.exit

src.addr.case.15:                                 ; preds = %for.loop
  %_15 = load i32, i32* %src_15, align 4
  br label %src.addr.exit

src.addr.case.16:                                 ; preds = %for.loop
  %_16 = load i32, i32* %src_16, align 4
  br label %src.addr.exit

src.addr.case.17:                                 ; preds = %for.loop
  %_17 = load i32, i32* %src_17, align 4
  br label %src.addr.exit

src.addr.case.18:                                 ; preds = %for.loop
  %_18 = load i32, i32* %src_18, align 4
  br label %src.addr.exit

src.addr.case.19:                                 ; preds = %for.loop
  %_19 = load i32, i32* %src_19, align 4
  br label %src.addr.exit

src.addr.case.20:                                 ; preds = %for.loop
  %_20 = load i32, i32* %src_20, align 4
  br label %src.addr.exit

src.addr.case.21:                                 ; preds = %for.loop
  %_21 = load i32, i32* %src_21, align 4
  br label %src.addr.exit

src.addr.case.22:                                 ; preds = %for.loop
  %_22 = load i32, i32* %src_22, align 4
  br label %src.addr.exit

src.addr.case.23:                                 ; preds = %for.loop
  %_23 = load i32, i32* %src_23, align 4
  br label %src.addr.exit

src.addr.case.24:                                 ; preds = %for.loop
  %_24 = load i32, i32* %src_24, align 4
  br label %src.addr.exit

src.addr.case.25:                                 ; preds = %for.loop
  %_25 = load i32, i32* %src_25, align 4
  br label %src.addr.exit

src.addr.case.26:                                 ; preds = %for.loop
  %_26 = load i32, i32* %src_26, align 4
  br label %src.addr.exit

src.addr.case.27:                                 ; preds = %for.loop
  %_27 = load i32, i32* %src_27, align 4
  br label %src.addr.exit

src.addr.case.28:                                 ; preds = %for.loop
  %_28 = load i32, i32* %src_28, align 4
  br label %src.addr.exit

src.addr.case.29:                                 ; preds = %for.loop
  %_29 = load i32, i32* %src_29, align 4
  br label %src.addr.exit

src.addr.case.30:                                 ; preds = %for.loop
  %_30 = load i32, i32* %src_30, align 4
  br label %src.addr.exit

src.addr.case.31:                                 ; preds = %for.loop
  %_31 = load i32, i32* %src_31, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.31, %src.addr.case.30, %src.addr.case.29, %src.addr.case.28, %src.addr.case.27, %src.addr.case.26, %src.addr.case.25, %src.addr.case.24, %src.addr.case.23, %src.addr.case.22, %src.addr.case.21, %src.addr.case.20, %src.addr.case.19, %src.addr.case.18, %src.addr.case.17, %src.addr.case.16, %src.addr.case.15, %src.addr.case.14, %src.addr.case.13, %src.addr.case.12, %src.addr.case.11, %src.addr.case.10, %src.addr.case.9, %src.addr.case.8, %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0, %for.loop
  %3 = phi i32 [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ], [ %_2, %src.addr.case.2 ], [ %_3, %src.addr.case.3 ], [ %_4, %src.addr.case.4 ], [ %_5, %src.addr.case.5 ], [ %_6, %src.addr.case.6 ], [ %_7, %src.addr.case.7 ], [ %_8, %src.addr.case.8 ], [ %_9, %src.addr.case.9 ], [ %_10, %src.addr.case.10 ], [ %_11, %src.addr.case.11 ], [ %_12, %src.addr.case.12 ], [ %_13, %src.addr.case.13 ], [ %_14, %src.addr.case.14 ], [ %_15, %src.addr.case.15 ], [ %_16, %src.addr.case.16 ], [ %_17, %src.addr.case.17 ], [ %_18, %src.addr.case.18 ], [ %_19, %src.addr.case.19 ], [ %_20, %src.addr.case.20 ], [ %_21, %src.addr.case.21 ], [ %_22, %src.addr.case.22 ], [ %_23, %src.addr.case.23 ], [ %_24, %src.addr.case.24 ], [ %_25, %src.addr.case.25 ], [ %_26, %src.addr.case.26 ], [ %_27, %src.addr.case.27 ], [ %_28, %src.addr.case.28 ], [ %_29, %src.addr.case.29 ], [ %_30, %src.addr.case.30 ], [ %_31, %src.addr.case.31 ], [ undef, %for.loop ]
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32a32i32.36.39([32 x [32 x i32]]* "orig.arg.no"="0" %dst, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.21" %src_21, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.22" %src_22, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.23" %src_23, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.24" %src_24, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.25" %src_25, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.26" %src_26, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.27" %src_27, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.28" %src_28, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.29" %src_29, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.30" %src_30, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.31" %src_31, i64 "orig.arg.no"="2" %num) #4 {
entry:
  %0 = icmp eq [32 x i32]* %src_0, null
  %1 = icmp eq [32 x [32 x i32]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x [32 x i32]], [32 x [32 x i32]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [32 x i32], [32 x i32]* %src_0, i64 0, i64 %for.loop.idx2
  %src.addr_1 = getelementptr [32 x i32], [32 x i32]* %src_1, i64 0, i64 %for.loop.idx2
  %src.addr_2 = getelementptr [32 x i32], [32 x i32]* %src_2, i64 0, i64 %for.loop.idx2
  %src.addr_3 = getelementptr [32 x i32], [32 x i32]* %src_3, i64 0, i64 %for.loop.idx2
  %src.addr_4 = getelementptr [32 x i32], [32 x i32]* %src_4, i64 0, i64 %for.loop.idx2
  %src.addr_5 = getelementptr [32 x i32], [32 x i32]* %src_5, i64 0, i64 %for.loop.idx2
  %src.addr_6 = getelementptr [32 x i32], [32 x i32]* %src_6, i64 0, i64 %for.loop.idx2
  %src.addr_7 = getelementptr [32 x i32], [32 x i32]* %src_7, i64 0, i64 %for.loop.idx2
  %src.addr_8 = getelementptr [32 x i32], [32 x i32]* %src_8, i64 0, i64 %for.loop.idx2
  %src.addr_9 = getelementptr [32 x i32], [32 x i32]* %src_9, i64 0, i64 %for.loop.idx2
  %src.addr_10 = getelementptr [32 x i32], [32 x i32]* %src_10, i64 0, i64 %for.loop.idx2
  %src.addr_11 = getelementptr [32 x i32], [32 x i32]* %src_11, i64 0, i64 %for.loop.idx2
  %src.addr_12 = getelementptr [32 x i32], [32 x i32]* %src_12, i64 0, i64 %for.loop.idx2
  %src.addr_13 = getelementptr [32 x i32], [32 x i32]* %src_13, i64 0, i64 %for.loop.idx2
  %src.addr_14 = getelementptr [32 x i32], [32 x i32]* %src_14, i64 0, i64 %for.loop.idx2
  %src.addr_15 = getelementptr [32 x i32], [32 x i32]* %src_15, i64 0, i64 %for.loop.idx2
  %src.addr_16 = getelementptr [32 x i32], [32 x i32]* %src_16, i64 0, i64 %for.loop.idx2
  %src.addr_17 = getelementptr [32 x i32], [32 x i32]* %src_17, i64 0, i64 %for.loop.idx2
  %src.addr_18 = getelementptr [32 x i32], [32 x i32]* %src_18, i64 0, i64 %for.loop.idx2
  %src.addr_19 = getelementptr [32 x i32], [32 x i32]* %src_19, i64 0, i64 %for.loop.idx2
  %src.addr_20 = getelementptr [32 x i32], [32 x i32]* %src_20, i64 0, i64 %for.loop.idx2
  %src.addr_21 = getelementptr [32 x i32], [32 x i32]* %src_21, i64 0, i64 %for.loop.idx2
  %src.addr_22 = getelementptr [32 x i32], [32 x i32]* %src_22, i64 0, i64 %for.loop.idx2
  %src.addr_23 = getelementptr [32 x i32], [32 x i32]* %src_23, i64 0, i64 %for.loop.idx2
  %src.addr_24 = getelementptr [32 x i32], [32 x i32]* %src_24, i64 0, i64 %for.loop.idx2
  %src.addr_25 = getelementptr [32 x i32], [32 x i32]* %src_25, i64 0, i64 %for.loop.idx2
  %src.addr_26 = getelementptr [32 x i32], [32 x i32]* %src_26, i64 0, i64 %for.loop.idx2
  %src.addr_27 = getelementptr [32 x i32], [32 x i32]* %src_27, i64 0, i64 %for.loop.idx2
  %src.addr_28 = getelementptr [32 x i32], [32 x i32]* %src_28, i64 0, i64 %for.loop.idx2
  %src.addr_29 = getelementptr [32 x i32], [32 x i32]* %src_29, i64 0, i64 %for.loop.idx2
  %src.addr_30 = getelementptr [32 x i32], [32 x i32]* %src_30, i64 0, i64 %for.loop.idx2
  %src.addr_31 = getelementptr [32 x i32], [32 x i32]* %src_31, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a32i32.37.38([32 x i32]* %dst.addr, i32* %src.addr_0, i32* %src.addr_1, i32* %src.addr_2, i32* %src.addr_3, i32* %src.addr_4, i32* %src.addr_5, i32* %src.addr_6, i32* %src.addr_7, i32* %src.addr_8, i32* %src.addr_9, i32* %src.addr_10, i32* %src.addr_11, i32* %src.addr_12, i32* %src.addr_13, i32* %src.addr_14, i32* %src.addr_15, i32* %src.addr_16, i32* %src.addr_17, i32* %src.addr_18, i32* %src.addr_19, i32* %src.addr_20, i32* %src.addr_21, i32* %src.addr_22, i32* %src.addr_23, i32* %src.addr_24, i32* %src.addr_25, i32* %src.addr_26, i32* %src.addr_27, i32* %src.addr_28, i32* %src.addr_29, i32* %src.addr_30, i32* %src.addr_31, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a32a32i32.35.40([32 x [32 x i32]]* "orig.arg.no"="0" %dst, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.21" %src_21, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.22" %src_22, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.23" %src_23, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.24" %src_24, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.25" %src_25, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.26" %src_26, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.27" %src_27, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.28" %src_28, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.29" %src_29, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.30" %src_30, [32 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.31" %src_31) #5 {
entry:
  %0 = icmp eq [32 x [32 x i32]]* %dst, null
  %1 = icmp eq [32 x i32]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a32a32i32.36.39([32 x [32 x i32]]* nonnull %dst, [32 x i32]* nonnull %src_0, [32 x i32]* %src_1, [32 x i32]* %src_2, [32 x i32]* %src_3, [32 x i32]* %src_4, [32 x i32]* %src_5, [32 x i32]* %src_6, [32 x i32]* %src_7, [32 x i32]* %src_8, [32 x i32]* %src_9, [32 x i32]* %src_10, [32 x i32]* %src_11, [32 x i32]* %src_12, [32 x i32]* %src_13, [32 x i32]* %src_14, [32 x i32]* %src_15, [32 x i32]* %src_16, [32 x i32]* %src_17, [32 x i32]* %src_18, [32 x i32]* %src_19, [32 x i32]* %src_20, [32 x i32]* %src_21, [32 x i32]* %src_22, [32 x i32]* %src_23, [32 x i32]* %src_24, [32 x i32]* %src_25, [32 x i32]* %src_26, [32 x i32]* %src_27, [32 x i32]* %src_28, [32 x i32]* %src_29, [32 x i32]* %src_30, [32 x i32]* %src_31, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_out(%"class.hls::stream<ap_int<8>>"* "orig.arg.no"="0" "unpacked"="0", i8* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0", [32 x [32 x i32]]* "orig.arg.no"="2" "unpacked"="2", [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.0" %_0, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.1" %_1, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.2" %_2, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.3" %_3, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.4" %_4, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.5" %_5, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.6" %_6, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.7" %_7, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.8" %_8, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.9" %_9, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.10" %_10, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.11" %_11, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.12" %_12, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.13" %_13, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.14" %_14, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.15" %_15, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.16" %_16, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.17" %_17, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.18" %_18, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.19" %_19, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.20" %_20, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.21" %_21, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.22" %_22, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.23" %_23, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.24" %_24, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.25" %_25, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.26" %_26, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.27" %_27, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.28" %_28, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.29" %_29, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.30" %_30, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.31" %_31, %"class.hls::stream<ap_int<32>>"* "orig.arg.no"="4" "unpacked"="4", i32* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0") #7 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* %0, i8* align 512 %1)
  call void @onebyonecpy_hls.p0a32a32i32.35.40([32 x [32 x i32]]* %2, [32 x i32]* %_0, [32 x i32]* %_1, [32 x i32]* %_2, [32 x i32]* %_3, [32 x i32]* %_4, [32 x i32]* %_5, [32 x i32]* %_6, [32 x i32]* %_7, [32 x i32]* %_8, [32 x i32]* %_9, [32 x i32]* %_10, [32 x i32]* %_11, [32 x i32]* %_12, [32 x i32]* %_13, [32 x i32]* %_14, [32 x i32]* %_15, [32 x i32]* %_16, [32 x i32]* %_17, [32 x i32]* %_18, [32 x i32]* %_19, [32 x i32]* %_20, [32 x i32]* %_21, [32 x i32]* %_22, [32 x i32]* %_23, [32 x i32]* %_24, [32 x i32]* %_25, [32 x i32]* %_26, [32 x i32]* %_27, [32 x i32]* %_28, [32 x i32]* %_29, [32 x i32]* %_30, [32 x i32]* %_31)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<32>>.4"(%"class.hls::stream<ap_int<32>>"* %3, i32* align 512 %4)
  ret void
}

declare void @apatb_dense_gemv_hw(i8*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, i32*, i32)

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_back(%"class.hls::stream<ap_int<8>>"* "orig.arg.no"="0" "unpacked"="0", i8* noalias nocapture align 512 "orig.arg.no"="1" "unpacked"="1.0", [32 x [32 x i32]]* "orig.arg.no"="2" "unpacked"="2", [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.0" %_0, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.1" %_1, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.2" %_2, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.3" %_3, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.4" %_4, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.5" %_5, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.6" %_6, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.7" %_7, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.8" %_8, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.9" %_9, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.10" %_10, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.11" %_11, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.12" %_12, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.13" %_13, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.14" %_14, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.15" %_15, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.16" %_16, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.17" %_17, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.18" %_18, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.19" %_19, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.20" %_20, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.21" %_21, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.22" %_22, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.23" %_23, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.24" %_24, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.25" %_25, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.26" %_26, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.27" %_27, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.28" %_28, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.29" %_29, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.30" %_30, [32 x i32]* readonly "orig.arg.no"="3" "unpacked"="3.31" %_31, %"class.hls::stream<ap_int<32>>"* "orig.arg.no"="4" "unpacked"="4", i32* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0") #7 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* %0, i8* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<32>>.4"(%"class.hls::stream<ap_int<32>>"* %3, i32* align 512 %4)
  ret void
}

declare void @dense_gemv_hw_stub(%"class.hls::stream<ap_int<8>>"* noalias nocapture nonnull, [32 x i32]* noalias nocapture nonnull readonly, %"class.hls::stream<ap_int<32>>"* noalias nocapture nonnull, i32)

define void @dense_gemv_hw_stub_wrapper(i8*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, [32 x i32]*, i32*, i32) #8 {
entry:
  %35 = call i8* @malloc(i64 1)
  %36 = bitcast i8* %35 to %"class.hls::stream<ap_int<8>>"*
  %37 = call i8* @malloc(i64 4096)
  %38 = bitcast i8* %37 to [32 x [32 x i32]]*
  %39 = call i8* @malloc(i64 4)
  %40 = bitcast i8* %39 to %"class.hls::stream<ap_int<32>>"*
  call void @copy_out(%"class.hls::stream<ap_int<8>>"* %36, i8* %0, [32 x [32 x i32]]* %38, [32 x i32]* %1, [32 x i32]* %2, [32 x i32]* %3, [32 x i32]* %4, [32 x i32]* %5, [32 x i32]* %6, [32 x i32]* %7, [32 x i32]* %8, [32 x i32]* %9, [32 x i32]* %10, [32 x i32]* %11, [32 x i32]* %12, [32 x i32]* %13, [32 x i32]* %14, [32 x i32]* %15, [32 x i32]* %16, [32 x i32]* %17, [32 x i32]* %18, [32 x i32]* %19, [32 x i32]* %20, [32 x i32]* %21, [32 x i32]* %22, [32 x i32]* %23, [32 x i32]* %24, [32 x i32]* %25, [32 x i32]* %26, [32 x i32]* %27, [32 x i32]* %28, [32 x i32]* %29, [32 x i32]* %30, [32 x i32]* %31, [32 x i32]* %32, %"class.hls::stream<ap_int<32>>"* %40, i32* %33)
  %41 = bitcast [32 x [32 x i32]]* %38 to [32 x i32]*
  call void @dense_gemv_hw_stub(%"class.hls::stream<ap_int<8>>"* %36, [32 x i32]* %41, %"class.hls::stream<ap_int<32>>"* %40, i32 %34)
  call void @copy_in(%"class.hls::stream<ap_int<8>>"* %36, i8* %0, [32 x [32 x i32]]* %38, [32 x i32]* %1, [32 x i32]* %2, [32 x i32]* %3, [32 x i32]* %4, [32 x i32]* %5, [32 x i32]* %6, [32 x i32]* %7, [32 x i32]* %8, [32 x i32]* %9, [32 x i32]* %10, [32 x i32]* %11, [32 x i32]* %12, [32 x i32]* %13, [32 x i32]* %14, [32 x i32]* %15, [32 x i32]* %16, [32 x i32]* %17, [32 x i32]* %18, [32 x i32]* %19, [32 x i32]* %20, [32 x i32]* %21, [32 x i32]* %22, [32 x i32]* %23, [32 x i32]* %24, [32 x i32]* %25, [32 x i32]* %26, [32 x i32]* %27, [32 x i32]* %28, [32 x i32]* %29, [32 x i32]* %30, [32 x i32]* %31, [32 x i32]* %32, %"class.hls::stream<ap_int<32>>"* %40, i32* %33)
  call void @free(i8* %35)
  call void @free(i8* %37)
  call void @free(i8* %39)
  ret void
}

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind willreturn }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #7 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #8 = { "fpga.wrapper.func"="stub" }
attributes #9 = { inaccessiblememonly nounwind willreturn "xlx.port.bitwidth"="8" "xlx.source"="user" }
attributes #10 = { inaccessiblememonly nounwind willreturn "xlx.port.bitwidth"="32" "xlx.source"="user" }
attributes #11 = { inaccessiblememonly nounwind willreturn "xlx.source"="infer-from-pragma" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}
!datalayout.transforms.on.top = !{!6}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = !{!7, !9, !11}
!7 = !{!8}
!8 = !{!"1", [32 x [32 x i32]]* null}
!9 = !{!10}
!10 = !{!"array_partition", !"type=Complete", !"dim=2"}
!11 = !{!12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43}
!12 = !{!"1.0", [32 x i32]* null}
!13 = !{!"1.1", [32 x i32]* null}
!14 = !{!"1.2", [32 x i32]* null}
!15 = !{!"1.3", [32 x i32]* null}
!16 = !{!"1.4", [32 x i32]* null}
!17 = !{!"1.5", [32 x i32]* null}
!18 = !{!"1.6", [32 x i32]* null}
!19 = !{!"1.7", [32 x i32]* null}
!20 = !{!"1.8", [32 x i32]* null}
!21 = !{!"1.9", [32 x i32]* null}
!22 = !{!"1.10", [32 x i32]* null}
!23 = !{!"1.11", [32 x i32]* null}
!24 = !{!"1.12", [32 x i32]* null}
!25 = !{!"1.13", [32 x i32]* null}
!26 = !{!"1.14", [32 x i32]* null}
!27 = !{!"1.15", [32 x i32]* null}
!28 = !{!"1.16", [32 x i32]* null}
!29 = !{!"1.17", [32 x i32]* null}
!30 = !{!"1.18", [32 x i32]* null}
!31 = !{!"1.19", [32 x i32]* null}
!32 = !{!"1.20", [32 x i32]* null}
!33 = !{!"1.21", [32 x i32]* null}
!34 = !{!"1.22", [32 x i32]* null}
!35 = !{!"1.23", [32 x i32]* null}
!36 = !{!"1.24", [32 x i32]* null}
!37 = !{!"1.25", [32 x i32]* null}
!38 = !{!"1.26", [32 x i32]* null}
!39 = !{!"1.27", [32 x i32]* null}
!40 = !{!"1.28", [32 x i32]* null}
!41 = !{!"1.29", [32 x i32]* null}
!42 = !{!"1.30", [32 x i32]* null}
!43 = !{!"1.31", [32 x i32]* null}
!44 = !DILocation(line: 18, column: 1, scope: !45)
!45 = distinct !DISubprogram(name: "dense_gemv", linkageName: "_Z10dense_gemvRN3hls6streamI6ap_intILi8EELi0EEEPA32_iRNS0_IS1_ILi32EELi0EEEi", scope: !46, file: !46, line: 6, type: !47, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !184, variables: !5)
!46 = !DIFile(filename: "../hls/dense_gemv.cpp", directory: "C:\5Cfpga_project\5Cgemv")
!47 = !DISubroutineType(types: !48)
!48 = !{null, !49, !124, !128, !77}
!49 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "stream<ap_int<8>, 0>", scope: !52, file: !51, line: 53, size: 8, flags: DIFlagTypePassByReference, elements: !53, templateParams: !121, identifier: "_ZTSN3hls6streamI6ap_intILi8EELi0EEE")
!51 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/common/technology/autopilot/hls_stream_39.h", directory: "")
!52 = !DINamespace(name: "hls", scope: null)
!53 = !{!54, !114}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !50, file: !51, line: 155, baseType: !55, size: 8, flags: DIFlagPublic)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int<8>", file: !56, line: 19, size: 8, flags: DIFlagTypePassByValue, elements: !57, templateParams: !113, identifier: "_ZTS6ap_intILi8EE")
!56 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/common/technology/autopilot\5Cap_int.h", directory: "")
!57 = !{!58, !93, !98, !102, !107}
!58 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !55, baseType: !59, extraData: i32 0)
!59 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<8, true>", file: !60, line: 124, size: 8, flags: DIFlagTypePassByValue, elements: !61, templateParams: !91, identifier: "_ZTS11ap_int_baseILi8ELb1EE")
!60 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/common/technology/autopilot\5Cetc/ap_int_base.h", directory: "")
!61 = !{!62, !80, !82, !84}
!62 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !59, baseType: !63, extraData: i32 0)
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<8, true>", file: !64, line: 518, size: 8, flags: DIFlagTypePassByValue, elements: !65, templateParams: !75, identifier: "_ZTS8ssdm_intILi8ELb1EE")
!64 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/common/technology/autopilot\5Cetc/ap_common.h", directory: "")
!65 = !{!66, !68, !72}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !63, file: !64, line: 520, baseType: !67, size: 8)
!67 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DISubprogram(name: "ssdm_int", scope: !63, file: !64, line: 521, type: !69, isLocal: false, isDefinition: false, scopeLine: 521, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DISubroutineType(types: !70)
!70 = !{null, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!72 = !DISubprogram(name: "ssdm_int", scope: !63, file: !64, line: 522, type: !73, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DISubroutineType(types: !74)
!74 = !{null, !71, !67}
!75 = !{!76, !78}
!76 = !DITemplateValueParameter(name: "_AP_N", type: !77, value: i32 8)
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DITemplateValueParameter(name: "_AP_S", type: !79, value: i1 true)
!79 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !59, file: !60, line: 148, baseType: !81, flags: DIFlagStaticMember, extraData: i32 8)
!81 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !77)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !59, file: !60, line: 149, baseType: !83, flags: DIFlagStaticMember, extraData: i1 true)
!83 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !79)
!84 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi8ELb1EEaSERKS0_", scope: !59, file: !60, line: 479, type: !85, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !88, !89}
!87 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !59, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!89 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !59)
!91 = !{!92, !78}
!92 = !DITemplateValueParameter(name: "_AP_W", type: !77, value: i32 8)
!93 = !DISubprogram(name: "ap_int", scope: !55, file: !56, line: 143, type: !94, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DISubroutineType(types: !95)
!95 = !{null, !96, !97}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!97 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!98 = !DISubprogram(name: "ap_int", scope: !55, file: !56, line: 144, type: !99, isLocal: false, isDefinition: false, scopeLine: 144, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{null, !96, !101}
!101 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!102 = !DISubprogram(name: "ap_int", scope: !55, file: !56, line: 145, type: !103, isLocal: false, isDefinition: false, scopeLine: 145, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DISubroutineType(types: !104)
!104 = !{null, !96, !105}
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "half", file: !64, line: 623, baseType: !106)
!106 = !DIBasicType(name: "__fp16", size: 16, encoding: DW_ATE_float)
!107 = !DISubprogram(name: "operator=", linkageName: "_ZN6ap_intILi8EEaSERKS0_", scope: !55, file: !56, line: 155, type: !108, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DISubroutineType(types: !109)
!109 = !{!110, !96, !111}
!110 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !55, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !55)
!113 = !{!92}
!114 = !DISubprogram(name: "set_name", linkageName: "_ZN3hls6streamI6ap_intILi8EELi0EE8set_nameEPKc", scope: !50, file: !51, line: 152, type: !115, isLocal: false, isDefinition: false, scopeLine: 152, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!115 = !DISubroutineType(types: !116)
!116 = !{null, !117, !118}
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !120)
!120 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!121 = !{!122, !123}
!122 = !DITemplateTypeParameter(name: "__STREAM_T__", type: !55)
!123 = !DITemplateValueParameter(name: "DEPTH", type: !77, value: i32 0)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !77, size: 1024, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 32)
!128 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !129, size: 64)
!129 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "stream<ap_int<32>, 0>", scope: !52, file: !51, line: 53, size: 32, flags: DIFlagTypePassByReference, elements: !130, templateParams: !182, identifier: "_ZTSN3hls6streamI6ap_intILi32EELi0EEE")
!130 = !{!131, !178}
!131 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !129, file: !51, line: 155, baseType: !132, size: 32, flags: DIFlagPublic)
!132 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int<32>", file: !56, line: 19, size: 32, flags: DIFlagTypePassByValue, elements: !133, templateParams: !177, identifier: "_ZTS6ap_intILi32EE")
!133 = !{!134, !161, !165, !168, !171}
!134 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !132, baseType: !135, extraData: i32 0)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<32, true>", file: !60, line: 124, size: 32, flags: DIFlagTypePassByValue, elements: !136, templateParams: !159, identifier: "_ZTS11ap_int_baseILi32ELb1EE")
!136 = !{!137, !150, !151, !152}
!137 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !135, baseType: !138, extraData: i32 0)
!138 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<32, true>", file: !64, line: 518, size: 32, flags: DIFlagTypePassByValue, elements: !139, templateParams: !148, identifier: "_ZTS8ssdm_intILi32ELb1EE")
!139 = !{!140, !141, !145}
!140 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !138, file: !64, line: 520, baseType: !77, size: 32)
!141 = !DISubprogram(name: "ssdm_int", scope: !138, file: !64, line: 521, type: !142, isLocal: false, isDefinition: false, scopeLine: 521, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{null, !144}
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!145 = !DISubprogram(name: "ssdm_int", scope: !138, file: !64, line: 522, type: !146, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{null, !144, !77}
!148 = !{!149, !78}
!149 = !DITemplateValueParameter(name: "_AP_N", type: !77, value: i32 32)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !135, file: !60, line: 148, baseType: !81, flags: DIFlagStaticMember, extraData: i32 32)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !135, file: !60, line: 149, baseType: !83, flags: DIFlagStaticMember, extraData: i1 true)
!152 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi32ELb1EEaSERKS0_", scope: !135, file: !60, line: 479, type: !153, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!155, !156, !157}
!155 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !135, size: 64)
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!157 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !158, size: 64)
!158 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !135)
!159 = !{!160, !78}
!160 = !DITemplateValueParameter(name: "_AP_W", type: !77, value: i32 32)
!161 = !DISubprogram(name: "ap_int", scope: !132, file: !56, line: 143, type: !162, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DISubroutineType(types: !163)
!163 = !{null, !164, !97}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!165 = !DISubprogram(name: "ap_int", scope: !132, file: !56, line: 144, type: !166, isLocal: false, isDefinition: false, scopeLine: 144, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{null, !164, !101}
!168 = !DISubprogram(name: "ap_int", scope: !132, file: !56, line: 145, type: !169, isLocal: false, isDefinition: false, scopeLine: 145, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{null, !164, !105}
!171 = !DISubprogram(name: "operator=", linkageName: "_ZN6ap_intILi32EEaSERKS0_", scope: !132, file: !56, line: 155, type: !172, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{!174, !164, !175}
!174 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !132, size: 64)
!175 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !132)
!177 = !{!160}
!178 = !DISubprogram(name: "set_name", linkageName: "_ZN3hls6streamI6ap_intILi32EELi0EE8set_nameEPKc", scope: !129, file: !51, line: 152, type: !179, isLocal: false, isDefinition: false, scopeLine: 152, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!179 = !DISubroutineType(types: !180)
!180 = !{null, !181, !118}
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!182 = !{!183, !123}
!183 = !DITemplateTypeParameter(name: "__STREAM_T__", type: !132)
!184 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !185, producer: "AMD/Xilinx clang version 16.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !186, imports: !214, splitDebugInlining: false, gnuPubnames: true)
!185 = !DIFile(filename: "C:/fpga_project/gemv/dense_gemv/hls/.autopilot/db\5Cdense_gemv.pp.0.cpp", directory: "C:\5Cfpga_project\5Cgemv", checksumkind: CSK_MD5, checksum: "ad45684b07f7ffc5e058aba93fa2dc83")
!186 = !{!135, !187}
!187 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ap_int_base<41, true>", file: !60, line: 124, size: 64, flags: DIFlagTypePassByValue, elements: !188, templateParams: !212, identifier: "_ZTS11ap_int_baseILi41ELb1EE")
!188 = !{!189, !203, !204, !205}
!189 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !187, baseType: !190, extraData: i32 0)
!190 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ssdm_int<41, true>", file: !64, line: 518, size: 64, flags: DIFlagTypePassByValue, elements: !191, templateParams: !201, identifier: "_ZTS8ssdm_intILi41ELb1EE")
!191 = !{!192, !194, !198}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !190, file: !64, line: 520, baseType: !193, size: 41, align: 64)
!193 = !DIBasicType(name: "_BitInt", size: 64, encoding: DW_ATE_signed)
!194 = !DISubprogram(name: "ssdm_int", scope: !190, file: !64, line: 521, type: !195, isLocal: false, isDefinition: false, scopeLine: 521, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{null, !197}
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!198 = !DISubprogram(name: "ssdm_int", scope: !190, file: !64, line: 522, type: !199, isLocal: false, isDefinition: false, scopeLine: 522, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DISubroutineType(types: !200)
!200 = !{null, !197, !193}
!201 = !{!202, !78}
!202 = !DITemplateValueParameter(name: "_AP_N", type: !77, value: i32 41)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !187, file: !60, line: 148, baseType: !81, flags: DIFlagStaticMember, extraData: i32 41)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "sign_flag", scope: !187, file: !60, line: 149, baseType: !83, flags: DIFlagStaticMember, extraData: i1 true)
!205 = !DISubprogram(name: "operator=", linkageName: "_ZN11ap_int_baseILi41ELb1EEaSERKS0_", scope: !187, file: !60, line: 479, type: !206, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!208, !209, !210}
!208 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !187, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!210 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !187)
!212 = !{!213, !78}
!213 = !DITemplateValueParameter(name: "_AP_W", type: !77, value: i32 41)
!214 = !{!215, !220, !226, !230, !237, !241, !246, !250, !254, !258, !271, !275, !279, !283, !287, !292, !296, !300, !304, !308, !316, !320, !324, !328, !332, !337, !343, !347, !351, !353, !361, !365, !373, !375, !379, !383, !387, !391, !396, !400, !405, !406, !407, !408, !410, !411, !412, !413, !414, !415, !416, !519, !523, !529, !531, !533, !537, !539, !541, !543, !545, !547, !549, !551, !556, !560, !562, !564, !569, !571, !573, !575, !577, !579, !581, !583, !585, !587, !591, !595, !597, !599, !601, !603, !605, !607, !609, !611, !613, !615, !619, !623, !625, !627, !629, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !657, !661, !665, !667, !669, !671, !673, !675, !677, !679, !681, !683, !687, !691, !695, !697, !699, !701, !705, !709, !713, !715, !717, !719, !721, !723, !725, !727, !729, !731, !733, !735, !737, !741, !745, !749, !751, !753, !755, !757, !761, !765, !767, !769, !771, !773, !775, !777, !781, !785, !787, !789, !791, !793, !797, !801, !805, !807, !809, !811, !813, !815, !817, !821, !825, !829, !831, !835, !839, !841, !843, !845, !847, !849, !851, !855, !858, !862, !869, !874, !878, !882, !886, !890, !892, !894, !898, !906, !910, !916, !922, !924, !928, !933, !937, !941, !947, !949, !953, !957, !961, !963, !967, !971, !975, !977, !979, !983, !991, !995, !999, !1003, !1005, !1011, !1013, !1019, !1023, !1025, !1029, !1033, !1037, !1041, !1043, !1045, !1049, !1053, !1057, !1059, !1063, !1067, !1069, !1071, !1075, !1079, !1083, !1087, !1088, !1089, !1090, !1091, !1092, !1093, !1094, !1095, !1096, !1097, !1101, !1104, !1106, !1108, !1110, !1112, !1114, !1116, !1118, !1120, !1122, !1124, !1126, !1128, !1131, !1133, !1135, !1137, !1139, !1141, !1143, !1145, !1147, !1149, !1151, !1153, !1155, !1157, !1161, !1165, !1170, !1174, !1176, !1178, !1180, !1182, !1184, !1186, !1188, !1190, !1192, !1194, !1196, !1198, !1200, !1202, !1204, !1206, !1209, !1213, !1217, !1219, !1221, !1223, !1225, !1231, !1235, !1239, !1243, !1247, !1251, !1256, !1260, !1262, !1266, !1272, !1276, !1281, !1283, !1285, !1289, !1293, !1295, !1297, !1299, !1301, !1305, !1307, !1309, !1313, !1317, !1321, !1325, !1329, !1333, !1335, !1339, !1343, !1347, !1351, !1353, !1355, !1359, !1363, !1364, !1365, !1366, !1367, !1368, !1372, !1374, !1375, !1377, !1379, !1381, !1383, !1387, !1389, !1391, !1393, !1395, !1397, !1399, !1401, !1403, !1407, !1411, !1413, !1417}
!215 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !216, entity: !217, file: !219, line: 58)
!216 = !DINamespace(name: "__gnu_debug", scope: null)
!217 = !DINamespace(name: "__debug", scope: !218)
!218 = !DINamespace(name: "std", scope: null)
!219 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cdebug/debug.h", directory: "")
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !221, file: !225, line: 52)
!221 = !DISubprogram(name: "abs", scope: !222, file: !222, line: 383, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cstdlib.h", directory: "")
!223 = !DISubroutineType(types: !224)
!224 = !{!77, !77}
!225 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cbits/std_abs.h", directory: "")
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !227, file: !229, line: 127)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !222, line: 62, baseType: !228)
!228 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_div_t", file: !222, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS6_div_t")
!229 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccstdlib", directory: "")
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !231, file: !229, line: 128)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !222, line: 67, baseType: !232)
!232 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_ldiv_t", file: !222, line: 64, size: 128, flags: DIFlagTypePassByValue, elements: !233, identifier: "_ZTS7_ldiv_t")
!233 = !{!234, !236}
!234 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !232, file: !222, line: 65, baseType: !235, size: 64)
!235 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !232, file: !222, line: 66, baseType: !235, size: 64, offset: 64)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !238, file: !229, line: 130)
!238 = !DISubprogram(name: "abort", scope: !222, file: !222, line: 374, type: !239, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!239 = !DISubroutineType(types: !240)
!240 = !{null}
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !242, file: !229, line: 134)
!242 = !DISubprogram(name: "atexit", scope: !222, file: !222, line: 394, type: !243, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DISubroutineType(types: !244)
!244 = !{!77, !245}
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !239, size: 64)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !247, file: !229, line: 140)
!247 = !DISubprogram(name: "atof", scope: !222, file: !222, line: 397, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DISubroutineType(types: !249)
!249 = !{!97, !118}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !251, file: !229, line: 141)
!251 = !DISubprogram(name: "atoi", scope: !222, file: !222, line: 400, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DISubroutineType(types: !253)
!253 = !{!77, !118}
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !255, file: !229, line: 142)
!255 = !DISubprogram(name: "atol", scope: !222, file: !222, line: 402, type: !256, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DISubroutineType(types: !257)
!257 = !{!235, !118}
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !259, file: !229, line: 143)
!259 = !DISubprogram(name: "bsearch", scope: !222, file: !222, line: 406, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DISubroutineType(types: !261)
!261 = !{!262, !263, !263, !265, !265, !268}
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64)
!264 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !266, line: 35, baseType: !267)
!266 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Ccrtdefs.h", directory: "")
!267 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!269 = !DISubroutineType(types: !270)
!270 = !{!77, !263, !263}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !272, file: !229, line: 144)
!272 = !DISubprogram(name: "calloc", scope: !222, file: !222, line: 501, type: !273, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DISubroutineType(types: !274)
!274 = !{!262, !265, !265}
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !276, file: !229, line: 145)
!276 = !DISubprogram(name: "div", scope: !222, file: !222, line: 412, type: !277, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DISubroutineType(types: !278)
!278 = !{!227, !77, !77}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !280, file: !229, line: 146)
!280 = !DISubprogram(name: "exit", scope: !222, file: !222, line: 360, type: !281, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!281 = !DISubroutineType(types: !282)
!282 = !{null, !77}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !284, file: !229, line: 147)
!284 = !DISubprogram(name: "free", scope: !222, file: !222, line: 502, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DISubroutineType(types: !286)
!286 = !{null, !262}
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !288, file: !229, line: 148)
!288 = !DISubprogram(name: "getenv", scope: !222, file: !222, line: 413, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DISubroutineType(types: !290)
!290 = !{!291, !118}
!291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !293, file: !229, line: 149)
!293 = !DISubprogram(name: "labs", scope: !222, file: !222, line: 384, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!235, !235}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !297, file: !229, line: 150)
!297 = !DISubprogram(name: "ldiv", scope: !222, file: !222, line: 423, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DISubroutineType(types: !299)
!299 = !{!231, !235, !235}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !301, file: !229, line: 151)
!301 = !DISubprogram(name: "malloc", scope: !222, file: !222, line: 503, type: !302, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DISubroutineType(types: !303)
!303 = !{!262, !265}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !305, file: !229, line: 153)
!305 = !DISubprogram(name: "mblen", scope: !222, file: !222, line: 425, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DISubroutineType(types: !307)
!307 = !{!77, !118, !265}
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !309, file: !229, line: 154)
!309 = !DISubprogram(name: "mbstowcs", scope: !222, file: !222, line: 433, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DISubroutineType(types: !311)
!311 = !{!265, !312, !315, !265}
!312 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !313)
!313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !314, size: 64)
!314 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!315 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !118)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !317, file: !229, line: 155)
!317 = !DISubprogram(name: "mbtowc", scope: !222, file: !222, line: 431, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{!77, !312, !315, !265}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !321, file: !229, line: 157)
!321 = !DISubprogram(name: "qsort", scope: !222, file: !222, line: 407, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !262, !265, !265, !268}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !325, file: !229, line: 163)
!325 = !DISubprogram(name: "rand", scope: !222, file: !222, line: 436, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!77}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !329, file: !229, line: 164)
!329 = !DISubprogram(name: "realloc", scope: !222, file: !222, line: 504, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!262, !262, !265}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !333, file: !229, line: 165)
!333 = !DISubprogram(name: "srand", scope: !222, file: !222, line: 438, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{null, !336}
!336 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !338, file: !229, line: 166)
!338 = !DISubprogram(name: "strtod", scope: !222, file: !222, line: 450, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DISubroutineType(types: !340)
!340 = !{!97, !315, !341}
!341 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !342)
!342 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !344, file: !229, line: 167)
!344 = !DISubprogram(name: "strtol", scope: !222, file: !222, line: 485, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!235, !315, !341, !77}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !348, file: !229, line: 168)
!348 = !DISubprogram(name: "strtoul", scope: !222, file: !222, line: 487, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!267, !315, !341, !77}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !352, file: !229, line: 169)
!352 = !DISubprogram(name: "system", scope: !222, file: !222, line: 491, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !354, file: !229, line: 171)
!354 = !DISubprogram(name: "wcstombs", scope: !222, file: !222, line: 496, type: !355, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!355 = !DISubroutineType(types: !356)
!356 = !{!265, !357, !358, !265}
!357 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !291)
!358 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !359)
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !360, size: 64)
!360 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !314)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !362, file: !229, line: 172)
!362 = !DISubprogram(name: "wctomb", scope: !222, file: !222, line: 494, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DISubroutineType(types: !364)
!364 = !{!77, !291, !314}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !367, file: !229, line: 200)
!366 = !DINamespace(name: "__gnu_cxx", scope: null)
!367 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !222, line: 699, baseType: !368)
!368 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !222, line: 699, size: 128, flags: DIFlagTypePassByValue, elements: !369, identifier: "_ZTS7lldiv_t")
!369 = !{!370, !372}
!370 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !368, file: !222, line: 699, baseType: !371, size: 64)
!371 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !368, file: !222, line: 699, baseType: !371, size: 64, offset: 64)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !374, file: !229, line: 206)
!374 = !DISubprogram(name: "_Exit", scope: !222, file: !222, line: 365, type: !281, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !376, file: !229, line: 210)
!376 = !DISubprogram(name: "llabs", scope: !222, file: !222, line: 703, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!371, !371}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !380, file: !229, line: 216)
!380 = !DISubprogram(name: "lldiv", scope: !222, file: !222, line: 701, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!381 = !DISubroutineType(types: !382)
!382 = !{!367, !371, !371}
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !384, file: !229, line: 227)
!384 = !DISubprogram(name: "atoll", scope: !222, file: !222, line: 712, type: !385, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!385 = !DISubroutineType(types: !386)
!386 = !{!371, !118}
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !388, file: !229, line: 228)
!388 = !DISubprogram(name: "strtoll", scope: !222, file: !222, line: 708, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!389 = !DISubroutineType(types: !390)
!390 = !{!371, !315, !341, !77}
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !392, file: !229, line: 229)
!392 = !DISubprogram(name: "strtoull", scope: !222, file: !222, line: 709, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DISubroutineType(types: !394)
!394 = !{!395, !315, !341, !77}
!395 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !397, file: !229, line: 231)
!397 = !DISubprogram(name: "strtof", scope: !222, file: !222, line: 457, type: !398, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!398 = !DISubroutineType(types: !399)
!399 = !{!101, !315, !341}
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !401, file: !229, line: 232)
!401 = !DISubprogram(name: "strtold", scope: !222, file: !222, line: 468, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DISubroutineType(types: !403)
!403 = !{!404, !315, !341}
!404 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !367, file: !229, line: 240)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !374, file: !229, line: 242)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !376, file: !229, line: 244)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !409, file: !229, line: 245)
!409 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !366, file: !229, line: 213, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !380, file: !229, line: 246)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !384, file: !229, line: 248)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !397, file: !229, line: 249)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !388, file: !229, line: 250)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !392, file: !229, line: 251)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !401, file: !229, line: 252)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !417, file: !418, line: 57)
!417 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !419, file: !418, line: 79, size: 64, flags: DIFlagTypePassByReference, elements: !420, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!418 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cbits/exception_ptr.h", directory: "")
!419 = !DINamespace(name: "__exception_ptr", scope: !218)
!420 = !{!421, !422, !426, !429, !430, !435, !436, !440, !446, !450, !454, !457, !458, !461, !464}
!421 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !417, file: !418, line: 81, baseType: !262, size: 64)
!422 = !DISubprogram(name: "exception_ptr", scope: !417, file: !418, line: 83, type: !423, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !425, !262}
!425 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !417, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!426 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !417, file: !418, line: 85, type: !427, isLocal: false, isDefinition: false, scopeLine: 85, flags: DIFlagPrototyped, isOptimized: false)
!427 = !DISubroutineType(types: !428)
!428 = !{null, !425}
!429 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !417, file: !418, line: 86, type: !427, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !417, file: !418, line: 88, type: !431, isLocal: false, isDefinition: false, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: false)
!431 = !DISubroutineType(types: !432)
!432 = !{!262, !433}
!433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !434, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!434 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !417)
!435 = !DISubprogram(name: "exception_ptr", scope: !417, file: !418, line: 96, type: !427, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!436 = !DISubprogram(name: "exception_ptr", scope: !417, file: !418, line: 98, type: !437, isLocal: false, isDefinition: false, scopeLine: 98, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!437 = !DISubroutineType(types: !438)
!438 = !{null, !425, !439}
!439 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !434, size: 64)
!440 = !DISubprogram(name: "exception_ptr", scope: !417, file: !418, line: 101, type: !441, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!441 = !DISubroutineType(types: !442)
!442 = !{null, !425, !443}
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !218, file: !444, line: 242, baseType: !445)
!444 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cx86_64-w64-mingw32\5Cbits/c++config.h", directory: "")
!445 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!446 = !DISubprogram(name: "exception_ptr", scope: !417, file: !418, line: 105, type: !447, isLocal: false, isDefinition: false, scopeLine: 105, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{null, !425, !449}
!449 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !417, size: 64)
!450 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !417, file: !418, line: 118, type: !451, isLocal: false, isDefinition: false, scopeLine: 118, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!451 = !DISubroutineType(types: !452)
!452 = !{!453, !425, !439}
!453 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !417, size: 64)
!454 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !417, file: !418, line: 122, type: !455, isLocal: false, isDefinition: false, scopeLine: 122, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!455 = !DISubroutineType(types: !456)
!456 = !{!453, !425, !449}
!457 = !DISubprogram(name: "~exception_ptr", scope: !417, file: !418, line: 129, type: !427, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!458 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !417, file: !418, line: 132, type: !459, isLocal: false, isDefinition: false, scopeLine: 132, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !425, !453}
!461 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !417, file: !418, line: 144, type: !462, isLocal: false, isDefinition: false, scopeLine: 144, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!462 = !DISubroutineType(types: !463)
!463 = !{!79, !433}
!464 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !417, file: !418, line: 153, type: !465, isLocal: false, isDefinition: false, scopeLine: 153, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!465 = !DISubroutineType(types: !466)
!466 = !{!467, !433}
!467 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !468, size: 64)
!468 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !469)
!469 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !218, file: !470, line: 88, size: 128, flags: DIFlagTypePassByReference, elements: !471, vtableHolder: !469)
!470 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ctypeinfo", directory: "")
!471 = !{!472, !475, !476, !480, !484, !488, !489, !490, !494, !497, !498, !502, !509, !512, !516}
!472 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$type_info", scope: !470, file: !470, baseType: !473, size: 64, flags: DIFlagArtificial)
!473 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !474, size: 64)
!474 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !326, size: 64)
!475 = !DIDerivedType(tag: DW_TAG_member, name: "__name", scope: !469, file: !470, line: 171, baseType: !118, size: 64, offset: 64, flags: DIFlagProtected)
!476 = !DISubprogram(name: "~type_info", scope: !469, file: !470, line: 95, type: !477, isLocal: false, isDefinition: false, scopeLine: 95, containingType: !469, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!477 = !DISubroutineType(types: !478)
!478 = !{null, !479}
!479 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !469, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!480 = !DISubprogram(name: "name", linkageName: "_ZNKSt9type_info4nameEv", scope: !469, file: !470, line: 99, type: !481, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!481 = !DISubroutineType(types: !482)
!482 = !{!118, !483}
!483 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !468, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!484 = !DISubprogram(name: "before", linkageName: "_ZNKSt9type_info6beforeERKS_", scope: !469, file: !470, line: 115, type: !485, isLocal: false, isDefinition: false, scopeLine: 115, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!485 = !DISubroutineType(types: !486)
!486 = !{!79, !483, !487}
!487 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !468, size: 64)
!488 = !DISubprogram(name: "operator==", linkageName: "_ZNKSt9type_infoeqERKS_", scope: !469, file: !470, line: 120, type: !485, isLocal: false, isDefinition: false, scopeLine: 120, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!489 = !DISubprogram(name: "operator!=", linkageName: "_ZNKSt9type_infoneERKS_", scope: !469, file: !470, line: 136, type: !485, isLocal: false, isDefinition: false, scopeLine: 136, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!490 = !DISubprogram(name: "hash_code", linkageName: "_ZNKSt9type_info9hash_codeEv", scope: !469, file: !470, line: 140, type: !491, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!491 = !DISubroutineType(types: !492)
!492 = !{!493, !483}
!493 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !218, file: !444, line: 238, baseType: !267)
!494 = !DISubprogram(name: "__is_pointer_p", linkageName: "_ZNKSt9type_info14__is_pointer_pEv", scope: !469, file: !470, line: 152, type: !495, isLocal: false, isDefinition: false, scopeLine: 152, containingType: !469, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!495 = !DISubroutineType(types: !496)
!496 = !{!79, !483}
!497 = !DISubprogram(name: "__is_function_p", linkageName: "_ZNKSt9type_info15__is_function_pEv", scope: !469, file: !470, line: 155, type: !495, isLocal: false, isDefinition: false, scopeLine: 155, containingType: !469, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 3, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!498 = !DISubprogram(name: "__do_catch", linkageName: "_ZNKSt9type_info10__do_catchEPKS_PPvj", scope: !469, file: !470, line: 163, type: !499, isLocal: false, isDefinition: false, scopeLine: 163, containingType: !469, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 4, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!499 = !DISubroutineType(types: !500)
!500 = !{!79, !483, !467, !501, !336}
!501 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!502 = !DISubprogram(name: "__do_upcast", linkageName: "_ZNKSt9type_info11__do_upcastEPKN10__cxxabiv117__class_type_infoEPPv", scope: !469, file: !470, line: 167, type: !503, isLocal: false, isDefinition: false, scopeLine: 167, containingType: !469, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 5, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!503 = !DISubroutineType(types: !504)
!504 = !{!79, !483, !505, !501}
!505 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !506, size: 64)
!506 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !507)
!507 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__class_type_info", scope: !508, file: !470, line: 45, flags: DIFlagFwdDecl, identifier: "_ZTSN10__cxxabiv117__class_type_infoE")
!508 = !DINamespace(name: "__cxxabiv1", scope: null)
!509 = !DISubprogram(name: "type_info", scope: !469, file: !470, line: 173, type: !510, isLocal: false, isDefinition: false, scopeLine: 173, flags: DIFlagProtected | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!510 = !DISubroutineType(types: !511)
!511 = !{null, !479, !118}
!512 = !DISubprogram(name: "operator=", linkageName: "_ZNSt9type_infoaSERKS_", scope: !469, file: !470, line: 177, type: !513, isLocal: false, isDefinition: false, scopeLine: 177, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{!515, !479, !487}
!515 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !469, size: 64)
!516 = !DISubprogram(name: "type_info", scope: !469, file: !470, line: 178, type: !517, isLocal: false, isDefinition: false, scopeLine: 178, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DISubroutineType(types: !518)
!518 = !{null, !479, !487}
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !520, file: !418, line: 73)
!520 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !218, file: !418, line: 69, type: !521, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!521 = !DISubroutineType(types: !522)
!522 = !{null, !417}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !524, file: !528, line: 83)
!524 = !DISubprogram(name: "acos", scope: !525, file: !525, line: 190, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cmath.h", directory: "")
!526 = !DISubroutineType(types: !527)
!527 = !{!97, !97}
!528 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccmath", directory: "")
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !530, file: !528, line: 102)
!530 = !DISubprogram(name: "asin", scope: !525, file: !525, line: 189, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !532, file: !528, line: 121)
!532 = !DISubprogram(name: "atan", scope: !525, file: !525, line: 191, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !534, file: !528, line: 140)
!534 = !DISubprogram(name: "atan2", scope: !525, file: !525, line: 192, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DISubroutineType(types: !536)
!536 = !{!97, !97, !97}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !538, file: !528, line: 161)
!538 = !DISubprogram(name: "ceil", scope: !525, file: !525, line: 198, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !540, file: !528, line: 180)
!540 = !DISubprogram(name: "cos", scope: !525, file: !525, line: 184, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !542, file: !528, line: 199)
!542 = !DISubprogram(name: "cosh", scope: !525, file: !525, line: 187, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !544, file: !528, line: 218)
!544 = !DISubprogram(name: "exp", scope: !525, file: !525, line: 193, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !546, file: !528, line: 237)
!546 = !DISubprogram(name: "fabs", scope: !525, file: !525, line: 204, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !548, file: !528, line: 256)
!548 = !DISubprogram(name: "floor", scope: !525, file: !525, line: 199, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !550, file: !528, line: 275)
!550 = !DISubprogram(name: "fmod", scope: !525, file: !525, line: 246, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !552, file: !528, line: 296)
!552 = !DISubprogram(name: "frexp", scope: !525, file: !525, line: 244, type: !553, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DISubroutineType(types: !554)
!554 = !{!97, !97, !555}
!555 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !557, file: !528, line: 315)
!557 = !DISubprogram(name: "ldexp", scope: !525, file: !525, line: 243, type: !558, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DISubroutineType(types: !559)
!559 = !{!97, !97, !77}
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !561, file: !528, line: 334)
!561 = !DISubprogram(name: "log", scope: !525, file: !525, line: 194, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !563, file: !528, line: 353)
!563 = !DISubprogram(name: "log10", scope: !525, file: !525, line: 195, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !565, file: !528, line: 372)
!565 = !DISubprogram(name: "modf", scope: !525, file: !525, line: 245, type: !566, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DISubroutineType(types: !567)
!567 = !{!97, !97, !568}
!568 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !570, file: !528, line: 384)
!570 = !DISubprogram(name: "pow", scope: !525, file: !525, line: 196, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !572, file: !528, line: 421)
!572 = !DISubprogram(name: "sin", scope: !525, file: !525, line: 183, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !574, file: !528, line: 440)
!574 = !DISubprogram(name: "sinh", scope: !525, file: !525, line: 186, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !576, file: !528, line: 459)
!576 = !DISubprogram(name: "sqrt", scope: !525, file: !525, line: 197, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !578, file: !528, line: 478)
!578 = !DISubprogram(name: "tan", scope: !525, file: !525, line: 185, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !580, file: !528, line: 497)
!580 = !DISubprogram(name: "tanh", scope: !525, file: !525, line: 188, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !582, file: !528, line: 1065)
!582 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !525, line: 373, baseType: !97)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !584, file: !528, line: 1066)
!584 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !525, line: 372, baseType: !101)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !586, file: !528, line: 1069)
!586 = !DISubprogram(name: "acosh", scope: !525, file: !525, line: 705, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !588, file: !528, line: 1070)
!588 = !DISubprogram(name: "acoshf", scope: !525, file: !525, line: 706, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!589 = !DISubroutineType(types: !590)
!590 = !{!101, !101}
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !592, file: !528, line: 1071)
!592 = !DISubprogram(name: "acoshl", scope: !525, file: !525, line: 707, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!593 = !DISubroutineType(types: !594)
!594 = !{!404, !404}
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !596, file: !528, line: 1073)
!596 = !DISubprogram(name: "asinh", scope: !525, file: !525, line: 710, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !598, file: !528, line: 1074)
!598 = !DISubprogram(name: "asinhf", scope: !525, file: !525, line: 711, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !600, file: !528, line: 1075)
!600 = !DISubprogram(name: "asinhl", scope: !525, file: !525, line: 712, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !602, file: !528, line: 1077)
!602 = !DISubprogram(name: "atanh", scope: !525, file: !525, line: 715, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !604, file: !528, line: 1078)
!604 = !DISubprogram(name: "atanhf", scope: !525, file: !525, line: 716, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !606, file: !528, line: 1079)
!606 = !DISubprogram(name: "atanhl", scope: !525, file: !525, line: 717, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !608, file: !528, line: 1081)
!608 = !DISubprogram(name: "cbrt", scope: !525, file: !525, line: 877, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !610, file: !528, line: 1082)
!610 = !DISubprogram(name: "cbrtf", scope: !525, file: !525, line: 878, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !612, file: !528, line: 1083)
!612 = !DISubprogram(name: "cbrtl", scope: !525, file: !525, line: 879, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !614, file: !528, line: 1085)
!614 = !DISubprogram(name: "copysign", scope: !525, file: !525, line: 1063, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !616, file: !528, line: 1086)
!616 = !DISubprogram(name: "copysignf", scope: !525, file: !525, line: 1064, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!617 = !DISubroutineType(types: !618)
!618 = !{!101, !101, !101}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !620, file: !528, line: 1087)
!620 = !DISubprogram(name: "copysignl", scope: !525, file: !525, line: 1065, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DISubroutineType(types: !622)
!622 = !{!404, !404, !404}
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !624, file: !528, line: 1089)
!624 = !DISubprogram(name: "erf", scope: !525, file: !525, line: 901, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !626, file: !528, line: 1090)
!626 = !DISubprogram(name: "erff", scope: !525, file: !525, line: 902, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !628, file: !528, line: 1091)
!628 = !DISubprogram(name: "erfl", scope: !525, file: !525, line: 903, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !630, file: !528, line: 1093)
!630 = !DISubprogram(name: "erfc", scope: !525, file: !525, line: 906, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !632, file: !528, line: 1094)
!632 = !DISubprogram(name: "erfcf", scope: !525, file: !525, line: 907, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !634, file: !528, line: 1095)
!634 = !DISubprogram(name: "erfcl", scope: !525, file: !525, line: 908, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !636, file: !528, line: 1097)
!636 = !DISubprogram(name: "exp2", scope: !525, file: !525, line: 728, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !638, file: !528, line: 1098)
!638 = !DISubprogram(name: "exp2f", scope: !525, file: !525, line: 729, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !640, file: !528, line: 1099)
!640 = !DISubprogram(name: "exp2l", scope: !525, file: !525, line: 730, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !642, file: !528, line: 1101)
!642 = !DISubprogram(name: "expm1", scope: !525, file: !525, line: 734, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !644, file: !528, line: 1102)
!644 = !DISubprogram(name: "expm1f", scope: !525, file: !525, line: 735, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !646, file: !528, line: 1103)
!646 = !DISubprogram(name: "expm1l", scope: !525, file: !525, line: 736, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !648, file: !528, line: 1105)
!648 = !DISubprogram(name: "fdim", scope: !525, file: !525, line: 1109, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !650, file: !528, line: 1106)
!650 = !DISubprogram(name: "fdimf", scope: !525, file: !525, line: 1110, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !652, file: !528, line: 1107)
!652 = !DISubprogram(name: "fdiml", scope: !525, file: !525, line: 1111, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !654, file: !528, line: 1109)
!654 = !DISubprogram(name: "fma", scope: !525, file: !525, line: 1130, type: !655, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DISubroutineType(types: !656)
!656 = !{!97, !97, !97, !97}
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !658, file: !528, line: 1110)
!658 = !DISubprogram(name: "fmaf", scope: !525, file: !525, line: 1131, type: !659, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!659 = !DISubroutineType(types: !660)
!660 = !{!101, !101, !101, !101}
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !662, file: !528, line: 1111)
!662 = !DISubprogram(name: "fmal", scope: !525, file: !525, line: 1132, type: !663, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!663 = !DISubroutineType(types: !664)
!664 = !{!404, !404, !404, !404}
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !666, file: !528, line: 1113)
!666 = !DISubprogram(name: "fmax", scope: !525, file: !525, line: 1119, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !668, file: !528, line: 1114)
!668 = !DISubprogram(name: "fmaxf", scope: !525, file: !525, line: 1120, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !670, file: !528, line: 1115)
!670 = !DISubprogram(name: "fmaxl", scope: !525, file: !525, line: 1121, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !672, file: !528, line: 1117)
!672 = !DISubprogram(name: "fmin", scope: !525, file: !525, line: 1124, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !674, file: !528, line: 1118)
!674 = !DISubprogram(name: "fminf", scope: !525, file: !525, line: 1125, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !676, file: !528, line: 1119)
!676 = !DISubprogram(name: "fminl", scope: !525, file: !525, line: 1126, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !678, file: !528, line: 1121)
!678 = !DISubprogram(name: "hypot", scope: !525, file: !525, line: 882, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !680, file: !528, line: 1122)
!680 = !DISubprogram(name: "hypotf", scope: !525, file: !525, line: 883, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !682, file: !528, line: 1123)
!682 = !DISubprogram(name: "hypotl", scope: !525, file: !525, line: 887, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !684, file: !528, line: 1125)
!684 = !DISubprogram(name: "ilogb", scope: !525, file: !525, line: 748, type: !685, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!685 = !DISubroutineType(types: !686)
!686 = !{!77, !97}
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !688, file: !528, line: 1126)
!688 = !DISubprogram(name: "ilogbf", scope: !525, file: !525, line: 749, type: !689, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!689 = !DISubroutineType(types: !690)
!690 = !{!77, !101}
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !692, file: !528, line: 1127)
!692 = !DISubprogram(name: "ilogbl", scope: !525, file: !525, line: 750, type: !693, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!693 = !DISubroutineType(types: !694)
!694 = !{!77, !404}
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !696, file: !528, line: 1129)
!696 = !DISubprogram(name: "lgamma", scope: !525, file: !525, line: 911, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !698, file: !528, line: 1130)
!698 = !DISubprogram(name: "lgammaf", scope: !525, file: !525, line: 912, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !700, file: !528, line: 1131)
!700 = !DISubprogram(name: "lgammal", scope: !525, file: !525, line: 913, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !702, file: !528, line: 1134)
!702 = !DISubprogram(name: "llrint", scope: !525, file: !525, line: 946, type: !703, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!703 = !DISubroutineType(types: !704)
!704 = !{!371, !97}
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !706, file: !528, line: 1135)
!706 = !DISubprogram(name: "llrintf", scope: !525, file: !525, line: 947, type: !707, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!707 = !DISubroutineType(types: !708)
!708 = !{!371, !101}
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !710, file: !528, line: 1136)
!710 = !DISubprogram(name: "llrintl", scope: !525, file: !525, line: 948, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!711 = !DISubroutineType(types: !712)
!712 = !{!371, !404}
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !714, file: !528, line: 1138)
!714 = !DISubprogram(name: "llround", scope: !525, file: !525, line: 1038, type: !703, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !716, file: !528, line: 1139)
!716 = !DISubprogram(name: "llroundf", scope: !525, file: !525, line: 1039, type: !707, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !718, file: !528, line: 1140)
!718 = !DISubprogram(name: "llroundl", scope: !525, file: !525, line: 1040, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !720, file: !528, line: 1143)
!720 = !DISubprogram(name: "log1p", scope: !525, file: !525, line: 768, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !722, file: !528, line: 1144)
!722 = !DISubprogram(name: "log1pf", scope: !525, file: !525, line: 769, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !724, file: !528, line: 1145)
!724 = !DISubprogram(name: "log1pl", scope: !525, file: !525, line: 770, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !726, file: !528, line: 1147)
!726 = !DISubprogram(name: "log2", scope: !525, file: !525, line: 773, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !728, file: !528, line: 1148)
!728 = !DISubprogram(name: "log2f", scope: !525, file: !525, line: 774, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !730, file: !528, line: 1149)
!730 = !DISubprogram(name: "log2l", scope: !525, file: !525, line: 775, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !732, file: !528, line: 1151)
!732 = !DISubprogram(name: "logb", scope: !525, file: !525, line: 778, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !734, file: !528, line: 1152)
!734 = !DISubprogram(name: "logbf", scope: !525, file: !525, line: 779, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !736, file: !528, line: 1153)
!736 = !DISubprogram(name: "logbl", scope: !525, file: !525, line: 780, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !738, file: !528, line: 1155)
!738 = !DISubprogram(name: "lrint", scope: !525, file: !525, line: 942, type: !739, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!739 = !DISubroutineType(types: !740)
!740 = !{!235, !97}
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !742, file: !528, line: 1156)
!742 = !DISubprogram(name: "lrintf", scope: !525, file: !525, line: 943, type: !743, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!743 = !DISubroutineType(types: !744)
!744 = !{!235, !101}
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !746, file: !528, line: 1157)
!746 = !DISubprogram(name: "lrintl", scope: !525, file: !525, line: 944, type: !747, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!747 = !DISubroutineType(types: !748)
!748 = !{!235, !404}
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !750, file: !528, line: 1159)
!750 = !DISubprogram(name: "lround", scope: !525, file: !525, line: 1035, type: !739, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !752, file: !528, line: 1160)
!752 = !DISubprogram(name: "lroundf", scope: !525, file: !525, line: 1036, type: !743, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !754, file: !528, line: 1161)
!754 = !DISubprogram(name: "lroundl", scope: !525, file: !525, line: 1037, type: !747, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !756, file: !528, line: 1163)
!756 = !DISubprogram(name: "nan", scope: !525, file: !525, line: 1087, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !758, file: !528, line: 1164)
!758 = !DISubprogram(name: "nanf", scope: !525, file: !525, line: 1088, type: !759, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!759 = !DISubroutineType(types: !760)
!760 = !{!101, !118}
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !762, file: !528, line: 1165)
!762 = !DISubprogram(name: "nanl", scope: !525, file: !525, line: 1089, type: !763, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!763 = !DISubroutineType(types: !764)
!764 = !{!404, !118}
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !766, file: !528, line: 1167)
!766 = !DISubprogram(name: "nearbyint", scope: !525, file: !525, line: 931, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !768, file: !528, line: 1168)
!768 = !DISubprogram(name: "nearbyintf", scope: !525, file: !525, line: 932, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !770, file: !528, line: 1169)
!770 = !DISubprogram(name: "nearbyintl", scope: !525, file: !525, line: 933, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !772, file: !528, line: 1171)
!772 = !DISubprogram(name: "nextafter", scope: !525, file: !525, line: 1098, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !774, file: !528, line: 1172)
!774 = !DISubprogram(name: "nextafterf", scope: !525, file: !525, line: 1099, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !776, file: !528, line: 1173)
!776 = !DISubprogram(name: "nextafterl", scope: !525, file: !525, line: 1100, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !778, file: !528, line: 1175)
!778 = !DISubprogram(name: "nexttoward", scope: !525, file: !525, line: 1103, type: !779, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!779 = !DISubroutineType(types: !780)
!780 = !{!97, !97, !404}
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !782, file: !528, line: 1176)
!782 = !DISubprogram(name: "nexttowardf", scope: !525, file: !525, line: 1104, type: !783, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!783 = !DISubroutineType(types: !784)
!784 = !{!101, !101, !404}
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !786, file: !528, line: 1177)
!786 = !DISubprogram(name: "nexttowardl", scope: !525, file: !525, line: 1105, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !788, file: !528, line: 1179)
!788 = !DISubprogram(name: "remainder", scope: !525, file: !525, line: 1053, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !790, file: !528, line: 1180)
!790 = !DISubprogram(name: "remainderf", scope: !525, file: !525, line: 1054, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !792, file: !528, line: 1181)
!792 = !DISubprogram(name: "remainderl", scope: !525, file: !525, line: 1055, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !794, file: !528, line: 1183)
!794 = !DISubprogram(name: "remquo", scope: !525, file: !525, line: 1058, type: !795, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!795 = !DISubroutineType(types: !796)
!796 = !{!97, !97, !97, !555}
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !798, file: !528, line: 1184)
!798 = !DISubprogram(name: "remquof", scope: !525, file: !525, line: 1059, type: !799, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!799 = !DISubroutineType(types: !800)
!800 = !{!101, !101, !101, !555}
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !802, file: !528, line: 1185)
!802 = !DISubprogram(name: "remquol", scope: !525, file: !525, line: 1060, type: !803, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!803 = !DISubroutineType(types: !804)
!804 = !{!404, !404, !404, !555}
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !806, file: !528, line: 1187)
!806 = !DISubprogram(name: "rint", scope: !525, file: !525, line: 937, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !808, file: !528, line: 1188)
!808 = !DISubprogram(name: "rintf", scope: !525, file: !525, line: 938, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !810, file: !528, line: 1189)
!810 = !DISubprogram(name: "rintl", scope: !525, file: !525, line: 939, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !812, file: !528, line: 1191)
!812 = !DISubprogram(name: "round", scope: !525, file: !525, line: 1030, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !814, file: !528, line: 1192)
!814 = !DISubprogram(name: "roundf", scope: !525, file: !525, line: 1031, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !816, file: !528, line: 1193)
!816 = !DISubprogram(name: "roundl", scope: !525, file: !525, line: 1032, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !818, file: !528, line: 1195)
!818 = !DISubprogram(name: "scalbln", scope: !525, file: !525, line: 871, type: !819, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!819 = !DISubroutineType(types: !820)
!820 = !{!97, !97, !235}
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !822, file: !528, line: 1196)
!822 = !DISubprogram(name: "scalblnf", scope: !525, file: !525, line: 872, type: !823, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!823 = !DISubroutineType(types: !824)
!824 = !{!101, !101, !235}
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !826, file: !528, line: 1197)
!826 = !DISubprogram(name: "scalblnl", scope: !525, file: !525, line: 873, type: !827, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!827 = !DISubroutineType(types: !828)
!828 = !{!404, !404, !235}
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !830, file: !528, line: 1199)
!830 = !DISubprogram(name: "scalbn", scope: !525, file: !525, line: 867, type: !558, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !832, file: !528, line: 1200)
!832 = !DISubprogram(name: "scalbnf", scope: !525, file: !525, line: 868, type: !833, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!833 = !DISubroutineType(types: !834)
!834 = !{!101, !101, !77}
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !836, file: !528, line: 1201)
!836 = !DISubprogram(name: "scalbnl", scope: !525, file: !525, line: 869, type: !837, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!837 = !DISubroutineType(types: !838)
!838 = !{!404, !404, !77}
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !840, file: !528, line: 1203)
!840 = !DISubprogram(name: "tgamma", scope: !525, file: !525, line: 918, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !842, file: !528, line: 1204)
!842 = !DISubprogram(name: "tgammaf", scope: !525, file: !525, line: 919, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !844, file: !528, line: 1205)
!844 = !DISubprogram(name: "tgammal", scope: !525, file: !525, line: 920, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !846, file: !528, line: 1207)
!846 = !DISubprogram(name: "trunc", scope: !525, file: !525, line: 1044, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !848, file: !528, line: 1208)
!848 = !DISubprogram(name: "truncf", scope: !525, file: !525, line: 1045, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !850, file: !528, line: 1209)
!850 = !DISubprogram(name: "truncl", scope: !525, file: !525, line: 1046, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !852, file: !854, line: 64)
!852 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !853, line: 1416, baseType: !77)
!853 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cwchar.h", directory: "")
!854 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccwchar", directory: "")
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !856, file: !854, line: 139)
!856 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !266, line: 106, baseType: !857)
!857 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !859, file: !854, line: 141)
!859 = !DISubprogram(name: "btowc", scope: !853, file: !853, line: 1419, type: !860, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!860 = !DISubroutineType(types: !861)
!861 = !{!856, !77}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !863, file: !854, line: 142)
!863 = !DISubprogram(name: "fgetwc", scope: !853, file: !853, line: 771, type: !864, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!864 = !DISubroutineType(types: !865)
!865 = !{!856, !866}
!866 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !867, size: 64)
!867 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !853, line: 51, baseType: !868)
!868 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_iobuf", file: !853, line: 41, size: 384, flags: DIFlagFwdDecl, identifier: "_ZTS6_iobuf")
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !870, file: !854, line: 143)
!870 = !DISubprogram(name: "fgetws", scope: !853, file: !853, line: 780, type: !871, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!871 = !DISubroutineType(types: !872)
!872 = !{!313, !312, !77, !873}
!873 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !866)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !875, file: !854, line: 144)
!875 = !DISubprogram(name: "fputwc", scope: !853, file: !853, line: 773, type: !876, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!876 = !DISubroutineType(types: !877)
!877 = !{!856, !314, !866}
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !879, file: !854, line: 145)
!879 = !DISubprogram(name: "fputws", scope: !853, file: !853, line: 781, type: !880, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!880 = !DISubroutineType(types: !881)
!881 = !{!77, !358, !873}
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !883, file: !854, line: 146)
!883 = !DISubprogram(name: "fwide", scope: !853, file: !853, line: 1434, type: !884, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!884 = !DISubroutineType(types: !885)
!885 = !{!77, !866, !77}
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !887, file: !854, line: 147)
!887 = !DISubprogram(name: "fwprintf", linkageName: "_ZL8fwprintfP6_iobufPKwz", scope: !853, file: !853, line: 585, type: !888, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!888 = !DISubroutineType(types: !889)
!889 = !{!77, !866, !359, null}
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !891, file: !854, line: 148)
!891 = !DISubprogram(name: "fwscanf", linkageName: "_ZL7fwscanfP6_iobufPKwz", scope: !853, file: !853, line: 549, type: !888, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !893, file: !854, line: 149)
!893 = !DISubprogram(name: "getwc", scope: !853, file: !853, line: 775, type: !864, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !895, file: !854, line: 150)
!895 = !DISubprogram(name: "getwchar", scope: !853, file: !853, line: 776, type: !896, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!896 = !DISubroutineType(types: !897)
!897 = !{!856}
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !899, file: !854, line: 151)
!899 = !DISubprogram(name: "mbrlen", scope: !853, file: !853, line: 1420, type: !900, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!900 = !DISubroutineType(types: !901)
!901 = !{!902, !315, !902, !904}
!902 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !903, line: 46, baseType: !267)
!903 = !DIFile(filename: "C:\5CAMDDesignTools\5C2025.2\5CVitis\5Cwin64\5Ctools\5Cclang-16\5Clib\5Cclang\5C16\5Cinclude\5Cstddef.h", directory: "")
!904 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !905)
!905 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !852, size: 64)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !907, file: !854, line: 152)
!907 = !DISubprogram(name: "mbrtowc", scope: !853, file: !853, line: 1421, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!908 = !DISubroutineType(types: !909)
!909 = !{!902, !312, !315, !902, !904}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !911, file: !854, line: 153)
!911 = !DISubprogram(name: "mbsinit", scope: !853, file: !853, line: 1435, type: !912, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!912 = !DISubroutineType(types: !913)
!913 = !{!77, !914}
!914 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !915, size: 64)
!915 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !852)
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !917, file: !854, line: 154)
!917 = !DISubprogram(name: "mbsrtowcs", scope: !853, file: !853, line: 1422, type: !918, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!918 = !DISubroutineType(types: !919)
!919 = !{!902, !312, !920, !902, !904}
!920 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !921)
!921 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !923, file: !854, line: 155)
!923 = !DISubprogram(name: "putwc", scope: !853, file: !853, line: 777, type: !876, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !925, file: !854, line: 156)
!925 = !DISubprogram(name: "putwchar", scope: !853, file: !853, line: 778, type: !926, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!926 = !DISubroutineType(types: !927)
!927 = !{!856, !314}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !929, file: !854, line: 158)
!929 = !DISubprogram(name: "swprintf", linkageName: "_ZL8swprintfPwPKwz", scope: !930, file: !930, line: 62, type: !931, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!930 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cswprintf.inl", directory: "")
!931 = !DISubroutineType(types: !932)
!932 = !{!77, !313, !359, null}
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !934, file: !854, line: 160)
!934 = !DISubprogram(name: "swscanf", linkageName: "_ZL7swscanfPKwS0_z", scope: !853, file: !853, line: 527, type: !935, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!935 = !DISubroutineType(types: !936)
!936 = !{!77, !359, !359, null}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !938, file: !854, line: 161)
!938 = !DISubprogram(name: "ungetwc", scope: !853, file: !853, line: 779, type: !939, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!939 = !DISubroutineType(types: !940)
!940 = !{!856, !856, !866}
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !942, file: !854, line: 162)
!942 = !DISubprogram(name: "vfwprintf", linkageName: "_ZL9vfwprintfP6_iobufPKwPv", scope: !853, file: !853, line: 607, type: !943, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!943 = !DISubroutineType(types: !944)
!944 = !{!77, !866, !359, !945}
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !946, baseType: !262)
!946 = !DIFile(filename: "C:/fpga_project/gemv/dense_gemv/hls/.autopilot/db\5Cdense_gemv.pp.0.cpp", directory: "")
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !948, file: !854, line: 164)
!948 = !DISubprogram(name: "vfwscanf", linkageName: "_ZL8vfwscanfP6_iobufPKwPv", scope: !853, file: !853, line: 575, type: !943, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !950, file: !854, line: 167)
!950 = !DISubprogram(name: "vswprintf", linkageName: "_ZL9vswprintfPwPKwPv", scope: !930, file: !930, line: 51, type: !951, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!951 = !DISubroutineType(types: !952)
!952 = !{!77, !313, !359, !945}
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !954, file: !854, line: 170)
!954 = !DISubprogram(name: "vswscanf", linkageName: "_ZL8vswscanfPKwS0_Pv", scope: !853, file: !853, line: 561, type: !955, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!955 = !DISubroutineType(types: !956)
!956 = !{!77, !359, !359, !945}
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !958, file: !854, line: 172)
!958 = !DISubprogram(name: "vwprintf", linkageName: "_ZL8vwprintfPKwPv", scope: !853, file: !853, line: 614, type: !959, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!959 = !DISubroutineType(types: !960)
!960 = !{!77, !359, !945}
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !962, file: !854, line: 174)
!962 = !DISubprogram(name: "vwscanf", linkageName: "_ZL7vwscanfPKwPv", scope: !853, file: !853, line: 568, type: !959, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !964, file: !854, line: 176)
!964 = !DISubprogram(name: "wcrtomb", scope: !853, file: !853, line: 1423, type: !965, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!965 = !DISubroutineType(types: !966)
!966 = !{!902, !357, !314, !904}
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !968, file: !854, line: 177)
!968 = !DISubprogram(name: "wcscat", scope: !853, file: !853, line: 1305, type: !969, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!969 = !DISubroutineType(types: !970)
!970 = !{!313, !312, !358}
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !972, file: !854, line: 178)
!972 = !DISubprogram(name: "wcscmp", scope: !853, file: !853, line: 1307, type: !973, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!973 = !DISubroutineType(types: !974)
!974 = !{!77, !359, !359}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !976, file: !854, line: 179)
!976 = !DISubprogram(name: "wcscoll", scope: !853, file: !853, line: 1336, type: !973, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !978, file: !854, line: 180)
!978 = !DISubprogram(name: "wcscpy", scope: !853, file: !853, line: 1308, type: !969, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !980, file: !854, line: 181)
!980 = !DISubprogram(name: "wcscspn", scope: !853, file: !853, line: 1309, type: !981, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!981 = !DISubroutineType(types: !982)
!982 = !{!902, !359, !359}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !984, file: !854, line: 182)
!984 = !DISubprogram(name: "wcsftime", scope: !853, file: !853, line: 1381, type: !985, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!985 = !DISubroutineType(types: !986)
!986 = !{!902, !312, !902, !358, !987}
!987 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !988)
!988 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !989, size: 64)
!989 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !990)
!990 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !853, line: 1361, size: 288, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !992, file: !854, line: 183)
!992 = !DISubprogram(name: "wcslen", scope: !853, file: !853, line: 1310, type: !993, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!993 = !DISubroutineType(types: !994)
!994 = !{!902, !359}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !996, file: !854, line: 184)
!996 = !DISubprogram(name: "wcsncat", scope: !853, file: !853, line: 1312, type: !997, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!997 = !DISubroutineType(types: !998)
!998 = !{!313, !312, !358, !902}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1000, file: !854, line: 185)
!1000 = !DISubprogram(name: "wcsncmp", scope: !853, file: !853, line: 1313, type: !1001, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!77, !359, !359, !902}
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1004, file: !854, line: 186)
!1004 = !DISubprogram(name: "wcsncpy", scope: !853, file: !853, line: 1314, type: !997, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1006, file: !854, line: 187)
!1006 = !DISubprogram(name: "wcsrtombs", scope: !853, file: !853, line: 1424, type: !1007, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!902, !357, !1009, !902, !904}
!1009 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1010)
!1010 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1012, file: !854, line: 188)
!1012 = !DISubprogram(name: "wcsspn", scope: !853, file: !853, line: 1318, type: !981, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1014, file: !854, line: 189)
!1014 = !DISubprogram(name: "wcstod", scope: !222, file: !222, line: 537, type: !1015, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!97, !358, !1017}
!1017 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1018)
!1018 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !313, size: 64)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1020, file: !854, line: 191)
!1020 = !DISubprogram(name: "wcstof", scope: !222, file: !222, line: 541, type: !1021, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!101, !358, !1017}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1024, file: !854, line: 193)
!1024 = !DISubprogram(name: "wcstok", scope: !853, file: !853, line: 1320, type: !969, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1026, file: !854, line: 194)
!1026 = !DISubprogram(name: "wcstol", scope: !222, file: !222, line: 553, type: !1027, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!235, !358, !1017, !77}
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1030, file: !854, line: 195)
!1030 = !DISubprogram(name: "wcstoul", scope: !222, file: !222, line: 555, type: !1031, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!267, !358, !1017, !77}
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1034, file: !854, line: 196)
!1034 = !DISubprogram(name: "wcsxfrm", scope: !853, file: !853, line: 1334, type: !1035, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!902, !312, !358, !902}
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1038, file: !854, line: 197)
!1038 = !DISubprogram(name: "wctob", scope: !853, file: !853, line: 1425, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!77, !856}
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1042, file: !854, line: 198)
!1042 = !DISubprogram(name: "wmemcmp", scope: !853, file: !853, line: 1430, type: !1001, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1044, file: !854, line: 199)
!1044 = !DISubprogram(name: "wmemcpy", scope: !853, file: !853, line: 1431, type: !997, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1046, file: !854, line: 200)
!1046 = !DISubprogram(name: "wmemmove", scope: !853, file: !853, line: 1433, type: !1047, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!313, !313, !359, !902}
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1050, file: !854, line: 201)
!1050 = !DISubprogram(name: "wmemset", scope: !853, file: !853, line: 1428, type: !1051, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1051 = !DISubroutineType(types: !1052)
!1052 = !{!313, !313, !314, !902}
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1054, file: !854, line: 202)
!1054 = !DISubprogram(name: "wprintf", linkageName: "_ZL7wprintfPKwz", scope: !853, file: !853, line: 596, type: !1055, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{!77, !359, null}
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1058, file: !854, line: 203)
!1058 = !DISubprogram(name: "wscanf", linkageName: "_ZL6wscanfPKwz", scope: !853, file: !853, line: 538, type: !1055, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1060, file: !854, line: 204)
!1060 = !DISubprogram(name: "wcschr", scope: !853, file: !853, line: 1306, type: !1061, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!313, !359, !314}
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1064, file: !854, line: 205)
!1064 = !DISubprogram(name: "wcspbrk", scope: !853, file: !853, line: 1316, type: !1065, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!313, !359, !359}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1068, file: !854, line: 206)
!1068 = !DISubprogram(name: "wcsrchr", scope: !853, file: !853, line: 1317, type: !1061, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1070, file: !854, line: 207)
!1070 = !DISubprogram(name: "wcsstr", scope: !853, file: !853, line: 1319, type: !1065, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1072, file: !854, line: 208)
!1072 = !DISubprogram(name: "wmemchr", scope: !853, file: !853, line: 1429, type: !1073, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!313, !359, !314, !902}
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1076, file: !854, line: 248)
!1076 = !DISubprogram(name: "wcstold", scope: !222, file: !222, line: 550, type: !1077, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!404, !358, !1017}
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1080, file: !854, line: 257)
!1080 = !DISubprogram(name: "wcstoll", scope: !853, file: !853, line: 1436, type: !1081, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1081 = !DISubroutineType(types: !1082)
!1082 = !{!371, !358, !1017, !77}
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1084, file: !854, line: 258)
!1084 = !DISubprogram(name: "wcstoull", scope: !853, file: !853, line: 1437, type: !1085, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!395, !358, !1017, !77}
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1076, file: !854, line: 264)
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1080, file: !854, line: 265)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1084, file: !854, line: 266)
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1020, file: !854, line: 280)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !948, file: !854, line: 283)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !954, file: !854, line: 286)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !962, file: !854, line: 289)
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1076, file: !854, line: 293)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1080, file: !854, line: 294)
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1084, file: !854, line: 295)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1098, file: !1100, line: 48)
!1098 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1099, line: 35, baseType: !67)
!1099 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cstdint.h", directory: "")
!1100 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccstdint", directory: "")
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1102, file: !1100, line: 49)
!1102 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1099, line: 37, baseType: !1103)
!1103 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1105, file: !1100, line: 50)
!1105 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1099, line: 39, baseType: !77)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1107, file: !1100, line: 51)
!1107 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1099, line: 41, baseType: !371)
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1109, file: !1100, line: 53)
!1109 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !1099, line: 58, baseType: !67)
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1111, file: !1100, line: 54)
!1111 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !1099, line: 60, baseType: !1103)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1113, file: !1100, line: 55)
!1113 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !1099, line: 62, baseType: !77)
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1115, file: !1100, line: 56)
!1115 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !1099, line: 64, baseType: !371)
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1117, file: !1100, line: 58)
!1117 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !1099, line: 45, baseType: !67)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1119, file: !1100, line: 59)
!1119 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !1099, line: 47, baseType: !1103)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1121, file: !1100, line: 60)
!1121 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !1099, line: 49, baseType: !77)
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1123, file: !1100, line: 61)
!1123 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !1099, line: 51, baseType: !371)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1125, file: !1100, line: 63)
!1125 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !1099, line: 68, baseType: !371)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1127, file: !1100, line: 64)
!1127 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !266, line: 62, baseType: !235)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1129, file: !1100, line: 66)
!1129 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1099, line: 36, baseType: !1130)
!1130 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1132, file: !1100, line: 67)
!1132 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1099, line: 38, baseType: !857)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1134, file: !1100, line: 68)
!1134 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1099, line: 40, baseType: !336)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1136, file: !1100, line: 69)
!1136 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1099, line: 42, baseType: !395)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1138, file: !1100, line: 71)
!1138 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !1099, line: 59, baseType: !1130)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1140, file: !1100, line: 72)
!1140 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !1099, line: 61, baseType: !857)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1142, file: !1100, line: 73)
!1142 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !1099, line: 63, baseType: !336)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1144, file: !1100, line: 74)
!1144 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !1099, line: 65, baseType: !395)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1146, file: !1100, line: 76)
!1146 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !1099, line: 46, baseType: !1130)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1148, file: !1100, line: 77)
!1148 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !1099, line: 48, baseType: !857)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1150, file: !1100, line: 78)
!1150 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !1099, line: 50, baseType: !336)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1152, file: !1100, line: 79)
!1152 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !1099, line: 52, baseType: !395)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1154, file: !1100, line: 81)
!1154 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !1099, line: 69, baseType: !395)
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1156, file: !1100, line: 82)
!1156 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !266, line: 75, baseType: !267)
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1158, file: !1160, line: 53)
!1158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1159, line: 45, size: 704, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1159 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Clocale.h", directory: "")
!1160 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cclocale", directory: "")
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1162, file: !1160, line: 54)
!1162 = !DISubprogram(name: "setlocale", scope: !1159, file: !1159, line: 80, type: !1163, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!291, !77, !118}
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1166, file: !1160, line: 55)
!1166 = !DISubprogram(name: "localeconv", scope: !1159, file: !1159, line: 81, type: !1167, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!1169}
!1169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1158, size: 64)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1171, file: !1173, line: 64)
!1171 = !DISubprogram(name: "isalnum", scope: !1172, file: !1172, line: 124, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1172 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cctype.h", directory: "")
!1173 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccctype", directory: "")
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1175, file: !1173, line: 65)
!1175 = !DISubprogram(name: "isalpha", scope: !1172, file: !1172, line: 110, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1177, file: !1173, line: 66)
!1177 = !DISubprogram(name: "iscntrl", scope: !1172, file: !1172, line: 130, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1179, file: !1173, line: 67)
!1179 = !DISubprogram(name: "isdigit", scope: !1172, file: !1172, line: 116, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1181, file: !1173, line: 68)
!1181 = !DISubprogram(name: "isgraph", scope: !1172, file: !1172, line: 128, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1183, file: !1173, line: 69)
!1183 = !DISubprogram(name: "islower", scope: !1172, file: !1172, line: 114, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1185, file: !1173, line: 70)
!1185 = !DISubprogram(name: "isprint", scope: !1172, file: !1172, line: 126, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1187, file: !1173, line: 71)
!1187 = !DISubprogram(name: "ispunct", scope: !1172, file: !1172, line: 122, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1189, file: !1173, line: 72)
!1189 = !DISubprogram(name: "isspace", scope: !1172, file: !1172, line: 120, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1191, file: !1173, line: 73)
!1191 = !DISubprogram(name: "isupper", scope: !1172, file: !1172, line: 112, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1193, file: !1173, line: 74)
!1193 = !DISubprogram(name: "isxdigit", scope: !1172, file: !1172, line: 118, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1195, file: !1173, line: 75)
!1195 = !DISubprogram(name: "tolower", scope: !1172, file: !1172, line: 133, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1197, file: !1173, line: 76)
!1197 = !DISubprogram(name: "toupper", scope: !1172, file: !1172, line: 132, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1199, file: !1173, line: 87)
!1199 = !DISubprogram(name: "isblank", scope: !1172, file: !1172, line: 144, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !493, file: !1201, line: 44)
!1201 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cext/new_allocator.h", directory: "")
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1203, file: !1201, line: 45)
!1203 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !218, file: !444, line: 239, baseType: !235)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !867, file: !1205, line: 98)
!1205 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccstdio", directory: "")
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1207, file: !1205, line: 99)
!1207 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1208, line: 104, baseType: !235)
!1208 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cstdio.h", directory: "")
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1210, file: !1205, line: 101)
!1210 = !DISubprogram(name: "clearerr", scope: !1208, file: !1208, line: 578, type: !1211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{null, !866}
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1214, file: !1205, line: 102)
!1214 = !DISubprogram(name: "fclose", scope: !1208, file: !1208, line: 579, type: !1215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{!77, !866}
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1218, file: !1205, line: 103)
!1218 = !DISubprogram(name: "feof", scope: !1208, file: !1208, line: 586, type: !1215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1220, file: !1205, line: 104)
!1220 = !DISubprogram(name: "ferror", scope: !1208, file: !1208, line: 587, type: !1215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1222, file: !1205, line: 105)
!1222 = !DISubprogram(name: "fflush", scope: !1208, file: !1208, line: 588, type: !1215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1224, file: !1205, line: 106)
!1224 = !DISubprogram(name: "fgetc", scope: !1208, file: !1208, line: 589, type: !1215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1226, file: !1205, line: 107)
!1226 = !DISubprogram(name: "fgetpos", scope: !1208, file: !1208, line: 591, type: !1227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1227 = !DISubroutineType(types: !1228)
!1228 = !{!77, !873, !1229}
!1229 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1230)
!1230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1207, size: 64)
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1232, file: !1205, line: 108)
!1232 = !DISubprogram(name: "fgets", scope: !1208, file: !1208, line: 593, type: !1233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!291, !357, !77, !873}
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1236, file: !1205, line: 109)
!1236 = !DISubprogram(name: "fopen", scope: !1208, file: !1208, line: 600, type: !1237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{!866, !315, !315}
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1240, file: !1205, line: 110)
!1240 = !DISubprogram(name: "fprintf", linkageName: "_ZL7fprintfP6_iobufPKcz", scope: !1208, file: !1208, line: 334, type: !1241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!77, !866, !118, null}
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1244, file: !1205, line: 111)
!1244 = !DISubprogram(name: "fputc", scope: !1208, file: !1208, line: 602, type: !1245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!77, !77, !866}
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1248, file: !1205, line: 112)
!1248 = !DISubprogram(name: "fputs", scope: !1208, file: !1208, line: 604, type: !1249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1249 = !DISubroutineType(types: !1250)
!1250 = !{!77, !315, !873}
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1252, file: !1205, line: 113)
!1252 = !DISubprogram(name: "fread", scope: !1208, file: !1208, line: 605, type: !1253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1253 = !DISubroutineType(types: !1254)
!1254 = !{!902, !1255, !902, !902, !873}
!1255 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !262)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1257, file: !1205, line: 114)
!1257 = !DISubprogram(name: "freopen", scope: !1208, file: !1208, line: 606, type: !1258, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1258 = !DISubroutineType(types: !1259)
!1259 = !{!866, !315, !315, !873}
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1261, file: !1205, line: 115)
!1261 = !DISubprogram(name: "fscanf", linkageName: "_ZL6fscanfP6_iobufPKcz", scope: !1208, file: !1208, line: 289, type: !1241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1263, file: !1205, line: 116)
!1263 = !DISubprogram(name: "fseek", scope: !1208, file: !1208, line: 609, type: !1264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{!77, !866, !235, !77}
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1267, file: !1205, line: 117)
!1267 = !DISubprogram(name: "fsetpos", scope: !1208, file: !1208, line: 607, type: !1268, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1268 = !DISubroutineType(types: !1269)
!1269 = !{!77, !866, !1270}
!1270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1271, size: 64)
!1271 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1207)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1273, file: !1205, line: 118)
!1273 = !DISubprogram(name: "ftell", scope: !1208, file: !1208, line: 610, type: !1274, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{!235, !866}
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1277, file: !1205, line: 119)
!1277 = !DISubprogram(name: "fwrite", scope: !1208, file: !1208, line: 654, type: !1278, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1278 = !DISubroutineType(types: !1279)
!1279 = !{!902, !1280, !902, !902, !873}
!1280 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !263)
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1282, file: !1205, line: 120)
!1282 = !DISubprogram(name: "getc", scope: !1208, file: !1208, line: 655, type: !1215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1284, file: !1205, line: 121)
!1284 = !DISubprogram(name: "getchar", scope: !1208, file: !1208, line: 656, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1286, file: !1205, line: 126)
!1286 = !DISubprogram(name: "perror", scope: !222, file: !222, line: 621, type: !1287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1287 = !DISubroutineType(types: !1288)
!1288 = !{null, !118}
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1290, file: !1205, line: 127)
!1290 = !DISubprogram(name: "printf", linkageName: "_ZL6printfPKcz", scope: !1208, file: !1208, line: 345, type: !1291, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!77, !118, null}
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1294, file: !1205, line: 128)
!1294 = !DISubprogram(name: "putc", scope: !1208, file: !1208, line: 670, type: !1245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1296, file: !1205, line: 129)
!1296 = !DISubprogram(name: "putchar", scope: !1208, file: !1208, line: 671, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1298, file: !1205, line: 130)
!1298 = !DISubprogram(name: "puts", scope: !1208, file: !1208, line: 672, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1300, file: !1205, line: 131)
!1300 = !DISubprogram(name: "remove", scope: !1208, file: !1208, line: 676, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1302, file: !1205, line: 132)
!1302 = !DISubprogram(name: "rename", scope: !1208, file: !1208, line: 677, type: !1303, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!77, !118, !118}
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1306, file: !1205, line: 133)
!1306 = !DISubprogram(name: "rewind", scope: !1208, file: !1208, line: 683, type: !1211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1308, file: !1205, line: 134)
!1308 = !DISubprogram(name: "scanf", linkageName: "_ZL5scanfPKcz", scope: !1208, file: !1208, line: 278, type: !1291, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1310, file: !1205, line: 135)
!1310 = !DISubprogram(name: "setbuf", scope: !1208, file: !1208, line: 685, type: !1311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{null, !873, !357}
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1314, file: !1205, line: 136)
!1314 = !DISubprogram(name: "setvbuf", scope: !1208, file: !1208, line: 689, type: !1315, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1315 = !DISubroutineType(types: !1316)
!1316 = !{!77, !873, !357, !77, !902}
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1318, file: !1205, line: 137)
!1318 = !DISubprogram(name: "sprintf", linkageName: "_ZL7sprintfPcPKcz", scope: !1208, file: !1208, line: 356, type: !1319, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!77, !291, !118, null}
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1322, file: !1205, line: 138)
!1322 = !DISubprogram(name: "sscanf", linkageName: "_ZL6sscanfPKcS0_z", scope: !1208, file: !1208, line: 267, type: !1323, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!77, !118, !118, null}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1326, file: !1205, line: 139)
!1326 = !DISubprogram(name: "tmpfile", scope: !1208, file: !1208, line: 715, type: !1327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1327 = !DISubroutineType(types: !1328)
!1328 = !{!866}
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1330, file: !1205, line: 141)
!1330 = !DISubprogram(name: "tmpnam", scope: !1208, file: !1208, line: 716, type: !1331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{!291, !291}
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1334, file: !1205, line: 143)
!1334 = !DISubprogram(name: "ungetc", scope: !1208, file: !1208, line: 717, type: !1245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1336, file: !1205, line: 144)
!1336 = !DISubprogram(name: "vfprintf", linkageName: "_ZL8vfprintfP6_iobufPKcPv", scope: !1208, file: !1208, line: 367, type: !1337, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{!77, !866, !118, !945}
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1340, file: !1205, line: 145)
!1340 = !DISubprogram(name: "vprintf", linkageName: "_ZL7vprintfPKcPv", scope: !1208, file: !1208, line: 374, type: !1341, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1341 = !DISubroutineType(types: !1342)
!1342 = !{!77, !118, !945}
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1344, file: !1205, line: 146)
!1344 = !DISubprogram(name: "vsprintf", linkageName: "_ZL8vsprintfPcPKcPv", scope: !1208, file: !1208, line: 381, type: !1345, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!77, !291, !118, !945}
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1348, file: !1205, line: 175)
!1348 = !DISubprogram(name: "snprintf", linkageName: "_ZL8snprintfPcmPKcz", scope: !1208, file: !1208, line: 388, type: !1349, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!77, !291, !902, !118, null}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1352, file: !1205, line: 176)
!1352 = !DISubprogram(name: "vfscanf", linkageName: "_ZL7vfscanfP6_iobufPKcPv", scope: !1208, file: !1208, line: 320, type: !1337, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1354, file: !1205, line: 177)
!1354 = !DISubprogram(name: "vscanf", linkageName: "_ZL6vscanfPKcPv", scope: !1208, file: !1208, line: 313, type: !1341, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1356, file: !1205, line: 178)
!1356 = !DISubprogram(name: "vsnprintf", linkageName: "_ZL9vsnprintfPcmPKcPv", scope: !1208, file: !1208, line: 399, type: !1357, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!77, !291, !902, !118, !945}
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1360, file: !1205, line: 179)
!1360 = !DISubprogram(name: "vsscanf", linkageName: "_ZL7vsscanfPKcS0_Pv", scope: !1208, file: !1208, line: 306, type: !1361, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!77, !118, !118, !945}
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1348, file: !1205, line: 185)
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1352, file: !1205, line: 186)
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1354, file: !1205, line: 187)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1356, file: !1205, line: 188)
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1360, file: !1205, line: 189)
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1369, file: !1371, line: 82)
!1369 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1370, line: 174, baseType: !314)
!1370 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cwctype.h", directory: "")
!1371 = !DIFile(filename: "C:/AMDDesignTools/2025.2/Vitis/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccwctype", directory: "")
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1373, file: !1371, line: 83)
!1373 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !266, line: 107, baseType: !857)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !856, file: !1371, line: 84)
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1376, file: !1371, line: 86)
!1376 = !DISubprogram(name: "iswalnum", scope: !853, file: !853, line: 276, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1378, file: !1371, line: 87)
!1378 = !DISubprogram(name: "iswalpha", scope: !853, file: !853, line: 262, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1380, file: !1371, line: 89)
!1380 = !DISubprogram(name: "iswblank", scope: !853, file: !853, line: 300, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1382, file: !1371, line: 91)
!1382 = !DISubprogram(name: "iswcntrl", scope: !853, file: !853, line: 282, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1384, file: !1371, line: 92)
!1384 = !DISubprogram(name: "iswctype", scope: !853, file: !853, line: 291, type: !1385, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1385 = !DISubroutineType(types: !1386)
!1386 = !{!77, !856, !1373}
!1387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1388, file: !1371, line: 93)
!1388 = !DISubprogram(name: "iswdigit", scope: !853, file: !853, line: 268, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1390, file: !1371, line: 94)
!1390 = !DISubprogram(name: "iswgraph", scope: !853, file: !853, line: 280, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1392, file: !1371, line: 95)
!1392 = !DISubprogram(name: "iswlower", scope: !853, file: !853, line: 266, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1394, file: !1371, line: 96)
!1394 = !DISubprogram(name: "iswprint", scope: !853, file: !853, line: 278, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1396, file: !1371, line: 97)
!1396 = !DISubprogram(name: "iswpunct", scope: !853, file: !853, line: 274, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1398, file: !1371, line: 98)
!1398 = !DISubprogram(name: "iswspace", scope: !853, file: !853, line: 272, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1400, file: !1371, line: 99)
!1400 = !DISubprogram(name: "iswupper", scope: !853, file: !853, line: 264, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1402, file: !1371, line: 100)
!1402 = !DISubprogram(name: "iswxdigit", scope: !853, file: !853, line: 270, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1404, file: !1371, line: 101)
!1404 = !DISubprogram(name: "towctrans", scope: !1370, file: !1370, line: 175, type: !1405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1405 = !DISubroutineType(types: !1406)
!1406 = !{!856, !856, !1369}
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1408, file: !1371, line: 102)
!1408 = !DISubprogram(name: "towlower", scope: !853, file: !853, line: 289, type: !1409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{!856, !856}
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1412, file: !1371, line: 103)
!1412 = !DISubprogram(name: "towupper", scope: !853, file: !853, line: 287, type: !1409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1414, file: !1371, line: 104)
!1414 = !DISubprogram(name: "wctrans", scope: !1370, file: !1370, line: 176, type: !1415, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!1369, !118}
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !218, entity: !1418, file: !1371, line: 105)
!1418 = !DISubprogram(name: "wctype", scope: !1370, file: !1370, line: 177, type: !1419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!1373, !118}
!1421 = distinct !{!1421, !1422}
!1422 = !{!"llvm.loop.rotate.disable"}
!1423 = distinct !{!1423, !1422}
!1424 = distinct !{!1424, !1422}
!1425 = distinct !{!1425, !1422}
