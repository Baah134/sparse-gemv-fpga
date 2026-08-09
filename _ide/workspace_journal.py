# 2026-08-09T20:37:31.662151600
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/fpga_project")

comp = client.create_hls_component(name = "sparse_project_1",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="sparse_project_1")
comp.run(operation="C_SIMULATION")

cfg = client.get_config_file(path="/c:/fpga_project/sparse_project_1/hls_config.cfg")

cfg.set_value(section="hls", key="syn.top", value="sparse_gemv")

comp.run(operation="C_SIMULATION")

comp = client.get_component(name="sparse_project")
comp.run(operation="C_SIMULATION")

client.delete_component(name="sparse_project_1")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

