set ModuleHierarchy {[{
"Name" : "dense_gemv", "RefName" : "dense_gemv","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_dense_gemv_Pipeline_VITIS_LOOP_25_1_fu_314", "RefName" : "dense_gemv_Pipeline_VITIS_LOOP_25_1","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_25_1","RefName" : "VITIS_LOOP_25_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_dense_gemv_Pipeline_VITIS_LOOP_30_2_fu_352", "RefName" : "dense_gemv_Pipeline_VITIS_LOOP_30_2","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_30_2","RefName" : "VITIS_LOOP_30_2","ID" : "4","Type" : "pipeline"},]},]
}]}