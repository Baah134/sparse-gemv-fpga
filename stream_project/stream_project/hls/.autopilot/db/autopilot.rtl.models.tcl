set SynModuleInfo {
  {SRCNAME stream_mover MODELNAME stream_mover RTLNAME stream_mover IS_TOP 1
    SUBMODULES {
      {MODELNAME stream_mover_control_s_axi RTLNAME stream_mover_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME stream_mover_regslice_both RTLNAME stream_mover_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
      {MODELNAME stream_mover_flow_control_loop_pipe RTLNAME stream_mover_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME stream_mover_flow_control_loop_pipe_U}
    }
  }
}
