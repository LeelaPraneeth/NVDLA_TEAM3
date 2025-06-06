//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_CMAC_B.rdl
//   Parms: opendla.parms
//   Date: Tue May 06 14:04:53 PDT 2025
//

import uvm_pkg::*;
import ordt_uvm_reg_pkg::*;

// S_STATUS
class reg_addrmap_NVDLA_NVDLA_CMAC_B_S_STATUS extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl STATUS_0;
  rand uvm_reg_field_rdl STATUS_1;
  
  function new(string name = "reg_addrmap_NVDLA_NVDLA_CMAC_B_S_STATUS");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.STATUS_0 = new("STATUS_0");
    this.STATUS_0.set_rdl_access_info(1, 0, 0, 1, 0, 0);
    this.STATUS_0.configure(this, 2, 0, "RO", 1, 2'h0, 1, 0, 0);
    this.STATUS_0.add_def_property("spec_access", "r");
    this.STATUS_0.add_def_property("spec_sw_default", "0x0");
    this.STATUS_0.add_def_property("sw_default_mask", "0x0");
    this.STATUS_0.add_def_property("reset_mask", "0x3");
    this.STATUS_1 = new("STATUS_1");
    this.STATUS_1.set_rdl_access_info(1, 0, 0, 1, 0, 0);
    this.STATUS_1.configure(this, 2, 16, "RO", 1, 2'h0, 1, 0, 0);
    this.STATUS_1.add_def_property("spec_access", "r");
    this.STATUS_1.add_def_property("spec_sw_default", "0x0");
    this.STATUS_1.add_def_property("sw_default_mask", "0x0");
    this.STATUS_1.add_def_property("reset_mask", "0x3");
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "STATUS_0"}, 0, 2);
    add_hdl_path_slice({rdl_reg_name, "STATUS_1"}, 16, 2);
  endfunction: build
  
endclass : reg_addrmap_NVDLA_NVDLA_CMAC_B_S_STATUS

// S_POINTER
class reg_addrmap_NVDLA_NVDLA_CMAC_B_S_POINTER extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl PRODUCER;
  rand uvm_reg_field_rdl CONSUMER;
  
  function new(string name = "reg_addrmap_NVDLA_NVDLA_CMAC_B_S_POINTER");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.PRODUCER = new("PRODUCER");
    this.PRODUCER.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.PRODUCER.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
    this.PRODUCER.add_def_property("spec_access", "rw");
    this.PRODUCER.add_def_property("spec_sw_default", "0x0");
    this.PRODUCER.add_def_property("sw_default_mask", "0x0");
    this.PRODUCER.add_def_property("reset_mask", "0x1");
    this.CONSUMER = new("CONSUMER");
    this.CONSUMER.set_rdl_access_info(1, 0, 0, 1, 0, 0);
    this.CONSUMER.configure(this, 1, 16, "RO", 1, 1'h0, 1, 0, 0);
    this.CONSUMER.add_def_property("spec_access", "r");
    this.CONSUMER.add_def_property("spec_sw_default", "0x0");
    this.CONSUMER.add_def_property("sw_default_mask", "0x0");
    this.CONSUMER.add_def_property("reset_mask", "0x1");
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "PRODUCER"}, 0, 1);
    add_hdl_path_slice({rdl_reg_name, "CONSUMER"}, 16, 1);
  endfunction: build
  
endclass : reg_addrmap_NVDLA_NVDLA_CMAC_B_S_POINTER

// D_OP_ENABLE
class reg_addrmap_NVDLA_NVDLA_CMAC_B_D_OP_ENABLE extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl OP_EN;
  
  function new(string name = "reg_addrmap_NVDLA_NVDLA_CMAC_B_D_OP_ENABLE");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.OP_EN = new("OP_EN");
    this.OP_EN.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.OP_EN.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    this.OP_EN.add_def_property("spec_access", "rwto");
    this.OP_EN.add_def_property("spec_sw_default", "0x0");
    this.OP_EN.add_def_property("sw_default_mask", "0x0");
    this.OP_EN.add_def_property("reset_mask", "0x1");
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "OP_EN"}, 0, 1);
  endfunction: build
  
endclass : reg_addrmap_NVDLA_NVDLA_CMAC_B_D_OP_ENABLE

