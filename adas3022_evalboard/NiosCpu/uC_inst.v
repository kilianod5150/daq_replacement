  //Example instantiation for system 'uC'
  uC uC_inst
    (
      .areset_to_the_pll                   (areset_to_the_pll),
      .baddr_o_from_the_ADAS3022_0         (baddr_o_from_the_ADAS3022_0),
      .bbusy_i_to_the_ADAS3022_0           (bbusy_i_to_the_ADAS3022_0),
      .bdb_io_to_and_from_the_ADAS3022_0   (bdb_io_to_and_from_the_ADAS3022_0),
      .bidir_port_to_and_from_the_pwr_data (bidir_port_to_and_from_the_pwr_data),
      .brd_n_o_from_the_ADAS3022_0         (brd_n_o_from_the_ADAS3022_0),
      .breset_o_from_the_ADAS3022_0        (breset_o_from_the_ADAS3022_0),
      .bwr_n_o_from_the_ADAS3022_0         (bwr_n_o_from_the_ADAS3022_0),
      .ext_clk                             (ext_clk),
      .locked_from_the_pll                 (locked_from_the_pll),
      .out_port_from_the_i2c_int           (out_port_from_the_i2c_int),
      .out_port_from_the_leds              (out_port_from_the_leds),
      .out_port_from_the_pwr_en_clk        (out_port_from_the_pwr_en_clk),
      .phasedone_from_the_pll              (phasedone_from_the_pll),
      .reset_n                             (reset_n),
      .select_n_to_the_sram                (select_n_to_the_sram),
      .sys_clk                             (sys_clk),
      .tri_state_bridge_0_address          (tri_state_bridge_0_address),
      .tri_state_bridge_0_data             (tri_state_bridge_0_data),
      .tri_state_bridge_0_readn            (tri_state_bridge_0_readn),
      .tri_state_bridge_0_writen           (tri_state_bridge_0_writen)
    );

