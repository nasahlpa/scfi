package adc_ctrl_fsm_pkg;

  // Encoded control signals
  parameter int SignalWidth = ${num_bits_ctrl};
  typedef enum logic [SignalWidth-1:0] {
    SIGNAL_0 = ${num_bits_ctrl}'b${ctrl[0]},
    SIGNAL_1 = ${num_bits_ctrl}'b${ctrl[1]}
  } signal_e;

endpackage