// D_MISC_CFG
class reg_addrmap_NVDLA_NVDLA_CMAC_B_D_MISC_CFG extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl CONV_MODE;
  rand uvm_reg_field_rdl PROC_PRECISION;
  
  function new(string name = "reg_addrmap_NVDLA_NVDLA_CMAC_B_D_MISC_CFG");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.CONV_MODE = new("CONV_MODE");
    this.CONV_MODE.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.CONV_MODE.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
    this.CONV_MODE.add_def_property("spec_access", "rw");
    this.CONV_MODE.add_def_property("spec_sw_default", "0x0");
    this.CONV_MODE.add_def_property("sw_default_mask", "0x0");
    this.CONV_MODE.add_def_property("reset_mask", "0x1");
    this.PROC_PRECISION = new("PROC_PRECISION");
    this.PROC_PRECISION.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.PROC_PRECISION.configure(this, 2, 12, "RW", 0, 2'h1, 1, 1, 0);
    this.PROC_PRECISION.add_def_property("spec_access", "rw");
    this.PROC_PRECISION.add_def_property("spec_sw_default", "0x0");
    this.PROC_PRECISION.add_def_property("sw_default_mask", "0x0");
    this.PROC_PRECISION.add_def_property("reset_mask", "0x3");
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "CONV_MODE"}, 0, 1);
    add_hdl_path_slice({rdl_reg_name, "PROC_PRECISION"}, 12, 2);
  endfunction: build
  
endclass : reg_addrmap_NVDLA_NVDLA_CMAC_B_D_MISC_CFG

// Block NVDLA_CMAC_B
class block_addrmap_NVDLA_NVDLA_CMAC_B extends uvm_reg_block_rdl;
  rand reg_addrmap_NVDLA_NVDLA_CMAC_B_S_STATUS S_STATUS;
  rand reg_addrmap_NVDLA_NVDLA_CMAC_B_S_POINTER S_POINTER;
  rand reg_addrmap_NVDLA_NVDLA_CMAC_B_D_OP_ENABLE D_OP_ENABLE;
  rand reg_addrmap_NVDLA_NVDLA_CMAC_B_D_MISC_CFG D_MISC_CFG;
  
  function new(string name = "block_addrmap_NVDLA_NVDLA_CMAC_B");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 1);
    this.S_STATUS = new("S_STATUS");
    this.S_STATUS.configure(this, null, "");
    this.S_STATUS.set_rdl_tag("S_STATUS_");
    this.S_STATUS.set_reg_test_info(0, 0, 32);
    this.S_STATUS.build();
    this.default_map.add_reg(this.S_STATUS, `UVM_REG_ADDR_WIDTH'h0, "RO", 0);
    this.S_POINTER = new("S_POINTER");
    this.S_POINTER.configure(this, null, "");
    this.S_POINTER.set_rdl_tag("S_POINTER_");
    this.S_POINTER.set_reg_test_info(0, 0, 0);
    this.S_POINTER.build();
    this.default_map.add_reg(this.S_POINTER, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
    this.D_OP_ENABLE = new("D_OP_ENABLE");
    this.D_OP_ENABLE.configure(this, null, "");
    this.D_OP_ENABLE.set_rdl_tag("D_OP_ENABLE_");
    this.D_OP_ENABLE.set_reg_test_info(0, 0, 2);
    this.D_OP_ENABLE.build();
    this.default_map.add_reg(this.D_OP_ENABLE, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
    this.D_MISC_CFG = new("D_MISC_CFG");
    this.D_MISC_CFG.configure(this, null, "");
    this.D_MISC_CFG.set_rdl_tag("D_MISC_CFG_");
    this.D_MISC_CFG.set_reg_test_info(0, 0, 2);
    this.D_MISC_CFG.build();
    this.default_map.add_reg(this.D_MISC_CFG, `UVM_REG_ADDR_WIDTH'hc, "RW", 0);
  endfunction: build
  
  `uvm_object_utils(block_addrmap_NVDLA_NVDLA_CMAC_B)
endclass : block_addrmap_NVDLA_NVDLA_CMAC_B

// Base block
class block_addrmap_NVDLA extends uvm_reg_block_rdl;
  rand block_addrmap_NVDLA_NVDLA_CMAC_B NVDLA_CMAC_B;
  
  function new(string name = "block_addrmap_NVDLA");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", `UVM_REG_ADDR_WIDTH'h0, 4, UVM_LITTLE_ENDIAN, 1);
    this.set_rdl_address_map(1);
    this.set_rdl_address_map_hdl_path({`ADDRMAP_NVDLA_PIO_INSTANCE_PATH, ".pio_logic"});
    this.NVDLA_CMAC_B = block_addrmap_NVDLA_NVDLA_CMAC_B::type_id::create("NVDLA_CMAC_B",, get_full_name());
    this.NVDLA_CMAC_B.configure(this, "");
    this.NVDLA_CMAC_B.set_rdl_tag("NVDLA_CMAC_B_");
    this.NVDLA_CMAC_B.build();
    this.default_map.add_submap(this.NVDLA_CMAC_B.default_map, `UVM_REG_ADDR_WIDTH'h6000);
    set_hdl_path_root({`ADDRMAP_NVDLA_PIO_INSTANCE_PATH, ".pio_logic"});
    this.add_callbacks();
  endfunction: build
  
  `uvm_object_utils(block_addrmap_NVDLA)
endclass : block_addrmap_NVDLA
