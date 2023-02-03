`define STDERR 32'h80000002

module adc_ctrl_fsm_tb;

  logic             clk_i;
  logic             rst_ni;

  adc_ctrl_fsm adc_ctrl_fsm_i (
  .clk_aon_i(clk_i),
  .rst_aon_ni(rst_ni),
  .cfg_fsm_rst_i(1'b0),
  .cfg_adc_enable_i(1'b1),
  .cfg_oneshot_mode_i(3'b111),
  .cfg_lp_mode_i(3'b000),
  .cfg_pwrup_time_i(4'b0000),
  .cfg_wakeup_time_i(24'b000000000000000000000111),
  .cfg_lp_sample_cnt_i(8'b00001111),
  .cfg_np_sample_cnt_i(16'b0000000011111111),
  .adc_ctrl_match_i(8'b00001111),
  .adc_d_i(10'b0000000111),
  .adc_d_val_i(3'b111),
  .adc_pd_o(),
  .adc_chn_sel_o(),
  .chn0_val_we_o(),
  .chn1_val_we_o(),
  .chn0_val_o(),
  .chn1_val_o(),
  .adc_ctrl_done_o(),
  .oneshot_done_o()
  );

  initial clk_i = 0;
  always #5 clk_i = !clk_i;

  initial begin
      rst_ni = 0;
      #5
      rst_ni = 1;
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      #5
      $finish;
  end

  initial begin
    $dumpfile("adc_ctrl_fsm.vcd"); 
    $dumpvars(0, adc_ctrl_fsm_i);
  end
endmodule
