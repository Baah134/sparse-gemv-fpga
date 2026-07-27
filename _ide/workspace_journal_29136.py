# 2026-07-27T00:22:37.485361900
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/fpga_project")

comp = client.get_component(name="mac_project")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

client.delete_component(name="mac_project")

vitis.dispose()

