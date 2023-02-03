if { $env(LR_SYNTH_FLATTEN) } {
  set flatten_opt "-flatten"
} else {
  set flatten_opt ""
}

yosys "read_verilog -sv generated/*.v"
yosys "hierarchy -check -top $env(LR_SYNTH_TOP_MODULE)"

# Synthesize.
yosys "synth $flatten_opt -fsmprotect -hd 3 -top $env(LR_SYNTH_TOP_MODULE)"
yosys "opt -purge"

yosys "abc"

# Final flattening.
if { $env(LR_SYNTH_FLATTEN) } {
  yosys "flatten"
}

yosys "clean"
yosys "write_verilog generated/$env(LR_SYNTH_TOP_MODULE)_netlist.v"

yosys "tee -o area.rpt stat"