import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
@cocotb.test()
async def test_blinking_led(dut):
    cocotb.start_soon(Clock(dut.clk, 10,"ns").start())
    dut.reset.value  = 1
    await RisingEdge(dut.clk)
    dut.reset.value  = 0
    if dut.led.value == 0:
        dut._log.info("LED is correctly OFF")
    else:
        dut._log.info("LED is correctly ON")

    await RisingEdge(dut.clk,25000000)
    if dut.led.value == 1:
        dut._log.info("LED is correctly OFF")
    else:
        dut._log.info("LED is correctly ON")
