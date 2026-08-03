# 2026-08-03T20:09:45.579414900
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/fpga_project")

comp = client.get_component(name="gemv")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

