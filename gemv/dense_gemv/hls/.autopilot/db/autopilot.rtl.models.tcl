set SynModuleInfo {
  {SRCNAME dense_gemv_Pipeline_VITIS_LOOP_25_1 MODELNAME dense_gemv_Pipeline_VITIS_LOOP_25_1 RTLNAME dense_gemv_dense_gemv_Pipeline_VITIS_LOOP_25_1
    SUBMODULES {
      {MODELNAME dense_gemv_flow_control_loop_pipe_sequential_init RTLNAME dense_gemv_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dense_gemv_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME dense_gemv_Pipeline_VITIS_LOOP_30_2 MODELNAME dense_gemv_Pipeline_VITIS_LOOP_30_2 RTLNAME dense_gemv_dense_gemv_Pipeline_VITIS_LOOP_30_2
    SUBMODULES {
      {MODELNAME dense_gemv_mul_32s_8s_32_2_1 RTLNAME dense_gemv_mul_32s_8s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dense_gemv MODELNAME dense_gemv RTLNAME dense_gemv IS_TOP 1
    SUBMODULES {
      {MODELNAME dense_gemv_control_s_axi RTLNAME dense_gemv_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME dense_gemv_regslice_both RTLNAME dense_gemv_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
