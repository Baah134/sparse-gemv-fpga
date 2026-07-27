# 2026-07-26T22:43:02.755078100
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/fpga_project")

cfg = client.get_config_file(path="C:\fpga_project\mac_project\hls_config.cfg")

cfg.set_values(key="syn.file", values=["../mac_accumulator.cpp", "../mac_accumulator.h", "../hls/stream_mover.cpp"])

cfg.set_values(key="tb.file", values=["../tb_mac.cpp", "../tb/tb_stream_mover.cpp"])

comp = client.get_component(name="mac_project")
comp.run(operation="C_SIMULATION")

cfg.set_values(key="syn.file", values=["../mac_accumulator.cpp", "../mac_accumulator.h", "../hls/stream_mover.cpp", "../hls/mac_accumulator.cpp"])

cfg.set_values(key="tb.file", values=["../tb_mac.cpp", "../tb/tb_stream_mover.cpp", "../tb/tb_mac.cpp"])

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

