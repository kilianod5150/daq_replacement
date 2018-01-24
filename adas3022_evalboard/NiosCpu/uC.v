//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2012 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ADAS3022_0_avalon_arbitrator (
                                      // inputs:
                                       ADAS3022_0_avalon_readdata,
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_read,
                                       cpu_data_master_waitrequest,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       cpu_instruction_master_address_to_slave,
                                       cpu_instruction_master_read,
                                       reset_n,

                                      // outputs:
                                       ADAS3022_0_avalon_address,
                                       ADAS3022_0_avalon_read,
                                       ADAS3022_0_avalon_readdata_from_sa,
                                       ADAS3022_0_avalon_reset,
                                       ADAS3022_0_avalon_write,
                                       ADAS3022_0_avalon_writedata,
                                       cpu_data_master_granted_ADAS3022_0_avalon,
                                       cpu_data_master_qualified_request_ADAS3022_0_avalon,
                                       cpu_data_master_read_data_valid_ADAS3022_0_avalon,
                                       cpu_data_master_requests_ADAS3022_0_avalon,
                                       cpu_instruction_master_granted_ADAS3022_0_avalon,
                                       cpu_instruction_master_qualified_request_ADAS3022_0_avalon,
                                       cpu_instruction_master_read_data_valid_ADAS3022_0_avalon,
                                       cpu_instruction_master_requests_ADAS3022_0_avalon,
                                       d1_ADAS3022_0_avalon_end_xfer
                                    )
;

  output  [  2: 0] ADAS3022_0_avalon_address;
  output           ADAS3022_0_avalon_read;
  output  [ 31: 0] ADAS3022_0_avalon_readdata_from_sa;
  output           ADAS3022_0_avalon_reset;
  output           ADAS3022_0_avalon_write;
  output  [ 31: 0] ADAS3022_0_avalon_writedata;
  output           cpu_data_master_granted_ADAS3022_0_avalon;
  output           cpu_data_master_qualified_request_ADAS3022_0_avalon;
  output           cpu_data_master_read_data_valid_ADAS3022_0_avalon;
  output           cpu_data_master_requests_ADAS3022_0_avalon;
  output           cpu_instruction_master_granted_ADAS3022_0_avalon;
  output           cpu_instruction_master_qualified_request_ADAS3022_0_avalon;
  output           cpu_instruction_master_read_data_valid_ADAS3022_0_avalon;
  output           cpu_instruction_master_requests_ADAS3022_0_avalon;
  output           d1_ADAS3022_0_avalon_end_xfer;
  input   [ 31: 0] ADAS3022_0_avalon_readdata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 22: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input            reset_n;

  wire    [  2: 0] ADAS3022_0_avalon_address;
  wire             ADAS3022_0_avalon_allgrants;
  wire             ADAS3022_0_avalon_allow_new_arb_cycle;
  wire             ADAS3022_0_avalon_any_bursting_master_saved_grant;
  wire             ADAS3022_0_avalon_any_continuerequest;
  reg     [  1: 0] ADAS3022_0_avalon_arb_addend;
  wire             ADAS3022_0_avalon_arb_counter_enable;
  reg     [  1: 0] ADAS3022_0_avalon_arb_share_counter;
  wire    [  1: 0] ADAS3022_0_avalon_arb_share_counter_next_value;
  wire    [  1: 0] ADAS3022_0_avalon_arb_share_set_values;
  wire    [  1: 0] ADAS3022_0_avalon_arb_winner;
  wire             ADAS3022_0_avalon_arbitration_holdoff_internal;
  wire             ADAS3022_0_avalon_beginbursttransfer_internal;
  wire             ADAS3022_0_avalon_begins_xfer;
  wire    [  3: 0] ADAS3022_0_avalon_chosen_master_double_vector;
  wire    [  1: 0] ADAS3022_0_avalon_chosen_master_rot_left;
  wire             ADAS3022_0_avalon_end_xfer;
  wire             ADAS3022_0_avalon_firsttransfer;
  wire    [  1: 0] ADAS3022_0_avalon_grant_vector;
  wire             ADAS3022_0_avalon_in_a_read_cycle;
  wire             ADAS3022_0_avalon_in_a_write_cycle;
  wire    [  1: 0] ADAS3022_0_avalon_master_qreq_vector;
  wire             ADAS3022_0_avalon_non_bursting_master_requests;
  wire             ADAS3022_0_avalon_read;
  wire    [ 31: 0] ADAS3022_0_avalon_readdata_from_sa;
  reg              ADAS3022_0_avalon_reg_firsttransfer;
  wire             ADAS3022_0_avalon_reset;
  reg     [  1: 0] ADAS3022_0_avalon_saved_chosen_master_vector;
  reg              ADAS3022_0_avalon_slavearbiterlockenable;
  wire             ADAS3022_0_avalon_slavearbiterlockenable2;
  wire             ADAS3022_0_avalon_unreg_firsttransfer;
  wire             ADAS3022_0_avalon_waits_for_read;
  wire             ADAS3022_0_avalon_waits_for_write;
  wire             ADAS3022_0_avalon_write;
  wire    [ 31: 0] ADAS3022_0_avalon_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ADAS3022_0_avalon;
  wire             cpu_data_master_qualified_request_ADAS3022_0_avalon;
  wire             cpu_data_master_read_data_valid_ADAS3022_0_avalon;
  wire             cpu_data_master_requests_ADAS3022_0_avalon;
  wire             cpu_data_master_saved_grant_ADAS3022_0_avalon;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_ADAS3022_0_avalon;
  wire             cpu_instruction_master_qualified_request_ADAS3022_0_avalon;
  wire             cpu_instruction_master_read_data_valid_ADAS3022_0_avalon;
  wire             cpu_instruction_master_requests_ADAS3022_0_avalon;
  wire             cpu_instruction_master_saved_grant_ADAS3022_0_avalon;
  reg              d1_ADAS3022_0_avalon_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ADAS3022_0_avalon;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_ADAS3022_0_avalon;
  reg              last_cycle_cpu_instruction_master_granted_slave_ADAS3022_0_avalon;
  wire    [ 22: 0] shifted_address_to_ADAS3022_0_avalon_from_cpu_data_master;
  wire    [ 22: 0] shifted_address_to_ADAS3022_0_avalon_from_cpu_instruction_master;
  wire             wait_for_ADAS3022_0_avalon_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ADAS3022_0_avalon_end_xfer;
    end


  assign ADAS3022_0_avalon_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ADAS3022_0_avalon | cpu_instruction_master_qualified_request_ADAS3022_0_avalon));
  //assign ADAS3022_0_avalon_readdata_from_sa = ADAS3022_0_avalon_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ADAS3022_0_avalon_readdata_from_sa = ADAS3022_0_avalon_readdata;

  assign cpu_data_master_requests_ADAS3022_0_avalon = ({cpu_data_master_address_to_slave[22 : 5] , 5'b0} == 23'hc0) & (cpu_data_master_read | cpu_data_master_write);
  //ADAS3022_0_avalon_arb_share_counter set values, which is an e_mux
  assign ADAS3022_0_avalon_arb_share_set_values = 1;

  //ADAS3022_0_avalon_non_bursting_master_requests mux, which is an e_mux
  assign ADAS3022_0_avalon_non_bursting_master_requests = cpu_data_master_requests_ADAS3022_0_avalon |
    cpu_instruction_master_requests_ADAS3022_0_avalon |
    cpu_data_master_requests_ADAS3022_0_avalon |
    cpu_instruction_master_requests_ADAS3022_0_avalon;

  //ADAS3022_0_avalon_any_bursting_master_saved_grant mux, which is an e_mux
  assign ADAS3022_0_avalon_any_bursting_master_saved_grant = 0;

  //ADAS3022_0_avalon_arb_share_counter_next_value assignment, which is an e_assign
  assign ADAS3022_0_avalon_arb_share_counter_next_value = ADAS3022_0_avalon_firsttransfer ? (ADAS3022_0_avalon_arb_share_set_values - 1) : |ADAS3022_0_avalon_arb_share_counter ? (ADAS3022_0_avalon_arb_share_counter - 1) : 0;

  //ADAS3022_0_avalon_allgrants all slave grants, which is an e_mux
  assign ADAS3022_0_avalon_allgrants = (|ADAS3022_0_avalon_grant_vector) |
    (|ADAS3022_0_avalon_grant_vector) |
    (|ADAS3022_0_avalon_grant_vector) |
    (|ADAS3022_0_avalon_grant_vector);

  //ADAS3022_0_avalon_end_xfer assignment, which is an e_assign
  assign ADAS3022_0_avalon_end_xfer = ~(ADAS3022_0_avalon_waits_for_read | ADAS3022_0_avalon_waits_for_write);

  //end_xfer_arb_share_counter_term_ADAS3022_0_avalon arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ADAS3022_0_avalon = ADAS3022_0_avalon_end_xfer & (~ADAS3022_0_avalon_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ADAS3022_0_avalon_arb_share_counter arbitration counter enable, which is an e_assign
  assign ADAS3022_0_avalon_arb_counter_enable = (end_xfer_arb_share_counter_term_ADAS3022_0_avalon & ADAS3022_0_avalon_allgrants) | (end_xfer_arb_share_counter_term_ADAS3022_0_avalon & ~ADAS3022_0_avalon_non_bursting_master_requests);

  //ADAS3022_0_avalon_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_arb_share_counter <= 0;
      else if (ADAS3022_0_avalon_arb_counter_enable)
          ADAS3022_0_avalon_arb_share_counter <= ADAS3022_0_avalon_arb_share_counter_next_value;
    end


  //ADAS3022_0_avalon_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_slavearbiterlockenable <= 0;
      else if ((|ADAS3022_0_avalon_master_qreq_vector & end_xfer_arb_share_counter_term_ADAS3022_0_avalon) | (end_xfer_arb_share_counter_term_ADAS3022_0_avalon & ~ADAS3022_0_avalon_non_bursting_master_requests))
          ADAS3022_0_avalon_slavearbiterlockenable <= |ADAS3022_0_avalon_arb_share_counter_next_value;
    end


  //cpu/data_master ADAS3022_0/avalon arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = ADAS3022_0_avalon_slavearbiterlockenable & cpu_data_master_continuerequest;

  //ADAS3022_0_avalon_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ADAS3022_0_avalon_slavearbiterlockenable2 = |ADAS3022_0_avalon_arb_share_counter_next_value;

  //cpu/data_master ADAS3022_0/avalon arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = ADAS3022_0_avalon_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master ADAS3022_0/avalon arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = ADAS3022_0_avalon_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master ADAS3022_0/avalon arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = ADAS3022_0_avalon_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted ADAS3022_0/avalon last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_ADAS3022_0_avalon <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_ADAS3022_0_avalon <= cpu_instruction_master_saved_grant_ADAS3022_0_avalon ? 1 : (ADAS3022_0_avalon_arbitration_holdoff_internal | ~cpu_instruction_master_requests_ADAS3022_0_avalon) ? 0 : last_cycle_cpu_instruction_master_granted_slave_ADAS3022_0_avalon;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_ADAS3022_0_avalon & cpu_instruction_master_requests_ADAS3022_0_avalon;

  //ADAS3022_0_avalon_any_continuerequest at least one master continues requesting, which is an e_mux
  assign ADAS3022_0_avalon_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_ADAS3022_0_avalon = cpu_data_master_requests_ADAS3022_0_avalon & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //ADAS3022_0_avalon_writedata mux, which is an e_mux
  assign ADAS3022_0_avalon_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_ADAS3022_0_avalon = (({cpu_instruction_master_address_to_slave[22 : 5] , 5'b0} == 23'hc0) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted ADAS3022_0/avalon last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_ADAS3022_0_avalon <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_ADAS3022_0_avalon <= cpu_data_master_saved_grant_ADAS3022_0_avalon ? 1 : (ADAS3022_0_avalon_arbitration_holdoff_internal | ~cpu_data_master_requests_ADAS3022_0_avalon) ? 0 : last_cycle_cpu_data_master_granted_slave_ADAS3022_0_avalon;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_ADAS3022_0_avalon & cpu_data_master_requests_ADAS3022_0_avalon;

  assign cpu_instruction_master_qualified_request_ADAS3022_0_avalon = cpu_instruction_master_requests_ADAS3022_0_avalon & ~(cpu_data_master_arbiterlock);
  //allow new arb cycle for ADAS3022_0/avalon, which is an e_assign
  assign ADAS3022_0_avalon_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for ADAS3022_0/avalon, which is an e_assign
  assign ADAS3022_0_avalon_master_qreq_vector[0] = cpu_instruction_master_qualified_request_ADAS3022_0_avalon;

  //cpu/instruction_master grant ADAS3022_0/avalon, which is an e_assign
  assign cpu_instruction_master_granted_ADAS3022_0_avalon = ADAS3022_0_avalon_grant_vector[0];

  //cpu/instruction_master saved-grant ADAS3022_0/avalon, which is an e_assign
  assign cpu_instruction_master_saved_grant_ADAS3022_0_avalon = ADAS3022_0_avalon_arb_winner[0] && cpu_instruction_master_requests_ADAS3022_0_avalon;

  //cpu/data_master assignment into master qualified-requests vector for ADAS3022_0/avalon, which is an e_assign
  assign ADAS3022_0_avalon_master_qreq_vector[1] = cpu_data_master_qualified_request_ADAS3022_0_avalon;

  //cpu/data_master grant ADAS3022_0/avalon, which is an e_assign
  assign cpu_data_master_granted_ADAS3022_0_avalon = ADAS3022_0_avalon_grant_vector[1];

  //cpu/data_master saved-grant ADAS3022_0/avalon, which is an e_assign
  assign cpu_data_master_saved_grant_ADAS3022_0_avalon = ADAS3022_0_avalon_arb_winner[1] && cpu_data_master_requests_ADAS3022_0_avalon;

  //ADAS3022_0/avalon chosen-master double-vector, which is an e_assign
  assign ADAS3022_0_avalon_chosen_master_double_vector = {ADAS3022_0_avalon_master_qreq_vector, ADAS3022_0_avalon_master_qreq_vector} & ({~ADAS3022_0_avalon_master_qreq_vector, ~ADAS3022_0_avalon_master_qreq_vector} + ADAS3022_0_avalon_arb_addend);

  //stable onehot encoding of arb winner
  assign ADAS3022_0_avalon_arb_winner = (ADAS3022_0_avalon_allow_new_arb_cycle & | ADAS3022_0_avalon_grant_vector) ? ADAS3022_0_avalon_grant_vector : ADAS3022_0_avalon_saved_chosen_master_vector;

  //saved ADAS3022_0_avalon_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_saved_chosen_master_vector <= 0;
      else if (ADAS3022_0_avalon_allow_new_arb_cycle)
          ADAS3022_0_avalon_saved_chosen_master_vector <= |ADAS3022_0_avalon_grant_vector ? ADAS3022_0_avalon_grant_vector : ADAS3022_0_avalon_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign ADAS3022_0_avalon_grant_vector = {(ADAS3022_0_avalon_chosen_master_double_vector[1] | ADAS3022_0_avalon_chosen_master_double_vector[3]),
    (ADAS3022_0_avalon_chosen_master_double_vector[0] | ADAS3022_0_avalon_chosen_master_double_vector[2])};

  //ADAS3022_0/avalon chosen master rotated left, which is an e_assign
  assign ADAS3022_0_avalon_chosen_master_rot_left = (ADAS3022_0_avalon_arb_winner << 1) ? (ADAS3022_0_avalon_arb_winner << 1) : 1;

  //ADAS3022_0/avalon's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_arb_addend <= 1;
      else if (|ADAS3022_0_avalon_grant_vector)
          ADAS3022_0_avalon_arb_addend <= ADAS3022_0_avalon_end_xfer? ADAS3022_0_avalon_chosen_master_rot_left : ADAS3022_0_avalon_grant_vector;
    end


  //~ADAS3022_0_avalon_reset assignment, which is an e_assign
  assign ADAS3022_0_avalon_reset = ~reset_n;

  //ADAS3022_0_avalon_firsttransfer first transaction, which is an e_assign
  assign ADAS3022_0_avalon_firsttransfer = ADAS3022_0_avalon_begins_xfer ? ADAS3022_0_avalon_unreg_firsttransfer : ADAS3022_0_avalon_reg_firsttransfer;

  //ADAS3022_0_avalon_unreg_firsttransfer first transaction, which is an e_assign
  assign ADAS3022_0_avalon_unreg_firsttransfer = ~(ADAS3022_0_avalon_slavearbiterlockenable & ADAS3022_0_avalon_any_continuerequest);

  //ADAS3022_0_avalon_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_reg_firsttransfer <= 1'b1;
      else if (ADAS3022_0_avalon_begins_xfer)
          ADAS3022_0_avalon_reg_firsttransfer <= ADAS3022_0_avalon_unreg_firsttransfer;
    end


  //ADAS3022_0_avalon_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ADAS3022_0_avalon_beginbursttransfer_internal = ADAS3022_0_avalon_begins_xfer;

  //ADAS3022_0_avalon_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign ADAS3022_0_avalon_arbitration_holdoff_internal = ADAS3022_0_avalon_begins_xfer & ADAS3022_0_avalon_firsttransfer;

  //ADAS3022_0_avalon_read assignment, which is an e_mux
  assign ADAS3022_0_avalon_read = (cpu_data_master_granted_ADAS3022_0_avalon & cpu_data_master_read) | (cpu_instruction_master_granted_ADAS3022_0_avalon & cpu_instruction_master_read);

  //ADAS3022_0_avalon_write assignment, which is an e_mux
  assign ADAS3022_0_avalon_write = cpu_data_master_granted_ADAS3022_0_avalon & cpu_data_master_write;

  assign shifted_address_to_ADAS3022_0_avalon_from_cpu_data_master = cpu_data_master_address_to_slave;
  //ADAS3022_0_avalon_address mux, which is an e_mux
  assign ADAS3022_0_avalon_address = (cpu_data_master_granted_ADAS3022_0_avalon)? (shifted_address_to_ADAS3022_0_avalon_from_cpu_data_master >> 2) :
    (shifted_address_to_ADAS3022_0_avalon_from_cpu_instruction_master >> 2);

  assign shifted_address_to_ADAS3022_0_avalon_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_ADAS3022_0_avalon_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ADAS3022_0_avalon_end_xfer <= 1;
      else 
        d1_ADAS3022_0_avalon_end_xfer <= ADAS3022_0_avalon_end_xfer;
    end


  //ADAS3022_0_avalon_waits_for_read in a cycle, which is an e_mux
  assign ADAS3022_0_avalon_waits_for_read = ADAS3022_0_avalon_in_a_read_cycle & ADAS3022_0_avalon_begins_xfer;

  //ADAS3022_0_avalon_in_a_read_cycle assignment, which is an e_assign
  assign ADAS3022_0_avalon_in_a_read_cycle = (cpu_data_master_granted_ADAS3022_0_avalon & cpu_data_master_read) | (cpu_instruction_master_granted_ADAS3022_0_avalon & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ADAS3022_0_avalon_in_a_read_cycle;

  //ADAS3022_0_avalon_waits_for_write in a cycle, which is an e_mux
  assign ADAS3022_0_avalon_waits_for_write = ADAS3022_0_avalon_in_a_write_cycle & 0;

  //ADAS3022_0_avalon_in_a_write_cycle assignment, which is an e_assign
  assign ADAS3022_0_avalon_in_a_write_cycle = cpu_data_master_granted_ADAS3022_0_avalon & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ADAS3022_0_avalon_in_a_write_cycle;

  assign wait_for_ADAS3022_0_avalon_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ADAS3022_0/avalon enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_ADAS3022_0_avalon + cpu_instruction_master_granted_ADAS3022_0_avalon > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_ADAS3022_0_avalon + cpu_instruction_master_saved_grant_ADAS3022_0_avalon > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ADAS3022_0_avalon_master_arbitrator (
                                             // inputs:
                                              ADAS3022_0_avalon_master_address,
                                              ADAS3022_0_avalon_master_byteenable,
                                              ADAS3022_0_avalon_master_granted_sram_s1,
                                              ADAS3022_0_avalon_master_qualified_request_sram_s1,
                                              ADAS3022_0_avalon_master_requests_sram_s1,
                                              ADAS3022_0_avalon_master_write,
                                              ADAS3022_0_avalon_master_writedata,
                                              clk,
                                              d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                              reset_n,

                                             // outputs:
                                              ADAS3022_0_avalon_master_address_to_slave,
                                              ADAS3022_0_avalon_master_waitrequest
                                           )
;

  output  [ 31: 0] ADAS3022_0_avalon_master_address_to_slave;
  output           ADAS3022_0_avalon_master_waitrequest;
  input   [ 31: 0] ADAS3022_0_avalon_master_address;
  input   [  1: 0] ADAS3022_0_avalon_master_byteenable;
  input            ADAS3022_0_avalon_master_granted_sram_s1;
  input            ADAS3022_0_avalon_master_qualified_request_sram_s1;
  input            ADAS3022_0_avalon_master_requests_sram_s1;
  input            ADAS3022_0_avalon_master_write;
  input   [ 15: 0] ADAS3022_0_avalon_master_writedata;
  input            clk;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input            reset_n;

  reg     [ 31: 0] ADAS3022_0_avalon_master_address_last_time;
  wire    [ 31: 0] ADAS3022_0_avalon_master_address_to_slave;
  reg     [  1: 0] ADAS3022_0_avalon_master_byteenable_last_time;
  wire             ADAS3022_0_avalon_master_run;
  wire             ADAS3022_0_avalon_master_waitrequest;
  reg              ADAS3022_0_avalon_master_write_last_time;
  reg     [ 15: 0] ADAS3022_0_avalon_master_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (ADAS3022_0_avalon_master_qualified_request_sram_s1 | ~ADAS3022_0_avalon_master_requests_sram_s1) & (ADAS3022_0_avalon_master_granted_sram_s1 | ~ADAS3022_0_avalon_master_qualified_request_sram_s1) & ((~ADAS3022_0_avalon_master_qualified_request_sram_s1 | ~(ADAS3022_0_avalon_master_write) | (1 & (ADAS3022_0_avalon_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign ADAS3022_0_avalon_master_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign ADAS3022_0_avalon_master_address_to_slave = {10'b1,
    ADAS3022_0_avalon_master_address[21 : 0]};

  //actual waitrequest port, which is an e_assign
  assign ADAS3022_0_avalon_master_waitrequest = ~ADAS3022_0_avalon_master_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ADAS3022_0_avalon_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_master_address_last_time <= 0;
      else 
        ADAS3022_0_avalon_master_address_last_time <= ADAS3022_0_avalon_master_address;
    end


  //ADAS3022_0/avalon_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= ADAS3022_0_avalon_master_waitrequest & (ADAS3022_0_avalon_master_write);
    end


  //ADAS3022_0_avalon_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (ADAS3022_0_avalon_master_address != ADAS3022_0_avalon_master_address_last_time))
        begin
          $write("%0d ns: ADAS3022_0_avalon_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //ADAS3022_0_avalon_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_master_byteenable_last_time <= 0;
      else 
        ADAS3022_0_avalon_master_byteenable_last_time <= ADAS3022_0_avalon_master_byteenable;
    end


  //ADAS3022_0_avalon_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (ADAS3022_0_avalon_master_byteenable != ADAS3022_0_avalon_master_byteenable_last_time))
        begin
          $write("%0d ns: ADAS3022_0_avalon_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //ADAS3022_0_avalon_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_master_write_last_time <= 0;
      else 
        ADAS3022_0_avalon_master_write_last_time <= ADAS3022_0_avalon_master_write;
    end


  //ADAS3022_0_avalon_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (ADAS3022_0_avalon_master_write != ADAS3022_0_avalon_master_write_last_time))
        begin
          $write("%0d ns: ADAS3022_0_avalon_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //ADAS3022_0_avalon_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ADAS3022_0_avalon_master_writedata_last_time <= 0;
      else 
        ADAS3022_0_avalon_master_writedata_last_time <= ADAS3022_0_avalon_master_writedata;
    end


  //ADAS3022_0_avalon_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (ADAS3022_0_avalon_master_writedata != ADAS3022_0_avalon_master_writedata_last_time) & ADAS3022_0_avalon_master_write)
        begin
          $write("%0d ns: ADAS3022_0_avalon_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 22: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 22: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 22: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[22 : 11] , 11'b0} == 23'h800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[22 : 11] , 11'b0} == 23'h800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~(cpu_data_master_arbiterlock);
  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     ADAS3022_0_avalon_readdata_from_sa,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable_sram_s1,
                                     cpu_data_master_granted_ADAS3022_0_avalon,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_i2c_int_s1,
                                     cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                     cpu_data_master_granted_leds_s1,
                                     cpu_data_master_granted_onchip_mem_s1,
                                     cpu_data_master_granted_pwr_data_s1,
                                     cpu_data_master_granted_pwr_en_clk_s1,
                                     cpu_data_master_granted_sram_s1,
                                     cpu_data_master_granted_sys_timer_s1,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_granted_uC_clock_0_in,
                                     cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_ADAS3022_0_avalon,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_i2c_int_s1,
                                     cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_leds_s1,
                                     cpu_data_master_qualified_request_onchip_mem_s1,
                                     cpu_data_master_qualified_request_pwr_data_s1,
                                     cpu_data_master_qualified_request_pwr_en_clk_s1,
                                     cpu_data_master_qualified_request_sram_s1,
                                     cpu_data_master_qualified_request_sys_timer_s1,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_qualified_request_uC_clock_0_in,
                                     cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_ADAS3022_0_avalon,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_i2c_int_s1,
                                     cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_leds_s1,
                                     cpu_data_master_read_data_valid_onchip_mem_s1,
                                     cpu_data_master_read_data_valid_pwr_data_s1,
                                     cpu_data_master_read_data_valid_pwr_en_clk_s1,
                                     cpu_data_master_read_data_valid_sram_s1,
                                     cpu_data_master_read_data_valid_sys_timer_s1,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_read_data_valid_uC_clock_0_in,
                                     cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_ADAS3022_0_avalon,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_i2c_int_s1,
                                     cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                     cpu_data_master_requests_leds_s1,
                                     cpu_data_master_requests_onchip_mem_s1,
                                     cpu_data_master_requests_pwr_data_s1,
                                     cpu_data_master_requests_pwr_en_clk_s1,
                                     cpu_data_master_requests_sram_s1,
                                     cpu_data_master_requests_sys_timer_s1,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_requests_uC_clock_0_in,
                                     cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_ADAS3022_0_avalon_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_i2c_int_s1_end_xfer,
                                     d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                     d1_leds_s1_end_xfer,
                                     d1_onchip_mem_s1_end_xfer,
                                     d1_pwr_data_s1_end_xfer,
                                     d1_pwr_en_clk_s1_end_xfer,
                                     d1_sys_timer_s1_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                     d1_uC_clock_0_in_end_xfer,
                                     d1_ucprobe_uart_avalon_jtag_slave_end_xfer,
                                     i2c_int_s1_readdata_from_sa,
                                     incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
                                     jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                     leds_s1_readdata_from_sa,
                                     onchip_mem_s1_readdata_from_sa,
                                     pwr_data_s1_readdata_from_sa,
                                     pwr_en_clk_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_onchip_mem_s1,
                                     registered_cpu_data_master_read_data_valid_sram_s1,
                                     reset_n,
                                     sys_timer_s1_irq_from_sa,
                                     sys_timer_s1_readdata_from_sa,
                                     sysid_control_slave_readdata_from_sa,
                                     uC_clock_0_in_readdata_from_sa,
                                     uC_clock_0_in_waitrequest_from_sa,
                                     ucprobe_uart_avalon_jtag_slave_irq_from_sa,
                                     ucprobe_uart_avalon_jtag_slave_readdata_from_sa,
                                     ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_irq,
                                     cpu_data_master_no_byte_enables_and_last_term,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 22: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input   [ 31: 0] ADAS3022_0_avalon_readdata_from_sa;
  input            clk;
  input   [ 22: 0] cpu_data_master_address;
  input   [  1: 0] cpu_data_master_byteenable_sram_s1;
  input            cpu_data_master_granted_ADAS3022_0_avalon;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_i2c_int_s1;
  input            cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_data_master_granted_leds_s1;
  input            cpu_data_master_granted_onchip_mem_s1;
  input            cpu_data_master_granted_pwr_data_s1;
  input            cpu_data_master_granted_pwr_en_clk_s1;
  input            cpu_data_master_granted_sram_s1;
  input            cpu_data_master_granted_sys_timer_s1;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_granted_uC_clock_0_in;
  input            cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_ADAS3022_0_avalon;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_i2c_int_s1;
  input            cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_leds_s1;
  input            cpu_data_master_qualified_request_onchip_mem_s1;
  input            cpu_data_master_qualified_request_pwr_data_s1;
  input            cpu_data_master_qualified_request_pwr_en_clk_s1;
  input            cpu_data_master_qualified_request_sram_s1;
  input            cpu_data_master_qualified_request_sys_timer_s1;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_qualified_request_uC_clock_0_in;
  input            cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_ADAS3022_0_avalon;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_i2c_int_s1;
  input            cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_leds_s1;
  input            cpu_data_master_read_data_valid_onchip_mem_s1;
  input            cpu_data_master_read_data_valid_pwr_data_s1;
  input            cpu_data_master_read_data_valid_pwr_en_clk_s1;
  input            cpu_data_master_read_data_valid_sram_s1;
  input            cpu_data_master_read_data_valid_sys_timer_s1;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_read_data_valid_uC_clock_0_in;
  input            cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_ADAS3022_0_avalon;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_i2c_int_s1;
  input            cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_data_master_requests_leds_s1;
  input            cpu_data_master_requests_onchip_mem_s1;
  input            cpu_data_master_requests_pwr_data_s1;
  input            cpu_data_master_requests_pwr_en_clk_s1;
  input            cpu_data_master_requests_sram_s1;
  input            cpu_data_master_requests_sys_timer_s1;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_requests_uC_clock_0_in;
  input            cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_ADAS3022_0_avalon_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_i2c_int_s1_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_leds_s1_end_xfer;
  input            d1_onchip_mem_s1_end_xfer;
  input            d1_pwr_data_s1_end_xfer;
  input            d1_pwr_en_clk_s1_end_xfer;
  input            d1_sys_timer_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input            d1_uC_clock_0_in_end_xfer;
  input            d1_ucprobe_uart_avalon_jtag_slave_end_xfer;
  input   [ 31: 0] i2c_int_s1_readdata_from_sa;
  input   [ 15: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 31: 0] leds_s1_readdata_from_sa;
  input   [ 31: 0] onchip_mem_s1_readdata_from_sa;
  input   [ 31: 0] pwr_data_s1_readdata_from_sa;
  input   [ 31: 0] pwr_en_clk_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  input            registered_cpu_data_master_read_data_valid_sram_s1;
  input            reset_n;
  input            sys_timer_s1_irq_from_sa;
  input   [ 15: 0] sys_timer_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input   [ 31: 0] uC_clock_0_in_readdata_from_sa;
  input            uC_clock_0_in_waitrequest_from_sa;
  input            ucprobe_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] ucprobe_uart_avalon_jtag_slave_readdata_from_sa;
  input            ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa;

  wire    [ 22: 0] cpu_data_master_address_to_slave;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [ 31: 0] cpu_data_master_irq;
  reg              cpu_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 31: 0] p1_registered_cpu_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_ADAS3022_0_avalon | ~cpu_data_master_requests_ADAS3022_0_avalon) & (cpu_data_master_granted_ADAS3022_0_avalon | ~cpu_data_master_qualified_request_ADAS3022_0_avalon) & ((~cpu_data_master_qualified_request_ADAS3022_0_avalon | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_ADAS3022_0_avalon | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_i2c_int_s1 | ~cpu_data_master_requests_i2c_int_s1) & ((~cpu_data_master_qualified_request_i2c_int_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_i2c_int_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_leds_s1 | ~cpu_data_master_requests_leds_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_leds_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_leds_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_onchip_mem_s1 | registered_cpu_data_master_read_data_valid_onchip_mem_s1 | ~cpu_data_master_requests_onchip_mem_s1) & (cpu_data_master_granted_onchip_mem_s1 | ~cpu_data_master_qualified_request_onchip_mem_s1) & ((~cpu_data_master_qualified_request_onchip_mem_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_mem_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_mem_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_pwr_data_s1 | ~cpu_data_master_requests_pwr_data_s1) & ((~cpu_data_master_qualified_request_pwr_data_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_pwr_data_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_pwr_en_clk_s1 | ~cpu_data_master_requests_pwr_en_clk_s1) & ((~cpu_data_master_qualified_request_pwr_en_clk_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_pwr_en_clk_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sys_timer_s1 | ~cpu_data_master_requests_sys_timer_s1) & ((~cpu_data_master_qualified_request_sys_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sys_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sram_s1 | (registered_cpu_data_master_read_data_valid_sram_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_sram_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sram_s1) & (cpu_data_master_granted_sram_s1 | ~cpu_data_master_qualified_request_sram_s1) & ((~cpu_data_master_qualified_request_sram_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_sram_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sram_s1 | ~cpu_data_master_write | (1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_uC_clock_0_in | ~cpu_data_master_requests_uC_clock_0_in) & ((~cpu_data_master_qualified_request_uC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~uC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_uC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~uC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave | ~cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[22 : 0];

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_ADAS3022_0_avalon}} | ADAS3022_0_avalon_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_i2c_int_s1}} | i2c_int_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_leds_s1}} | leds_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_onchip_mem_s1}} | onchip_mem_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_pwr_data_s1}} | pwr_data_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_pwr_en_clk_s1}} | pwr_en_clk_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sys_timer_s1}} | sys_timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sram_s1}} | {incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_requests_uC_clock_0_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave}} | registered_cpu_data_master_readdata);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else 
        registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = ({32 {~cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_uC_clock_0_in}} | uC_clock_0_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave}} | ucprobe_uart_avalon_jtag_slave_readdata_from_sa);

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    sys_timer_s1_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa,
    ucprobe_uart_avalon_jtag_slave_irq_from_sa};

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_no_byte_enables_and_last_term <= 0;
      else 
        cpu_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_sram_s1;

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_sram_s1 & cpu_data_master_write & !cpu_data_master_byteenable_sram_s1)) |
    cpu_data_master_read_data_valid_sram_s1 |
    (cpu_data_master_granted_sram_s1 & cpu_data_master_write & 1 & 1);

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_sram_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_data_master_requests_sram_s1 & ~cpu_data_master_waitrequest & cpu_data_master_write));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            ADAS3022_0_avalon_readdata_from_sa,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_ADAS3022_0_avalon,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_onchip_mem_s1,
                                            cpu_instruction_master_granted_sram_s1,
                                            cpu_instruction_master_qualified_request_ADAS3022_0_avalon,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_onchip_mem_s1,
                                            cpu_instruction_master_qualified_request_sram_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_ADAS3022_0_avalon,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_onchip_mem_s1,
                                            cpu_instruction_master_read_data_valid_sram_s1,
                                            cpu_instruction_master_requests_ADAS3022_0_avalon,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_onchip_mem_s1,
                                            cpu_instruction_master_requests_sram_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_ADAS3022_0_avalon_end_xfer,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_onchip_mem_s1_end_xfer,
                                            d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                            incoming_tri_state_bridge_0_data,
                                            onchip_mem_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 22: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_waitrequest;
  input   [ 31: 0] ADAS3022_0_avalon_readdata_from_sa;
  input            clk;
  input   [ 22: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_ADAS3022_0_avalon;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_onchip_mem_s1;
  input            cpu_instruction_master_granted_sram_s1;
  input            cpu_instruction_master_qualified_request_ADAS3022_0_avalon;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_onchip_mem_s1;
  input            cpu_instruction_master_qualified_request_sram_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_ADAS3022_0_avalon;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_onchip_mem_s1;
  input            cpu_instruction_master_read_data_valid_sram_s1;
  input            cpu_instruction_master_requests_ADAS3022_0_avalon;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_onchip_mem_s1;
  input            cpu_instruction_master_requests_sram_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_ADAS3022_0_avalon_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_mem_s1_end_xfer;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_tri_state_bridge_0_data;
  input   [ 31: 0] onchip_mem_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] cpu_instruction_master_address_last_time;
  wire    [ 22: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_ADAS3022_0_avalon | ~cpu_instruction_master_requests_ADAS3022_0_avalon) & (cpu_instruction_master_granted_ADAS3022_0_avalon | ~cpu_instruction_master_qualified_request_ADAS3022_0_avalon) & ((~cpu_instruction_master_qualified_request_ADAS3022_0_avalon | ~cpu_instruction_master_read | (1 & ~d1_ADAS3022_0_avalon_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_instruction_master_qualified_request_onchip_mem_s1 | cpu_instruction_master_read_data_valid_onchip_mem_s1 | ~cpu_instruction_master_requests_onchip_mem_s1) & (cpu_instruction_master_granted_onchip_mem_s1 | ~cpu_instruction_master_qualified_request_onchip_mem_s1) & ((~cpu_instruction_master_qualified_request_onchip_mem_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_onchip_mem_s1 & cpu_instruction_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_sram_s1 | (cpu_instruction_master_read_data_valid_sram_s1 & cpu_instruction_master_dbs_address[1]) | ~cpu_instruction_master_requests_sram_s1) & (cpu_instruction_master_granted_sram_s1 | ~cpu_instruction_master_qualified_request_sram_s1) & ((~cpu_instruction_master_qualified_request_sram_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_sram_s1 & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[22 : 0];

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~cpu_instruction_master_requests_ADAS3022_0_avalon}} | ADAS3022_0_avalon_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_onchip_mem_s1}} | onchip_mem_s1_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_sram_s1}} | {incoming_tri_state_bridge_0_data[15 : 0],
    dbs_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = incoming_tri_state_bridge_0_data;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_sram_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_instruction_master_read_data_valid_sram_s1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module i2c_int_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_data_master_address_to_slave,
                                cpu_data_master_read,
                                cpu_data_master_waitrequest,
                                cpu_data_master_write,
                                cpu_data_master_writedata,
                                i2c_int_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_data_master_granted_i2c_int_s1,
                                cpu_data_master_qualified_request_i2c_int_s1,
                                cpu_data_master_read_data_valid_i2c_int_s1,
                                cpu_data_master_requests_i2c_int_s1,
                                d1_i2c_int_s1_end_xfer,
                                i2c_int_s1_address,
                                i2c_int_s1_chipselect,
                                i2c_int_s1_readdata_from_sa,
                                i2c_int_s1_reset_n,
                                i2c_int_s1_write_n,
                                i2c_int_s1_writedata
                             )
