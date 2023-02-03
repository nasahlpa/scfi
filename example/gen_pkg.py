#!/usr/bin/env python3
import subprocess
import sys


from mako.template import Template
from pathlib import Path

def hamming(a, b):
    return bin(a^b).count('1')

def main():
    template_file = (Path("adc_ctrl_fsm_pkg.sv.tpl"))
    pkg_template = Template(template_file.read_text(), strict_undefined=True)
    pkg_out = Path("adc_ctrl_fsm_pkg.sv")
    hd = int(sys.argv[1])
    
    # Set encoded 0/1.
    ctrl = []
    ctrl.append("0")
    ctrl.append("1")
    for x in range(1, hd):
        ctrl[0] += "0"
        ctrl[1] += "1"

    pkg_out.write_text(pkg_template.render(num_bits_ctrl=hd, ctrl=ctrl))

if __name__ == "__main__":
    main()