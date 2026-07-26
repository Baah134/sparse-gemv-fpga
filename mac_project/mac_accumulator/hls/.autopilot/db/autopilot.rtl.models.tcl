set SynModuleInfo {
  {SRCNAME mac_accumulator MODELNAME mac_accumulator RTLNAME mac_accumulator IS_TOP 1
    SUBMODULES {
      {MODELNAME mac_accumulator_mac_muladd_8s_8s_32s_32_4_1 RTLNAME mac_accumulator_mac_muladd_8s_8s_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME mac_accumulator_control_s_axi RTLNAME mac_accumulator_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME mac_accumulator_regslice_both RTLNAME mac_accumulator_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
      {MODELNAME mac_accumulator_flow_control_loop_delay_pipe RTLNAME mac_accumulator_flow_control_loop_delay_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mac_accumulator_flow_control_loop_delay_pipe_U}
    }
  }
}
