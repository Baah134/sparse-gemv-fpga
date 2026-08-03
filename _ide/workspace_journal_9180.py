# 2026-08-03T16:49:13.672263300
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/fpga_project")

cfg = client.get_config_file(path="C:\fpga_project\gemv\hls_config.cfg")

cfg.set_values(key="syn.file", values=["../hls/dense_gemv.cpp", "../hls/dense_gemv.h"])

cfg.set_values(key="tb.file", values=["../tb/tb_dense_gemv.cpp"])

comp = client.get_component(name="gemv")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

