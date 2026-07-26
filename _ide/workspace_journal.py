# 2026-07-25T21:45:28.076231100
import vitis

client = vitis.create_client()
client.set_workspace(path="fpga_project")

comp = client.create_hls_component(name = "mac_project",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

cfg = client.get_config_file(path="C:\Users\prince.baah\Downloads\fpga_project\mac_project\hls_config.cfg")

cfg.set_values(key="tb.file", values=["../tb_mac.cpp"])

comp = client.get_component(name="mac_project")
comp.run(operation="C_SIMULATION")

cfg.set_values(key="syn.file", values=["../mac_accumulator.cpp", "../mac_accumulator.h"])

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

vitis.dispose()

