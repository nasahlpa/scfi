#!/bin/bash
# Based on:
# https://github.com/lowRISC/opentitan/tree/master/hw/ip/aes/pre_syn

set -e
set -o pipefail

mkdir -p generated
mkdir -p log
rm -rf generated/*

error () {
    echo >&2 "$@"
    exit 1
}

if [ $# -eq 0 ]
  then
    error "No top level model specified"
fi

teelog () {
    tee "log/$1.log"
}

#-------------------------------------------------------------------------
# setup flow variables
#-------------------------------------------------------------------------
export LR_SYNTH_TOP_MODULE=$1
export LR_SYNTH_FLATTEN=false
export LR_SYNTH_CELL_LIB_PATH=../NangateOpenCellLibrary_typical.lib

#-------------------------------------------------------------------------
# use sv2v to convert all SystemVerilog files to Verilog
#-------------------------------------------------------------------------

OT_DEP_PACKAGES=(
    *_pkg.sv
)

for file in *.sv; do
    module=`basename -s .sv $file`

    # Skip packages
    if echo "$module" | grep -q '_pkg$'; then
        continue
    fi

    sv2v \
        --define=SYNTHESIS --define=YOSYS \
        "${OT_DEP_PACKAGES[@]}" \
        $file \
        > generated/${module}.v
done

#-------------------------------------------------------------------------
# run Yosys synthesis
#-------------------------------------------------------------------------
yosys -c ./tcl/yosys_run_synth.tcl $2 |& teelog syn || {
    error "Failed to synthesize RTL with Yosys"
}
