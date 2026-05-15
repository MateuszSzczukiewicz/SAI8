GHDL ?= ghdl
STD  ?= 08
TOP  := sai8

all: run

build:
	$(GHDL) -a --std=$(STD) $(TOP).vhd
	$(GHDL) -e --std=$(STD) $(TOP)

run: build
	$(GHDL) -r --std=$(STD) $(TOP) --stop-time=1us

clean:
	rm -rf *.o *.cf work-obj* $(TOP)

.PHONY: all build run clean
