; ModuleID = 'C:/fpga_project/stream_project/stream_project/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<ap_int<8>>" = type { %"struct.ap_int<8>" }
%"struct.ap_int<8>" = type { %"struct.ap_int_base<8, true>" }
%"struct.ap_int_base<8, true>" = type { %"struct.ssdm_int<8, true>" }
%"struct.ssdm_int<8, true>" = type { i8 }

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_stream_mover_ir(%"class.hls::stream<ap_int<8>>"* noalias nocapture nonnull align 1 dereferenceable(1) %in_stream, %"class.hls::stream<ap_int<8>>"* noalias nocapture nonnull align 1 dereferenceable(1) %out_stream, i32 %N) local_unnamed_addr #1 {
entry:
  %in_stream_copy = alloca i8, align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(i8* %in_stream_copy, i32 0) ]
  %out_stream_copy = alloca i8, align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(i8* %out_stream_copy, i32 0) ]
  call fastcc void @copy_in(%"class.hls::stream<ap_int<8>>"* nonnull %in_stream, i8* nonnull align 512 %in_stream_copy, %"class.hls::stream<ap_int<8>>"* nonnull %out_stream, i8* nonnull align 512 %out_stream_copy)
  call void @apatb_stream_mover_hw(i8* %in_stream_copy, i8* %out_stream_copy, i32 %N)
  call void @copy_back(%"class.hls::stream<ap_int<8>>"* %in_stream, i8* %in_stream_copy, %"class.hls::stream<ap_int<8>>"* %out_stream, i8* %out_stream_copy)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in(%"class.hls::stream<ap_int<8>>"* noalias "unpacked"="0", i8* noalias nocapture align 512 "unpacked"="1.0", %"class.hls::stream<ap_int<8>>"* noalias "unpacked"="2", i8* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>.12"(i8* align 512 %1, %"class.hls::stream<ap_int<8>>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>.12"(i8* align 512 %3, %"class.hls::stream<ap_int<8>>"* %2)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out(%"class.hls::stream<ap_int<8>>"* noalias "unpacked"="0", i8* noalias nocapture align 512 "unpacked"="1.0", %"class.hls::stream<ap_int<8>>"* noalias "unpacked"="2", i8* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* %0, i8* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* %2, i8* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* noalias "unpacked"="0" %dst, i8* noalias nocapture align 512 "unpacked"="1.0" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"class.hls::stream<ap_int<8>>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>.7"(%"class.hls::stream<ap_int<8>>"* nonnull %dst, i8* align 512 %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>.7"(%"class.hls::stream<ap_int<8>>"* noalias nocapture "unpacked"="0", i8* noalias nocapture align 512 "unpacked"="1.0") unnamed_addr #5 {
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
  br label %empty, !llvm.loop !6

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>.12"(i8* noalias nocapture align 512 "unpacked"="0.0" %dst, %"class.hls::stream<ap_int<8>>"* noalias "unpacked"="1" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"class.hls::stream<ap_int<8>>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>.15"(i8* align 512 %dst, %"class.hls::stream<ap_int<8>>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_int<8>>.15"(i8* noalias nocapture align 512 "unpacked"="0.0", %"class.hls::stream<ap_int<8>>"* noalias nocapture "unpacked"="1") unnamed_addr #5 {
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
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_stream_mover_hw(i8*, i8*, i32)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back(%"class.hls::stream<ap_int<8>>"* noalias "unpacked"="0", i8* noalias nocapture align 512 "unpacked"="1.0", %"class.hls::stream<ap_int<8>>"* noalias "unpacked"="2", i8* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* %0, i8* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_int<8>>"(%"class.hls::stream<ap_int<8>>"* %2, i8* align 512 %3)
  ret void
}

declare void @stream_mover_hw_stub(%"class.hls::stream<ap_int<8>>"* noalias nocapture nonnull, %"class.hls::stream<ap_int<8>>"* noalias nocapture nonnull, i32)

define void @stream_mover_hw_stub_wrapper(i8*, i8*, i32) #6 {
entry:
  %3 = call i8* @malloc(i64 1)
  %4 = bitcast i8* %3 to %"class.hls::stream<ap_int<8>>"*
  %5 = call i8* @malloc(i64 1)
  %6 = bitcast i8* %5 to %"class.hls::stream<ap_int<8>>"*
  call void @copy_out(%"class.hls::stream<ap_int<8>>"* %4, i8* %0, %"class.hls::stream<ap_int<8>>"* %6, i8* %1)
  call void @stream_mover_hw_stub(%"class.hls::stream<ap_int<8>>"* %4, %"class.hls::stream<ap_int<8>>"* %6, i32 %2)
  call void @copy_in(%"class.hls::stream<ap_int<8>>"* %4, i8* %0, %"class.hls::stream<ap_int<8>>"* %6, i8* %1)
  call void @free(i8* %3)
  call void @free(i8* %5)
  ret void
}

declare i1 @fpga_fifo_not_empty_1(i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind willreturn }
attributes #1 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind willreturn "xlx.port.bitwidth"="8" "xlx.source"="user" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.rotate.disable"}
!8 = distinct !{!8, !7}
