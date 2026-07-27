# 2026-07-27T00:38:04.515361400
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/fpga_project")

comp = client.create_hls_component(name = "stream_project",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="stream_project")
comp.run(operation="C_SIMULATION")

cfg = client.get_config_file(path="C:\fpga_project\stream_project\hls_config.cfg")

cfg.set_values(key="syn.file", values=["../hls/stream_mover.cpp", "../hls/stream_mover.h"])

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

cfg = client.get_config_file(path="/c:/fpga_project/stream_project/hls_config.cfg")

cfg.set_value(section="hls", key="syn.top", value="stream_mover")

comp.run(operation="SYNTHESIS")