;

  output           cpu_data_master_granted_i2c_int_s1;
  output           cpu_data_master_qualified_request_i2c_int_s1;
  output           cpu_data_master_read_data_valid_i2c_int_s1;
  output           cpu_data_master_requests_i2c_int_s1;
  output           d1_i2c_int_s1_end_xfer;
  output  [  1: 0] i2c_int_s1_address;
  output           i2c_int_s1_chipselect;
  output  [ 31: 0] i2c_int_s1_readdata_from_sa;
  output           i2c_int_s1_reset_n;
  output           i2c_int_s1_write_n;
  output  [ 31: 0] i2c_int_s1_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] i2c_int_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_i2c_int_s1;
  wire             cpu_data_master_qualified_request_i2c_int_s1;
  wire             cpu_data_master_read_data_valid_i2c_int_s1;
  wire             cpu_data_master_requests_i2c_int_s1;
  wire             cpu_data_master_saved_grant_i2c_int_s1;
  reg              d1_i2c_int_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_i2c_int_s1;
  wire    [  1: 0] i2c_int_s1_address;
  wire             i2c_int_s1_allgrants;
  wire             i2c_int_s1_allow_new_arb_cycle;
  wire             i2c_int_s1_any_bursting_master_saved_grant;
  wire             i2c_int_s1_any_continuerequest;
  wire             i2c_int_s1_arb_counter_enable;
  reg     [  1: 0] i2c_int_s1_arb_share_counter;
  wire    [  1: 0] i2c_int_s1_arb_share_counter_next_value;
  wire    [  1: 0] i2c_int_s1_arb_share_set_values;
  wire             i2c_int_s1_beginbursttransfer_internal;
  wire             i2c_int_s1_begins_xfer;
  wire             i2c_int_s1_chipselect;
  wire             i2c_int_s1_end_xfer;
  wire             i2c_int_s1_firsttransfer;
  wire             i2c_int_s1_grant_vector;
  wire             i2c_int_s1_in_a_read_cycle;
  wire             i2c_int_s1_in_a_write_cycle;
  wire             i2c_int_s1_master_qreq_vector;
  wire             i2c_int_s1_non_bursting_master_requests;
  wire    [ 31: 0] i2c_int_s1_readdata_from_sa;
  reg              i2c_int_s1_reg_firsttransfer;
  wire             i2c_int_s1_reset_n;
  reg              i2c_int_s1_slavearbiterlockenable;
  wire             i2c_int_s1_slavearbiterlockenable2;
  wire             i2c_int_s1_unreg_firsttransfer;
  wire             i2c_int_s1_waits_for_read;
  wire             i2c_int_s1_waits_for_write;
  wire             i2c_int_s1_write_n;
  wire    [ 31: 0] i2c_int_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 22: 0] shifted_address_to_i2c_int_s1_from_cpu_data_master;
  wire             wait_for_i2c_int_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~i2c_int_s1_end_xfer;
    end


  assign i2c_int_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_i2c_int_s1));
  //assign i2c_int_s1_readdata_from_sa = i2c_int_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign i2c_int_s1_readdata_from_sa = i2c_int_s1_readdata;

  assign cpu_data_master_requests_i2c_int_s1 = ({cpu_data_master_address_to_slave[22 : 4] , 4'b0} == 23'h80) & (cpu_data_master_read | cpu_data_master_write);
  //i2c_int_s1_arb_share_counter set values, which is an e_mux
  assign i2c_int_s1_arb_share_set_values = 1;

  //i2c_int_s1_non_bursting_master_requests mux, which is an e_mux
  assign i2c_int_s1_non_bursting_master_requests = cpu_data_master_requests_i2c_int_s1;

  //i2c_int_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign i2c_int_s1_any_bursting_master_saved_grant = 0;

  //i2c_int_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign i2c_int_s1_arb_share_counter_next_value = i2c_int_s1_firsttransfer ? (i2c_int_s1_arb_share_set_values - 1) : |i2c_int_s1_arb_share_counter ? (i2c_int_s1_arb_share_counter - 1) : 0;

  //i2c_int_s1_allgrants all slave grants, which is an e_mux
  assign i2c_int_s1_allgrants = |i2c_int_s1_grant_vector;

  //i2c_int_s1_end_xfer assignment, which is an e_assign
  assign i2c_int_s1_end_xfer = ~(i2c_int_s1_waits_for_read | i2c_int_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_i2c_int_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_i2c_int_s1 = i2c_int_s1_end_xfer & (~i2c_int_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //i2c_int_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign i2c_int_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_i2c_int_s1 & i2c_int_s1_allgrants) | (end_xfer_arb_share_counter_term_i2c_int_s1 & ~i2c_int_s1_non_bursting_master_requests);

  //i2c_int_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_int_s1_arb_share_counter <= 0;
      else if (i2c_int_s1_arb_counter_enable)
          i2c_int_s1_arb_share_counter <= i2c_int_s1_arb_share_counter_next_value;
    end


  //i2c_int_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_int_s1_slavearbiterlockenable <= 0;
      else if ((|i2c_int_s1_master_qreq_vector & end_xfer_arb_share_counter_term_i2c_int_s1) | (end_xfer_arb_share_counter_term_i2c_int_s1 & ~i2c_int_s1_non_bursting_master_requests))
          i2c_int_s1_slavearbiterlockenable <= |i2c_int_s1_arb_share_counter_next_value;
    end


  //cpu/data_master i2c_int/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = i2c_int_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //i2c_int_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign i2c_int_s1_slavearbiterlockenable2 = |i2c_int_s1_arb_share_counter_next_value;

  //cpu/data_master i2c_int/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = i2c_int_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //i2c_int_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign i2c_int_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_i2c_int_s1 = cpu_data_master_requests_i2c_int_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //i2c_int_s1_writedata mux, which is an e_mux
  assign i2c_int_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_i2c_int_s1 = cpu_data_master_qualified_request_i2c_int_s1;

  //cpu/data_master saved-grant i2c_int/s1, which is an e_assign
  assign cpu_data_master_saved_grant_i2c_int_s1 = cpu_data_master_requests_i2c_int_s1;

  //allow new arb cycle for i2c_int/s1, which is an e_assign
  assign i2c_int_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign i2c_int_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign i2c_int_s1_master_qreq_vector = 1;

  //i2c_int_s1_reset_n assignment, which is an e_assign
  assign i2c_int_s1_reset_n = reset_n;

  assign i2c_int_s1_chipselect = cpu_data_master_granted_i2c_int_s1;
  //i2c_int_s1_firsttransfer first transaction, which is an e_assign
  assign i2c_int_s1_firsttransfer = i2c_int_s1_begins_xfer ? i2c_int_s1_unreg_firsttransfer : i2c_int_s1_reg_firsttransfer;

  //i2c_int_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign i2c_int_s1_unreg_firsttransfer = ~(i2c_int_s1_slavearbiterlockenable & i2c_int_s1_any_continuerequest);

  //i2c_int_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_int_s1_reg_firsttransfer <= 1'b1;
      else if (i2c_int_s1_begins_xfer)
          i2c_int_s1_reg_firsttransfer <= i2c_int_s1_unreg_firsttransfer;
    end


  //i2c_int_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign i2c_int_s1_beginbursttransfer_internal = i2c_int_s1_begins_xfer;

  //~i2c_int_s1_write_n assignment, which is an e_mux
  assign i2c_int_s1_write_n = ~(cpu_data_master_granted_i2c_int_s1 & cpu_data_master_write);

  assign shifted_address_to_i2c_int_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //i2c_int_s1_address mux, which is an e_mux
  assign i2c_int_s1_address = shifted_address_to_i2c_int_s1_from_cpu_data_master >> 2;

  //d1_i2c_int_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_i2c_int_s1_end_xfer <= 1;
      else 
        d1_i2c_int_s1_end_xfer <= i2c_int_s1_end_xfer;
    end


  //i2c_int_s1_waits_for_read in a cycle, which is an e_mux
  assign i2c_int_s1_waits_for_read = i2c_int_s1_in_a_read_cycle & i2c_int_s1_begins_xfer;

  //i2c_int_s1_in_a_read_cycle assignment, which is an e_assign
  assign i2c_int_s1_in_a_read_cycle = cpu_data_master_granted_i2c_int_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = i2c_int_s1_in_a_read_cycle;

  //i2c_int_s1_waits_for_write in a cycle, which is an e_mux
  assign i2c_int_s1_waits_for_write = i2c_int_s1_in_a_write_cycle & 0;

  //i2c_int_s1_in_a_write_cycle assignment, which is an e_assign
  assign i2c_int_s1_in_a_write_cycle = cpu_data_master_granted_i2c_int_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = i2c_int_s1_in_a_write_cycle;

  assign wait_for_i2c_int_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //i2c_int/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_data_master_address_to_slave,
                                                   cpu_data_master_read,
                                                   cpu_data_master_waitrequest,
                                                   cpu_data_master_write,
                                                   cpu_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 22: 0] shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_data_master_address_to_slave[22 : 3] , 3'b0} == 23'h30) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module leds_s1_arbitrator (
                            // inputs:
                             clk,
                             cpu_data_master_address_to_slave,
                             cpu_data_master_read,
                             cpu_data_master_waitrequest,
                             cpu_data_master_write,
                             cpu_data_master_writedata,
                             leds_s1_readdata,
                             reset_n,

                            // outputs:
                             cpu_data_master_granted_leds_s1,
                             cpu_data_master_qualified_request_leds_s1,
                             cpu_data_master_read_data_valid_leds_s1,
                             cpu_data_master_requests_leds_s1,
                             d1_leds_s1_end_xfer,
                             leds_s1_address,
                             leds_s1_chipselect,
                             leds_s1_readdata_from_sa,
                             leds_s1_reset_n,
                             leds_s1_write_n,
                             leds_s1_writedata
                          )
;

  output           cpu_data_master_granted_leds_s1;
  output           cpu_data_master_qualified_request_leds_s1;
  output           cpu_data_master_read_data_valid_leds_s1;
  output           cpu_data_master_requests_leds_s1;
  output           d1_leds_s1_end_xfer;
  output  [  1: 0] leds_s1_address;
  output           leds_s1_chipselect;
  output  [ 31: 0] leds_s1_readdata_from_sa;
  output           leds_s1_reset_n;
  output           leds_s1_write_n;
  output  [ 31: 0] leds_s1_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] leds_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_leds_s1;
  wire             cpu_data_master_qualified_request_leds_s1;
  wire             cpu_data_master_read_data_valid_leds_s1;
  wire             cpu_data_master_requests_leds_s1;
  wire             cpu_data_master_saved_grant_leds_s1;
  reg              d1_leds_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_leds_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_allgrants;
  wire             leds_s1_allow_new_arb_cycle;
  wire             leds_s1_any_bursting_master_saved_grant;
  wire             leds_s1_any_continuerequest;
  wire             leds_s1_arb_counter_enable;
  reg     [  1: 0] leds_s1_arb_share_counter;
  wire    [  1: 0] leds_s1_arb_share_counter_next_value;
  wire    [  1: 0] leds_s1_arb_share_set_values;
  wire             leds_s1_beginbursttransfer_internal;
  wire             leds_s1_begins_xfer;
  wire             leds_s1_chipselect;
  wire             leds_s1_end_xfer;
  wire             leds_s1_firsttransfer;
  wire             leds_s1_grant_vector;
  wire             leds_s1_in_a_read_cycle;
  wire             leds_s1_in_a_write_cycle;
  wire             leds_s1_master_qreq_vector;
  wire             leds_s1_non_bursting_master_requests;
  wire    [ 31: 0] leds_s1_readdata_from_sa;
  reg              leds_s1_reg_firsttransfer;
  wire             leds_s1_reset_n;
  reg              leds_s1_slavearbiterlockenable;
  wire             leds_s1_slavearbiterlockenable2;
  wire             leds_s1_unreg_firsttransfer;
  wire             leds_s1_waits_for_read;
  wire             leds_s1_waits_for_write;
  wire             leds_s1_write_n;
  wire    [ 31: 0] leds_s1_writedata;
  wire    [ 22: 0] shifted_address_to_leds_s1_from_cpu_data_master;
  wire             wait_for_leds_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~leds_s1_end_xfer;
    end


  assign leds_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_leds_s1));
  //assign leds_s1_readdata_from_sa = leds_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign leds_s1_readdata_from_sa = leds_s1_readdata;

  assign cpu_data_master_requests_leds_s1 = ({cpu_data_master_address_to_slave[22 : 4] , 4'b0} == 23'h10) & (cpu_data_master_read | cpu_data_master_write);
  //leds_s1_arb_share_counter set values, which is an e_mux
  assign leds_s1_arb_share_set_values = 1;

  //leds_s1_non_bursting_master_requests mux, which is an e_mux
  assign leds_s1_non_bursting_master_requests = cpu_data_master_requests_leds_s1;

  //leds_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign leds_s1_any_bursting_master_saved_grant = 0;

  //leds_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign leds_s1_arb_share_counter_next_value = leds_s1_firsttransfer ? (leds_s1_arb_share_set_values - 1) : |leds_s1_arb_share_counter ? (leds_s1_arb_share_counter - 1) : 0;

  //leds_s1_allgrants all slave grants, which is an e_mux
  assign leds_s1_allgrants = |leds_s1_grant_vector;

  //leds_s1_end_xfer assignment, which is an e_assign
  assign leds_s1_end_xfer = ~(leds_s1_waits_for_read | leds_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_leds_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_leds_s1 = leds_s1_end_xfer & (~leds_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //leds_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign leds_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_leds_s1 & leds_s1_allgrants) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests);

  //leds_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_arb_share_counter <= 0;
      else if (leds_s1_arb_counter_enable)
          leds_s1_arb_share_counter <= leds_s1_arb_share_counter_next_value;
    end


  //leds_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_slavearbiterlockenable <= 0;
      else if ((|leds_s1_master_qreq_vector & end_xfer_arb_share_counter_term_leds_s1) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests))
          leds_s1_slavearbiterlockenable <= |leds_s1_arb_share_counter_next_value;
    end


  //cpu/data_master leds/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = leds_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //leds_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign leds_s1_slavearbiterlockenable2 = |leds_s1_arb_share_counter_next_value;

  //cpu/data_master leds/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = leds_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //leds_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign leds_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_leds_s1 = cpu_data_master_requests_leds_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //leds_s1_writedata mux, which is an e_mux
  assign leds_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_leds_s1 = cpu_data_master_qualified_request_leds_s1;

  //cpu/data_master saved-grant leds/s1, which is an e_assign
  assign cpu_data_master_saved_grant_leds_s1 = cpu_data_master_requests_leds_s1;

  //allow new arb cycle for leds/s1, which is an e_assign
  assign leds_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign leds_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign leds_s1_master_qreq_vector = 1;

  //leds_s1_reset_n assignment, which is an e_assign
  assign leds_s1_reset_n = reset_n;

  assign leds_s1_chipselect = cpu_data_master_granted_leds_s1;
  //leds_s1_firsttransfer first transaction, which is an e_assign
  assign leds_s1_firsttransfer = leds_s1_begins_xfer ? leds_s1_unreg_firsttransfer : leds_s1_reg_firsttransfer;

  //leds_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign leds_s1_unreg_firsttransfer = ~(leds_s1_slavearbiterlockenable & leds_s1_any_continuerequest);

  //leds_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_reg_firsttransfer <= 1'b1;
      else if (leds_s1_begins_xfer)
          leds_s1_reg_firsttransfer <= leds_s1_unreg_firsttransfer;
    end


  //leds_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign leds_s1_beginbursttransfer_internal = leds_s1_begins_xfer;

  //~leds_s1_write_n assignment, which is an e_mux
  assign leds_s1_write_n = ~(cpu_data_master_granted_leds_s1 & cpu_data_master_write);

  assign shifted_address_to_leds_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //leds_s1_address mux, which is an e_mux
  assign leds_s1_address = shifted_address_to_leds_s1_from_cpu_data_master >> 2;

  //d1_leds_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_leds_s1_end_xfer <= 1;
      else 
        d1_leds_s1_end_xfer <= leds_s1_end_xfer;
    end


  //leds_s1_waits_for_read in a cycle, which is an e_mux
  assign leds_s1_waits_for_read = leds_s1_in_a_read_cycle & leds_s1_begins_xfer;

  //leds_s1_in_a_read_cycle assignment, which is an e_assign
  assign leds_s1_in_a_read_cycle = cpu_data_master_granted_leds_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = leds_s1_in_a_read_cycle;

  //leds_s1_waits_for_write in a cycle, which is an e_mux
  assign leds_s1_waits_for_write = leds_s1_in_a_write_cycle & 0;

  //leds_s1_in_a_write_cycle assignment, which is an e_assign
  assign leds_s1_in_a_write_cycle = cpu_data_master_granted_leds_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = leds_s1_in_a_write_cycle;

  assign wait_for_leds_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //leds/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mm_console_master_master_arbitrator (
                                             // inputs:
                                              clk,
                                              d1_onchip_mem_s1_end_xfer,
                                              d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                              incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
                                              mm_console_master_byteenable_sram_s1,
                                              mm_console_master_granted_onchip_mem_s1,
                                              mm_console_master_granted_sram_s1,
                                              mm_console_master_master_address,
                                              mm_console_master_master_byteenable,
                                              mm_console_master_master_read,
                                              mm_console_master_master_write,
                                              mm_console_master_master_writedata,
                                              mm_console_master_qualified_request_onchip_mem_s1,
                                              mm_console_master_qualified_request_sram_s1,
                                              mm_console_master_read_data_valid_onchip_mem_s1,
                                              mm_console_master_read_data_valid_sram_s1,
                                              mm_console_master_requests_onchip_mem_s1,
                                              mm_console_master_requests_sram_s1,
                                              onchip_mem_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              mm_console_master_dbs_address,
                                              mm_console_master_dbs_write_16,
                                              mm_console_master_latency_counter,
                                              mm_console_master_master_address_to_slave,
                                              mm_console_master_master_readdata,
                                              mm_console_master_master_readdatavalid,
                                              mm_console_master_master_reset,
                                              mm_console_master_master_waitrequest
                                           )
;

  output  [  1: 0] mm_console_master_dbs_address;
  output  [ 15: 0] mm_console_master_dbs_write_16;
  output  [  1: 0] mm_console_master_latency_counter;
  output  [ 31: 0] mm_console_master_master_address_to_slave;
  output  [ 31: 0] mm_console_master_master_readdata;
  output           mm_console_master_master_readdatavalid;
  output           mm_console_master_master_reset;
  output           mm_console_master_master_waitrequest;
  input            clk;
  input            d1_onchip_mem_s1_end_xfer;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  input   [  1: 0] mm_console_master_byteenable_sram_s1;
  input            mm_console_master_granted_onchip_mem_s1;
  input            mm_console_master_granted_sram_s1;
  input   [ 31: 0] mm_console_master_master_address;
  input   [  3: 0] mm_console_master_master_byteenable;
  input            mm_console_master_master_read;
  input            mm_console_master_master_write;
  input   [ 31: 0] mm_console_master_master_writedata;
  input            mm_console_master_qualified_request_onchip_mem_s1;
  input            mm_console_master_qualified_request_sram_s1;
  input            mm_console_master_read_data_valid_onchip_mem_s1;
  input            mm_console_master_read_data_valid_sram_s1;
  input            mm_console_master_requests_onchip_mem_s1;
  input            mm_console_master_requests_sram_s1;
  input   [ 31: 0] onchip_mem_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  reg     [  1: 0] mm_console_master_dbs_address;
  reg     [  1: 0] mm_console_master_dbs_rdv_counter;
  wire    [ 15: 0] mm_console_master_dbs_write_16;
  reg     [  1: 0] mm_console_master_latency_counter;
  reg     [ 31: 0] mm_console_master_master_address_last_time;
  wire    [ 31: 0] mm_console_master_master_address_to_slave;
  reg     [  3: 0] mm_console_master_master_byteenable_last_time;
  wire    [  1: 0] mm_console_master_master_dbs_increment;
  wire    [  1: 0] mm_console_master_master_dbs_rdv_counter_inc;
  wire             mm_console_master_master_is_granted_some_slave;
  wire    [  1: 0] mm_console_master_master_next_dbs_rdv_counter;
  reg              mm_console_master_master_read_but_no_slave_selected;
  reg              mm_console_master_master_read_last_time;
  wire    [ 31: 0] mm_console_master_master_readdata;
  wire             mm_console_master_master_readdatavalid;
  wire             mm_console_master_master_reset;
  wire             mm_console_master_master_run;
  wire             mm_console_master_master_waitrequest;
  reg              mm_console_master_master_write_last_time;
  reg     [ 31: 0] mm_console_master_master_writedata_last_time;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire    [  1: 0] p1_mm_console_master_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_mm_console_master_master_readdatavalid;
  wire             r_1;
  wire             r_2;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (mm_console_master_qualified_request_onchip_mem_s1 | ~mm_console_master_requests_onchip_mem_s1) & (mm_console_master_granted_onchip_mem_s1 | ~mm_console_master_qualified_request_onchip_mem_s1) & ((~mm_console_master_qualified_request_onchip_mem_s1 | ~mm_console_master_master_read | (1 & mm_console_master_master_read))) & ((~mm_console_master_qualified_request_onchip_mem_s1 | ~(mm_console_master_master_read | mm_console_master_master_write) | (1 & (mm_console_master_master_read | mm_console_master_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign mm_console_master_master_run = r_1 & r_2;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (mm_console_master_qualified_request_sram_s1 | (mm_console_master_master_write & !mm_console_master_byteenable_sram_s1 & mm_console_master_dbs_address[1]) | ~mm_console_master_requests_sram_s1) & (mm_console_master_granted_sram_s1 | ~mm_console_master_qualified_request_sram_s1) & ((~mm_console_master_qualified_request_sram_s1 | ~mm_console_master_master_read | (1 & (mm_console_master_dbs_address[1]) & mm_console_master_master_read))) & ((~mm_console_master_qualified_request_sram_s1 | ~mm_console_master_master_write | (1 & (mm_console_master_dbs_address[1]) & mm_console_master_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign mm_console_master_master_address_to_slave = {9'b0,
    mm_console_master_master_address[22 : 0]};

  //mm_console_master_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_master_read_but_no_slave_selected <= 0;
      else 
        mm_console_master_master_read_but_no_slave_selected <= mm_console_master_master_read & mm_console_master_master_run & ~mm_console_master_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign mm_console_master_master_is_granted_some_slave = mm_console_master_granted_onchip_mem_s1 |
    mm_console_master_granted_sram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_mm_console_master_master_readdatavalid = mm_console_master_read_data_valid_onchip_mem_s1 |
    (mm_console_master_read_data_valid_sram_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign mm_console_master_master_readdatavalid = mm_console_master_master_read_but_no_slave_selected |
    pre_flush_mm_console_master_master_readdatavalid |
    mm_console_master_master_read_but_no_slave_selected |
    pre_flush_mm_console_master_master_readdatavalid;

  //mm_console_master/master readdata mux, which is an e_mux
  assign mm_console_master_master_readdata = ({32 {~mm_console_master_read_data_valid_onchip_mem_s1}} | onchip_mem_s1_readdata_from_sa) &
    ({32 {~mm_console_master_read_data_valid_sram_s1}} | {incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign mm_console_master_master_waitrequest = ~mm_console_master_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_latency_counter <= 0;
      else 
        mm_console_master_latency_counter <= p1_mm_console_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_mm_console_master_latency_counter = ((mm_console_master_master_run & mm_console_master_master_read))? latency_load_value :
    (mm_console_master_latency_counter)? mm_console_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({2 {mm_console_master_requests_onchip_mem_s1}} & 1) |
    ({2 {mm_console_master_requests_sram_s1}} & 2);

  //~mm_console_master_master_reset assignment, which is an e_assign
  assign mm_console_master_master_reset = ~reset_n;

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & mm_console_master_requests_sram_s1 & mm_console_master_master_write & !mm_console_master_byteenable_sram_s1)) |
    (mm_console_master_granted_sram_s1 & mm_console_master_master_read & 1 & 1) |
    (mm_console_master_granted_sram_s1 & mm_console_master_master_write & 1 & 1);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((mm_console_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign mm_console_master_dbs_write_16 = (mm_console_master_dbs_address[1])? mm_console_master_master_writedata[31 : 16] :
    mm_console_master_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign mm_console_master_master_dbs_increment = (mm_console_master_requests_sram_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = mm_console_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = mm_console_master_dbs_address + mm_console_master_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_dbs_address <= 0;
      else if (dbs_count_enable)
          mm_console_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign mm_console_master_master_next_dbs_rdv_counter = mm_console_master_dbs_rdv_counter + mm_console_master_master_dbs_rdv_counter_inc;

  //mm_console_master_master_rdv_inc_mux, which is an e_mux
  assign mm_console_master_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = mm_console_master_read_data_valid_sram_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          mm_console_master_dbs_rdv_counter <= mm_console_master_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = mm_console_master_dbs_rdv_counter[1] & ~mm_console_master_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //mm_console_master_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_master_address_last_time <= 0;
      else 
        mm_console_master_master_address_last_time <= mm_console_master_master_address;
    end


  //mm_console_master/master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= mm_console_master_master_waitrequest & (mm_console_master_master_read | mm_console_master_master_write);
    end


  //mm_console_master_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (mm_console_master_master_address != mm_console_master_master_address_last_time))
        begin
          $write("%0d ns: mm_console_master_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //mm_console_master_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_master_byteenable_last_time <= 0;
      else 
        mm_console_master_master_byteenable_last_time <= mm_console_master_master_byteenable;
    end


  //mm_console_master_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (mm_console_master_master_byteenable != mm_console_master_master_byteenable_last_time))
        begin
          $write("%0d ns: mm_console_master_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //mm_console_master_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_master_read_last_time <= 0;
      else 
        mm_console_master_master_read_last_time <= mm_console_master_master_read;
    end


  //mm_console_master_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (mm_console_master_master_read != mm_console_master_master_read_last_time))
        begin
          $write("%0d ns: mm_console_master_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //mm_console_master_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_master_write_last_time <= 0;
      else 
        mm_console_master_master_write_last_time <= mm_console_master_master_write;
    end


  //mm_console_master_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (mm_console_master_master_write != mm_console_master_master_write_last_time))
        begin
          $write("%0d ns: mm_console_master_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //mm_console_master_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_master_writedata_last_time <= 0;
      else 
        mm_console_master_master_writedata_last_time <= mm_console_master_master_writedata;
    end


  //mm_console_master_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (mm_console_master_master_writedata != mm_console_master_master_writedata_last_time) & mm_console_master_master_write)
        begin
          $write("%0d ns: mm_console_master_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_mem_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   cpu_instruction_master_address_to_slave,
                                   cpu_instruction_master_read,
                                   mm_console_master_latency_counter,
                                   mm_console_master_master_address_to_slave,
                                   mm_console_master_master_byteenable,
                                   mm_console_master_master_read,
                                   mm_console_master_master_write,
                                   mm_console_master_master_writedata,
                                   onchip_mem_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_onchip_mem_s1,
                                   cpu_data_master_qualified_request_onchip_mem_s1,
                                   cpu_data_master_read_data_valid_onchip_mem_s1,
                                   cpu_data_master_requests_onchip_mem_s1,
                                   cpu_instruction_master_granted_onchip_mem_s1,
                                   cpu_instruction_master_qualified_request_onchip_mem_s1,
                                   cpu_instruction_master_read_data_valid_onchip_mem_s1,
                                   cpu_instruction_master_requests_onchip_mem_s1,
                                   d1_onchip_mem_s1_end_xfer,
                                   mm_console_master_granted_onchip_mem_s1,
                                   mm_console_master_qualified_request_onchip_mem_s1,
                                   mm_console_master_read_data_valid_onchip_mem_s1,
                                   mm_console_master_requests_onchip_mem_s1,
                                   onchip_mem_s1_address,
                                   onchip_mem_s1_byteenable,
                                   onchip_mem_s1_chipselect,
                                   onchip_mem_s1_clken,
                                   onchip_mem_s1_readdata_from_sa,
                                   onchip_mem_s1_reset,
                                   onchip_mem_s1_write,
                                   onchip_mem_s1_writedata,
                                   registered_cpu_data_master_read_data_valid_onchip_mem_s1
                                )
;

  output           cpu_data_master_granted_onchip_mem_s1;
  output           cpu_data_master_qualified_request_onchip_mem_s1;
  output           cpu_data_master_read_data_valid_onchip_mem_s1;
  output           cpu_data_master_requests_onchip_mem_s1;
  output           cpu_instruction_master_granted_onchip_mem_s1;
  output           cpu_instruction_master_qualified_request_onchip_mem_s1;
  output           cpu_instruction_master_read_data_valid_onchip_mem_s1;
  output           cpu_instruction_master_requests_onchip_mem_s1;
  output           d1_onchip_mem_s1_end_xfer;
  output           mm_console_master_granted_onchip_mem_s1;
  output           mm_console_master_qualified_request_onchip_mem_s1;
  output           mm_console_master_read_data_valid_onchip_mem_s1;
  output           mm_console_master_requests_onchip_mem_s1;
  output  [  9: 0] onchip_mem_s1_address;
  output  [  3: 0] onchip_mem_s1_byteenable;
  output           onchip_mem_s1_chipselect;
  output           onchip_mem_s1_clken;
  output  [ 31: 0] onchip_mem_s1_readdata_from_sa;
  output           onchip_mem_s1_reset;
  output           onchip_mem_s1_write;
  output  [ 31: 0] onchip_mem_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 22: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [  1: 0] mm_console_master_latency_counter;
  input   [ 31: 0] mm_console_master_master_address_to_slave;
  input   [  3: 0] mm_console_master_master_byteenable;
  input            mm_console_master_master_read;
  input            mm_console_master_master_write;
  input   [ 31: 0] mm_console_master_master_writedata;
  input   [ 31: 0] onchip_mem_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_mem_s1;
  wire             cpu_data_master_qualified_request_onchip_mem_s1;
  wire             cpu_data_master_read_data_valid_onchip_mem_s1;
  reg              cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_mem_s1;
  wire             cpu_data_master_saved_grant_onchip_mem_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_mem_s1;
  wire             cpu_instruction_master_qualified_request_onchip_mem_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_mem_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_mem_s1;
  wire             cpu_instruction_master_saved_grant_onchip_mem_s1;
  reg              d1_onchip_mem_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_mem_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_mem_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1;
  reg              last_cycle_mm_console_master_master_granted_slave_onchip_mem_s1;
  wire             mm_console_master_granted_onchip_mem_s1;
  wire             mm_console_master_master_arbiterlock;
  wire             mm_console_master_master_arbiterlock2;
  wire             mm_console_master_master_continuerequest;
  wire             mm_console_master_qualified_request_onchip_mem_s1;
  wire             mm_console_master_read_data_valid_onchip_mem_s1;
  reg              mm_console_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             mm_console_master_read_data_valid_onchip_mem_s1_shift_register_in;
  wire             mm_console_master_requests_onchip_mem_s1;
  wire             mm_console_master_saved_grant_onchip_mem_s1;
  wire    [  9: 0] onchip_mem_s1_address;
  wire             onchip_mem_s1_allgrants;
  wire             onchip_mem_s1_allow_new_arb_cycle;
  wire             onchip_mem_s1_any_bursting_master_saved_grant;
  wire             onchip_mem_s1_any_continuerequest;
  reg     [  2: 0] onchip_mem_s1_arb_addend;
  wire             onchip_mem_s1_arb_counter_enable;
  reg     [  1: 0] onchip_mem_s1_arb_share_counter;
  wire    [  1: 0] onchip_mem_s1_arb_share_counter_next_value;
  wire    [  1: 0] onchip_mem_s1_arb_share_set_values;
  wire    [  2: 0] onchip_mem_s1_arb_winner;
  wire             onchip_mem_s1_arbitration_holdoff_internal;
  wire             onchip_mem_s1_beginbursttransfer_internal;
  wire             onchip_mem_s1_begins_xfer;
  wire    [  3: 0] onchip_mem_s1_byteenable;
  wire             onchip_mem_s1_chipselect;
  wire    [  5: 0] onchip_mem_s1_chosen_master_double_vector;
  wire    [  2: 0] onchip_mem_s1_chosen_master_rot_left;
  wire             onchip_mem_s1_clken;
  wire             onchip_mem_s1_end_xfer;
  wire             onchip_mem_s1_firsttransfer;
  wire    [  2: 0] onchip_mem_s1_grant_vector;
  wire             onchip_mem_s1_in_a_read_cycle;
  wire             onchip_mem_s1_in_a_write_cycle;
  wire    [  2: 0] onchip_mem_s1_master_qreq_vector;
  wire             onchip_mem_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_mem_s1_readdata_from_sa;
  reg              onchip_mem_s1_reg_firsttransfer;
  wire             onchip_mem_s1_reset;
  reg     [  2: 0] onchip_mem_s1_saved_chosen_master_vector;
  reg              onchip_mem_s1_slavearbiterlockenable;
  wire             onchip_mem_s1_slavearbiterlockenable2;
  wire             onchip_mem_s1_unreg_firsttransfer;
  wire             onchip_mem_s1_waits_for_read;
  wire             onchip_mem_s1_waits_for_write;
  wire             onchip_mem_s1_write;
  wire    [ 31: 0] onchip_mem_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             p1_mm_console_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  wire    [ 22: 0] shifted_address_to_onchip_mem_s1_from_cpu_data_master;
  wire    [ 22: 0] shifted_address_to_onchip_mem_s1_from_cpu_instruction_master;
  wire    [ 31: 0] shifted_address_to_onchip_mem_s1_from_mm_console_master_master;
  wire             wait_for_onchip_mem_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_mem_s1_end_xfer;
    end


  assign onchip_mem_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_mem_s1 | cpu_instruction_master_qualified_request_onchip_mem_s1 | mm_console_master_qualified_request_onchip_mem_s1));
  //assign onchip_mem_s1_readdata_from_sa = onchip_mem_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_mem_s1_readdata_from_sa = onchip_mem_s1_readdata;

  assign cpu_data_master_requests_onchip_mem_s1 = ({cpu_data_master_address_to_slave[22 : 12] , 12'b0} == 23'h2000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_mem_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_onchip_mem_s1 = cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in;

  //onchip_mem_s1_arb_share_counter set values, which is an e_mux
  assign onchip_mem_s1_arb_share_set_values = 1;

  //onchip_mem_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_mem_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_mem_s1 |
    cpu_instruction_master_requests_onchip_mem_s1 |
    mm_console_master_requests_onchip_mem_s1 |
    cpu_data_master_requests_onchip_mem_s1 |
    cpu_instruction_master_requests_onchip_mem_s1 |
    mm_console_master_requests_onchip_mem_s1 |
    cpu_data_master_requests_onchip_mem_s1 |
    cpu_instruction_master_requests_onchip_mem_s1 |
    mm_console_master_requests_onchip_mem_s1;

  //onchip_mem_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_mem_s1_any_bursting_master_saved_grant = 0;

  //onchip_mem_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_mem_s1_arb_share_counter_next_value = onchip_mem_s1_firsttransfer ? (onchip_mem_s1_arb_share_set_values - 1) : |onchip_mem_s1_arb_share_counter ? (onchip_mem_s1_arb_share_counter - 1) : 0;

  //onchip_mem_s1_allgrants all slave grants, which is an e_mux
  assign onchip_mem_s1_allgrants = (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector);

  //onchip_mem_s1_end_xfer assignment, which is an e_assign
  assign onchip_mem_s1_end_xfer = ~(onchip_mem_s1_waits_for_read | onchip_mem_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_mem_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_mem_s1 = onchip_mem_s1_end_xfer & (~onchip_mem_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_mem_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_mem_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_mem_s1 & onchip_mem_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_mem_s1 & ~onchip_mem_s1_non_bursting_master_requests);

  //onchip_mem_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_arb_share_counter <= 0;
      else if (onchip_mem_s1_arb_counter_enable)
          onchip_mem_s1_arb_share_counter <= onchip_mem_s1_arb_share_counter_next_value;
    end


  //onchip_mem_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_mem_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_mem_s1) | (end_xfer_arb_share_counter_term_onchip_mem_s1 & ~onchip_mem_s1_non_bursting_master_requests))
          onchip_mem_s1_slavearbiterlockenable <= |onchip_mem_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_mem/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_mem_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_mem_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_mem_s1_slavearbiterlockenable2 = |onchip_mem_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_mem/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_mem_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_mem/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_mem_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_mem/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_mem_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1 <= cpu_instruction_master_saved_grant_onchip_mem_s1 ? 1 : (onchip_mem_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_mem_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1 & cpu_instruction_master_requests_onchip_mem_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1 & cpu_instruction_master_requests_onchip_mem_s1);

  //onchip_mem_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_mem_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    mm_console_master_master_continuerequest |
    cpu_data_master_continuerequest |
    mm_console_master_master_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest;

  //mm_console_master/master onchip_mem/s1 arbiterlock, which is an e_assign
  assign mm_console_master_master_arbiterlock = onchip_mem_s1_slavearbiterlockenable & mm_console_master_master_continuerequest;

  //mm_console_master/master onchip_mem/s1 arbiterlock2, which is an e_assign
  assign mm_console_master_master_arbiterlock2 = onchip_mem_s1_slavearbiterlockenable2 & mm_console_master_master_continuerequest;

  //mm_console_master/master granted onchip_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_mm_console_master_master_granted_slave_onchip_mem_s1 <= 0;
      else 
        last_cycle_mm_console_master_master_granted_slave_onchip_mem_s1 <= mm_console_master_saved_grant_onchip_mem_s1 ? 1 : (onchip_mem_s1_arbitration_holdoff_internal | ~mm_console_master_requests_onchip_mem_s1) ? 0 : last_cycle_mm_console_master_master_granted_slave_onchip_mem_s1;
    end


  //mm_console_master_master_continuerequest continued request, which is an e_mux
  assign mm_console_master_master_continuerequest = (last_cycle_mm_console_master_master_granted_slave_onchip_mem_s1 & mm_console_master_requests_onchip_mem_s1) |
    (last_cycle_mm_console_master_master_granted_slave_onchip_mem_s1 & mm_console_master_requests_onchip_mem_s1);

  assign cpu_data_master_qualified_request_onchip_mem_s1 = cpu_data_master_requests_onchip_mem_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_onchip_mem_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock | mm_console_master_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in = cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_read & ~onchip_mem_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_onchip_mem_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_onchip_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_mem_s1_shift_register = {cpu_data_master_read_data_valid_onchip_mem_s1_shift_register, cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_mem_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_onchip_mem_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_mem_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_mem_s1 = cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;

  //onchip_mem_s1_writedata mux, which is an e_mux
  assign onchip_mem_s1_writedata = (cpu_data_master_granted_onchip_mem_s1)? cpu_data_master_writedata :
    mm_console_master_master_writedata;

  //mux onchip_mem_s1_clken, which is an e_mux
  assign onchip_mem_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_mem_s1 = (({cpu_instruction_master_address_to_slave[22 : 12] , 12'b0} == 23'h2000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_mem_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_onchip_mem_s1 <= cpu_data_master_saved_grant_onchip_mem_s1 ? 1 : (onchip_mem_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_mem_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_mem_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_onchip_mem_s1 & cpu_data_master_requests_onchip_mem_s1) |
    (last_cycle_cpu_data_master_granted_slave_onchip_mem_s1 & cpu_data_master_requests_onchip_mem_s1);

  assign cpu_instruction_master_qualified_request_onchip_mem_s1 = cpu_instruction_master_requests_onchip_mem_s1 & ~((cpu_instruction_master_read & ((|cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register))) | cpu_data_master_arbiterlock | mm_console_master_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in = cpu_instruction_master_granted_onchip_mem_s1 & cpu_instruction_master_read & ~onchip_mem_s1_waits_for_read & ~(|cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register);

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_mem_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_mem_s1 = cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;

  assign mm_console_master_requests_onchip_mem_s1 = ({mm_console_master_master_address_to_slave[31 : 12] , 12'b0} == 32'h2000) & (mm_console_master_master_read | mm_console_master_master_write);
  assign mm_console_master_qualified_request_onchip_mem_s1 = mm_console_master_requests_onchip_mem_s1 & ~((mm_console_master_master_read & ((1 < mm_console_master_latency_counter))) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock);
  //mm_console_master_read_data_valid_onchip_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign mm_console_master_read_data_valid_onchip_mem_s1_shift_register_in = mm_console_master_granted_onchip_mem_s1 & mm_console_master_master_read & ~onchip_mem_s1_waits_for_read;

  //shift register p1 mm_console_master_read_data_valid_onchip_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_mm_console_master_read_data_valid_onchip_mem_s1_shift_register = {mm_console_master_read_data_valid_onchip_mem_s1_shift_register, mm_console_master_read_data_valid_onchip_mem_s1_shift_register_in};

  //mm_console_master_read_data_valid_onchip_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_read_data_valid_onchip_mem_s1_shift_register <= 0;
      else 
        mm_console_master_read_data_valid_onchip_mem_s1_shift_register <= p1_mm_console_master_read_data_valid_onchip_mem_s1_shift_register;
    end


  //local readdatavalid mm_console_master_read_data_valid_onchip_mem_s1, which is an e_mux
  assign mm_console_master_read_data_valid_onchip_mem_s1 = mm_console_master_read_data_valid_onchip_mem_s1_shift_register;

  //allow new arb cycle for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock & ~mm_console_master_master_arbiterlock;

  //mm_console_master/master assignment into master qualified-requests vector for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_master_qreq_vector[0] = mm_console_master_qualified_request_onchip_mem_s1;

  //mm_console_master/master grant onchip_mem/s1, which is an e_assign
  assign mm_console_master_granted_onchip_mem_s1 = onchip_mem_s1_grant_vector[0];

  //mm_console_master/master saved-grant onchip_mem/s1, which is an e_assign
  assign mm_console_master_saved_grant_onchip_mem_s1 = onchip_mem_s1_arb_winner[0] && mm_console_master_requests_onchip_mem_s1;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_master_qreq_vector[1] = cpu_instruction_master_qualified_request_onchip_mem_s1;

  //cpu/instruction_master grant onchip_mem/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_mem_s1 = onchip_mem_s1_grant_vector[1];

  //cpu/instruction_master saved-grant onchip_mem/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_mem_s1 = onchip_mem_s1_arb_winner[1] && cpu_instruction_master_requests_onchip_mem_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_master_qreq_vector[2] = cpu_data_master_qualified_request_onchip_mem_s1;

  //cpu/data_master grant onchip_mem/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_mem_s1 = onchip_mem_s1_grant_vector[2];

  //cpu/data_master saved-grant onchip_mem/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_mem_s1 = onchip_mem_s1_arb_winner[2] && cpu_data_master_requests_onchip_mem_s1;

  //onchip_mem/s1 chosen-master double-vector, which is an e_assign
  assign onchip_mem_s1_chosen_master_double_vector = {onchip_mem_s1_master_qreq_vector, onchip_mem_s1_master_qreq_vector} & ({~onchip_mem_s1_master_qreq_vector, ~onchip_mem_s1_master_qreq_vector} + onchip_mem_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_mem_s1_arb_winner = (onchip_mem_s1_allow_new_arb_cycle & | onchip_mem_s1_grant_vector) ? onchip_mem_s1_grant_vector : onchip_mem_s1_saved_chosen_master_vector;

  //saved onchip_mem_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_saved_chosen_master_vector <= 0;
      else if (onchip_mem_s1_allow_new_arb_cycle)
          onchip_mem_s1_saved_chosen_master_vector <= |onchip_mem_s1_grant_vector ? onchip_mem_s1_grant_vector : onchip_mem_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_mem_s1_grant_vector = {(onchip_mem_s1_chosen_master_double_vector[2] | onchip_mem_s1_chosen_master_double_vector[5]),
    (onchip_mem_s1_chosen_master_double_vector[1] | onchip_mem_s1_chosen_master_double_vector[4]),
    (onchip_mem_s1_chosen_master_double_vector[0] | onchip_mem_s1_chosen_master_double_vector[3])};

  //onchip_mem/s1 chosen master rotated left, which is an e_assign
  assign onchip_mem_s1_chosen_master_rot_left = (onchip_mem_s1_arb_winner << 1) ? (onchip_mem_s1_arb_winner << 1) : 1;

  //onchip_mem/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_arb_addend <= 1;
      else if (|onchip_mem_s1_grant_vector)
          onchip_mem_s1_arb_addend <= onchip_mem_s1_end_xfer? onchip_mem_s1_chosen_master_rot_left : onchip_mem_s1_grant_vector;
    end


  //~onchip_mem_s1_reset assignment, which is an e_assign
  assign onchip_mem_s1_reset = ~reset_n;

  assign onchip_mem_s1_chipselect = cpu_data_master_granted_onchip_mem_s1 | cpu_instruction_master_granted_onchip_mem_s1 | mm_console_master_granted_onchip_mem_s1;
  //onchip_mem_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_mem_s1_firsttransfer = onchip_mem_s1_begins_xfer ? onchip_mem_s1_unreg_firsttransfer : onchip_mem_s1_reg_firsttransfer;

  //onchip_mem_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_mem_s1_unreg_firsttransfer = ~(onchip_mem_s1_slavearbiterlockenable & onchip_mem_s1_any_continuerequest);

  //onchip_mem_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_mem_s1_begins_xfer)
          onchip_mem_s1_reg_firsttransfer <= onchip_mem_s1_unreg_firsttransfer;
    end


  //onchip_mem_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_mem_s1_beginbursttransfer_internal = onchip_mem_s1_begins_xfer;

  //onchip_mem_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_mem_s1_arbitration_holdoff_internal = onchip_mem_s1_begins_xfer & onchip_mem_s1_firsttransfer;

  //onchip_mem_s1_write assignment, which is an e_mux
  assign onchip_mem_s1_write = (cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_write) | (mm_console_master_granted_onchip_mem_s1 & mm_console_master_master_write);

  assign shifted_address_to_onchip_mem_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_mem_s1_address mux, which is an e_mux
  assign onchip_mem_s1_address = (cpu_data_master_granted_onchip_mem_s1)? (shifted_address_to_onchip_mem_s1_from_cpu_data_master >> 2) :
    (cpu_instruction_master_granted_onchip_mem_s1)? (shifted_address_to_onchip_mem_s1_from_cpu_instruction_master >> 2) :
    (shifted_address_to_onchip_mem_s1_from_mm_console_master_master >> 2);

  assign shifted_address_to_onchip_mem_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  assign shifted_address_to_onchip_mem_s1_from_mm_console_master_master = mm_console_master_master_address_to_slave;
  //d1_onchip_mem_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_mem_s1_end_xfer <= 1;
      else 
        d1_onchip_mem_s1_end_xfer <= onchip_mem_s1_end_xfer;
    end


  //onchip_mem_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_mem_s1_waits_for_read = onchip_mem_s1_in_a_read_cycle & 0;

  //onchip_mem_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_mem_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_mem_s1 & cpu_instruction_master_read) | (mm_console_master_granted_onchip_mem_s1 & mm_console_master_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_mem_s1_in_a_read_cycle;

  //onchip_mem_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_mem_s1_waits_for_write = onchip_mem_s1_in_a_write_cycle & 0;

  //onchip_mem_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_mem_s1_in_a_write_cycle = (cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_write) | (mm_console_master_granted_onchip_mem_s1 & mm_console_master_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_mem_s1_in_a_write_cycle;

  assign wait_for_onchip_mem_s1_counter = 0;
  //onchip_mem_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_mem_s1_byteenable = (cpu_data_master_granted_onchip_mem_s1)? cpu_data_master_byteenable :
    (mm_console_master_granted_onchip_mem_s1)? mm_console_master_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_mem/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_mem_s1 + cpu_instruction_master_granted_onchip_mem_s1 + mm_console_master_granted_onchip_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_mem_s1 + cpu_instruction_master_saved_grant_onchip_mem_s1 + mm_console_master_saved_grant_onchip_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_pll_slave_arbitrator (
                                  // inputs:
                                   clk,
                                   pll_pll_slave_readdata,
                                   reset_n,
                                   uC_clock_0_out_address_to_slave,
                                   uC_clock_0_out_read,
                                   uC_clock_0_out_write,
                                   uC_clock_0_out_writedata,

                                  // outputs:
                                   d1_pll_pll_slave_end_xfer,
                                   pll_pll_slave_address,
                                   pll_pll_slave_read,
                                   pll_pll_slave_readdata_from_sa,
                                   pll_pll_slave_reset,
                                   pll_pll_slave_write,
                                   pll_pll_slave_writedata,
                                   uC_clock_0_out_granted_pll_pll_slave,
                                   uC_clock_0_out_qualified_request_pll_pll_slave,
                                   uC_clock_0_out_read_data_valid_pll_pll_slave,
                                   uC_clock_0_out_requests_pll_pll_slave
                                )
;

  output           d1_pll_pll_slave_end_xfer;
  output  [  1: 0] pll_pll_slave_address;
  output           pll_pll_slave_read;
  output  [ 31: 0] pll_pll_slave_readdata_from_sa;
  output           pll_pll_slave_reset;
  output           pll_pll_slave_write;
  output  [ 31: 0] pll_pll_slave_writedata;
  output           uC_clock_0_out_granted_pll_pll_slave;
  output           uC_clock_0_out_qualified_request_pll_pll_slave;
  output           uC_clock_0_out_read_data_valid_pll_pll_slave;
  output           uC_clock_0_out_requests_pll_pll_slave;
  input            clk;
  input   [ 31: 0] pll_pll_slave_readdata;
  input            reset_n;
  input   [  3: 0] uC_clock_0_out_address_to_slave;
  input            uC_clock_0_out_read;
  input            uC_clock_0_out_write;
  input   [ 31: 0] uC_clock_0_out_writedata;

  reg              d1_pll_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_allgrants;
  wire             pll_pll_slave_allow_new_arb_cycle;
  wire             pll_pll_slave_any_bursting_master_saved_grant;
  wire             pll_pll_slave_any_continuerequest;
  wire             pll_pll_slave_arb_counter_enable;
  reg              pll_pll_slave_arb_share_counter;
  wire             pll_pll_slave_arb_share_counter_next_value;
  wire             pll_pll_slave_arb_share_set_values;
  wire             pll_pll_slave_beginbursttransfer_internal;
  wire             pll_pll_slave_begins_xfer;
  wire             pll_pll_slave_end_xfer;
  wire             pll_pll_slave_firsttransfer;
  wire             pll_pll_slave_grant_vector;
  wire             pll_pll_slave_in_a_read_cycle;
  wire             pll_pll_slave_in_a_write_cycle;
  wire             pll_pll_slave_master_qreq_vector;
  wire             pll_pll_slave_non_bursting_master_requests;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  reg              pll_pll_slave_reg_firsttransfer;
  wire             pll_pll_slave_reset;
  reg              pll_pll_slave_slavearbiterlockenable;
  wire             pll_pll_slave_slavearbiterlockenable2;
  wire             pll_pll_slave_unreg_firsttransfer;
  wire             pll_pll_slave_waits_for_read;
  wire             pll_pll_slave_waits_for_write;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire    [  3: 0] shifted_address_to_pll_pll_slave_from_uC_clock_0_out;
  wire             uC_clock_0_out_arbiterlock;
  wire             uC_clock_0_out_arbiterlock2;
  wire             uC_clock_0_out_continuerequest;
  wire             uC_clock_0_out_granted_pll_pll_slave;
  wire             uC_clock_0_out_qualified_request_pll_pll_slave;
  wire             uC_clock_0_out_read_data_valid_pll_pll_slave;
  wire             uC_clock_0_out_requests_pll_pll_slave;
  wire             uC_clock_0_out_saved_grant_pll_pll_slave;
  wire             wait_for_pll_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pll_pll_slave_end_xfer;
    end


  assign pll_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((uC_clock_0_out_qualified_request_pll_pll_slave));
  //assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata;

  assign uC_clock_0_out_requests_pll_pll_slave = (1) & (uC_clock_0_out_read | uC_clock_0_out_write);
  //pll_pll_slave_arb_share_counter set values, which is an e_mux
  assign pll_pll_slave_arb_share_set_values = 1;

  //pll_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign pll_pll_slave_non_bursting_master_requests = uC_clock_0_out_requests_pll_pll_slave;

  //pll_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_pll_slave_any_bursting_master_saved_grant = 0;

  //pll_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_pll_slave_arb_share_counter_next_value = pll_pll_slave_firsttransfer ? (pll_pll_slave_arb_share_set_values - 1) : |pll_pll_slave_arb_share_counter ? (pll_pll_slave_arb_share_counter - 1) : 0;

  //pll_pll_slave_allgrants all slave grants, which is an e_mux
  assign pll_pll_slave_allgrants = |pll_pll_slave_grant_vector;

  //pll_pll_slave_end_xfer assignment, which is an e_assign
  assign pll_pll_slave_end_xfer = ~(pll_pll_slave_waits_for_read | pll_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_pll_slave = pll_pll_slave_end_xfer & (~pll_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_pll_slave & pll_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests);

  //pll_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_arb_share_counter <= 0;
      else if (pll_pll_slave_arb_counter_enable)
          pll_pll_slave_arb_share_counter <= pll_pll_slave_arb_share_counter_next_value;
    end


  //pll_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_slavearbiterlockenable <= 0;
      else if ((|pll_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_pll_pll_slave) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests))
          pll_pll_slave_slavearbiterlockenable <= |pll_pll_slave_arb_share_counter_next_value;
    end


  //uC_clock_0/out pll/pll_slave arbiterlock, which is an e_assign
  assign uC_clock_0_out_arbiterlock = pll_pll_slave_slavearbiterlockenable & uC_clock_0_out_continuerequest;

  //pll_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_pll_slave_slavearbiterlockenable2 = |pll_pll_slave_arb_share_counter_next_value;

  //uC_clock_0/out pll/pll_slave arbiterlock2, which is an e_assign
  assign uC_clock_0_out_arbiterlock2 = pll_pll_slave_slavearbiterlockenable2 & uC_clock_0_out_continuerequest;

  //pll_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_pll_slave_any_continuerequest = 1;

  //uC_clock_0_out_continuerequest continued request, which is an e_assign
  assign uC_clock_0_out_continuerequest = 1;

  assign uC_clock_0_out_qualified_request_pll_pll_slave = uC_clock_0_out_requests_pll_pll_slave;
  //pll_pll_slave_writedata mux, which is an e_mux
  assign pll_pll_slave_writedata = uC_clock_0_out_writedata;

  //master is always granted when requested
  assign uC_clock_0_out_granted_pll_pll_slave = uC_clock_0_out_qualified_request_pll_pll_slave;

  //uC_clock_0/out saved-grant pll/pll_slave, which is an e_assign
  assign uC_clock_0_out_saved_grant_pll_pll_slave = uC_clock_0_out_requests_pll_pll_slave;

  //allow new arb cycle for pll/pll_slave, which is an e_assign
  assign pll_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_pll_slave_master_qreq_vector = 1;

  //~pll_pll_slave_reset assignment, which is an e_assign
  assign pll_pll_slave_reset = ~reset_n;

  //pll_pll_slave_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_firsttransfer = pll_pll_slave_begins_xfer ? pll_pll_slave_unreg_firsttransfer : pll_pll_slave_reg_firsttransfer;

  //pll_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_unreg_firsttransfer = ~(pll_pll_slave_slavearbiterlockenable & pll_pll_slave_any_continuerequest);

  //pll_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_reg_firsttransfer <= 1'b1;
      else if (pll_pll_slave_begins_xfer)
          pll_pll_slave_reg_firsttransfer <= pll_pll_slave_unreg_firsttransfer;
    end


  //pll_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_pll_slave_beginbursttransfer_internal = pll_pll_slave_begins_xfer;

  //pll_pll_slave_read assignment, which is an e_mux
  assign pll_pll_slave_read = uC_clock_0_out_granted_pll_pll_slave & uC_clock_0_out_read;

  //pll_pll_slave_write assignment, which is an e_mux
  assign pll_pll_slave_write = uC_clock_0_out_granted_pll_pll_slave & uC_clock_0_out_write;

  assign shifted_address_to_pll_pll_slave_from_uC_clock_0_out = uC_clock_0_out_address_to_slave;
  //pll_pll_slave_address mux, which is an e_mux
  assign pll_pll_slave_address = shifted_address_to_pll_pll_slave_from_uC_clock_0_out >> 2;

  //d1_pll_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_pll_slave_end_xfer <= 1;
      else 
        d1_pll_pll_slave_end_xfer <= pll_pll_slave_end_xfer;
    end


  //pll_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_read = pll_pll_slave_in_a_read_cycle & 0;

  //pll_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_read_cycle = uC_clock_0_out_granted_pll_pll_slave & uC_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_pll_slave_in_a_read_cycle;

  //pll_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_write = pll_pll_slave_in_a_write_cycle & 0;

  //pll_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_write_cycle = uC_clock_0_out_granted_pll_pll_slave & uC_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_pll_slave_in_a_write_cycle;

  assign wait_for_pll_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pwr_data_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_read,
                                 cpu_data_master_waitrequest,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 pwr_data_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_pwr_data_s1,
                                 cpu_data_master_qualified_request_pwr_data_s1,
                                 cpu_data_master_read_data_valid_pwr_data_s1,
                                 cpu_data_master_requests_pwr_data_s1,
                                 d1_pwr_data_s1_end_xfer,
                                 pwr_data_s1_address,
                                 pwr_data_s1_chipselect,
                                 pwr_data_s1_readdata_from_sa,
                                 pwr_data_s1_reset_n,
                                 pwr_data_s1_write_n,
                                 pwr_data_s1_writedata
                              )
;

  output           cpu_data_master_granted_pwr_data_s1;
  output           cpu_data_master_qualified_request_pwr_data_s1;
  output           cpu_data_master_read_data_valid_pwr_data_s1;
  output           cpu_data_master_requests_pwr_data_s1;
  output           d1_pwr_data_s1_end_xfer;
  output  [  2: 0] pwr_data_s1_address;
  output           pwr_data_s1_chipselect;
  output  [ 31: 0] pwr_data_s1_readdata_from_sa;
  output           pwr_data_s1_reset_n;
  output           pwr_data_s1_write_n;
  output  [ 31: 0] pwr_data_s1_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] pwr_data_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pwr_data_s1;
  wire             cpu_data_master_qualified_request_pwr_data_s1;
  wire             cpu_data_master_read_data_valid_pwr_data_s1;
  wire             cpu_data_master_requests_pwr_data_s1;
  wire             cpu_data_master_saved_grant_pwr_data_s1;
  reg              d1_pwr_data_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pwr_data_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] pwr_data_s1_address;
  wire             pwr_data_s1_allgrants;
  wire             pwr_data_s1_allow_new_arb_cycle;
  wire             pwr_data_s1_any_bursting_master_saved_grant;
  wire             pwr_data_s1_any_continuerequest;
  wire             pwr_data_s1_arb_counter_enable;
  reg     [  1: 0] pwr_data_s1_arb_share_counter;
  wire    [  1: 0] pwr_data_s1_arb_share_counter_next_value;
  wire    [  1: 0] pwr_data_s1_arb_share_set_values;
  wire             pwr_data_s1_beginbursttransfer_internal;
  wire             pwr_data_s1_begins_xfer;
  wire             pwr_data_s1_chipselect;
  wire             pwr_data_s1_end_xfer;
  wire             pwr_data_s1_firsttransfer;
  wire             pwr_data_s1_grant_vector;
  wire             pwr_data_s1_in_a_read_cycle;
  wire             pwr_data_s1_in_a_write_cycle;
  wire             pwr_data_s1_master_qreq_vector;
  wire             pwr_data_s1_non_bursting_master_requests;
  wire    [ 31: 0] pwr_data_s1_readdata_from_sa;
  reg              pwr_data_s1_reg_firsttransfer;
  wire             pwr_data_s1_reset_n;
  reg              pwr_data_s1_slavearbiterlockenable;
  wire             pwr_data_s1_slavearbiterlockenable2;
  wire             pwr_data_s1_unreg_firsttransfer;
  wire             pwr_data_s1_waits_for_read;
  wire             pwr_data_s1_waits_for_write;
  wire             pwr_data_s1_write_n;
  wire    [ 31: 0] pwr_data_s1_writedata;
  wire    [ 22: 0] shifted_address_to_pwr_data_s1_from_cpu_data_master;
  wire             wait_for_pwr_data_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pwr_data_s1_end_xfer;
    end


  assign pwr_data_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pwr_data_s1));
  //assign pwr_data_s1_readdata_from_sa = pwr_data_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pwr_data_s1_readdata_from_sa = pwr_data_s1_readdata;

  assign cpu_data_master_requests_pwr_data_s1 = ({cpu_data_master_address_to_slave[22 : 5] , 5'b0} == 23'h60) & (cpu_data_master_read | cpu_data_master_write);
  //pwr_data_s1_arb_share_counter set values, which is an e_mux
  assign pwr_data_s1_arb_share_set_values = 1;

  //pwr_data_s1_non_bursting_master_requests mux, which is an e_mux
  assign pwr_data_s1_non_bursting_master_requests = cpu_data_master_requests_pwr_data_s1;

  //pwr_data_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pwr_data_s1_any_bursting_master_saved_grant = 0;

  //pwr_data_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pwr_data_s1_arb_share_counter_next_value = pwr_data_s1_firsttransfer ? (pwr_data_s1_arb_share_set_values - 1) : |pwr_data_s1_arb_share_counter ? (pwr_data_s1_arb_share_counter - 1) : 0;

  //pwr_data_s1_allgrants all slave grants, which is an e_mux
  assign pwr_data_s1_allgrants = |pwr_data_s1_grant_vector;

  //pwr_data_s1_end_xfer assignment, which is an e_assign
  assign pwr_data_s1_end_xfer = ~(pwr_data_s1_waits_for_read | pwr_data_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pwr_data_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pwr_data_s1 = pwr_data_s1_end_xfer & (~pwr_data_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pwr_data_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pwr_data_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pwr_data_s1 & pwr_data_s1_allgrants) | (end_xfer_arb_share_counter_term_pwr_data_s1 & ~pwr_data_s1_non_bursting_master_requests);

  //pwr_data_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pwr_data_s1_arb_share_counter <= 0;
      else if (pwr_data_s1_arb_counter_enable)
          pwr_data_s1_arb_share_counter <= pwr_data_s1_arb_share_counter_next_value;
    end


  //pwr_data_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pwr_data_s1_slavearbiterlockenable <= 0;
      else if ((|pwr_data_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pwr_data_s1) | (end_xfer_arb_share_counter_term_pwr_data_s1 & ~pwr_data_s1_non_bursting_master_requests))
          pwr_data_s1_slavearbiterlockenable <= |pwr_data_s1_arb_share_counter_next_value;
    end


  //cpu/data_master pwr_data/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pwr_data_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pwr_data_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pwr_data_s1_slavearbiterlockenable2 = |pwr_data_s1_arb_share_counter_next_value;

  //cpu/data_master pwr_data/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pwr_data_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pwr_data_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pwr_data_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pwr_data_s1 = cpu_data_master_requests_pwr_data_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //pwr_data_s1_writedata mux, which is an e_mux
  assign pwr_data_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_pwr_data_s1 = cpu_data_master_qualified_request_pwr_data_s1;

  //cpu/data_master saved-grant pwr_data/s1, which is an e_assign
  assign cpu_data_master_saved_grant_pwr_data_s1 = cpu_data_master_requests_pwr_data_s1;

  //allow new arb cycle for pwr_data/s1, which is an e_assign
  assign pwr_data_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pwr_data_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pwr_data_s1_master_qreq_vector = 1;

  //pwr_data_s1_reset_n assignment, which is an e_assign
  assign pwr_data_s1_reset_n = reset_n;

  assign pwr_data_s1_chipselect = cpu_data_master_granted_pwr_data_s1;
  //pwr_data_s1_firsttransfer first transaction, which is an e_assign
  assign pwr_data_s1_firsttransfer = pwr_data_s1_begins_xfer ? pwr_data_s1_unreg_firsttransfer : pwr_data_s1_reg_firsttransfer;

  //pwr_data_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pwr_data_s1_unreg_firsttransfer = ~(pwr_data_s1_slavearbiterlockenable & pwr_data_s1_any_continuerequest);

  //pwr_data_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pwr_data_s1_reg_firsttransfer <= 1'b1;
      else if (pwr_data_s1_begins_xfer)
          pwr_data_s1_reg_firsttransfer <= pwr_data_s1_unreg_firsttransfer;
    end


  //pwr_data_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pwr_data_s1_beginbursttransfer_internal = pwr_data_s1_begins_xfer;

  //~pwr_data_s1_write_n assignment, which is an e_mux
  assign pwr_data_s1_write_n = ~(cpu_data_master_granted_pwr_data_s1 & cpu_data_master_write);

  assign shifted_address_to_pwr_data_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pwr_data_s1_address mux, which is an e_mux
  assign pwr_data_s1_address = shifted_address_to_pwr_data_s1_from_cpu_data_master >> 2;

  //d1_pwr_data_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pwr_data_s1_end_xfer <= 1;
      else 
        d1_pwr_data_s1_end_xfer <= pwr_data_s1_end_xfer;
    end


  //pwr_data_s1_waits_for_read in a cycle, which is an e_mux
  assign pwr_data_s1_waits_for_read = pwr_data_s1_in_a_read_cycle & pwr_data_s1_begins_xfer;

  //pwr_data_s1_in_a_read_cycle assignment, which is an e_assign
  assign pwr_data_s1_in_a_read_cycle = cpu_data_master_granted_pwr_data_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pwr_data_s1_in_a_read_cycle;

  //pwr_data_s1_waits_for_write in a cycle, which is an e_mux
  assign pwr_data_s1_waits_for_write = pwr_data_s1_in_a_write_cycle & 0;

  //pwr_data_s1_in_a_write_cycle assignment, which is an e_assign
  assign pwr_data_s1_in_a_write_cycle = cpu_data_master_granted_pwr_data_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pwr_data_s1_in_a_write_cycle;

  assign wait_for_pwr_data_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pwr_data/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pwr_en_clk_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   pwr_en_clk_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_pwr_en_clk_s1,
                                   cpu_data_master_qualified_request_pwr_en_clk_s1,
                                   cpu_data_master_read_data_valid_pwr_en_clk_s1,
                                   cpu_data_master_requests_pwr_en_clk_s1,
                                   d1_pwr_en_clk_s1_end_xfer,
                                   pwr_en_clk_s1_address,
                                   pwr_en_clk_s1_chipselect,
                                   pwr_en_clk_s1_readdata_from_sa,
                                   pwr_en_clk_s1_reset_n,
                                   pwr_en_clk_s1_write_n,
                                   pwr_en_clk_s1_writedata
                                )
;

  output           cpu_data_master_granted_pwr_en_clk_s1;
  output           cpu_data_master_qualified_request_pwr_en_clk_s1;
  output           cpu_data_master_read_data_valid_pwr_en_clk_s1;
  output           cpu_data_master_requests_pwr_en_clk_s1;
  output           d1_pwr_en_clk_s1_end_xfer;
  output  [  1: 0] pwr_en_clk_s1_address;
  output           pwr_en_clk_s1_chipselect;
  output  [ 31: 0] pwr_en_clk_s1_readdata_from_sa;
  output           pwr_en_clk_s1_reset_n;
  output           pwr_en_clk_s1_write_n;
  output  [ 31: 0] pwr_en_clk_s1_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] pwr_en_clk_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pwr_en_clk_s1;
  wire             cpu_data_master_qualified_request_pwr_en_clk_s1;
  wire             cpu_data_master_read_data_valid_pwr_en_clk_s1;
  wire             cpu_data_master_requests_pwr_en_clk_s1;
  wire             cpu_data_master_saved_grant_pwr_en_clk_s1;
  reg              d1_pwr_en_clk_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pwr_en_clk_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pwr_en_clk_s1_address;
  wire             pwr_en_clk_s1_allgrants;
  wire             pwr_en_clk_s1_allow_new_arb_cycle;
  wire             pwr_en_clk_s1_any_bursting_master_saved_grant;
  wire             pwr_en_clk_s1_any_continuerequest;
  wire             pwr_en_clk_s1_arb_counter_enable;
  reg     [  1: 0] pwr_en_clk_s1_arb_share_counter;
  wire    [  1: 0] pwr_en_clk_s1_arb_share_counter_next_value;
  wire    [  1: 0] pwr_en_clk_s1_arb_share_set_values;
  wire             pwr_en_clk_s1_beginbursttransfer_internal;
  wire             pwr_en_clk_s1_begins_xfer;
  wire             pwr_en_clk_s1_chipselect;
  wire             pwr_en_clk_s1_end_xfer;
  wire             pwr_en_clk_s1_firsttransfer;
  wire             pwr_en_clk_s1_grant_vector;
  wire             pwr_en_clk_s1_in_a_read_cycle;
  wire             pwr_en_clk_s1_in_a_write_cycle;
  wire             pwr_en_clk_s1_master_qreq_vector;
  wire             pwr_en_clk_s1_non_bursting_master_requests;
  wire    [ 31: 0] pwr_en_clk_s1_readdata_from_sa;
  reg              pwr_en_clk_s1_reg_firsttransfer;
  wire             pwr_en_clk_s1_reset_n;
  reg              pwr_en_clk_s1_slavearbiterlockenable;
  wire             pwr_en_clk_s1_slavearbiterlockenable2;
  wire             pwr_en_clk_s1_unreg_firsttransfer;
  wire             pwr_en_clk_s1_waits_for_read;
  wire             pwr_en_clk_s1_waits_for_write;
  wire             pwr_en_clk_s1_write_n;
  wire    [ 31: 0] pwr_en_clk_s1_writedata;
  wire    [ 22: 0] shifted_address_to_pwr_en_clk_s1_from_cpu_data_master;
  wire             wait_for_pwr_en_clk_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pwr_en_clk_s1_end_xfer;
    end


  assign pwr_en_clk_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pwr_en_clk_s1));
  //assign pwr_en_clk_s1_readdata_from_sa = pwr_en_clk_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pwr_en_clk_s1_readdata_from_sa = pwr_en_clk_s1_readdata;

  assign cpu_data_master_requests_pwr_en_clk_s1 = ({cpu_data_master_address_to_slave[22 : 4] , 4'b0} == 23'ha0) & (cpu_data_master_read | cpu_data_master_write);
  //pwr_en_clk_s1_arb_share_counter set values, which is an e_mux
  assign pwr_en_clk_s1_arb_share_set_values = 1;

  //pwr_en_clk_s1_non_bursting_master_requests mux, which is an e_mux
  assign pwr_en_clk_s1_non_bursting_master_requests = cpu_data_master_requests_pwr_en_clk_s1;

  //pwr_en_clk_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pwr_en_clk_s1_any_bursting_master_saved_grant = 0;

  //pwr_en_clk_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pwr_en_clk_s1_arb_share_counter_next_value = pwr_en_clk_s1_firsttransfer ? (pwr_en_clk_s1_arb_share_set_values - 1) : |pwr_en_clk_s1_arb_share_counter ? (pwr_en_clk_s1_arb_share_counter - 1) : 0;

  //pwr_en_clk_s1_allgrants all slave grants, which is an e_mux
  assign pwr_en_clk_s1_allgrants = |pwr_en_clk_s1_grant_vector;

  //pwr_en_clk_s1_end_xfer assignment, which is an e_assign
  assign pwr_en_clk_s1_end_xfer = ~(pwr_en_clk_s1_waits_for_read | pwr_en_clk_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pwr_en_clk_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pwr_en_clk_s1 = pwr_en_clk_s1_end_xfer & (~pwr_en_clk_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pwr_en_clk_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pwr_en_clk_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pwr_en_clk_s1 & pwr_en_clk_s1_allgrants) | (end_xfer_arb_share_counter_term_pwr_en_clk_s1 & ~pwr_en_clk_s1_non_bursting_master_requests);

  //pwr_en_clk_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pwr_en_clk_s1_arb_share_counter <= 0;
      else if (pwr_en_clk_s1_arb_counter_enable)
          pwr_en_clk_s1_arb_share_counter <= pwr_en_clk_s1_arb_share_counter_next_value;
    end


  //pwr_en_clk_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pwr_en_clk_s1_slavearbiterlockenable <= 0;
      else if ((|pwr_en_clk_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pwr_en_clk_s1) | (end_xfer_arb_share_counter_term_pwr_en_clk_s1 & ~pwr_en_clk_s1_non_bursting_master_requests))
          pwr_en_clk_s1_slavearbiterlockenable <= |pwr_en_clk_s1_arb_share_counter_next_value;
    end


  //cpu/data_master pwr_en_clk/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pwr_en_clk_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pwr_en_clk_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pwr_en_clk_s1_slavearbiterlockenable2 = |pwr_en_clk_s1_arb_share_counter_next_value;

  //cpu/data_master pwr_en_clk/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pwr_en_clk_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pwr_en_clk_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pwr_en_clk_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pwr_en_clk_s1 = cpu_data_master_requests_pwr_en_clk_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //pwr_en_clk_s1_writedata mux, which is an e_mux
  assign pwr_en_clk_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_pwr_en_clk_s1 = cpu_data_master_qualified_request_pwr_en_clk_s1;

  //cpu/data_master saved-grant pwr_en_clk/s1, which is an e_assign
  assign cpu_data_master_saved_grant_pwr_en_clk_s1 = cpu_data_master_requests_pwr_en_clk_s1;

  //allow new arb cycle for pwr_en_clk/s1, which is an e_assign
  assign pwr_en_clk_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pwr_en_clk_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pwr_en_clk_s1_master_qreq_vector = 1;

  //pwr_en_clk_s1_reset_n assignment, which is an e_assign
  assign pwr_en_clk_s1_reset_n = reset_n;

  assign pwr_en_clk_s1_chipselect = cpu_data_master_granted_pwr_en_clk_s1;
  //pwr_en_clk_s1_firsttransfer first transaction, which is an e_assign
  assign pwr_en_clk_s1_firsttransfer = pwr_en_clk_s1_begins_xfer ? pwr_en_clk_s1_unreg_firsttransfer : pwr_en_clk_s1_reg_firsttransfer;

  //pwr_en_clk_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pwr_en_clk_s1_unreg_firsttransfer = ~(pwr_en_clk_s1_slavearbiterlockenable & pwr_en_clk_s1_any_continuerequest);

  //pwr_en_clk_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pwr_en_clk_s1_reg_firsttransfer <= 1'b1;
      else if (pwr_en_clk_s1_begins_xfer)
          pwr_en_clk_s1_reg_firsttransfer <= pwr_en_clk_s1_unreg_firsttransfer;
    end


  //pwr_en_clk_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pwr_en_clk_s1_beginbursttransfer_internal = pwr_en_clk_s1_begins_xfer;

  //~pwr_en_clk_s1_write_n assignment, which is an e_mux
  assign pwr_en_clk_s1_write_n = ~(cpu_data_master_granted_pwr_en_clk_s1 & cpu_data_master_write);

  assign shifted_address_to_pwr_en_clk_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pwr_en_clk_s1_address mux, which is an e_mux
  assign pwr_en_clk_s1_address = shifted_address_to_pwr_en_clk_s1_from_cpu_data_master >> 2;

  //d1_pwr_en_clk_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pwr_en_clk_s1_end_xfer <= 1;
      else 
        d1_pwr_en_clk_s1_end_xfer <= pwr_en_clk_s1_end_xfer;
    end


  //pwr_en_clk_s1_waits_for_read in a cycle, which is an e_mux
  assign pwr_en_clk_s1_waits_for_read = pwr_en_clk_s1_in_a_read_cycle & pwr_en_clk_s1_begins_xfer;

  //pwr_en_clk_s1_in_a_read_cycle assignment, which is an e_assign
  assign pwr_en_clk_s1_in_a_read_cycle = cpu_data_master_granted_pwr_en_clk_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pwr_en_clk_s1_in_a_read_cycle;

  //pwr_en_clk_s1_waits_for_write in a cycle, which is an e_mux
  assign pwr_en_clk_s1_waits_for_write = pwr_en_clk_s1_in_a_write_cycle & 0;

  //pwr_en_clk_s1_in_a_write_cycle assignment, which is an e_assign
  assign pwr_en_clk_s1_in_a_write_cycle = cpu_data_master_granted_pwr_en_clk_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pwr_en_clk_s1_in_a_write_cycle;

  assign wait_for_pwr_en_clk_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pwr_en_clk/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_timer_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  cpu_data_master_address_to_slave,
                                  cpu_data_master_read,
                                  cpu_data_master_waitrequest,
                                  cpu_data_master_write,
                                  cpu_data_master_writedata,
                                  reset_n,
                                  sys_timer_s1_irq,
                                  sys_timer_s1_readdata,

                                 // outputs:
                                  cpu_data_master_granted_sys_timer_s1,
                                  cpu_data_master_qualified_request_sys_timer_s1,
                                  cpu_data_master_read_data_valid_sys_timer_s1,
                                  cpu_data_master_requests_sys_timer_s1,
                                  d1_sys_timer_s1_end_xfer,
                                  sys_timer_s1_address,
                                  sys_timer_s1_chipselect,
                                  sys_timer_s1_irq_from_sa,
                                  sys_timer_s1_readdata_from_sa,
                                  sys_timer_s1_reset_n,
                                  sys_timer_s1_write_n,
                                  sys_timer_s1_writedata
                               )
;

  output           cpu_data_master_granted_sys_timer_s1;
  output           cpu_data_master_qualified_request_sys_timer_s1;
  output           cpu_data_master_read_data_valid_sys_timer_s1;
  output           cpu_data_master_requests_sys_timer_s1;
  output           d1_sys_timer_s1_end_xfer;
  output  [  2: 0] sys_timer_s1_address;
  output           sys_timer_s1_chipselect;
  output           sys_timer_s1_irq_from_sa;
  output  [ 15: 0] sys_timer_s1_readdata_from_sa;
  output           sys_timer_s1_reset_n;
  output           sys_timer_s1_write_n;
  output  [ 15: 0] sys_timer_s1_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            sys_timer_s1_irq;
  input   [ 15: 0] sys_timer_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sys_timer_s1;
  wire             cpu_data_master_qualified_request_sys_timer_s1;
  wire             cpu_data_master_read_data_valid_sys_timer_s1;
  wire             cpu_data_master_requests_sys_timer_s1;
  wire             cpu_data_master_saved_grant_sys_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sys_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sys_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 22: 0] shifted_address_to_sys_timer_s1_from_cpu_data_master;
  wire    [  2: 0] sys_timer_s1_address;
  wire             sys_timer_s1_allgrants;
  wire             sys_timer_s1_allow_new_arb_cycle;
  wire             sys_timer_s1_any_bursting_master_saved_grant;
  wire             sys_timer_s1_any_continuerequest;
  wire             sys_timer_s1_arb_counter_enable;
  reg     [  1: 0] sys_timer_s1_arb_share_counter;
  wire    [  1: 0] sys_timer_s1_arb_share_counter_next_value;
  wire    [  1: 0] sys_timer_s1_arb_share_set_values;
  wire             sys_timer_s1_beginbursttransfer_internal;
  wire             sys_timer_s1_begins_xfer;
  wire             sys_timer_s1_chipselect;
  wire             sys_timer_s1_end_xfer;
  wire             sys_timer_s1_firsttransfer;
  wire             sys_timer_s1_grant_vector;
  wire             sys_timer_s1_in_a_read_cycle;
  wire             sys_timer_s1_in_a_write_cycle;
  wire             sys_timer_s1_irq_from_sa;
  wire             sys_timer_s1_master_qreq_vector;
  wire             sys_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] sys_timer_s1_readdata_from_sa;
  reg              sys_timer_s1_reg_firsttransfer;
  wire             sys_timer_s1_reset_n;
  reg              sys_timer_s1_slavearbiterlockenable;
  wire             sys_timer_s1_slavearbiterlockenable2;
  wire             sys_timer_s1_unreg_firsttransfer;
  wire             sys_timer_s1_waits_for_read;
  wire             sys_timer_s1_waits_for_write;
  wire             sys_timer_s1_write_n;
  wire    [ 15: 0] sys_timer_s1_writedata;
  wire             wait_for_sys_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sys_timer_s1_end_xfer;
    end


  assign sys_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sys_timer_s1));
  //assign sys_timer_s1_readdata_from_sa = sys_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_timer_s1_readdata_from_sa = sys_timer_s1_readdata;

  assign cpu_data_master_requests_sys_timer_s1 = ({cpu_data_master_address_to_slave[22 : 5] , 5'b0} == 23'h40) & (cpu_data_master_read | cpu_data_master_write);
  //sys_timer_s1_arb_share_counter set values, which is an e_mux
  assign sys_timer_s1_arb_share_set_values = 1;

  //sys_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign sys_timer_s1_non_bursting_master_requests = cpu_data_master_requests_sys_timer_s1;

  //sys_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sys_timer_s1_any_bursting_master_saved_grant = 0;

  //sys_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sys_timer_s1_arb_share_counter_next_value = sys_timer_s1_firsttransfer ? (sys_timer_s1_arb_share_set_values - 1) : |sys_timer_s1_arb_share_counter ? (sys_timer_s1_arb_share_counter - 1) : 0;

  //sys_timer_s1_allgrants all slave grants, which is an e_mux
  assign sys_timer_s1_allgrants = |sys_timer_s1_grant_vector;

  //sys_timer_s1_end_xfer assignment, which is an e_assign
  assign sys_timer_s1_end_xfer = ~(sys_timer_s1_waits_for_read | sys_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sys_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sys_timer_s1 = sys_timer_s1_end_xfer & (~sys_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sys_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sys_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sys_timer_s1 & sys_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_sys_timer_s1 & ~sys_timer_s1_non_bursting_master_requests);

  //sys_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_timer_s1_arb_share_counter <= 0;
      else if (sys_timer_s1_arb_counter_enable)
          sys_timer_s1_arb_share_counter <= sys_timer_s1_arb_share_counter_next_value;
    end


  //sys_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_timer_s1_slavearbiterlockenable <= 0;
      else if ((|sys_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sys_timer_s1) | (end_xfer_arb_share_counter_term_sys_timer_s1 & ~sys_timer_s1_non_bursting_master_requests))
          sys_timer_s1_slavearbiterlockenable <= |sys_timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sys_timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sys_timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sys_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sys_timer_s1_slavearbiterlockenable2 = |sys_timer_s1_arb_share_counter_next_value;

  //cpu/data_master sys_timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sys_timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sys_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sys_timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sys_timer_s1 = cpu_data_master_requests_sys_timer_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //sys_timer_s1_writedata mux, which is an e_mux
  assign sys_timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sys_timer_s1 = cpu_data_master_qualified_request_sys_timer_s1;

  //cpu/data_master saved-grant sys_timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sys_timer_s1 = cpu_data_master_requests_sys_timer_s1;

  //allow new arb cycle for sys_timer/s1, which is an e_assign
  assign sys_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sys_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sys_timer_s1_master_qreq_vector = 1;

  //sys_timer_s1_reset_n assignment, which is an e_assign
  assign sys_timer_s1_reset_n = reset_n;

  assign sys_timer_s1_chipselect = cpu_data_master_granted_sys_timer_s1;
  //sys_timer_s1_firsttransfer first transaction, which is an e_assign
  assign sys_timer_s1_firsttransfer = sys_timer_s1_begins_xfer ? sys_timer_s1_unreg_firsttransfer : sys_timer_s1_reg_firsttransfer;

  //sys_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sys_timer_s1_unreg_firsttransfer = ~(sys_timer_s1_slavearbiterlockenable & sys_timer_s1_any_continuerequest);

  //sys_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_timer_s1_reg_firsttransfer <= 1'b1;
      else if (sys_timer_s1_begins_xfer)
          sys_timer_s1_reg_firsttransfer <= sys_timer_s1_unreg_firsttransfer;
    end


  //sys_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sys_timer_s1_beginbursttransfer_internal = sys_timer_s1_begins_xfer;

  //~sys_timer_s1_write_n assignment, which is an e_mux
  assign sys_timer_s1_write_n = ~(cpu_data_master_granted_sys_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_sys_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sys_timer_s1_address mux, which is an e_mux
  assign sys_timer_s1_address = shifted_address_to_sys_timer_s1_from_cpu_data_master >> 2;

  //d1_sys_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sys_timer_s1_end_xfer <= 1;
      else 
        d1_sys_timer_s1_end_xfer <= sys_timer_s1_end_xfer;
    end


  //sys_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign sys_timer_s1_waits_for_read = sys_timer_s1_in_a_read_cycle & sys_timer_s1_begins_xfer;

  //sys_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign sys_timer_s1_in_a_read_cycle = cpu_data_master_granted_sys_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sys_timer_s1_in_a_read_cycle;

  //sys_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign sys_timer_s1_waits_for_write = sys_timer_s1_in_a_write_cycle & 0;

  //sys_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign sys_timer_s1_in_a_write_cycle = cpu_data_master_granted_sys_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sys_timer_s1_in_a_write_cycle;

  assign wait_for_sys_timer_s1_counter = 0;
  //assign sys_timer_s1_irq_from_sa = sys_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_timer_s1_irq_from_sa = sys_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sys_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_read,
                                         cpu_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_data_master_granted_sysid_control_slave,
                                         cpu_data_master_qualified_request_sysid_control_slave,
                                         cpu_data_master_read_data_valid_sysid_control_slave,
                                         cpu_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_data_master_granted_sysid_control_slave;
  output           cpu_data_master_qualified_request_sysid_control_slave;
  output           cpu_data_master_read_data_valid_sysid_control_slave;
  output           cpu_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 22: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[22 : 3] , 3'b0} == 23'h20) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign cpu_data_master_granted_sysid_control_slave = cpu_data_master_qualified_request_sysid_control_slave;

  //cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_0_avalon_slave_arbitrator (
                                                    // inputs:
                                                     ADAS3022_0_avalon_master_address_to_slave,
                                                     ADAS3022_0_avalon_master_write,
                                                     ADAS3022_0_avalon_master_writedata,
                                                     clk,
                                                     cpu_data_master_address_to_slave,
                                                     cpu_data_master_byteenable,
                                                     cpu_data_master_dbs_address,
                                                     cpu_data_master_dbs_write_16,
                                                     cpu_data_master_no_byte_enables_and_last_term,
                                                     cpu_data_master_read,
                                                     cpu_data_master_waitrequest,
                                                     cpu_data_master_write,
                                                     cpu_instruction_master_address_to_slave,
                                                     cpu_instruction_master_dbs_address,
                                                     cpu_instruction_master_read,
                                                     mm_console_master_dbs_address,
                                                     mm_console_master_dbs_write_16,
                                                     mm_console_master_latency_counter,
                                                     mm_console_master_master_address_to_slave,
                                                     mm_console_master_master_byteenable,
                                                     mm_console_master_master_read,
                                                     mm_console_master_master_write,
                                                     reset_n,

                                                    // outputs:
                                                     ADAS3022_0_avalon_master_granted_sram_s1,
                                                     ADAS3022_0_avalon_master_qualified_request_sram_s1,
                                                     ADAS3022_0_avalon_master_requests_sram_s1,
                                                     cpu_data_master_byteenable_sram_s1,
                                                     cpu_data_master_granted_sram_s1,
                                                     cpu_data_master_qualified_request_sram_s1,
                                                     cpu_data_master_read_data_valid_sram_s1,
                                                     cpu_data_master_requests_sram_s1,
                                                     cpu_instruction_master_granted_sram_s1,
                                                     cpu_instruction_master_qualified_request_sram_s1,
                                                     cpu_instruction_master_read_data_valid_sram_s1,
                                                     cpu_instruction_master_requests_sram_s1,
                                                     d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                                     incoming_tri_state_bridge_0_data,
                                                     incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
                                                     mm_console_master_byteenable_sram_s1,
                                                     mm_console_master_granted_sram_s1,
                                                     mm_console_master_qualified_request_sram_s1,
                                                     mm_console_master_read_data_valid_sram_s1,
                                                     mm_console_master_requests_sram_s1,
                                                     registered_cpu_data_master_read_data_valid_sram_s1,
                                                     select_n_to_the_sram,
                                                     tri_state_bridge_0_address,
                                                     tri_state_bridge_0_data,
                                                     tri_state_bridge_0_readn,
                                                     tri_state_bridge_0_writen
                                                  )
;

  output           ADAS3022_0_avalon_master_granted_sram_s1;
  output           ADAS3022_0_avalon_master_qualified_request_sram_s1;
  output           ADAS3022_0_avalon_master_requests_sram_s1;
  output  [  1: 0] cpu_data_master_byteenable_sram_s1;
  output           cpu_data_master_granted_sram_s1;
  output           cpu_data_master_qualified_request_sram_s1;
  output           cpu_data_master_read_data_valid_sram_s1;
  output           cpu_data_master_requests_sram_s1;
  output           cpu_instruction_master_granted_sram_s1;
  output           cpu_instruction_master_qualified_request_sram_s1;
  output           cpu_instruction_master_read_data_valid_sram_s1;
  output           cpu_instruction_master_requests_sram_s1;
  output           d1_tri_state_bridge_0_avalon_slave_end_xfer;
  output  [ 15: 0] incoming_tri_state_bridge_0_data;
  output  [ 15: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  output  [  1: 0] mm_console_master_byteenable_sram_s1;
  output           mm_console_master_granted_sram_s1;
  output           mm_console_master_qualified_request_sram_s1;
  output           mm_console_master_read_data_valid_sram_s1;
  output           mm_console_master_requests_sram_s1;
  output           registered_cpu_data_master_read_data_valid_sram_s1;
  output           select_n_to_the_sram;
  output  [ 21: 0] tri_state_bridge_0_address;
  inout   [ 15: 0] tri_state_bridge_0_data;
  output           tri_state_bridge_0_readn;
  output           tri_state_bridge_0_writen;
  input   [ 31: 0] ADAS3022_0_avalon_master_address_to_slave;
  input            ADAS3022_0_avalon_master_write;
  input   [ 15: 0] ADAS3022_0_avalon_master_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 22: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input            cpu_instruction_master_read;
  input   [  1: 0] mm_console_master_dbs_address;
  input   [ 15: 0] mm_console_master_dbs_write_16;
  input   [  1: 0] mm_console_master_latency_counter;
  input   [ 31: 0] mm_console_master_master_address_to_slave;
  input   [  3: 0] mm_console_master_master_byteenable;
  input            mm_console_master_master_read;
  input            mm_console_master_master_write;
  input            reset_n;

  wire             ADAS3022_0_avalon_master_arbiterlock;
  wire             ADAS3022_0_avalon_master_arbiterlock2;
  wire             ADAS3022_0_avalon_master_continuerequest;
  wire             ADAS3022_0_avalon_master_granted_sram_s1;
  wire             ADAS3022_0_avalon_master_qualified_request_sram_s1;
  wire             ADAS3022_0_avalon_master_requests_sram_s1;
  wire             ADAS3022_0_avalon_master_saved_grant_sram_s1;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sram_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sram_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sram_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sram_s1;
  wire             cpu_data_master_qualified_request_sram_s1;
  wire             cpu_data_master_read_data_valid_sram_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_sram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_sram_s1_shift_register_in;
  wire             cpu_data_master_requests_sram_s1;
  wire             cpu_data_master_saved_grant_sram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sram_s1;
  wire             cpu_instruction_master_qualified_request_sram_s1;
  wire             cpu_instruction_master_read_data_valid_sram_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_sram_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_sram_s1_shift_register_in;
  wire             cpu_instruction_master_requests_sram_s1;
  wire             cpu_instruction_master_saved_grant_sram_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 15: 0] d1_outgoing_tri_state_bridge_0_data /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_0_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 15: 0] incoming_tri_state_bridge_0_data /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_tri_state_bridge_0_data_bit_0_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_10_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_11_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_12_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_13_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_14_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_15_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_1_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_2_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_3_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_4_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_5_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_6_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_7_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_8_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_9_is_x;
  wire    [ 15: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  reg              last_cycle_ADAS3022_0_avalon_master_granted_slave_sram_s1;
  reg              last_cycle_cpu_data_master_granted_slave_sram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_sram_s1;
  reg              last_cycle_mm_console_master_master_granted_slave_sram_s1;
  wire    [  1: 0] mm_console_master_byteenable_sram_s1;
  wire    [  1: 0] mm_console_master_byteenable_sram_s1_segment_0;
  wire    [  1: 0] mm_console_master_byteenable_sram_s1_segment_1;
  wire             mm_console_master_granted_sram_s1;
  wire             mm_console_master_master_arbiterlock;
  wire             mm_console_master_master_arbiterlock2;
  wire             mm_console_master_master_continuerequest;
  wire             mm_console_master_qualified_request_sram_s1;
  wire             mm_console_master_read_data_valid_sram_s1;
  reg     [  1: 0] mm_console_master_read_data_valid_sram_s1_shift_register;
  wire             mm_console_master_read_data_valid_sram_s1_shift_register_in;
  wire             mm_console_master_requests_sram_s1;
  wire             mm_console_master_saved_grant_sram_s1;
  wire    [ 15: 0] outgoing_tri_state_bridge_0_data;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_sram_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_sram_s1_shift_register;
  wire    [  1: 0] p1_mm_console_master_read_data_valid_sram_s1_shift_register;
  wire             p1_select_n_to_the_sram;
  wire    [ 21: 0] p1_tri_state_bridge_0_address;
  wire             p1_tri_state_bridge_0_readn;
  wire             p1_tri_state_bridge_0_writen;
  wire             registered_cpu_data_master_read_data_valid_sram_s1;
  reg              select_n_to_the_sram /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             sram_s1_in_a_read_cycle;
  wire             sram_s1_in_a_write_cycle;
  wire             sram_s1_waits_for_read;
  wire             sram_s1_waits_for_write;
  wire             sram_s1_with_write_latency;
  wire             time_to_write;
  reg     [ 21: 0] tri_state_bridge_0_address /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             tri_state_bridge_0_avalon_slave_allgrants;
  wire             tri_state_bridge_0_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_0_avalon_slave_any_continuerequest;
  reg     [  3: 0] tri_state_bridge_0_avalon_slave_arb_addend;
  wire             tri_state_bridge_0_avalon_slave_arb_counter_enable;
  reg     [  1: 0] tri_state_bridge_0_avalon_slave_arb_share_counter;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_arb_share_set_values;
  wire    [  3: 0] tri_state_bridge_0_avalon_slave_arb_winner;
  wire             tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_0_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_0_avalon_slave_begins_xfer;
  wire    [  7: 0] tri_state_bridge_0_avalon_slave_chosen_master_double_vector;
  wire    [  3: 0] tri_state_bridge_0_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_0_avalon_slave_end_xfer;
  wire             tri_state_bridge_0_avalon_slave_firsttransfer;
  wire    [  3: 0] tri_state_bridge_0_avalon_slave_grant_vector;
  wire    [  3: 0] tri_state_bridge_0_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_0_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_0_avalon_slave_read_pending;
  reg              tri_state_bridge_0_avalon_slave_reg_firsttransfer;
  reg     [  3: 0] tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_0_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_0_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_0_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_0_avalon_slave_write_pending;
  wire    [ 15: 0] tri_state_bridge_0_data;
  reg              tri_state_bridge_0_readn /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              tri_state_bridge_0_writen /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             wait_for_sram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_0_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_0_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((ADAS3022_0_avalon_master_qualified_request_sram_s1 | cpu_data_master_qualified_request_sram_s1 | cpu_instruction_master_qualified_request_sram_s1 | mm_console_master_qualified_request_sram_s1));
  assign ADAS3022_0_avalon_master_requests_sram_s1 = (({ADAS3022_0_avalon_master_address_to_slave[31 : 22] , 22'b0} == 32'h400000) & (ADAS3022_0_avalon_master_write)) & ADAS3022_0_avalon_master_write;
  //tri_state_bridge_0/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_read_pending = 0;

  //tri_state_bridge_0_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_arb_share_set_values = (cpu_data_master_granted_sram_s1)? 2 :
    (cpu_instruction_master_granted_sram_s1)? 2 :
    (mm_console_master_granted_sram_s1)? 2 :
    (cpu_data_master_granted_sram_s1)? 2 :
    (cpu_instruction_master_granted_sram_s1)? 2 :
    (mm_console_master_granted_sram_s1)? 2 :
    (cpu_data_master_granted_sram_s1)? 2 :
    (cpu_instruction_master_granted_sram_s1)? 2 :
    (mm_console_master_granted_sram_s1)? 2 :
    (cpu_data_master_granted_sram_s1)? 2 :
    (cpu_instruction_master_granted_sram_s1)? 2 :
    (mm_console_master_granted_sram_s1)? 2 :
    1;

  //tri_state_bridge_0_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_non_bursting_master_requests = ADAS3022_0_avalon_master_requests_sram_s1 |
    cpu_data_master_requests_sram_s1 |
    cpu_instruction_master_requests_sram_s1 |
    mm_console_master_requests_sram_s1 |
    ADAS3022_0_avalon_master_requests_sram_s1 |
    cpu_data_master_requests_sram_s1 |
    cpu_instruction_master_requests_sram_s1 |
    mm_console_master_requests_sram_s1 |
    ADAS3022_0_avalon_master_requests_sram_s1 |
    cpu_data_master_requests_sram_s1 |
    cpu_instruction_master_requests_sram_s1 |
    mm_console_master_requests_sram_s1 |
    ADAS3022_0_avalon_master_requests_sram_s1 |
    cpu_data_master_requests_sram_s1 |
    cpu_instruction_master_requests_sram_s1 |
    mm_console_master_requests_sram_s1;

  //tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_0_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_share_counter_next_value = tri_state_bridge_0_avalon_slave_firsttransfer ? (tri_state_bridge_0_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_0_avalon_slave_arb_share_counter ? (tri_state_bridge_0_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_0_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_allgrants = (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector);

  //tri_state_bridge_0_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_end_xfer = ~(sram_s1_waits_for_read | sram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave = tri_state_bridge_0_avalon_slave_end_xfer & (~tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_0_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & tri_state_bridge_0_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & ~tri_state_bridge_0_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_0_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_0_avalon_slave_arb_counter_enable)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_0_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_0_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & ~tri_state_bridge_0_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //ADAS3022_0/avalon_master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign ADAS3022_0_avalon_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & ADAS3022_0_avalon_master_continuerequest;

  //tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;

  //ADAS3022_0/avalon_master tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign ADAS3022_0_avalon_master_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & ADAS3022_0_avalon_master_continuerequest;

  //cpu/data_master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu/data_master tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/data_master granted sram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sram_s1 <= cpu_data_master_saved_grant_sram_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_sram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_sram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_sram_s1 & cpu_data_master_requests_sram_s1) |
    (last_cycle_cpu_data_master_granted_slave_sram_s1 & cpu_data_master_requests_sram_s1) |
    (last_cycle_cpu_data_master_granted_slave_sram_s1 & cpu_data_master_requests_sram_s1);

  //tri_state_bridge_0_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_any_continuerequest = cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest |
    mm_console_master_master_continuerequest |
    ADAS3022_0_avalon_master_continuerequest |
    cpu_instruction_master_continuerequest |
    mm_console_master_master_continuerequest |
    ADAS3022_0_avalon_master_continuerequest |
    cpu_data_master_continuerequest |
    mm_console_master_master_continuerequest |
    ADAS3022_0_avalon_master_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sram_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sram_s1 <= cpu_instruction_master_saved_grant_sram_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_sram_s1 & cpu_instruction_master_requests_sram_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_sram_s1 & cpu_instruction_master_requests_sram_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_sram_s1 & cpu_instruction_master_requests_sram_s1);

  //mm_console_master/master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign mm_console_master_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & mm_console_master_master_continuerequest;

  //mm_console_master/master tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign mm_console_master_master_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & mm_console_master_master_continuerequest;

  //mm_console_master/master granted sram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_mm_console_master_master_granted_slave_sram_s1 <= 0;
      else 
        last_cycle_mm_console_master_master_granted_slave_sram_s1 <= mm_console_master_saved_grant_sram_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~mm_console_master_requests_sram_s1) ? 0 : last_cycle_mm_console_master_master_granted_slave_sram_s1;
    end


  //mm_console_master_master_continuerequest continued request, which is an e_mux
  assign mm_console_master_master_continuerequest = (last_cycle_mm_console_master_master_granted_slave_sram_s1 & mm_console_master_requests_sram_s1) |
    (last_cycle_mm_console_master_master_granted_slave_sram_s1 & mm_console_master_requests_sram_s1) |
    (last_cycle_mm_console_master_master_granted_slave_sram_s1 & mm_console_master_requests_sram_s1);

  assign ADAS3022_0_avalon_master_qualified_request_sram_s1 = ADAS3022_0_avalon_master_requests_sram_s1 & ~(((tri_state_bridge_0_avalon_slave_read_pending) & ADAS3022_0_avalon_master_write) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock | mm_console_master_master_arbiterlock);
  //tri_state_bridge_0_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_tri_state_bridge_0_data <= 0;
      else 
        incoming_tri_state_bridge_0_data <= tri_state_bridge_0_data;
    end


  //sram_s1_with_write_latency assignment, which is an e_assign
  assign sram_s1_with_write_latency = in_a_write_cycle & (ADAS3022_0_avalon_master_qualified_request_sram_s1 | cpu_data_master_qualified_request_sram_s1 | cpu_instruction_master_qualified_request_sram_s1 | mm_console_master_qualified_request_sram_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (sram_s1_with_write_latency)? 1 :
    (sram_s1_with_write_latency)? 1 :
    (sram_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_tri_state_bridge_0_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_tri_state_bridge_0_data <= 0;
      else 
        d1_outgoing_tri_state_bridge_0_data <= outgoing_tri_state_bridge_0_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_tri_state_bridge_0_data tristate driver, which is an e_assign
  assign tri_state_bridge_0_data = (d1_in_a_write_cycle)? d1_outgoing_tri_state_bridge_0_data:{16{1'bz}};

  //outgoing_tri_state_bridge_0_data mux, which is an e_mux
  assign outgoing_tri_state_bridge_0_data = (ADAS3022_0_avalon_master_granted_sram_s1)? ADAS3022_0_avalon_master_writedata :
    (cpu_data_master_granted_sram_s1)? cpu_data_master_dbs_write_16 :
    mm_console_master_dbs_write_16;

  assign cpu_data_master_requests_sram_s1 = ({cpu_data_master_address_to_slave[22] , 22'b0} == 23'h400000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_sram of type chipselect to ~p1_select_n_to_the_sram, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_sram <= ~0;
      else 
        select_n_to_the_sram <= p1_select_n_to_the_sram;
    end


  assign tri_state_bridge_0_avalon_slave_write_pending = 0;
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_sram_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_sram_s1 = cpu_data_master_read_data_valid_sram_s1_shift_register[0];

  //ADAS3022_0/avalon_master granted sram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_ADAS3022_0_avalon_master_granted_slave_sram_s1 <= 0;
      else 
        last_cycle_ADAS3022_0_avalon_master_granted_slave_sram_s1 <= ADAS3022_0_avalon_master_saved_grant_sram_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~ADAS3022_0_avalon_master_requests_sram_s1) ? 0 : last_cycle_ADAS3022_0_avalon_master_granted_slave_sram_s1;
    end


  //ADAS3022_0_avalon_master_continuerequest continued request, which is an e_mux
  assign ADAS3022_0_avalon_master_continuerequest = (last_cycle_ADAS3022_0_avalon_master_granted_slave_sram_s1 & ADAS3022_0_avalon_master_requests_sram_s1) |
    (last_cycle_ADAS3022_0_avalon_master_granted_slave_sram_s1 & ADAS3022_0_avalon_master_requests_sram_s1) |
    (last_cycle_ADAS3022_0_avalon_master_granted_slave_sram_s1 & ADAS3022_0_avalon_master_requests_sram_s1);

  assign cpu_data_master_qualified_request_sram_s1 = cpu_data_master_requests_sram_s1 & ~((cpu_data_master_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (|cpu_data_master_read_data_valid_sram_s1_shift_register))) | ((~cpu_data_master_waitrequest | tri_state_bridge_0_avalon_slave_read_pending | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_sram_s1) & cpu_data_master_write) | ADAS3022_0_avalon_master_arbiterlock | cpu_instruction_master_arbiterlock | mm_console_master_master_arbiterlock);
  //cpu_data_master_read_data_valid_sram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_sram_s1_shift_register_in = cpu_data_master_granted_sram_s1 & cpu_data_master_read & ~sram_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_sram_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_sram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_sram_s1_shift_register = {cpu_data_master_read_data_valid_sram_s1_shift_register, cpu_data_master_read_data_valid_sram_s1_shift_register_in};

  //cpu_data_master_read_data_valid_sram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_sram_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_sram_s1_shift_register <= p1_cpu_data_master_read_data_valid_sram_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_sram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_sram_s1 = cpu_data_master_read_data_valid_sram_s1_shift_register[1];

  assign cpu_instruction_master_requests_sram_s1 = (({cpu_instruction_master_address_to_slave[22] , 22'b0} == 23'h400000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  assign cpu_instruction_master_qualified_request_sram_s1 = cpu_instruction_master_requests_sram_s1 & ~((cpu_instruction_master_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (|cpu_instruction_master_read_data_valid_sram_s1_shift_register))) | ADAS3022_0_avalon_master_arbiterlock | cpu_data_master_arbiterlock | mm_console_master_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_sram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sram_s1_shift_register_in = cpu_instruction_master_granted_sram_s1 & cpu_instruction_master_read & ~sram_s1_waits_for_read & ~(|cpu_instruction_master_read_data_valid_sram_s1_shift_register);

  //shift register p1 cpu_instruction_master_read_data_valid_sram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_sram_s1_shift_register = {cpu_instruction_master_read_data_valid_sram_s1_shift_register, cpu_instruction_master_read_data_valid_sram_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_sram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_sram_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_sram_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_sram_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_sram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sram_s1 = cpu_instruction_master_read_data_valid_sram_s1_shift_register[1];

  assign mm_console_master_requests_sram_s1 = ({mm_console_master_master_address_to_slave[31 : 22] , 22'b0} == 32'h400000) & (mm_console_master_master_read | mm_console_master_master_write);
  assign mm_console_master_qualified_request_sram_s1 = mm_console_master_requests_sram_s1 & ~((mm_console_master_master_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (2 < mm_console_master_latency_counter))) | ((tri_state_bridge_0_avalon_slave_read_pending | !mm_console_master_byteenable_sram_s1) & mm_console_master_master_write) | ADAS3022_0_avalon_master_arbiterlock | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock);
  //mm_console_master_read_data_valid_sram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign mm_console_master_read_data_valid_sram_s1_shift_register_in = mm_console_master_granted_sram_s1 & mm_console_master_master_read & ~sram_s1_waits_for_read;

  //shift register p1 mm_console_master_read_data_valid_sram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_mm_console_master_read_data_valid_sram_s1_shift_register = {mm_console_master_read_data_valid_sram_s1_shift_register, mm_console_master_read_data_valid_sram_s1_shift_register_in};

  //mm_console_master_read_data_valid_sram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mm_console_master_read_data_valid_sram_s1_shift_register <= 0;
      else 
        mm_console_master_read_data_valid_sram_s1_shift_register <= p1_mm_console_master_read_data_valid_sram_s1_shift_register;
    end


  //local readdatavalid mm_console_master_read_data_valid_sram_s1, which is an e_mux
  assign mm_console_master_read_data_valid_sram_s1 = mm_console_master_read_data_valid_sram_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge_0/avalon_slave, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_allow_new_arb_cycle = ~ADAS3022_0_avalon_master_arbiterlock & ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock & ~mm_console_master_master_arbiterlock;

  //mm_console_master/master assignment into master qualified-requests vector for sram/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[0] = mm_console_master_qualified_request_sram_s1;

  //mm_console_master/master grant sram/s1, which is an e_assign
  assign mm_console_master_granted_sram_s1 = tri_state_bridge_0_avalon_slave_grant_vector[0];

  //mm_console_master/master saved-grant sram/s1, which is an e_assign
  assign mm_console_master_saved_grant_sram_s1 = tri_state_bridge_0_avalon_slave_arb_winner[0] && mm_console_master_requests_sram_s1;

  //cpu/instruction_master assignment into master qualified-requests vector for sram/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[1] = cpu_instruction_master_qualified_request_sram_s1;

  //cpu/instruction_master grant sram/s1, which is an e_assign
  assign cpu_instruction_master_granted_sram_s1 = tri_state_bridge_0_avalon_slave_grant_vector[1];

  //cpu/instruction_master saved-grant sram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_sram_s1 = tri_state_bridge_0_avalon_slave_arb_winner[1] && cpu_instruction_master_requests_sram_s1;

  //cpu/data_master assignment into master qualified-requests vector for sram/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[2] = cpu_data_master_qualified_request_sram_s1;

  //cpu/data_master grant sram/s1, which is an e_assign
  assign cpu_data_master_granted_sram_s1 = tri_state_bridge_0_avalon_slave_grant_vector[2];

  //cpu/data_master saved-grant sram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sram_s1 = tri_state_bridge_0_avalon_slave_arb_winner[2] && cpu_data_master_requests_sram_s1;

  //ADAS3022_0/avalon_master assignment into master qualified-requests vector for sram/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[3] = ADAS3022_0_avalon_master_qualified_request_sram_s1;

  //ADAS3022_0/avalon_master grant sram/s1, which is an e_assign
  assign ADAS3022_0_avalon_master_granted_sram_s1 = tri_state_bridge_0_avalon_slave_grant_vector[3];

  //ADAS3022_0/avalon_master saved-grant sram/s1, which is an e_assign
  assign ADAS3022_0_avalon_master_saved_grant_sram_s1 = tri_state_bridge_0_avalon_slave_arb_winner[3] && ADAS3022_0_avalon_master_requests_sram_s1;

  //tri_state_bridge_0/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_double_vector = {tri_state_bridge_0_avalon_slave_master_qreq_vector, tri_state_bridge_0_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_0_avalon_slave_master_qreq_vector, ~tri_state_bridge_0_avalon_slave_master_qreq_vector} + tri_state_bridge_0_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_0_avalon_slave_arb_winner = (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_0_avalon_slave_grant_vector) ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_0_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_0_avalon_slave_grant_vector ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_0_avalon_slave_grant_vector = {(tri_state_bridge_0_avalon_slave_chosen_master_double_vector[3] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[7]),
    (tri_state_bridge_0_avalon_slave_chosen_master_double_vector[2] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[6]),
    (tri_state_bridge_0_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[5]),
    (tri_state_bridge_0_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[4])};

  //tri_state_bridge_0/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_rot_left = (tri_state_bridge_0_avalon_slave_arb_winner << 1) ? (tri_state_bridge_0_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge_0/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_0_avalon_slave_grant_vector)
          tri_state_bridge_0_avalon_slave_arb_addend <= tri_state_bridge_0_avalon_slave_end_xfer? tri_state_bridge_0_avalon_slave_chosen_master_rot_left : tri_state_bridge_0_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_sram = ~(ADAS3022_0_avalon_master_granted_sram_s1 | cpu_data_master_granted_sram_s1 | cpu_instruction_master_granted_sram_s1 | mm_console_master_granted_sram_s1);
  //tri_state_bridge_0_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_firsttransfer = tri_state_bridge_0_avalon_slave_begins_xfer ? tri_state_bridge_0_avalon_slave_unreg_firsttransfer : tri_state_bridge_0_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_0_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_0_avalon_slave_slavearbiterlockenable & tri_state_bridge_0_avalon_slave_any_continuerequest);

  //tri_state_bridge_0_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_0_avalon_slave_begins_xfer)
          tri_state_bridge_0_avalon_slave_reg_firsttransfer <= tri_state_bridge_0_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_0_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_beginbursttransfer_internal = tri_state_bridge_0_avalon_slave_begins_xfer;

  //tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_0_avalon_slave_begins_xfer & tri_state_bridge_0_avalon_slave_firsttransfer;

  //~tri_state_bridge_0_readn of type read to ~p1_tri_state_bridge_0_readn, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_readn <= ~0;
      else 
        tri_state_bridge_0_readn <= p1_tri_state_bridge_0_readn;
    end


  //~p1_tri_state_bridge_0_readn assignment, which is an e_mux
  assign p1_tri_state_bridge_0_readn = ~((cpu_data_master_granted_sram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sram_s1 & cpu_instruction_master_read) | (mm_console_master_granted_sram_s1 & mm_console_master_master_read));

  //~tri_state_bridge_0_writen of type write to ~p1_tri_state_bridge_0_writen, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_writen <= ~0;
      else 
        tri_state_bridge_0_writen <= p1_tri_state_bridge_0_writen;
    end


  //~p1_tri_state_bridge_0_writen assignment, which is an e_mux
  assign p1_tri_state_bridge_0_writen = ~((ADAS3022_0_avalon_master_granted_sram_s1 & ADAS3022_0_avalon_master_write) | (cpu_data_master_granted_sram_s1 & cpu_data_master_write) | (mm_console_master_granted_sram_s1 & mm_console_master_master_write));

  //tri_state_bridge_0_address of type address to p1_tri_state_bridge_0_address, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_address <= 0;
      else 
        tri_state_bridge_0_address <= p1_tri_state_bridge_0_address;
    end


  //p1_tri_state_bridge_0_address mux, which is an e_mux
  assign p1_tri_state_bridge_0_address = (ADAS3022_0_avalon_master_granted_sram_s1)? ADAS3022_0_avalon_master_address_to_slave :
    (cpu_data_master_granted_sram_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}}) :
    (cpu_instruction_master_granted_sram_s1)? ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}}) :
    ({mm_console_master_master_address_to_slave >> 2,
    mm_console_master_dbs_address[1],
    {1 {1'b0}}});

  //d1_tri_state_bridge_0_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_0_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_0_avalon_slave_end_xfer <= tri_state_bridge_0_avalon_slave_end_xfer;
    end


  //sram_s1_waits_for_read in a cycle, which is an e_mux
  assign sram_s1_waits_for_read = sram_s1_in_a_read_cycle & 0;

  //sram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sram_s1_in_a_read_cycle = (cpu_data_master_granted_sram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sram_s1 & cpu_instruction_master_read) | (mm_console_master_granted_sram_s1 & mm_console_master_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_s1_in_a_read_cycle;

  //sram_s1_waits_for_write in a cycle, which is an e_mux
  assign sram_s1_waits_for_write = sram_s1_in_a_write_cycle & 0;

  //sram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sram_s1_in_a_write_cycle = (ADAS3022_0_avalon_master_granted_sram_s1 & ADAS3022_0_avalon_master_write) | (cpu_data_master_granted_sram_s1 & cpu_data_master_write) | (mm_console_master_granted_sram_s1 & mm_console_master_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_s1_in_a_write_cycle;

  assign wait_for_sram_s1_counter = 0;
  assign {cpu_data_master_byteenable_sram_s1_segment_1,
cpu_data_master_byteenable_sram_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sram_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sram_s1_segment_0 :
    cpu_data_master_byteenable_sram_s1_segment_1;

  assign {mm_console_master_byteenable_sram_s1_segment_1,
mm_console_master_byteenable_sram_s1_segment_0} = mm_console_master_master_byteenable;
  assign mm_console_master_byteenable_sram_s1 = ((mm_console_master_dbs_address[1] == 0))? mm_console_master_byteenable_sram_s1_segment_0 :
    mm_console_master_byteenable_sram_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //incoming_tri_state_bridge_0_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_0_is_x = ^(incoming_tri_state_bridge_0_data[0]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[0] = incoming_tri_state_bridge_0_data_bit_0_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[0];

  //incoming_tri_state_bridge_0_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_1_is_x = ^(incoming_tri_state_bridge_0_data[1]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[1] = incoming_tri_state_bridge_0_data_bit_1_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[1];

  //incoming_tri_state_bridge_0_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_2_is_x = ^(incoming_tri_state_bridge_0_data[2]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[2] = incoming_tri_state_bridge_0_data_bit_2_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[2];

  //incoming_tri_state_bridge_0_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_3_is_x = ^(incoming_tri_state_bridge_0_data[3]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[3] = incoming_tri_state_bridge_0_data_bit_3_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[3];

  //incoming_tri_state_bridge_0_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_4_is_x = ^(incoming_tri_state_bridge_0_data[4]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[4] = incoming_tri_state_bridge_0_data_bit_4_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[4];

  //incoming_tri_state_bridge_0_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_5_is_x = ^(incoming_tri_state_bridge_0_data[5]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[5] = incoming_tri_state_bridge_0_data_bit_5_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[5];

  //incoming_tri_state_bridge_0_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_6_is_x = ^(incoming_tri_state_bridge_0_data[6]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[6] = incoming_tri_state_bridge_0_data_bit_6_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[6];

  //incoming_tri_state_bridge_0_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_7_is_x = ^(incoming_tri_state_bridge_0_data[7]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[7] = incoming_tri_state_bridge_0_data_bit_7_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[7];

  //incoming_tri_state_bridge_0_data_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_8_is_x = ^(incoming_tri_state_bridge_0_data[8]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[8] = incoming_tri_state_bridge_0_data_bit_8_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[8];

  //incoming_tri_state_bridge_0_data_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_9_is_x = ^(incoming_tri_state_bridge_0_data[9]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[9] = incoming_tri_state_bridge_0_data_bit_9_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[9];

  //incoming_tri_state_bridge_0_data_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_10_is_x = ^(incoming_tri_state_bridge_0_data[10]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[10] = incoming_tri_state_bridge_0_data_bit_10_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[10];

  //incoming_tri_state_bridge_0_data_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_11_is_x = ^(incoming_tri_state_bridge_0_data[11]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[11] = incoming_tri_state_bridge_0_data_bit_11_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[11];

  //incoming_tri_state_bridge_0_data_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_12_is_x = ^(incoming_tri_state_bridge_0_data[12]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[12] = incoming_tri_state_bridge_0_data_bit_12_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[12];

  //incoming_tri_state_bridge_0_data_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_13_is_x = ^(incoming_tri_state_bridge_0_data[13]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[13] = incoming_tri_state_bridge_0_data_bit_13_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[13];

  //incoming_tri_state_bridge_0_data_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_14_is_x = ^(incoming_tri_state_bridge_0_data[14]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[14] = incoming_tri_state_bridge_0_data_bit_14_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[14];

  //incoming_tri_state_bridge_0_data_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_15_is_x = ^(incoming_tri_state_bridge_0_data[15]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[15] = incoming_tri_state_bridge_0_data_bit_15_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[15];

  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (ADAS3022_0_avalon_master_granted_sram_s1 + cpu_data_master_granted_sram_s1 + cpu_instruction_master_granted_sram_s1 + mm_console_master_granted_sram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (ADAS3022_0_avalon_master_saved_grant_sram_s1 + cpu_data_master_saved_grant_sram_s1 + cpu_instruction_master_saved_grant_sram_s1 + mm_console_master_saved_grant_sram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0 = incoming_tri_state_bridge_0_data;
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_0_bridge_arbitrator 
;



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uC_clock_0_in_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   reset_n,
                                   uC_clock_0_in_endofpacket,
                                   uC_clock_0_in_readdata,
                                   uC_clock_0_in_waitrequest,

                                  // outputs:
                                   cpu_data_master_granted_uC_clock_0_in,
                                   cpu_data_master_qualified_request_uC_clock_0_in,
                                   cpu_data_master_read_data_valid_uC_clock_0_in,
                                   cpu_data_master_requests_uC_clock_0_in,
                                   d1_uC_clock_0_in_end_xfer,
                                   uC_clock_0_in_address,
                                   uC_clock_0_in_byteenable,
                                   uC_clock_0_in_endofpacket_from_sa,
                                   uC_clock_0_in_nativeaddress,
                                   uC_clock_0_in_read,
                                   uC_clock_0_in_readdata_from_sa,
                                   uC_clock_0_in_reset_n,
                                   uC_clock_0_in_waitrequest_from_sa,
                                   uC_clock_0_in_write,
                                   uC_clock_0_in_writedata
                                )
;

  output           cpu_data_master_granted_uC_clock_0_in;
  output           cpu_data_master_qualified_request_uC_clock_0_in;
  output           cpu_data_master_read_data_valid_uC_clock_0_in;
  output           cpu_data_master_requests_uC_clock_0_in;
  output           d1_uC_clock_0_in_end_xfer;
  output  [  3: 0] uC_clock_0_in_address;
  output  [  3: 0] uC_clock_0_in_byteenable;
  output           uC_clock_0_in_endofpacket_from_sa;
  output  [  1: 0] uC_clock_0_in_nativeaddress;
  output           uC_clock_0_in_read;
  output  [ 31: 0] uC_clock_0_in_readdata_from_sa;
  output           uC_clock_0_in_reset_n;
  output           uC_clock_0_in_waitrequest_from_sa;
  output           uC_clock_0_in_write;
  output  [ 31: 0] uC_clock_0_in_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            uC_clock_0_in_endofpacket;
  input   [ 31: 0] uC_clock_0_in_readdata;
  input            uC_clock_0_in_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_uC_clock_0_in;
  wire             cpu_data_master_qualified_request_uC_clock_0_in;
  wire             cpu_data_master_read_data_valid_uC_clock_0_in;
  wire             cpu_data_master_requests_uC_clock_0_in;
  wire             cpu_data_master_saved_grant_uC_clock_0_in;
  reg              d1_reasons_to_wait;
  reg              d1_uC_clock_0_in_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_uC_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] uC_clock_0_in_address;
  wire             uC_clock_0_in_allgrants;
  wire             uC_clock_0_in_allow_new_arb_cycle;
  wire             uC_clock_0_in_any_bursting_master_saved_grant;
  wire             uC_clock_0_in_any_continuerequest;
  wire             uC_clock_0_in_arb_counter_enable;
  reg     [  1: 0] uC_clock_0_in_arb_share_counter;
  wire    [  1: 0] uC_clock_0_in_arb_share_counter_next_value;
  wire    [  1: 0] uC_clock_0_in_arb_share_set_values;
  wire             uC_clock_0_in_beginbursttransfer_internal;
  wire             uC_clock_0_in_begins_xfer;
  wire    [  3: 0] uC_clock_0_in_byteenable;
  wire             uC_clock_0_in_end_xfer;
  wire             uC_clock_0_in_endofpacket_from_sa;
  wire             uC_clock_0_in_firsttransfer;
  wire             uC_clock_0_in_grant_vector;
  wire             uC_clock_0_in_in_a_read_cycle;
  wire             uC_clock_0_in_in_a_write_cycle;
  wire             uC_clock_0_in_master_qreq_vector;
  wire    [  1: 0] uC_clock_0_in_nativeaddress;
  wire             uC_clock_0_in_non_bursting_master_requests;
  wire             uC_clock_0_in_read;
  wire    [ 31: 0] uC_clock_0_in_readdata_from_sa;
  reg              uC_clock_0_in_reg_firsttransfer;
  wire             uC_clock_0_in_reset_n;
  reg              uC_clock_0_in_slavearbiterlockenable;
  wire             uC_clock_0_in_slavearbiterlockenable2;
  wire             uC_clock_0_in_unreg_firsttransfer;
  wire             uC_clock_0_in_waitrequest_from_sa;
  wire             uC_clock_0_in_waits_for_read;
  wire             uC_clock_0_in_waits_for_write;
  wire             uC_clock_0_in_write;
  wire    [ 31: 0] uC_clock_0_in_writedata;
  wire             wait_for_uC_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~uC_clock_0_in_end_xfer;
    end


  assign uC_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_uC_clock_0_in));
  //assign uC_clock_0_in_readdata_from_sa = uC_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uC_clock_0_in_readdata_from_sa = uC_clock_0_in_readdata;

  assign cpu_data_master_requests_uC_clock_0_in = ({cpu_data_master_address_to_slave[22 : 4] , 4'b0} == 23'h0) & (cpu_data_master_read | cpu_data_master_write);
  //assign uC_clock_0_in_waitrequest_from_sa = uC_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uC_clock_0_in_waitrequest_from_sa = uC_clock_0_in_waitrequest;

  //uC_clock_0_in_arb_share_counter set values, which is an e_mux
  assign uC_clock_0_in_arb_share_set_values = 1;

  //uC_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign uC_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_uC_clock_0_in;

  //uC_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign uC_clock_0_in_any_bursting_master_saved_grant = 0;

  //uC_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign uC_clock_0_in_arb_share_counter_next_value = uC_clock_0_in_firsttransfer ? (uC_clock_0_in_arb_share_set_values - 1) : |uC_clock_0_in_arb_share_counter ? (uC_clock_0_in_arb_share_counter - 1) : 0;

  //uC_clock_0_in_allgrants all slave grants, which is an e_mux
  assign uC_clock_0_in_allgrants = |uC_clock_0_in_grant_vector;

  //uC_clock_0_in_end_xfer assignment, which is an e_assign
  assign uC_clock_0_in_end_xfer = ~(uC_clock_0_in_waits_for_read | uC_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_uC_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_uC_clock_0_in = uC_clock_0_in_end_xfer & (~uC_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //uC_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign uC_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_uC_clock_0_in & uC_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_uC_clock_0_in & ~uC_clock_0_in_non_bursting_master_requests);

  //uC_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_in_arb_share_counter <= 0;
      else if (uC_clock_0_in_arb_counter_enable)
          uC_clock_0_in_arb_share_counter <= uC_clock_0_in_arb_share_counter_next_value;
    end


  //uC_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|uC_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_uC_clock_0_in) | (end_xfer_arb_share_counter_term_uC_clock_0_in & ~uC_clock_0_in_non_bursting_master_requests))
          uC_clock_0_in_slavearbiterlockenable <= |uC_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master uC_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = uC_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //uC_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign uC_clock_0_in_slavearbiterlockenable2 = |uC_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master uC_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = uC_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //uC_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign uC_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_uC_clock_0_in = cpu_data_master_requests_uC_clock_0_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //uC_clock_0_in_writedata mux, which is an e_mux
  assign uC_clock_0_in_writedata = cpu_data_master_writedata;

  //assign uC_clock_0_in_endofpacket_from_sa = uC_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uC_clock_0_in_endofpacket_from_sa = uC_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_uC_clock_0_in = cpu_data_master_qualified_request_uC_clock_0_in;

  //cpu/data_master saved-grant uC_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_uC_clock_0_in = cpu_data_master_requests_uC_clock_0_in;

  //allow new arb cycle for uC_clock_0/in, which is an e_assign
  assign uC_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign uC_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign uC_clock_0_in_master_qreq_vector = 1;

  //uC_clock_0_in_reset_n assignment, which is an e_assign
  assign uC_clock_0_in_reset_n = reset_n;

  //uC_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign uC_clock_0_in_firsttransfer = uC_clock_0_in_begins_xfer ? uC_clock_0_in_unreg_firsttransfer : uC_clock_0_in_reg_firsttransfer;

  //uC_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign uC_clock_0_in_unreg_firsttransfer = ~(uC_clock_0_in_slavearbiterlockenable & uC_clock_0_in_any_continuerequest);

  //uC_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (uC_clock_0_in_begins_xfer)
          uC_clock_0_in_reg_firsttransfer <= uC_clock_0_in_unreg_firsttransfer;
    end


  //uC_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign uC_clock_0_in_beginbursttransfer_internal = uC_clock_0_in_begins_xfer;

  //uC_clock_0_in_read assignment, which is an e_mux
  assign uC_clock_0_in_read = cpu_data_master_granted_uC_clock_0_in & cpu_data_master_read;

  //uC_clock_0_in_write assignment, which is an e_mux
  assign uC_clock_0_in_write = cpu_data_master_granted_uC_clock_0_in & cpu_data_master_write;

  //uC_clock_0_in_address mux, which is an e_mux
  assign uC_clock_0_in_address = cpu_data_master_address_to_slave;

  //slaveid uC_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign uC_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_uC_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_uC_clock_0_in_end_xfer <= 1;
      else 
        d1_uC_clock_0_in_end_xfer <= uC_clock_0_in_end_xfer;
    end


  //uC_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign uC_clock_0_in_waits_for_read = uC_clock_0_in_in_a_read_cycle & uC_clock_0_in_waitrequest_from_sa;

  //uC_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign uC_clock_0_in_in_a_read_cycle = cpu_data_master_granted_uC_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = uC_clock_0_in_in_a_read_cycle;

  //uC_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign uC_clock_0_in_waits_for_write = uC_clock_0_in_in_a_write_cycle & uC_clock_0_in_waitrequest_from_sa;

  //uC_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign uC_clock_0_in_in_a_write_cycle = cpu_data_master_granted_uC_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = uC_clock_0_in_in_a_write_cycle;

  assign wait_for_uC_clock_0_in_counter = 0;
  //uC_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign uC_clock_0_in_byteenable = (cpu_data_master_granted_uC_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uC_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uC_clock_0_out_arbitrator (
                                   // inputs:
                                    clk,
                                    d1_pll_pll_slave_end_xfer,
                                    pll_pll_slave_readdata_from_sa,
                                    reset_n,
                                    uC_clock_0_out_address,
                                    uC_clock_0_out_byteenable,
                                    uC_clock_0_out_granted_pll_pll_slave,
                                    uC_clock_0_out_qualified_request_pll_pll_slave,
                                    uC_clock_0_out_read,
                                    uC_clock_0_out_read_data_valid_pll_pll_slave,
                                    uC_clock_0_out_requests_pll_pll_slave,
                                    uC_clock_0_out_write,
                                    uC_clock_0_out_writedata,

                                   // outputs:
                                    uC_clock_0_out_address_to_slave,
                                    uC_clock_0_out_readdata,
                                    uC_clock_0_out_reset_n,
                                    uC_clock_0_out_waitrequest
                                 )
;

  output  [  3: 0] uC_clock_0_out_address_to_slave;
  output  [ 31: 0] uC_clock_0_out_readdata;
  output           uC_clock_0_out_reset_n;
  output           uC_clock_0_out_waitrequest;
  input            clk;
  input            d1_pll_pll_slave_end_xfer;
  input   [ 31: 0] pll_pll_slave_readdata_from_sa;
  input            reset_n;
  input   [  3: 0] uC_clock_0_out_address;
  input   [  3: 0] uC_clock_0_out_byteenable;
  input            uC_clock_0_out_granted_pll_pll_slave;
  input            uC_clock_0_out_qualified_request_pll_pll_slave;
  input            uC_clock_0_out_read;
  input            uC_clock_0_out_read_data_valid_pll_pll_slave;
  input            uC_clock_0_out_requests_pll_pll_slave;
  input            uC_clock_0_out_write;
  input   [ 31: 0] uC_clock_0_out_writedata;

  reg              active_and_waiting_last_time;
  wire             r_1;
  reg     [  3: 0] uC_clock_0_out_address_last_time;
  wire    [  3: 0] uC_clock_0_out_address_to_slave;
  reg     [  3: 0] uC_clock_0_out_byteenable_last_time;
  reg              uC_clock_0_out_read_last_time;
  wire    [ 31: 0] uC_clock_0_out_readdata;
  wire             uC_clock_0_out_reset_n;
  wire             uC_clock_0_out_run;
  wire             uC_clock_0_out_waitrequest;
  reg              uC_clock_0_out_write_last_time;
  reg     [ 31: 0] uC_clock_0_out_writedata_last_time;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~uC_clock_0_out_qualified_request_pll_pll_slave | ~(uC_clock_0_out_read | uC_clock_0_out_write) | (1 & (uC_clock_0_out_read | uC_clock_0_out_write)))) & ((~uC_clock_0_out_qualified_request_pll_pll_slave | ~(uC_clock_0_out_read | uC_clock_0_out_write) | (1 & (uC_clock_0_out_read | uC_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign uC_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign uC_clock_0_out_address_to_slave = uC_clock_0_out_address;

  //uC_clock_0/out readdata mux, which is an e_mux
  assign uC_clock_0_out_readdata = pll_pll_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign uC_clock_0_out_waitrequest = ~uC_clock_0_out_run;

  //uC_clock_0_out_reset_n assignment, which is an e_assign
  assign uC_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uC_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_out_address_last_time <= 0;
      else 
        uC_clock_0_out_address_last_time <= uC_clock_0_out_address;
    end


  //uC_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= uC_clock_0_out_waitrequest & (uC_clock_0_out_read | uC_clock_0_out_write);
    end


  //uC_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (uC_clock_0_out_address != uC_clock_0_out_address_last_time))
        begin
          $write("%0d ns: uC_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //uC_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_out_byteenable_last_time <= 0;
      else 
        uC_clock_0_out_byteenable_last_time <= uC_clock_0_out_byteenable;
    end


  //uC_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (uC_clock_0_out_byteenable != uC_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: uC_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //uC_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_out_read_last_time <= 0;
      else 
        uC_clock_0_out_read_last_time <= uC_clock_0_out_read;
    end


  //uC_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (uC_clock_0_out_read != uC_clock_0_out_read_last_time))
        begin
          $write("%0d ns: uC_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //uC_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_out_write_last_time <= 0;
      else 
        uC_clock_0_out_write_last_time <= uC_clock_0_out_write;
    end


  //uC_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (uC_clock_0_out_write != uC_clock_0_out_write_last_time))
        begin
          $write("%0d ns: uC_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //uC_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uC_clock_0_out_writedata_last_time <= 0;
      else 
        uC_clock_0_out_writedata_last_time <= uC_clock_0_out_writedata;
    end


  //uC_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (uC_clock_0_out_writedata != uC_clock_0_out_writedata_last_time) & uC_clock_0_out_write)
        begin
          $write("%0d ns: uC_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ucprobe_uart_avalon_jtag_slave_arbitrator (
                                                   // inputs:
                                                    clk,
                                                    cpu_data_master_address_to_slave,
                                                    cpu_data_master_read,
                                                    cpu_data_master_waitrequest,
                                                    cpu_data_master_write,
                                                    cpu_data_master_writedata,
                                                    reset_n,
                                                    ucprobe_uart_avalon_jtag_slave_dataavailable,
                                                    ucprobe_uart_avalon_jtag_slave_irq,
                                                    ucprobe_uart_avalon_jtag_slave_readdata,
                                                    ucprobe_uart_avalon_jtag_slave_readyfordata,
                                                    ucprobe_uart_avalon_jtag_slave_waitrequest,

                                                   // outputs:
                                                    cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave,
                                                    cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave,
                                                    cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave,
                                                    cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave,
                                                    d1_ucprobe_uart_avalon_jtag_slave_end_xfer,
                                                    ucprobe_uart_avalon_jtag_slave_address,
                                                    ucprobe_uart_avalon_jtag_slave_chipselect,
                                                    ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                    ucprobe_uart_avalon_jtag_slave_irq_from_sa,
                                                    ucprobe_uart_avalon_jtag_slave_read_n,
                                                    ucprobe_uart_avalon_jtag_slave_readdata_from_sa,
                                                    ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                    ucprobe_uart_avalon_jtag_slave_reset_n,
                                                    ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                    ucprobe_uart_avalon_jtag_slave_write_n,
                                                    ucprobe_uart_avalon_jtag_slave_writedata
                                                 )
;

  output           cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave;
  output           d1_ucprobe_uart_avalon_jtag_slave_end_xfer;
  output           ucprobe_uart_avalon_jtag_slave_address;
  output           ucprobe_uart_avalon_jtag_slave_chipselect;
  output           ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           ucprobe_uart_avalon_jtag_slave_irq_from_sa;
  output           ucprobe_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] ucprobe_uart_avalon_jtag_slave_readdata_from_sa;
  output           ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           ucprobe_uart_avalon_jtag_slave_reset_n;
  output           ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           ucprobe_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] ucprobe_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            ucprobe_uart_avalon_jtag_slave_dataavailable;
  input            ucprobe_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] ucprobe_uart_avalon_jtag_slave_readdata;
  input            ucprobe_uart_avalon_jtag_slave_readyfordata;
  input            ucprobe_uart_avalon_jtag_slave_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_ucprobe_uart_avalon_jtag_slave;
  reg              d1_reasons_to_wait;
  reg              d1_ucprobe_uart_avalon_jtag_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ucprobe_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 22: 0] shifted_address_to_ucprobe_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             ucprobe_uart_avalon_jtag_slave_address;
  wire             ucprobe_uart_avalon_jtag_slave_allgrants;
  wire             ucprobe_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             ucprobe_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             ucprobe_uart_avalon_jtag_slave_any_continuerequest;
  wire             ucprobe_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] ucprobe_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] ucprobe_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] ucprobe_uart_avalon_jtag_slave_arb_share_set_values;
  wire             ucprobe_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             ucprobe_uart_avalon_jtag_slave_begins_xfer;
  wire             ucprobe_uart_avalon_jtag_slave_chipselect;
  wire             ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_end_xfer;
  wire             ucprobe_uart_avalon_jtag_slave_firsttransfer;
  wire             ucprobe_uart_avalon_jtag_slave_grant_vector;
  wire             ucprobe_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             ucprobe_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             ucprobe_uart_avalon_jtag_slave_irq_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_master_qreq_vector;
  wire             ucprobe_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             ucprobe_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] ucprobe_uart_avalon_jtag_slave_readdata_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              ucprobe_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             ucprobe_uart_avalon_jtag_slave_reset_n;
  reg              ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             ucprobe_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_waits_for_read;
  wire             ucprobe_uart_avalon_jtag_slave_waits_for_write;
  wire             ucprobe_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] ucprobe_uart_avalon_jtag_slave_writedata;
  wire             wait_for_ucprobe_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ucprobe_uart_avalon_jtag_slave_end_xfer;
    end


  assign ucprobe_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave));
  //assign ucprobe_uart_avalon_jtag_slave_readdata_from_sa = ucprobe_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_readdata_from_sa = ucprobe_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[22 : 3] , 3'b0} == 23'h28) & (cpu_data_master_read | cpu_data_master_write);
  //assign ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa = ucprobe_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa = ucprobe_uart_avalon_jtag_slave_dataavailable;

  //assign ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa = ucprobe_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa = ucprobe_uart_avalon_jtag_slave_readyfordata;

  //assign ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa = ucprobe_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa = ucprobe_uart_avalon_jtag_slave_waitrequest;

  //ucprobe_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //ucprobe_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave;

  //ucprobe_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //ucprobe_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_arb_share_counter_next_value = ucprobe_uart_avalon_jtag_slave_firsttransfer ? (ucprobe_uart_avalon_jtag_slave_arb_share_set_values - 1) : |ucprobe_uart_avalon_jtag_slave_arb_share_counter ? (ucprobe_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //ucprobe_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_allgrants = |ucprobe_uart_avalon_jtag_slave_grant_vector;

  //ucprobe_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_end_xfer = ~(ucprobe_uart_avalon_jtag_slave_waits_for_read | ucprobe_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_ucprobe_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ucprobe_uart_avalon_jtag_slave = ucprobe_uart_avalon_jtag_slave_end_xfer & (~ucprobe_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ucprobe_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_ucprobe_uart_avalon_jtag_slave & ucprobe_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_ucprobe_uart_avalon_jtag_slave & ~ucprobe_uart_avalon_jtag_slave_non_bursting_master_requests);

  //ucprobe_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ucprobe_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (ucprobe_uart_avalon_jtag_slave_arb_counter_enable)
          ucprobe_uart_avalon_jtag_slave_arb_share_counter <= ucprobe_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|ucprobe_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_ucprobe_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_ucprobe_uart_avalon_jtag_slave & ~ucprobe_uart_avalon_jtag_slave_non_bursting_master_requests))
          ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable <= |ucprobe_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master ucprobe_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable2 = |ucprobe_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master ucprobe_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //ucprobe_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave = cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //ucprobe_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave = cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant ucprobe_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_ucprobe_uart_avalon_jtag_slave = cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave;

  //allow new arb cycle for ucprobe_uart/avalon_jtag_slave, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ucprobe_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ucprobe_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //ucprobe_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_reset_n = reset_n;

  assign ucprobe_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave;
  //ucprobe_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_firsttransfer = ucprobe_uart_avalon_jtag_slave_begins_xfer ? ucprobe_uart_avalon_jtag_slave_unreg_firsttransfer : ucprobe_uart_avalon_jtag_slave_reg_firsttransfer;

  //ucprobe_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_unreg_firsttransfer = ~(ucprobe_uart_avalon_jtag_slave_slavearbiterlockenable & ucprobe_uart_avalon_jtag_slave_any_continuerequest);

  //ucprobe_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ucprobe_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (ucprobe_uart_avalon_jtag_slave_begins_xfer)
          ucprobe_uart_avalon_jtag_slave_reg_firsttransfer <= ucprobe_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //ucprobe_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_beginbursttransfer_internal = ucprobe_uart_avalon_jtag_slave_begins_xfer;

  //~ucprobe_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave & cpu_data_master_read);

  //~ucprobe_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_ucprobe_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //ucprobe_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_address = shifted_address_to_ucprobe_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_ucprobe_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ucprobe_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_ucprobe_uart_avalon_jtag_slave_end_xfer <= ucprobe_uart_avalon_jtag_slave_end_xfer;
    end


  //ucprobe_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_waits_for_read = ucprobe_uart_avalon_jtag_slave_in_a_read_cycle & ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa;

  //ucprobe_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ucprobe_uart_avalon_jtag_slave_in_a_read_cycle;

  //ucprobe_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign ucprobe_uart_avalon_jtag_slave_waits_for_write = ucprobe_uart_avalon_jtag_slave_in_a_write_cycle & ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa;

  //ucprobe_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ucprobe_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_ucprobe_uart_avalon_jtag_slave_counter = 0;
  //assign ucprobe_uart_avalon_jtag_slave_irq_from_sa = ucprobe_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ucprobe_uart_avalon_jtag_slave_irq_from_sa = ucprobe_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ucprobe_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uC_reset_sys_clk_domain_synch_module (
                                              // inputs:
                                               clk,
                                               data_in,
                                               reset_n,

                                              // outputs:
                                               data_out
                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uC_reset_ext_clk_domain_synch_module (
                                              // inputs:
                                               clk,
                                               data_in,
                                               reset_n,

                                              // outputs:
                                               data_out
                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uC (
            // 1) global signals:
             ext_clk,
             reset_n,
             sys_clk,

            // the_ADAS3022_0
             baddr_o_from_the_ADAS3022_0,
             bbusy_i_to_the_ADAS3022_0,
             bdb_io_to_and_from_the_ADAS3022_0,
             brd_n_o_from_the_ADAS3022_0,
             breset_o_from_the_ADAS3022_0,
             bwr_n_o_from_the_ADAS3022_0,

            // the_i2c_int
             out_port_from_the_i2c_int,

            // the_leds
             out_port_from_the_leds,

            // the_pll
             areset_to_the_pll,
             locked_from_the_pll,
             phasedone_from_the_pll,

            // the_pwr_data
             bidir_port_to_and_from_the_pwr_data,

            // the_pwr_en_clk
             out_port_from_the_pwr_en_clk,

            // the_tri_state_bridge_0_avalon_slave
             select_n_to_the_sram,
             tri_state_bridge_0_address,
             tri_state_bridge_0_data,
             tri_state_bridge_0_readn,
             tri_state_bridge_0_writen
          )
;

  output  [  4: 0] baddr_o_from_the_ADAS3022_0;
  inout   [ 15: 0] bdb_io_to_and_from_the_ADAS3022_0;
  inout   [  7: 0] bidir_port_to_and_from_the_pwr_data;
  output           brd_n_o_from_the_ADAS3022_0;
  output           breset_o_from_the_ADAS3022_0;
  output           bwr_n_o_from_the_ADAS3022_0;
  output           locked_from_the_pll;
  output  [  4: 0] out_port_from_the_i2c_int;
  output  [  2: 0] out_port_from_the_leds;
  output           out_port_from_the_pwr_en_clk;
  output           phasedone_from_the_pll;
  output           select_n_to_the_sram;
  output           sys_clk;
  output  [ 21: 0] tri_state_bridge_0_address;
  inout   [ 15: 0] tri_state_bridge_0_data;
  output           tri_state_bridge_0_readn;
  output           tri_state_bridge_0_writen;
  input            areset_to_the_pll;
  input            bbusy_i_to_the_ADAS3022_0;
  input            ext_clk;
  input            reset_n;

  wire    [  2: 0] ADAS3022_0_avalon_address;
  wire    [ 31: 0] ADAS3022_0_avalon_master_address;
  wire    [ 31: 0] ADAS3022_0_avalon_master_address_to_slave;
  wire    [  1: 0] ADAS3022_0_avalon_master_byteenable;
  wire             ADAS3022_0_avalon_master_granted_sram_s1;
  wire             ADAS3022_0_avalon_master_qualified_request_sram_s1;
  wire             ADAS3022_0_avalon_master_requests_sram_s1;
  wire             ADAS3022_0_avalon_master_waitrequest;
  wire             ADAS3022_0_avalon_master_write;
  wire    [ 15: 0] ADAS3022_0_avalon_master_writedata;
  wire             ADAS3022_0_avalon_read;
  wire    [ 31: 0] ADAS3022_0_avalon_readdata;
  wire    [ 31: 0] ADAS3022_0_avalon_readdata_from_sa;
  wire             ADAS3022_0_avalon_reset;
  wire             ADAS3022_0_avalon_write;
  wire    [ 31: 0] ADAS3022_0_avalon_writedata;
  wire    [  4: 0] baddr_o_from_the_ADAS3022_0;
  wire    [ 15: 0] bdb_io_to_and_from_the_ADAS3022_0;
  wire    [  7: 0] bidir_port_to_and_from_the_pwr_data;
  wire             brd_n_o_from_the_ADAS3022_0;
  wire             breset_o_from_the_ADAS3022_0;
  wire             bwr_n_o_from_the_ADAS3022_0;
  wire    [ 22: 0] cpu_data_master_address;
  wire    [ 22: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [  1: 0] cpu_data_master_byteenable_sram_s1;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_ADAS3022_0_avalon;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_i2c_int_s1;
  wire             cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_granted_leds_s1;
  wire             cpu_data_master_granted_onchip_mem_s1;
  wire             cpu_data_master_granted_pwr_data_s1;
  wire             cpu_data_master_granted_pwr_en_clk_s1;
  wire             cpu_data_master_granted_sram_s1;
  wire             cpu_data_master_granted_sys_timer_s1;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_granted_uC_clock_0_in;
  wire             cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_no_byte_enables_and_last_term;
  wire             cpu_data_master_qualified_request_ADAS3022_0_avalon;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_i2c_int_s1;
  wire             cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_leds_s1;
  wire             cpu_data_master_qualified_request_onchip_mem_s1;
  wire             cpu_data_master_qualified_request_pwr_data_s1;
  wire             cpu_data_master_qualified_request_pwr_en_clk_s1;
  wire             cpu_data_master_qualified_request_sram_s1;
  wire             cpu_data_master_qualified_request_sys_timer_s1;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_qualified_request_uC_clock_0_in;
  wire             cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_ADAS3022_0_avalon;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_i2c_int_s1;
  wire             cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_leds_s1;
  wire             cpu_data_master_read_data_valid_onchip_mem_s1;
  wire             cpu_data_master_read_data_valid_pwr_data_s1;
  wire             cpu_data_master_read_data_valid_pwr_en_clk_s1;
  wire             cpu_data_master_read_data_valid_sram_s1;
  wire             cpu_data_master_read_data_valid_sys_timer_s1;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_uC_clock_0_in;
  wire             cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_ADAS3022_0_avalon;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_i2c_int_s1;
  wire             cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_data_master_requests_leds_s1;
  wire             cpu_data_master_requests_onchip_mem_s1;
  wire             cpu_data_master_requests_pwr_data_s1;
  wire             cpu_data_master_requests_pwr_en_clk_s1;
  wire             cpu_data_master_requests_sram_s1;
  wire             cpu_data_master_requests_sys_timer_s1;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_requests_uC_clock_0_in;
  wire             cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 22: 0] cpu_instruction_master_address;
  wire    [ 22: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_ADAS3022_0_avalon;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_onchip_mem_s1;
  wire             cpu_instruction_master_granted_sram_s1;
  wire             cpu_instruction_master_qualified_request_ADAS3022_0_avalon;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_onchip_mem_s1;
  wire             cpu_instruction_master_qualified_request_sram_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_ADAS3022_0_avalon;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_onchip_mem_s1;
  wire             cpu_instruction_master_read_data_valid_sram_s1;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_requests_ADAS3022_0_avalon;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_onchip_mem_s1;
  wire             cpu_instruction_master_requests_sram_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_ADAS3022_0_avalon_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_i2c_int_s1_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_leds_s1_end_xfer;
  wire             d1_onchip_mem_s1_end_xfer;
  wire             d1_pll_pll_slave_end_xfer;
  wire             d1_pwr_data_s1_end_xfer;
  wire             d1_pwr_en_clk_s1_end_xfer;
  wire             d1_sys_timer_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_tri_state_bridge_0_avalon_slave_end_xfer;
  wire             d1_uC_clock_0_in_end_xfer;
  wire             d1_ucprobe_uart_avalon_jtag_slave_end_xfer;
  wire             ext_clk_reset_n;
  wire    [  1: 0] i2c_int_s1_address;
  wire             i2c_int_s1_chipselect;
  wire    [ 31: 0] i2c_int_s1_readdata;
  wire    [ 31: 0] i2c_int_s1_readdata_from_sa;
  wire             i2c_int_s1_reset_n;
  wire             i2c_int_s1_write_n;
  wire    [ 31: 0] i2c_int_s1_writedata;
  wire    [ 15: 0] incoming_tri_state_bridge_0_data;
  wire    [ 15: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_chipselect;
  wire    [ 31: 0] leds_s1_readdata;
  wire    [ 31: 0] leds_s1_readdata_from_sa;
  wire             leds_s1_reset_n;
  wire             leds_s1_write_n;
  wire    [ 31: 0] leds_s1_writedata;
  wire             locked_from_the_pll;
  wire    [  1: 0] mm_console_master_byteenable_sram_s1;
  wire    [  1: 0] mm_console_master_dbs_address;
  wire    [ 15: 0] mm_console_master_dbs_write_16;
  wire             mm_console_master_granted_onchip_mem_s1;
  wire             mm_console_master_granted_sram_s1;
  wire    [  1: 0] mm_console_master_latency_counter;
  wire    [ 31: 0] mm_console_master_master_address;
  wire    [ 31: 0] mm_console_master_master_address_to_slave;
  wire    [  3: 0] mm_console_master_master_byteenable;
  wire             mm_console_master_master_read;
  wire    [ 31: 0] mm_console_master_master_readdata;
  wire             mm_console_master_master_readdatavalid;
  wire             mm_console_master_master_reset;
  wire             mm_console_master_master_resetrequest;
  wire             mm_console_master_master_waitrequest;
  wire             mm_console_master_master_write;
  wire    [ 31: 0] mm_console_master_master_writedata;
  wire             mm_console_master_qualified_request_onchip_mem_s1;
  wire             mm_console_master_qualified_request_sram_s1;
  wire             mm_console_master_read_data_valid_onchip_mem_s1;
  wire             mm_console_master_read_data_valid_sram_s1;
  wire             mm_console_master_requests_onchip_mem_s1;
  wire             mm_console_master_requests_sram_s1;
  wire    [  9: 0] onchip_mem_s1_address;
  wire    [  3: 0] onchip_mem_s1_byteenable;
  wire             onchip_mem_s1_chipselect;
  wire             onchip_mem_s1_clken;
  wire    [ 31: 0] onchip_mem_s1_readdata;
  wire    [ 31: 0] onchip_mem_s1_readdata_from_sa;
  wire             onchip_mem_s1_reset;
  wire             onchip_mem_s1_write;
  wire    [ 31: 0] onchip_mem_s1_writedata;
  wire             out_clk_pll_c0;
  wire    [  4: 0] out_port_from_the_i2c_int;
  wire    [  2: 0] out_port_from_the_leds;
  wire             out_port_from_the_pwr_en_clk;
  wire             phasedone_from_the_pll;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  wire             pll_pll_slave_reset;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire    [  2: 0] pwr_data_s1_address;
  wire             pwr_data_s1_chipselect;
  wire    [ 31: 0] pwr_data_s1_readdata;
  wire    [ 31: 0] pwr_data_s1_readdata_from_sa;
  wire             pwr_data_s1_reset_n;
  wire             pwr_data_s1_write_n;
  wire    [ 31: 0] pwr_data_s1_writedata;
  wire    [  1: 0] pwr_en_clk_s1_address;
  wire             pwr_en_clk_s1_chipselect;
  wire    [ 31: 0] pwr_en_clk_s1_readdata;
  wire    [ 31: 0] pwr_en_clk_s1_readdata_from_sa;
  wire             pwr_en_clk_s1_reset_n;
  wire             pwr_en_clk_s1_write_n;
  wire    [ 31: 0] pwr_en_clk_s1_writedata;
  wire             registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  wire             registered_cpu_data_master_read_data_valid_sram_s1;
  wire             reset_n_sources;
  wire             select_n_to_the_sram;
  wire             sys_clk;
  wire             sys_clk_reset_n;
  wire    [  2: 0] sys_timer_s1_address;
  wire             sys_timer_s1_chipselect;
  wire             sys_timer_s1_irq;
  wire             sys_timer_s1_irq_from_sa;
  wire    [ 15: 0] sys_timer_s1_readdata;
  wire    [ 15: 0] sys_timer_s1_readdata_from_sa;
  wire             sys_timer_s1_reset_n;
  wire             sys_timer_s1_write_n;
  wire    [ 15: 0] sys_timer_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [ 21: 0] tri_state_bridge_0_address;
  wire    [ 15: 0] tri_state_bridge_0_data;
  wire             tri_state_bridge_0_readn;
  wire             tri_state_bridge_0_writen;
  wire    [  3: 0] uC_clock_0_in_address;
  wire    [  3: 0] uC_clock_0_in_byteenable;
  wire             uC_clock_0_in_endofpacket;
  wire             uC_clock_0_in_endofpacket_from_sa;
  wire    [  1: 0] uC_clock_0_in_nativeaddress;
  wire             uC_clock_0_in_read;
  wire    [ 31: 0] uC_clock_0_in_readdata;
  wire    [ 31: 0] uC_clock_0_in_readdata_from_sa;
  wire             uC_clock_0_in_reset_n;
  wire             uC_clock_0_in_waitrequest;
  wire             uC_clock_0_in_waitrequest_from_sa;
  wire             uC_clock_0_in_write;
  wire    [ 31: 0] uC_clock_0_in_writedata;
  wire    [  3: 0] uC_clock_0_out_address;
  wire    [  3: 0] uC_clock_0_out_address_to_slave;
  wire    [  3: 0] uC_clock_0_out_byteenable;
  wire             uC_clock_0_out_endofpacket;
  wire             uC_clock_0_out_granted_pll_pll_slave;
  wire    [  1: 0] uC_clock_0_out_nativeaddress;
  wire             uC_clock_0_out_qualified_request_pll_pll_slave;
  wire             uC_clock_0_out_read;
  wire             uC_clock_0_out_read_data_valid_pll_pll_slave;
  wire    [ 31: 0] uC_clock_0_out_readdata;
  wire             uC_clock_0_out_requests_pll_pll_slave;
  wire             uC_clock_0_out_reset_n;
  wire             uC_clock_0_out_waitrequest;
  wire             uC_clock_0_out_write;
  wire    [ 31: 0] uC_clock_0_out_writedata;
  wire             ucprobe_uart_avalon_jtag_slave_address;
  wire             ucprobe_uart_avalon_jtag_slave_chipselect;
  wire             ucprobe_uart_avalon_jtag_slave_dataavailable;
  wire             ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_irq;
  wire             ucprobe_uart_avalon_jtag_slave_irq_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] ucprobe_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] ucprobe_uart_avalon_jtag_slave_readdata_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_readyfordata;
  wire             ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_reset_n;
  wire             ucprobe_uart_avalon_jtag_slave_waitrequest;
  wire             ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] ucprobe_uart_avalon_jtag_slave_writedata;
  ADAS3022_0_avalon_arbitrator the_ADAS3022_0_avalon
    (
      .ADAS3022_0_avalon_address                                  (ADAS3022_0_avalon_address),
      .ADAS3022_0_avalon_read                                     (ADAS3022_0_avalon_read),
      .ADAS3022_0_avalon_readdata                                 (ADAS3022_0_avalon_readdata),
      .ADAS3022_0_avalon_readdata_from_sa                         (ADAS3022_0_avalon_readdata_from_sa),
      .ADAS3022_0_avalon_reset                                    (ADAS3022_0_avalon_reset),
      .ADAS3022_0_avalon_write                                    (ADAS3022_0_avalon_write),
      .ADAS3022_0_avalon_writedata                                (ADAS3022_0_avalon_writedata),
      .clk                                                        (sys_clk),
      .cpu_data_master_address_to_slave                           (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_ADAS3022_0_avalon                  (cpu_data_master_granted_ADAS3022_0_avalon),
      .cpu_data_master_qualified_request_ADAS3022_0_avalon        (cpu_data_master_qualified_request_ADAS3022_0_avalon),
      .cpu_data_master_read                                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ADAS3022_0_avalon          (cpu_data_master_read_data_valid_ADAS3022_0_avalon),
      .cpu_data_master_requests_ADAS3022_0_avalon                 (cpu_data_master_requests_ADAS3022_0_avalon),
      .cpu_data_master_waitrequest                                (cpu_data_master_waitrequest),
      .cpu_data_master_write                                      (cpu_data_master_write),
      .cpu_data_master_writedata                                  (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                    (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_ADAS3022_0_avalon           (cpu_instruction_master_granted_ADAS3022_0_avalon),
      .cpu_instruction_master_qualified_request_ADAS3022_0_avalon (cpu_instruction_master_qualified_request_ADAS3022_0_avalon),
      .cpu_instruction_master_read                                (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_ADAS3022_0_avalon   (cpu_instruction_master_read_data_valid_ADAS3022_0_avalon),
      .cpu_instruction_master_requests_ADAS3022_0_avalon          (cpu_instruction_master_requests_ADAS3022_0_avalon),
      .d1_ADAS3022_0_avalon_end_xfer                              (d1_ADAS3022_0_avalon_end_xfer),
      .reset_n                                                    (sys_clk_reset_n)
    );

  ADAS3022_0_avalon_master_arbitrator the_ADAS3022_0_avalon_master
    (
      .ADAS3022_0_avalon_master_address                   (ADAS3022_0_avalon_master_address),
      .ADAS3022_0_avalon_master_address_to_slave          (ADAS3022_0_avalon_master_address_to_slave),
      .ADAS3022_0_avalon_master_byteenable                (ADAS3022_0_avalon_master_byteenable),
      .ADAS3022_0_avalon_master_granted_sram_s1           (ADAS3022_0_avalon_master_granted_sram_s1),
      .ADAS3022_0_avalon_master_qualified_request_sram_s1 (ADAS3022_0_avalon_master_qualified_request_sram_s1),
      .ADAS3022_0_avalon_master_requests_sram_s1          (ADAS3022_0_avalon_master_requests_sram_s1),
      .ADAS3022_0_avalon_master_waitrequest               (ADAS3022_0_avalon_master_waitrequest),
      .ADAS3022_0_avalon_master_write                     (ADAS3022_0_avalon_master_write),
      .ADAS3022_0_avalon_master_writedata                 (ADAS3022_0_avalon_master_writedata),
      .clk                                                (sys_clk),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer        (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .reset_n                                            (sys_clk_reset_n)
    );

  ADAS3022_0 the_ADAS3022_0
    (
      .avalon_address_i            (ADAS3022_0_avalon_address),
      .avalon_master_address_o     (ADAS3022_0_avalon_master_address),
      .avalon_master_byteenable_o  (ADAS3022_0_avalon_master_byteenable),
      .avalon_master_waitrequest_i (ADAS3022_0_avalon_master_waitrequest),
      .avalon_master_write_o       (ADAS3022_0_avalon_master_write),
      .avalon_master_writedata_o   (ADAS3022_0_avalon_master_writedata),
      .avalon_read_i               (ADAS3022_0_avalon_read),
      .avalon_readdata_o           (ADAS3022_0_avalon_readdata),
      .avalon_write_i              (ADAS3022_0_avalon_write),
      .avalon_writedata_i          (ADAS3022_0_avalon_writedata),
      .baddr_o                     (baddr_o_from_the_ADAS3022_0),
      .bbusy_i                     (bbusy_i_to_the_ADAS3022_0),
      .bdb_io                      (bdb_io_to_and_from_the_ADAS3022_0),
      .brd_n_o                     (brd_n_o_from_the_ADAS3022_0),
      .breset_o                    (breset_o_from_the_ADAS3022_0),
      .bwr_n_o                     (bwr_n_o_from_the_ADAS3022_0),
      .clk_i                       (sys_clk),
      .reset_i                     (ADAS3022_0_avalon_reset)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (sys_clk),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (sys_clk_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .ADAS3022_0_avalon_readdata_from_sa                               (ADAS3022_0_avalon_readdata_from_sa),
      .clk                                                              (sys_clk),
      .cpu_data_master_address                                          (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                 (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable_sram_s1                               (cpu_data_master_byteenable_sram_s1),
      .cpu_data_master_dbs_address                                      (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                     (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_ADAS3022_0_avalon                        (cpu_data_master_granted_ADAS3022_0_avalon),
      .cpu_data_master_granted_cpu_jtag_debug_module                    (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_i2c_int_s1                               (cpu_data_master_granted_i2c_int_s1),
      .cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave            (cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_granted_leds_s1                                  (cpu_data_master_granted_leds_s1),
      .cpu_data_master_granted_onchip_mem_s1                            (cpu_data_master_granted_onchip_mem_s1),
      .cpu_data_master_granted_pwr_data_s1                              (cpu_data_master_granted_pwr_data_s1),
      .cpu_data_master_granted_pwr_en_clk_s1                            (cpu_data_master_granted_pwr_en_clk_s1),
      .cpu_data_master_granted_sram_s1                                  (cpu_data_master_granted_sram_s1),
      .cpu_data_master_granted_sys_timer_s1                             (cpu_data_master_granted_sys_timer_s1),
      .cpu_data_master_granted_sysid_control_slave                      (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_granted_uC_clock_0_in                            (cpu_data_master_granted_uC_clock_0_in),
      .cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave           (cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_irq                                              (cpu_data_master_irq),
      .cpu_data_master_no_byte_enables_and_last_term                    (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_ADAS3022_0_avalon              (cpu_data_master_qualified_request_ADAS3022_0_avalon),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module          (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_i2c_int_s1                     (cpu_data_master_qualified_request_i2c_int_s1),
      .cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave  (cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_qualified_request_leds_s1                        (cpu_data_master_qualified_request_leds_s1),
      .cpu_data_master_qualified_request_onchip_mem_s1                  (cpu_data_master_qualified_request_onchip_mem_s1),
      .cpu_data_master_qualified_request_pwr_data_s1                    (cpu_data_master_qualified_request_pwr_data_s1),
      .cpu_data_master_qualified_request_pwr_en_clk_s1                  (cpu_data_master_qualified_request_pwr_en_clk_s1),
      .cpu_data_master_qualified_request_sram_s1                        (cpu_data_master_qualified_request_sram_s1),
      .cpu_data_master_qualified_request_sys_timer_s1                   (cpu_data_master_qualified_request_sys_timer_s1),
      .cpu_data_master_qualified_request_sysid_control_slave            (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_qualified_request_uC_clock_0_in                  (cpu_data_master_qualified_request_uC_clock_0_in),
      .cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave (cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_read                                             (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ADAS3022_0_avalon                (cpu_data_master_read_data_valid_ADAS3022_0_avalon),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module            (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_i2c_int_s1                       (cpu_data_master_read_data_valid_i2c_int_s1),
      .cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave    (cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_leds_s1                          (cpu_data_master_read_data_valid_leds_s1),
      .cpu_data_master_read_data_valid_onchip_mem_s1                    (cpu_data_master_read_data_valid_onchip_mem_s1),
      .cpu_data_master_read_data_valid_pwr_data_s1                      (cpu_data_master_read_data_valid_pwr_data_s1),
      .cpu_data_master_read_data_valid_pwr_en_clk_s1                    (cpu_data_master_read_data_valid_pwr_en_clk_s1),
      .cpu_data_master_read_data_valid_sram_s1                          (cpu_data_master_read_data_valid_sram_s1),
      .cpu_data_master_read_data_valid_sys_timer_s1                     (cpu_data_master_read_data_valid_sys_timer_s1),
      .cpu_data_master_read_data_valid_sysid_control_slave              (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_read_data_valid_uC_clock_0_in                    (cpu_data_master_read_data_valid_uC_clock_0_in),
      .cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_readdata                                         (cpu_data_master_readdata),
      .cpu_data_master_requests_ADAS3022_0_avalon                       (cpu_data_master_requests_ADAS3022_0_avalon),
      .cpu_data_master_requests_cpu_jtag_debug_module                   (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_i2c_int_s1                              (cpu_data_master_requests_i2c_int_s1),
      .cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave           (cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_requests_leds_s1                                 (cpu_data_master_requests_leds_s1),
      .cpu_data_master_requests_onchip_mem_s1                           (cpu_data_master_requests_onchip_mem_s1),
      .cpu_data_master_requests_pwr_data_s1                             (cpu_data_master_requests_pwr_data_s1),
      .cpu_data_master_requests_pwr_en_clk_s1                           (cpu_data_master_requests_pwr_en_clk_s1),
      .cpu_data_master_requests_sram_s1                                 (cpu_data_master_requests_sram_s1),
      .cpu_data_master_requests_sys_timer_s1                            (cpu_data_master_requests_sys_timer_s1),
      .cpu_data_master_requests_sysid_control_slave                     (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_requests_uC_clock_0_in                           (cpu_data_master_requests_uC_clock_0_in),
      .cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave          (cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                      (cpu_data_master_waitrequest),
      .cpu_data_master_write                                            (cpu_data_master_write),
      .cpu_data_master_writedata                                        (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                           (cpu_jtag_debug_module_readdata_from_sa),
      .d1_ADAS3022_0_avalon_end_xfer                                    (d1_ADAS3022_0_avalon_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                (d1_cpu_jtag_debug_module_end_xfer),
      .d1_i2c_int_s1_end_xfer                                           (d1_i2c_int_s1_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                        (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_leds_s1_end_xfer                                              (d1_leds_s1_end_xfer),
      .d1_onchip_mem_s1_end_xfer                                        (d1_onchip_mem_s1_end_xfer),
      .d1_pwr_data_s1_end_xfer                                          (d1_pwr_data_s1_end_xfer),
      .d1_pwr_en_clk_s1_end_xfer                                        (d1_pwr_en_clk_s1_end_xfer),
      .d1_sys_timer_s1_end_xfer                                         (d1_sys_timer_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                  (d1_sysid_control_slave_end_xfer),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                      (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .d1_uC_clock_0_in_end_xfer                                        (d1_uC_clock_0_in_end_xfer),
      .d1_ucprobe_uart_avalon_jtag_slave_end_xfer                       (d1_ucprobe_uart_avalon_jtag_slave_end_xfer),
      .i2c_int_s1_readdata_from_sa                                      (i2c_int_s1_readdata_from_sa),
      .incoming_tri_state_bridge_0_data_with_Xs_converted_to_0          (incoming_tri_state_bridge_0_data_with_Xs_converted_to_0),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                        (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                   (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .leds_s1_readdata_from_sa                                         (leds_s1_readdata_from_sa),
      .onchip_mem_s1_readdata_from_sa                                   (onchip_mem_s1_readdata_from_sa),
      .pwr_data_s1_readdata_from_sa                                     (pwr_data_s1_readdata_from_sa),
      .pwr_en_clk_s1_readdata_from_sa                                   (pwr_en_clk_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_onchip_mem_s1         (registered_cpu_data_master_read_data_valid_onchip_mem_s1),
      .registered_cpu_data_master_read_data_valid_sram_s1               (registered_cpu_data_master_read_data_valid_sram_s1),
      .reset_n                                                          (sys_clk_reset_n),
      .sys_timer_s1_irq_from_sa                                         (sys_timer_s1_irq_from_sa),
      .sys_timer_s1_readdata_from_sa                                    (sys_timer_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                             (sysid_control_slave_readdata_from_sa),
      .uC_clock_0_in_readdata_from_sa                                   (uC_clock_0_in_readdata_from_sa),
      .uC_clock_0_in_waitrequest_from_sa                                (uC_clock_0_in_waitrequest_from_sa),
      .ucprobe_uart_avalon_jtag_slave_irq_from_sa                       (ucprobe_uart_avalon_jtag_slave_irq_from_sa),
      .ucprobe_uart_avalon_jtag_slave_readdata_from_sa                  (ucprobe_uart_avalon_jtag_slave_readdata_from_sa),
      .ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa               (ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .ADAS3022_0_avalon_readdata_from_sa                             (ADAS3022_0_avalon_readdata_from_sa),
      .clk                                                            (sys_clk),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_ADAS3022_0_avalon               (cpu_instruction_master_granted_ADAS3022_0_avalon),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_onchip_mem_s1                   (cpu_instruction_master_granted_onchip_mem_s1),
      .cpu_instruction_master_granted_sram_s1                         (cpu_instruction_master_granted_sram_s1),
      .cpu_instruction_master_qualified_request_ADAS3022_0_avalon     (cpu_instruction_master_qualified_request_ADAS3022_0_avalon),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_onchip_mem_s1         (cpu_instruction_master_qualified_request_onchip_mem_s1),
      .cpu_instruction_master_qualified_request_sram_s1               (cpu_instruction_master_qualified_request_sram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_ADAS3022_0_avalon       (cpu_instruction_master_read_data_valid_ADAS3022_0_avalon),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_onchip_mem_s1           (cpu_instruction_master_read_data_valid_onchip_mem_s1),
      .cpu_instruction_master_read_data_valid_sram_s1                 (cpu_instruction_master_read_data_valid_sram_s1),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_requests_ADAS3022_0_avalon              (cpu_instruction_master_requests_ADAS3022_0_avalon),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_onchip_mem_s1                  (cpu_instruction_master_requests_onchip_mem_s1),
      .cpu_instruction_master_requests_sram_s1                        (cpu_instruction_master_requests_sram_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_ADAS3022_0_avalon_end_xfer                                  (d1_ADAS3022_0_avalon_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_mem_s1_end_xfer                                      (d1_onchip_mem_s1_end_xfer),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                    (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_0_data                               (incoming_tri_state_bridge_0_data),
      .onchip_mem_s1_readdata_from_sa                                 (onchip_mem_s1_readdata_from_sa),
      .reset_n                                                        (sys_clk_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (sys_clk),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  i2c_int_s1_arbitrator the_i2c_int_s1
    (
      .clk                                          (sys_clk),
      .cpu_data_master_address_to_slave             (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_i2c_int_s1           (cpu_data_master_granted_i2c_int_s1),
      .cpu_data_master_qualified_request_i2c_int_s1 (cpu_data_master_qualified_request_i2c_int_s1),
      .cpu_data_master_read                         (cpu_data_master_read),
      .cpu_data_master_read_data_valid_i2c_int_s1   (cpu_data_master_read_data_valid_i2c_int_s1),
      .cpu_data_master_requests_i2c_int_s1          (cpu_data_master_requests_i2c_int_s1),
      .cpu_data_master_waitrequest                  (cpu_data_master_waitrequest),
      .cpu_data_master_write                        (cpu_data_master_write),
      .cpu_data_master_writedata                    (cpu_data_master_writedata),
      .d1_i2c_int_s1_end_xfer                       (d1_i2c_int_s1_end_xfer),
      .i2c_int_s1_address                           (i2c_int_s1_address),
      .i2c_int_s1_chipselect                        (i2c_int_s1_chipselect),
      .i2c_int_s1_readdata                          (i2c_int_s1_readdata),
      .i2c_int_s1_readdata_from_sa                  (i2c_int_s1_readdata_from_sa),
      .i2c_int_s1_reset_n                           (i2c_int_s1_reset_n),
      .i2c_int_s1_write_n                           (i2c_int_s1_write_n),
      .i2c_int_s1_writedata                         (i2c_int_s1_writedata),
      .reset_n                                      (sys_clk_reset_n)
    );

  i2c_int the_i2c_int
    (
      .address    (i2c_int_s1_address),
      .chipselect (i2c_int_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_i2c_int),
      .readdata   (i2c_int_s1_readdata),
      .reset_n    (i2c_int_s1_reset_n),
      .write_n    (i2c_int_s1_write_n),
      .writedata  (i2c_int_s1_writedata)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                             (sys_clk),
      .cpu_data_master_address_to_slave                                (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_read                                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                     (cpu_data_master_waitrequest),
      .cpu_data_master_write                                           (cpu_data_master_write),
      .cpu_data_master_writedata                                       (cpu_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                           (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                        (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                     (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                               (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                       (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                            (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                          (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                      (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                           (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                       (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                           (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                         (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                         (sys_clk_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (sys_clk),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  leds_s1_arbitrator the_leds_s1
    (
      .clk                                       (sys_clk),
      .cpu_data_master_address_to_slave          (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_leds_s1           (cpu_data_master_granted_leds_s1),
      .cpu_data_master_qualified_request_leds_s1 (cpu_data_master_qualified_request_leds_s1),
      .cpu_data_master_read                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_leds_s1   (cpu_data_master_read_data_valid_leds_s1),
      .cpu_data_master_requests_leds_s1          (cpu_data_master_requests_leds_s1),
      .cpu_data_master_waitrequest               (cpu_data_master_waitrequest),
      .cpu_data_master_write                     (cpu_data_master_write),
      .cpu_data_master_writedata                 (cpu_data_master_writedata),
      .d1_leds_s1_end_xfer                       (d1_leds_s1_end_xfer),
      .leds_s1_address                           (leds_s1_address),
      .leds_s1_chipselect                        (leds_s1_chipselect),
      .leds_s1_readdata                          (leds_s1_readdata),
      .leds_s1_readdata_from_sa                  (leds_s1_readdata_from_sa),
      .leds_s1_reset_n                           (leds_s1_reset_n),
      .leds_s1_write_n                           (leds_s1_write_n),
      .leds_s1_writedata                         (leds_s1_writedata),
      .reset_n                                   (sys_clk_reset_n)
    );

  leds the_leds
    (
      .address    (leds_s1_address),
      .chipselect (leds_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_leds),
      .readdata   (leds_s1_readdata),
      .reset_n    (leds_s1_reset_n),
      .write_n    (leds_s1_write_n),
      .writedata  (leds_s1_writedata)
    );

  mm_console_master_master_arbitrator the_mm_console_master_master
    (
      .clk                                                     (sys_clk),
      .d1_onchip_mem_s1_end_xfer                               (d1_onchip_mem_s1_end_xfer),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer             (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_0_data_with_Xs_converted_to_0 (incoming_tri_state_bridge_0_data_with_Xs_converted_to_0),
      .mm_console_master_byteenable_sram_s1                    (mm_console_master_byteenable_sram_s1),
      .mm_console_master_dbs_address                           (mm_console_master_dbs_address),
      .mm_console_master_dbs_write_16                          (mm_console_master_dbs_write_16),
      .mm_console_master_granted_onchip_mem_s1                 (mm_console_master_granted_onchip_mem_s1),
      .mm_console_master_granted_sram_s1                       (mm_console_master_granted_sram_s1),
      .mm_console_master_latency_counter                       (mm_console_master_latency_counter),
      .mm_console_master_master_address                        (mm_console_master_master_address),
      .mm_console_master_master_address_to_slave               (mm_console_master_master_address_to_slave),
      .mm_console_master_master_byteenable                     (mm_console_master_master_byteenable),
      .mm_console_master_master_read                           (mm_console_master_master_read),
      .mm_console_master_master_readdata                       (mm_console_master_master_readdata),
      .mm_console_master_master_readdatavalid                  (mm_console_master_master_readdatavalid),
      .mm_console_master_master_reset                          (mm_console_master_master_reset),
      .mm_console_master_master_waitrequest                    (mm_console_master_master_waitrequest),
      .mm_console_master_master_write                          (mm_console_master_master_write),
      .mm_console_master_master_writedata                      (mm_console_master_master_writedata),
      .mm_console_master_qualified_request_onchip_mem_s1       (mm_console_master_qualified_request_onchip_mem_s1),
      .mm_console_master_qualified_request_sram_s1             (mm_console_master_qualified_request_sram_s1),
      .mm_console_master_read_data_valid_onchip_mem_s1         (mm_console_master_read_data_valid_onchip_mem_s1),
      .mm_console_master_read_data_valid_sram_s1               (mm_console_master_read_data_valid_sram_s1),
      .mm_console_master_requests_onchip_mem_s1                (mm_console_master_requests_onchip_mem_s1),
      .mm_console_master_requests_sram_s1                      (mm_console_master_requests_sram_s1),
      .onchip_mem_s1_readdata_from_sa                          (onchip_mem_s1_readdata_from_sa),
      .reset_n                                                 (sys_clk_reset_n)
    );

  mm_console_master the_mm_console_master
    (
      .clk_clk              (sys_clk),
      .clk_reset_reset      (mm_console_master_master_reset),
      .master_address       (mm_console_master_master_address),
      .master_byteenable    (mm_console_master_master_byteenable),
      .master_read          (mm_console_master_master_read),
      .master_readdata      (mm_console_master_master_readdata),
      .master_readdatavalid (mm_console_master_master_readdatavalid),
      .master_reset_reset   (mm_console_master_master_resetrequest),
      .master_waitrequest   (mm_console_master_master_waitrequest),
      .master_write         (mm_console_master_master_write),
      .master_writedata     (mm_console_master_master_writedata)
    );

  onchip_mem_s1_arbitrator the_onchip_mem_s1
    (
      .clk                                                      (sys_clk),
      .cpu_data_master_address_to_slave                         (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                               (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_mem_s1                    (cpu_data_master_granted_onchip_mem_s1),
      .cpu_data_master_qualified_request_onchip_mem_s1          (cpu_data_master_qualified_request_onchip_mem_s1),
      .cpu_data_master_read                                     (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_mem_s1            (cpu_data_master_read_data_valid_onchip_mem_s1),
      .cpu_data_master_requests_onchip_mem_s1                   (cpu_data_master_requests_onchip_mem_s1),
      .cpu_data_master_waitrequest                              (cpu_data_master_waitrequest),
      .cpu_data_master_write                                    (cpu_data_master_write),
      .cpu_data_master_writedata                                (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                  (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_mem_s1             (cpu_instruction_master_granted_onchip_mem_s1),
      .cpu_instruction_master_qualified_request_onchip_mem_s1   (cpu_instruction_master_qualified_request_onchip_mem_s1),
      .cpu_instruction_master_read                              (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_mem_s1     (cpu_instruction_master_read_data_valid_onchip_mem_s1),
      .cpu_instruction_master_requests_onchip_mem_s1            (cpu_instruction_master_requests_onchip_mem_s1),
      .d1_onchip_mem_s1_end_xfer                                (d1_onchip_mem_s1_end_xfer),
      .mm_console_master_granted_onchip_mem_s1                  (mm_console_master_granted_onchip_mem_s1),
      .mm_console_master_latency_counter                        (mm_console_master_latency_counter),
      .mm_console_master_master_address_to_slave                (mm_console_master_master_address_to_slave),
      .mm_console_master_master_byteenable                      (mm_console_master_master_byteenable),
      .mm_console_master_master_read                            (mm_console_master_master_read),
      .mm_console_master_master_write                           (mm_console_master_master_write),
      .mm_console_master_master_writedata                       (mm_console_master_master_writedata),
      .mm_console_master_qualified_request_onchip_mem_s1        (mm_console_master_qualified_request_onchip_mem_s1),
      .mm_console_master_read_data_valid_onchip_mem_s1          (mm_console_master_read_data_valid_onchip_mem_s1),
      .mm_console_master_requests_onchip_mem_s1                 (mm_console_master_requests_onchip_mem_s1),
      .onchip_mem_s1_address                                    (onchip_mem_s1_address),
      .onchip_mem_s1_byteenable                                 (onchip_mem_s1_byteenable),
      .onchip_mem_s1_chipselect                                 (onchip_mem_s1_chipselect),
      .onchip_mem_s1_clken                                      (onchip_mem_s1_clken),
      .onchip_mem_s1_readdata                                   (onchip_mem_s1_readdata),
      .onchip_mem_s1_readdata_from_sa                           (onchip_mem_s1_readdata_from_sa),
      .onchip_mem_s1_reset                                      (onchip_mem_s1_reset),
      .onchip_mem_s1_write                                      (onchip_mem_s1_write),
      .onchip_mem_s1_writedata                                  (onchip_mem_s1_writedata),
      .registered_cpu_data_master_read_data_valid_onchip_mem_s1 (registered_cpu_data_master_read_data_valid_onchip_mem_s1),
      .reset_n                                                  (sys_clk_reset_n)
    );

  onchip_mem the_onchip_mem
    (
      .address    (onchip_mem_s1_address),
      .byteenable (onchip_mem_s1_byteenable),
      .chipselect (onchip_mem_s1_chipselect),
      .clk        (sys_clk),
      .clken      (onchip_mem_s1_clken),
      .readdata   (onchip_mem_s1_readdata),
      .reset      (onchip_mem_s1_reset),
      .write      (onchip_mem_s1_write),
      .writedata  (onchip_mem_s1_writedata)
    );

  pll_pll_slave_arbitrator the_pll_pll_slave
    (
      .clk                                            (ext_clk),
      .d1_pll_pll_slave_end_xfer                      (d1_pll_pll_slave_end_xfer),
      .pll_pll_slave_address                          (pll_pll_slave_address),
      .pll_pll_slave_read                             (pll_pll_slave_read),
      .pll_pll_slave_readdata                         (pll_pll_slave_readdata),
      .pll_pll_slave_readdata_from_sa                 (pll_pll_slave_readdata_from_sa),
      .pll_pll_slave_reset                            (pll_pll_slave_reset),
      .pll_pll_slave_write                            (pll_pll_slave_write),
      .pll_pll_slave_writedata                        (pll_pll_slave_writedata),
      .reset_n                                        (ext_clk_reset_n),
      .uC_clock_0_out_address_to_slave                (uC_clock_0_out_address_to_slave),
      .uC_clock_0_out_granted_pll_pll_slave           (uC_clock_0_out_granted_pll_pll_slave),
      .uC_clock_0_out_qualified_request_pll_pll_slave (uC_clock_0_out_qualified_request_pll_pll_slave),
      .uC_clock_0_out_read                            (uC_clock_0_out_read),
      .uC_clock_0_out_read_data_valid_pll_pll_slave   (uC_clock_0_out_read_data_valid_pll_pll_slave),
      .uC_clock_0_out_requests_pll_pll_slave          (uC_clock_0_out_requests_pll_pll_slave),
      .uC_clock_0_out_write                           (uC_clock_0_out_write),
      .uC_clock_0_out_writedata                       (uC_clock_0_out_writedata)
    );

  //sys_clk out_clk assignment, which is an e_assign
  assign sys_clk = out_clk_pll_c0;

  pll the_pll
    (
      .address   (pll_pll_slave_address),
      .areset    (areset_to_the_pll),
      .c0        (out_clk_pll_c0),
      .clk       (ext_clk),
      .locked    (locked_from_the_pll),
      .phasedone (phasedone_from_the_pll),
      .read      (pll_pll_slave_read),
      .readdata  (pll_pll_slave_readdata),
      .reset     (pll_pll_slave_reset),
      .write     (pll_pll_slave_write),
      .writedata (pll_pll_slave_writedata)
    );

  pwr_data_s1_arbitrator the_pwr_data_s1
    (
      .clk                                           (sys_clk),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pwr_data_s1           (cpu_data_master_granted_pwr_data_s1),
      .cpu_data_master_qualified_request_pwr_data_s1 (cpu_data_master_qualified_request_pwr_data_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pwr_data_s1   (cpu_data_master_read_data_valid_pwr_data_s1),
      .cpu_data_master_requests_pwr_data_s1          (cpu_data_master_requests_pwr_data_s1),
      .cpu_data_master_waitrequest                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_pwr_data_s1_end_xfer                       (d1_pwr_data_s1_end_xfer),
      .pwr_data_s1_address                           (pwr_data_s1_address),
      .pwr_data_s1_chipselect                        (pwr_data_s1_chipselect),
      .pwr_data_s1_readdata                          (pwr_data_s1_readdata),
      .pwr_data_s1_readdata_from_sa                  (pwr_data_s1_readdata_from_sa),
      .pwr_data_s1_reset_n                           (pwr_data_s1_reset_n),
      .pwr_data_s1_write_n                           (pwr_data_s1_write_n),
      .pwr_data_s1_writedata                         (pwr_data_s1_writedata),
      .reset_n                                       (sys_clk_reset_n)
    );

  pwr_data the_pwr_data
    (
      .address    (pwr_data_s1_address),
      .bidir_port (bidir_port_to_and_from_the_pwr_data),
      .chipselect (pwr_data_s1_chipselect),
      .clk        (sys_clk),
      .readdata   (pwr_data_s1_readdata),
      .reset_n    (pwr_data_s1_reset_n),
      .write_n    (pwr_data_s1_write_n),
      .writedata  (pwr_data_s1_writedata)
    );

  pwr_en_clk_s1_arbitrator the_pwr_en_clk_s1
    (
      .clk                                             (sys_clk),
      .cpu_data_master_address_to_slave                (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pwr_en_clk_s1           (cpu_data_master_granted_pwr_en_clk_s1),
      .cpu_data_master_qualified_request_pwr_en_clk_s1 (cpu_data_master_qualified_request_pwr_en_clk_s1),
      .cpu_data_master_read                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pwr_en_clk_s1   (cpu_data_master_read_data_valid_pwr_en_clk_s1),
      .cpu_data_master_requests_pwr_en_clk_s1          (cpu_data_master_requests_pwr_en_clk_s1),
      .cpu_data_master_waitrequest                     (cpu_data_master_waitrequest),
      .cpu_data_master_write                           (cpu_data_master_write),
      .cpu_data_master_writedata                       (cpu_data_master_writedata),
      .d1_pwr_en_clk_s1_end_xfer                       (d1_pwr_en_clk_s1_end_xfer),
      .pwr_en_clk_s1_address                           (pwr_en_clk_s1_address),
      .pwr_en_clk_s1_chipselect                        (pwr_en_clk_s1_chipselect),
      .pwr_en_clk_s1_readdata                          (pwr_en_clk_s1_readdata),
      .pwr_en_clk_s1_readdata_from_sa                  (pwr_en_clk_s1_readdata_from_sa),
      .pwr_en_clk_s1_reset_n                           (pwr_en_clk_s1_reset_n),
      .pwr_en_clk_s1_write_n                           (pwr_en_clk_s1_write_n),
      .pwr_en_clk_s1_writedata                         (pwr_en_clk_s1_writedata),
      .reset_n                                         (sys_clk_reset_n)
    );

  pwr_en_clk the_pwr_en_clk
    (
      .address    (pwr_en_clk_s1_address),
      .chipselect (pwr_en_clk_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_pwr_en_clk),
      .readdata   (pwr_en_clk_s1_readdata),
      .reset_n    (pwr_en_clk_s1_reset_n),
      .write_n    (pwr_en_clk_s1_write_n),
      .writedata  (pwr_en_clk_s1_writedata)
    );

  sys_timer_s1_arbitrator the_sys_timer_s1
    (
      .clk                                            (sys_clk),
      .cpu_data_master_address_to_slave               (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sys_timer_s1           (cpu_data_master_granted_sys_timer_s1),
      .cpu_data_master_qualified_request_sys_timer_s1 (cpu_data_master_qualified_request_sys_timer_s1),
      .cpu_data_master_read                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sys_timer_s1   (cpu_data_master_read_data_valid_sys_timer_s1),
      .cpu_data_master_requests_sys_timer_s1          (cpu_data_master_requests_sys_timer_s1),
      .cpu_data_master_waitrequest                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                          (cpu_data_master_write),
      .cpu_data_master_writedata                      (cpu_data_master_writedata),
      .d1_sys_timer_s1_end_xfer                       (d1_sys_timer_s1_end_xfer),
      .reset_n                                        (sys_clk_reset_n),
      .sys_timer_s1_address                           (sys_timer_s1_address),
      .sys_timer_s1_chipselect                        (sys_timer_s1_chipselect),
      .sys_timer_s1_irq                               (sys_timer_s1_irq),
      .sys_timer_s1_irq_from_sa                       (sys_timer_s1_irq_from_sa),
      .sys_timer_s1_readdata                          (sys_timer_s1_readdata),
      .sys_timer_s1_readdata_from_sa                  (sys_timer_s1_readdata_from_sa),
      .sys_timer_s1_reset_n                           (sys_timer_s1_reset_n),
      .sys_timer_s1_write_n                           (sys_timer_s1_write_n),
      .sys_timer_s1_writedata                         (sys_timer_s1_writedata)
    );

  sys_timer the_sys_timer
    (
      .address    (sys_timer_s1_address),
      .chipselect (sys_timer_s1_chipselect),
      .clk        (sys_clk),
      .irq        (sys_timer_s1_irq),
      .readdata   (sys_timer_s1_readdata),
      .reset_n    (sys_timer_s1_reset_n),
      .write_n    (sys_timer_s1_write_n),
      .writedata  (sys_timer_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                   (sys_clk),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_qualified_request_sysid_control_slave (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sysid_control_slave   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (sys_clk_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  tri_state_bridge_0_avalon_slave_arbitrator the_tri_state_bridge_0_avalon_slave
    (
      .ADAS3022_0_avalon_master_address_to_slave               (ADAS3022_0_avalon_master_address_to_slave),
      .ADAS3022_0_avalon_master_granted_sram_s1                (ADAS3022_0_avalon_master_granted_sram_s1),
      .ADAS3022_0_avalon_master_qualified_request_sram_s1      (ADAS3022_0_avalon_master_qualified_request_sram_s1),
      .ADAS3022_0_avalon_master_requests_sram_s1               (ADAS3022_0_avalon_master_requests_sram_s1),
      .ADAS3022_0_avalon_master_write                          (ADAS3022_0_avalon_master_write),
      .ADAS3022_0_avalon_master_writedata                      (ADAS3022_0_avalon_master_writedata),
      .clk                                                     (sys_clk),
      .cpu_data_master_address_to_slave                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                              (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sram_s1                      (cpu_data_master_byteenable_sram_s1),
      .cpu_data_master_dbs_address                             (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                            (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sram_s1                         (cpu_data_master_granted_sram_s1),
      .cpu_data_master_no_byte_enables_and_last_term           (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_sram_s1               (cpu_data_master_qualified_request_sram_s1),
      .cpu_data_master_read                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sram_s1                 (cpu_data_master_read_data_valid_sram_s1),
      .cpu_data_master_requests_sram_s1                        (cpu_data_master_requests_sram_s1),
      .cpu_data_master_waitrequest                             (cpu_data_master_waitrequest),
      .cpu_data_master_write                                   (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                 (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                      (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_sram_s1                  (cpu_instruction_master_granted_sram_s1),
      .cpu_instruction_master_qualified_request_sram_s1        (cpu_instruction_master_qualified_request_sram_s1),
      .cpu_instruction_master_read                             (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sram_s1          (cpu_instruction_master_read_data_valid_sram_s1),
      .cpu_instruction_master_requests_sram_s1                 (cpu_instruction_master_requests_sram_s1),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer             (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_0_data                        (incoming_tri_state_bridge_0_data),
      .incoming_tri_state_bridge_0_data_with_Xs_converted_to_0 (incoming_tri_state_bridge_0_data_with_Xs_converted_to_0),
      .mm_console_master_byteenable_sram_s1                    (mm_console_master_byteenable_sram_s1),
      .mm_console_master_dbs_address                           (mm_console_master_dbs_address),
      .mm_console_master_dbs_write_16                          (mm_console_master_dbs_write_16),
      .mm_console_master_granted_sram_s1                       (mm_console_master_granted_sram_s1),
      .mm_console_master_latency_counter                       (mm_console_master_latency_counter),
      .mm_console_master_master_address_to_slave               (mm_console_master_master_address_to_slave),
      .mm_console_master_master_byteenable                     (mm_console_master_master_byteenable),
      .mm_console_master_master_read                           (mm_console_master_master_read),
      .mm_console_master_master_write                          (mm_console_master_master_write),
      .mm_console_master_qualified_request_sram_s1             (mm_console_master_qualified_request_sram_s1),
      .mm_console_master_read_data_valid_sram_s1               (mm_console_master_read_data_valid_sram_s1),
      .mm_console_master_requests_sram_s1                      (mm_console_master_requests_sram_s1),
      .registered_cpu_data_master_read_data_valid_sram_s1      (registered_cpu_data_master_read_data_valid_sram_s1),
      .reset_n                                                 (sys_clk_reset_n),
      .select_n_to_the_sram                                    (select_n_to_the_sram),
      .tri_state_bridge_0_address                              (tri_state_bridge_0_address),
      .tri_state_bridge_0_data                                 (tri_state_bridge_0_data),
      .tri_state_bridge_0_readn                                (tri_state_bridge_0_readn),
      .tri_state_bridge_0_writen                               (tri_state_bridge_0_writen)
    );

  uC_clock_0_in_arbitrator the_uC_clock_0_in
    (
      .clk                                             (sys_clk),
      .cpu_data_master_address_to_slave                (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                      (cpu_data_master_byteenable),
      .cpu_data_master_granted_uC_clock_0_in           (cpu_data_master_granted_uC_clock_0_in),
      .cpu_data_master_qualified_request_uC_clock_0_in (cpu_data_master_qualified_request_uC_clock_0_in),
      .cpu_data_master_read                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_uC_clock_0_in   (cpu_data_master_read_data_valid_uC_clock_0_in),
      .cpu_data_master_requests_uC_clock_0_in          (cpu_data_master_requests_uC_clock_0_in),
      .cpu_data_master_waitrequest                     (cpu_data_master_waitrequest),
      .cpu_data_master_write                           (cpu_data_master_write),
      .cpu_data_master_writedata                       (cpu_data_master_writedata),
      .d1_uC_clock_0_in_end_xfer                       (d1_uC_clock_0_in_end_xfer),
      .reset_n                                         (sys_clk_reset_n),
      .uC_clock_0_in_address                           (uC_clock_0_in_address),
      .uC_clock_0_in_byteenable                        (uC_clock_0_in_byteenable),
      .uC_clock_0_in_endofpacket                       (uC_clock_0_in_endofpacket),
      .uC_clock_0_in_endofpacket_from_sa               (uC_clock_0_in_endofpacket_from_sa),
      .uC_clock_0_in_nativeaddress                     (uC_clock_0_in_nativeaddress),
      .uC_clock_0_in_read                              (uC_clock_0_in_read),
      .uC_clock_0_in_readdata                          (uC_clock_0_in_readdata),
      .uC_clock_0_in_readdata_from_sa                  (uC_clock_0_in_readdata_from_sa),
      .uC_clock_0_in_reset_n                           (uC_clock_0_in_reset_n),
      .uC_clock_0_in_waitrequest                       (uC_clock_0_in_waitrequest),
      .uC_clock_0_in_waitrequest_from_sa               (uC_clock_0_in_waitrequest_from_sa),
      .uC_clock_0_in_write                             (uC_clock_0_in_write),
      .uC_clock_0_in_writedata                         (uC_clock_0_in_writedata)
    );

  uC_clock_0_out_arbitrator the_uC_clock_0_out
    (
      .clk                                            (ext_clk),
      .d1_pll_pll_slave_end_xfer                      (d1_pll_pll_slave_end_xfer),
      .pll_pll_slave_readdata_from_sa                 (pll_pll_slave_readdata_from_sa),
      .reset_n                                        (ext_clk_reset_n),
      .uC_clock_0_out_address                         (uC_clock_0_out_address),
      .uC_clock_0_out_address_to_slave                (uC_clock_0_out_address_to_slave),
      .uC_clock_0_out_byteenable                      (uC_clock_0_out_byteenable),
      .uC_clock_0_out_granted_pll_pll_slave           (uC_clock_0_out_granted_pll_pll_slave),
      .uC_clock_0_out_qualified_request_pll_pll_slave (uC_clock_0_out_qualified_request_pll_pll_slave),
      .uC_clock_0_out_read                            (uC_clock_0_out_read),
      .uC_clock_0_out_read_data_valid_pll_pll_slave   (uC_clock_0_out_read_data_valid_pll_pll_slave),
      .uC_clock_0_out_readdata                        (uC_clock_0_out_readdata),
      .uC_clock_0_out_requests_pll_pll_slave          (uC_clock_0_out_requests_pll_pll_slave),
      .uC_clock_0_out_reset_n                         (uC_clock_0_out_reset_n),
      .uC_clock_0_out_waitrequest                     (uC_clock_0_out_waitrequest),
      .uC_clock_0_out_write                           (uC_clock_0_out_write),
      .uC_clock_0_out_writedata                       (uC_clock_0_out_writedata)
    );

  uC_clock_0 the_uC_clock_0
    (
      .master_address       (uC_clock_0_out_address),
      .master_byteenable    (uC_clock_0_out_byteenable),
      .master_clk           (ext_clk),
      .master_endofpacket   (uC_clock_0_out_endofpacket),
      .master_nativeaddress (uC_clock_0_out_nativeaddress),
      .master_read          (uC_clock_0_out_read),
      .master_readdata      (uC_clock_0_out_readdata),
      .master_reset_n       (uC_clock_0_out_reset_n),
      .master_waitrequest   (uC_clock_0_out_waitrequest),
      .master_write         (uC_clock_0_out_write),
      .master_writedata     (uC_clock_0_out_writedata),
      .slave_address        (uC_clock_0_in_address),
      .slave_byteenable     (uC_clock_0_in_byteenable),
      .slave_clk            (sys_clk),
      .slave_endofpacket    (uC_clock_0_in_endofpacket),
      .slave_nativeaddress  (uC_clock_0_in_nativeaddress),
      .slave_read           (uC_clock_0_in_read),
      .slave_readdata       (uC_clock_0_in_readdata),
      .slave_reset_n        (uC_clock_0_in_reset_n),
      .slave_waitrequest    (uC_clock_0_in_waitrequest),
      .slave_write          (uC_clock_0_in_write),
      .slave_writedata      (uC_clock_0_in_writedata)
    );

  ucprobe_uart_avalon_jtag_slave_arbitrator the_ucprobe_uart_avalon_jtag_slave
    (
      .clk                                                              (sys_clk),
      .cpu_data_master_address_to_slave                                 (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave           (cpu_data_master_granted_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave (cpu_data_master_qualified_request_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_read                                             (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave          (cpu_data_master_requests_ucprobe_uart_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                      (cpu_data_master_waitrequest),
      .cpu_data_master_write                                            (cpu_data_master_write),
      .cpu_data_master_writedata                                        (cpu_data_master_writedata),
      .d1_ucprobe_uart_avalon_jtag_slave_end_xfer                       (d1_ucprobe_uart_avalon_jtag_slave_end_xfer),
      .reset_n                                                          (sys_clk_reset_n),
      .ucprobe_uart_avalon_jtag_slave_address                           (ucprobe_uart_avalon_jtag_slave_address),
      .ucprobe_uart_avalon_jtag_slave_chipselect                        (ucprobe_uart_avalon_jtag_slave_chipselect),
      .ucprobe_uart_avalon_jtag_slave_dataavailable                     (ucprobe_uart_avalon_jtag_slave_dataavailable),
      .ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa             (ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa),
      .ucprobe_uart_avalon_jtag_slave_irq                               (ucprobe_uart_avalon_jtag_slave_irq),
      .ucprobe_uart_avalon_jtag_slave_irq_from_sa                       (ucprobe_uart_avalon_jtag_slave_irq_from_sa),
      .ucprobe_uart_avalon_jtag_slave_read_n                            (ucprobe_uart_avalon_jtag_slave_read_n),
      .ucprobe_uart_avalon_jtag_slave_readdata                          (ucprobe_uart_avalon_jtag_slave_readdata),
      .ucprobe_uart_avalon_jtag_slave_readdata_from_sa                  (ucprobe_uart_avalon_jtag_slave_readdata_from_sa),
      .ucprobe_uart_avalon_jtag_slave_readyfordata                      (ucprobe_uart_avalon_jtag_slave_readyfordata),
      .ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa              (ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa),
      .ucprobe_uart_avalon_jtag_slave_reset_n                           (ucprobe_uart_avalon_jtag_slave_reset_n),
      .ucprobe_uart_avalon_jtag_slave_waitrequest                       (ucprobe_uart_avalon_jtag_slave_waitrequest),
      .ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa               (ucprobe_uart_avalon_jtag_slave_waitrequest_from_sa),
      .ucprobe_uart_avalon_jtag_slave_write_n                           (ucprobe_uart_avalon_jtag_slave_write_n),
      .ucprobe_uart_avalon_jtag_slave_writedata                         (ucprobe_uart_avalon_jtag_slave_writedata)
    );

  ucprobe_uart the_ucprobe_uart
    (
      .av_address     (ucprobe_uart_avalon_jtag_slave_address),
      .av_chipselect  (ucprobe_uart_avalon_jtag_slave_chipselect),
      .av_irq         (ucprobe_uart_avalon_jtag_slave_irq),
      .av_read_n      (ucprobe_uart_avalon_jtag_slave_read_n),
      .av_readdata    (ucprobe_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (ucprobe_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (ucprobe_uart_avalon_jtag_slave_write_n),
      .av_writedata   (ucprobe_uart_avalon_jtag_slave_writedata),
      .clk            (sys_clk),
      .dataavailable  (ucprobe_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (ucprobe_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (ucprobe_uart_avalon_jtag_slave_reset_n)
    );

  //reset is asserted asynchronously and deasserted synchronously
  uC_reset_sys_clk_domain_synch_module uC_reset_sys_clk_domain_synch
    (
      .clk      (sys_clk),
      .data_in  (1'b1),
      .data_out (sys_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    mm_console_master_master_resetrequest |
    0 |
    mm_console_master_master_resetrequest);

  //reset is asserted asynchronously and deasserted synchronously
  uC_reset_ext_clk_domain_synch_module uC_reset_ext_clk_domain_synch
    (
      .clk      (ext_clk),
      .data_in  (1'b1),
      .data_out (ext_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;

  //uC_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign uC_clock_0_out_endofpacket = 0;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_lane0_module (
                           // inputs:
                            data,
                            rdaddress,
                            rdclken,
                            wraddress,
                            wrclock,
                            wren,

                           // outputs:
                            q
                         )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("sram_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "sram_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_lane1_module (
                           // inputs:
                            data,
                            rdaddress,
                            rdclken,
                            wraddress,
                            wrclock,
                            wren,

                           // outputs:
                            q
                         )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("sram_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "sram_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram (
              // inputs:
               address,
               read_n,
               select_n,
               write_n,

              // outputs:
               data
            )
;

  inout   [ 15: 0] data;
  input   [ 20: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //sram_lane0, which is an e_ram
  sram_lane0_module sram_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //sram_lane1, which is an e_ram
  sram_lane1_module sram_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/11.0/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/11.0/quartus/eda/sim_lib/220model.v"
`include "c:/altera/11.0/quartus/eda/sim_lib/sgate.v"
`include "IP/ADAS3022/hdl/src/ADAS3022_Avalon_core.v"
`include "IP/ADAS3022/hdl/src/Eval_Board_interface.v"
`include "IP/ADAS3022/hdl/src/write_master.v"
`include "ADAS3022_0.v"
`include "pll.vo"
`include "pwr_en_clk.v"
`include "i2c_int.v"
`include "leds.v"
`include "cpu_test_bench.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "sysid.v"
`include "pwr_data.v"
`include "sys_timer.v"
`include "onchip_mem.v"
`include "jtag_uart_0.v"
`include "ucprobe_uart.v"
`include "uC_clock_0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             areset_to_the_pll;
  wire    [  4: 0] baddr_o_from_the_ADAS3022_0;
  wire             bbusy_i_to_the_ADAS3022_0;
  wire    [ 15: 0] bdb_io_to_and_from_the_ADAS3022_0;
  wire    [  7: 0] bidir_port_to_and_from_the_pwr_data;
  wire             brd_n_o_from_the_ADAS3022_0;
  wire             breset_o_from_the_ADAS3022_0;
  wire             bwr_n_o_from_the_ADAS3022_0;
  wire             clk;
  reg              ext_clk;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             locked_from_the_pll;
  wire    [  4: 0] out_port_from_the_i2c_int;
  wire    [  2: 0] out_port_from_the_leds;
  wire             out_port_from_the_pwr_en_clk;
  wire             phasedone_from_the_pll;
  reg              reset_n;
  wire             select_n_to_the_sram;
  wire             sys_clk;
  wire             sysid_control_slave_clock;
  wire    [ 21: 0] tri_state_bridge_0_address;
  wire    [ 15: 0] tri_state_bridge_0_data;
  wire             tri_state_bridge_0_readn;
  wire             tri_state_bridge_0_writen;
  wire             uC_clock_0_in_endofpacket_from_sa;
  wire             uC_clock_0_out_endofpacket;
  wire    [  1: 0] uC_clock_0_out_nativeaddress;
  wire             ucprobe_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             ucprobe_uart_avalon_jtag_slave_readyfordata_from_sa;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  uC DUT
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

  sram the_sram
    (
      .address  (tri_state_bridge_0_address[21 : 1]),
      .data     (tri_state_bridge_0_data),
      .read_n   (tri_state_bridge_0_readn),
      .select_n (select_n_to_the_sram),
      .write_n  (tri_state_bridge_0_writen)
    );

  initial
    ext_clk = 1'b0;
  always
     if (ext_clk == 1'b1) 
    #31 ext_clk <= ~ext_clk;
     else 
    #32 ext_clk <= ~ext_clk;
  
  initial 
    begin
      reset_n <= 0;
      #625 reset_n <= 1;
    end

endmodule


//synthesis translate_on