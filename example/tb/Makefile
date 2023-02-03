IVL = iverilog
IVLFLAGS = -Wall -Wno-sensitivity-entire-array -g2012

.PHONY: build
build:
	$(IVL) $(IVLFLAGS) adc_ctrl_fsm_tb.sv ../generated/adc_ctrl_fsm_netlist.v -o adc_ctrl_fsm

.PHONY: test
run:
	./adc_ctrl_fsm

.PHONY: clean
clean:
	rm -f adc_ctrl_fsm
