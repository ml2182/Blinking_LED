TOPLEVEL_LANG = verilog
TOPLEVEL = Blinking_LED
MODULE = test_Blinking_LED
VERILOG_SOURCES = $(PWD)/src/Blinking_LED.sv
SIM ?= verilator
include $(shell cocotb-config --makefiles)/Makefile.sim