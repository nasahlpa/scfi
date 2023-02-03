#!/bin/bash

./gen_pkg.py 3
sed "s/-hd [0-9]*/-hd 3/" tcl/yosys_run_synth_template.tcl > tcl/yosys_run_synth.tcl
./synth.sh adc_ctrl_fsm
line=$(tail -2 area.rpt | sed -n -e "s/^.*': //p")