# SCFI

Build SCFI:
```
git clone --recursive https://extgit.iaik.tugraz.at/sesys/scfi.git
cd yosys
git apply ../scfi.patch
# Install dependencies described in the original Yosys repository.
make
```
To run the example, install [sv2v](https://github.com/zachjs/sv2v) and [iverilog](https://github.com/steveicarus/iverilog).
```
# Download Nangate45 standard cell library:
wget https://raw.githubusercontent.com/The-OpenROAD-Project/OpenROAD-flow-scripts/master/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
# Set path:
export PATH=<path>/scfi/yosys/:$PATH
cd example
# Generate netlist:
./run.sh
# Run testbench:
cd tb
make && make run
```

# Publication
Nasahl, P., Unterguggenberger, M., Nagpal, R., Schilling, R., Schrammel, D., & Mangard, S. (2023). [SCFI: State Machine Control-Flow Hardening Against Fault Attacks](https://arxiv.org/abs/2208.01356). DATE Conference.