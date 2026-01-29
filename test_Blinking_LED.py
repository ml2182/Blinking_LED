import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
@cocotb.test()
async def test_blinking_led(dut):
    cocotb.start_soon(Clock(dut.clk, 20,"ns").start())
    dut.reset.value  = 1
    await RisingEdge(dut.clk)
    dut.reset.value  = 0
    if dut.led.value == 0:
        assert True, "LED correctly switches OFF"
    else:
        assert False, "LED error"

    await ClockCycles(dut.clk,25000000)
    await RisingEdge(dut.clk)
    if dut.led.value == 1:
        assert True, "LED correctly switches ON"
    else:
        assert False, "LED error"
