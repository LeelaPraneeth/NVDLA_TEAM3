// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================

// File Name: nv_ram_rwsp_160x16.v

`timescale 1ns / 10ps
module nv_ram_rwsp_160x16 (
        clk,
        ra,
        re,
        ore,
        dout,
        wa,
        we,
        di,
        pwrbus_ram_pd
        );
parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;

// port list
input           clk;
input  [7:0]    ra;
input           re;
input           ore;
output [15:0]   dout;
input  [7:0]    wa;
input           we;
input  [15:0]   di;
input  [31:0]   pwrbus_ram_pd;



// This wrapper consists of :  1 Ram cells: RAMPDP_160X16_GL_M2_D2 ;  

//Wires for Misc Ports 
wire  DFT_clamp;

//Wires for Mbist Ports 
wire [7:0] mbist_Wa_w0;
wire [1:0] mbist_Di_w0;
wire  mbist_we_w0;
wire [7:0] mbist_Ra_r0;

// verilint 528 off - Variable set but not used
wire [15:0] mbist_Do_r0_int_net;
// verilint 528 on - Variable set but not used
wire  mbist_ce_r0;
wire  mbist_en_sync;

//Wires for RamAccess Ports 
wire  SI;

// verilint 528 off - Variable set but not used
wire  SO_int_net;
// verilint 528 on - Variable set but not used
wire  shiftDR;
wire  updateDR;
wire  debug_mode;

//Wires for Misc Ports 
wire  mbist_ramaccess_rst_;
wire  ary_atpg_ctl;
wire  write_inh;
wire  scan_ramtms;
wire  iddq_mode;
wire  jtag_readonly_mode;
wire  ary_read_inh;
wire  test_mode;
wire  scan_en;
wire [7:0] svop;

// Use Bbox and clamps to clamp and tie off the DFT signals in the wrapper 
NV_BLKBOX_SRC0 UI_enableDFTmode_async_ld_buf (.Y(DFT_clamp));
wire pre_mbist_Wa_w0_0;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_0 (.Y(pre_mbist_Wa_w0_0));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_0 (.Z(mbist_Wa_w0[0]), .A1(pre_mbist_Wa_w0_0), .A2(DFT_clamp) );
wire pre_mbist_Wa_w0_1;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_1 (.Y(pre_mbist_Wa_w0_1));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_1 (.Z(mbist_Wa_w0[1]), .A1(pre_mbist_Wa_w0_1), .A2(DFT_clamp) );
wire pre_mbist_Wa_w0_2;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_2 (.Y(pre_mbist_Wa_w0_2));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_2 (.Z(mbist_Wa_w0[2]), .A1(pre_mbist_Wa_w0_2), .A2(DFT_clamp) );
wire pre_mbist_Wa_w0_3;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_3 (.Y(pre_mbist_Wa_w0_3));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_3 (.Z(mbist_Wa_w0[3]), .A1(pre_mbist_Wa_w0_3), .A2(DFT_clamp) );
wire pre_mbist_Wa_w0_4;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_4 (.Y(pre_mbist_Wa_w0_4));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_4 (.Z(mbist_Wa_w0[4]), .A1(pre_mbist_Wa_w0_4), .A2(DFT_clamp) );
wire pre_mbist_Wa_w0_5;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_5 (.Y(pre_mbist_Wa_w0_5));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_5 (.Z(mbist_Wa_w0[5]), .A1(pre_mbist_Wa_w0_5), .A2(DFT_clamp) );
wire pre_mbist_Wa_w0_6;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_6 (.Y(pre_mbist_Wa_w0_6));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_6 (.Z(mbist_Wa_w0[6]), .A1(pre_mbist_Wa_w0_6), .A2(DFT_clamp) );
wire pre_mbist_Wa_w0_7;
NV_BLKBOX_SRC0_X testInst_mbist_Wa_w0_7 (.Y(pre_mbist_Wa_w0_7));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Wa_w0_7 (.Z(mbist_Wa_w0[7]), .A1(pre_mbist_Wa_w0_7), .A2(DFT_clamp) );
wire pre_mbist_Di_w0_0;
NV_BLKBOX_SRC0_X testInst_mbist_Di_w0_0 (.Y(pre_mbist_Di_w0_0));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Di_w0_0 (.Z(mbist_Di_w0[0]), .A1(pre_mbist_Di_w0_0), .A2(DFT_clamp) );
wire pre_mbist_Di_w0_1;
NV_BLKBOX_SRC0_X testInst_mbist_Di_w0_1 (.Y(pre_mbist_Di_w0_1));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Di_w0_1 (.Z(mbist_Di_w0[1]), .A1(pre_mbist_Di_w0_1), .A2(DFT_clamp) );
wire pre_mbist_we_w0;
NV_BLKBOX_SRC0_X testInst_mbist_we_w0 (.Y(pre_mbist_we_w0));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_we_w0 (.Z(mbist_we_w0), .A1(pre_mbist_we_w0), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_0;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_0 (.Y(pre_mbist_Ra_r0_0));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_0 (.Z(mbist_Ra_r0[0]), .A1(pre_mbist_Ra_r0_0), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_1;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_1 (.Y(pre_mbist_Ra_r0_1));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_1 (.Z(mbist_Ra_r0[1]), .A1(pre_mbist_Ra_r0_1), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_2;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_2 (.Y(pre_mbist_Ra_r0_2));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_2 (.Z(mbist_Ra_r0[2]), .A1(pre_mbist_Ra_r0_2), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_3;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_3 (.Y(pre_mbist_Ra_r0_3));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_3 (.Z(mbist_Ra_r0[3]), .A1(pre_mbist_Ra_r0_3), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_4;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_4 (.Y(pre_mbist_Ra_r0_4));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_4 (.Z(mbist_Ra_r0[4]), .A1(pre_mbist_Ra_r0_4), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_5;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_5 (.Y(pre_mbist_Ra_r0_5));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_5 (.Z(mbist_Ra_r0[5]), .A1(pre_mbist_Ra_r0_5), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_6;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_6 (.Y(pre_mbist_Ra_r0_6));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_6 (.Z(mbist_Ra_r0[6]), .A1(pre_mbist_Ra_r0_6), .A2(DFT_clamp) );
wire pre_mbist_Ra_r0_7;
NV_BLKBOX_SRC0_X testInst_mbist_Ra_r0_7 (.Y(pre_mbist_Ra_r0_7));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_Ra_r0_7 (.Z(mbist_Ra_r0[7]), .A1(pre_mbist_Ra_r0_7), .A2(DFT_clamp) );
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_0 (.A(mbist_Do_r0_int_net[0]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_1 (.A(mbist_Do_r0_int_net[1]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_2 (.A(mbist_Do_r0_int_net[2]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_3 (.A(mbist_Do_r0_int_net[3]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_4 (.A(mbist_Do_r0_int_net[4]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_5 (.A(mbist_Do_r0_int_net[5]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_6 (.A(mbist_Do_r0_int_net[6]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_7 (.A(mbist_Do_r0_int_net[7]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_8 (.A(mbist_Do_r0_int_net[8]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_9 (.A(mbist_Do_r0_int_net[9]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_10 (.A(mbist_Do_r0_int_net[10]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_11 (.A(mbist_Do_r0_int_net[11]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_12 (.A(mbist_Do_r0_int_net[12]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_13 (.A(mbist_Do_r0_int_net[13]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_14 (.A(mbist_Do_r0_int_net[14]));
`endif 
`ifndef FPGA 
NV_BLKBOX_SINK testInst_mbist_Do_r0_15 (.A(mbist_Do_r0_int_net[15]));
`endif 
wire pre_mbist_ce_r0;
NV_BLKBOX_SRC0_X testInst_mbist_ce_r0 (.Y(pre_mbist_ce_r0));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_ce_r0 (.Z(mbist_ce_r0), .A1(pre_mbist_ce_r0), .A2(DFT_clamp) );
wire pre_mbist_en_sync;
NV_BLKBOX_SRC0_X testInst_mbist_en_sync (.Y(pre_mbist_en_sync));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_en_sync (.Z(mbist_en_sync), .A1(pre_mbist_en_sync), .A2(DFT_clamp) );
wire pre_SI;
NV_BLKBOX_SRC0_X testInst_SI (.Y(pre_SI));
AN2D4PO4 UJ_DFTQUALIFIER_SI (.Z(SI), .A1(pre_SI), .A2(DFT_clamp) );
`ifndef FPGA 
NV_BLKBOX_SINK testInst_SO (.A(SO_int_net));
`endif 
wire pre_shiftDR;
NV_BLKBOX_SRC0_X testInst_shiftDR (.Y(pre_shiftDR));
AN2D4PO4 UJ_DFTQUALIFIER_shiftDR (.Z(shiftDR), .A1(pre_shiftDR), .A2(DFT_clamp) );
wire pre_updateDR;
NV_BLKBOX_SRC0_X testInst_updateDR (.Y(pre_updateDR));
AN2D4PO4 UJ_DFTQUALIFIER_updateDR (.Z(updateDR), .A1(pre_updateDR), .A2(DFT_clamp) );
wire pre_debug_mode;
NV_BLKBOX_SRC0_X testInst_debug_mode (.Y(pre_debug_mode));
AN2D4PO4 UJ_DFTQUALIFIER_debug_mode (.Z(debug_mode), .A1(pre_debug_mode), .A2(DFT_clamp) );
wire pre_mbist_ramaccess_rst_;
NV_BLKBOX_SRC0_X testInst_mbist_ramaccess_rst_ (.Y(pre_mbist_ramaccess_rst_));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_ramaccess_rst_ (.Z(mbist_ramaccess_rst_), .A1(pre_mbist_ramaccess_rst_), .A2(DFT_clamp) );
wire pre_ary_atpg_ctl;
NV_BLKBOX_SRC0_X testInst_ary_atpg_ctl (.Y(pre_ary_atpg_ctl));
AN2D4PO4 UJ_DFTQUALIFIER_ary_atpg_ctl (.Z(ary_atpg_ctl), .A1(pre_ary_atpg_ctl), .A2(DFT_clamp) );
wire pre_write_inh;
NV_BLKBOX_SRC0_X testInst_write_inh (.Y(pre_write_inh));
AN2D4PO4 UJ_DFTQUALIFIER_write_inh (.Z(write_inh), .A1(pre_write_inh), .A2(DFT_clamp) );
wire pre_scan_ramtms;
NV_BLKBOX_SRC0_X testInst_scan_ramtms (.Y(pre_scan_ramtms));
AN2D4PO4 UJ_DFTQUALIFIER_scan_ramtms (.Z(scan_ramtms), .A1(pre_scan_ramtms), .A2(DFT_clamp) );
wire pre_iddq_mode;
NV_BLKBOX_SRC0_X testInst_iddq_mode (.Y(pre_iddq_mode));
AN2D4PO4 UJ_DFTQUALIFIER_iddq_mode (.Z(iddq_mode), .A1(pre_iddq_mode), .A2(DFT_clamp) );
wire pre_jtag_readonly_mode;
NV_BLKBOX_SRC0_X testInst_jtag_readonly_mode (.Y(pre_jtag_readonly_mode));
AN2D4PO4 UJ_DFTQUALIFIER_jtag_readonly_mode (.Z(jtag_readonly_mode), .A1(pre_jtag_readonly_mode), .A2(DFT_clamp) );
wire pre_ary_read_inh;
NV_BLKBOX_SRC0_X testInst_ary_read_inh (.Y(pre_ary_read_inh));
AN2D4PO4 UJ_DFTQUALIFIER_ary_read_inh (.Z(ary_read_inh), .A1(pre_ary_read_inh), .A2(DFT_clamp) );
wire pre_test_mode;
NV_BLKBOX_SRC0_X testInst_test_mode (.Y(pre_test_mode));
AN2D4PO4 UJ_DFTQUALIFIER_test_mode (.Z(test_mode), .A1(pre_test_mode), .A2(DFT_clamp) );
wire pre_scan_en;
NV_BLKBOX_SRC0_X testInst_scan_en (.Y(pre_scan_en));
AN2D4PO4 UJ_DFTQUALIFIER_scan_en (.Z(scan_en), .A1(pre_scan_en), .A2(DFT_clamp) );
NV_BLKBOX_SRC0 testInst_svop_0 (.Y(svop[0]));
NV_BLKBOX_SRC0 testInst_svop_1 (.Y(svop[1]));
NV_BLKBOX_SRC0 testInst_svop_2 (.Y(svop[2]));
NV_BLKBOX_SRC0 testInst_svop_3 (.Y(svop[3]));
NV_BLKBOX_SRC0 testInst_svop_4 (.Y(svop[4]));
NV_BLKBOX_SRC0 testInst_svop_5 (.Y(svop[5]));
NV_BLKBOX_SRC0 testInst_svop_6 (.Y(svop[6]));
NV_BLKBOX_SRC0 testInst_svop_7 (.Y(svop[7]));

// Declare the wires for test signals

// Instantiating the internal logic module now
// verilint 402 off - inferred Reset must be a module port
nv_ram_rwsp_160x16_logic #(FORCE_CONTENTION_ASSERTION_RESET_ACTIVE) r_nv_ram_rwsp_160x16 (
                           .SI(SI), .SO_int_net(SO_int_net), 
                           .ary_atpg_ctl(ary_atpg_ctl), 
                           .ary_read_inh(ary_read_inh), .clk(clk), 
                           .debug_mode(debug_mode), .di(di), .dout(dout), 
                           .iddq_mode(iddq_mode), 
                           .jtag_readonly_mode(jtag_readonly_mode), 
                           .mbist_Di_w0(mbist_Di_w0), 
                           .mbist_Do_r0_int_net(mbist_Do_r0_int_net), 
                           .mbist_Ra_r0(mbist_Ra_r0), .mbist_Wa_w0(mbist_Wa_w0), 
                           .mbist_ce_r0(mbist_ce_r0), 
                           .mbist_en_sync(mbist_en_sync), 
                           .mbist_ramaccess_rst_(mbist_ramaccess_rst_), 
                           .mbist_we_w0(mbist_we_w0), .ore(ore), 
                           .pwrbus_ram_pd(pwrbus_ram_pd), .ra(ra), .re(re), 
                           .scan_en(scan_en), .scan_ramtms(scan_ramtms), 
                           .shiftDR(shiftDR), .svop(svop), .test_mode(test_mode), 
                           .updateDR(updateDR), .wa(wa), .we(we), 
                           .write_inh(write_inh) );
// verilint 402 on - inferred Reset must be a module port


// synopsys dc_tcl_script_begin
// synopsys dc_tcl_script_end



// synopsys dc_tcl_script_begin
// synopsys dc_tcl_script_end


`ifndef SYNTHESIS
task arrangement (output integer arrangment_string[15:0]);
  begin
    arrangment_string[0] = 0  ;     
    arrangment_string[1] = 1  ;     
    arrangment_string[2] = 2  ;     
    arrangment_string[3] = 3  ;     
    arrangment_string[4] = 4  ;     
    arrangment_string[5] = 5  ;     
    arrangment_string[6] = 6  ;     
    arrangment_string[7] = 7  ;     
    arrangment_string[8] = 8  ;     
    arrangment_string[9] = 9  ;     
    arrangment_string[10] = 10  ;     
    arrangment_string[11] = 11  ;     
    arrangment_string[12] = 12  ;     
    arrangment_string[13] = 13  ;     
    arrangment_string[14] = 14  ;     
    arrangment_string[15] = 15  ;     
  end
endtask
`endif

`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS

`ifndef MEM_REG_NAME 
 `define MEM_REG_NAME MX.mem
`endif

// Bit vector indicating which shadow addresses have been written
reg [159:0] shadow_written = 'b0;

// Shadow ram array used to store initialization values
reg [15:0] shadow_mem [159:0];


`ifdef NV_RAM_EXPAND_ARRAY
wire [15:0] shadow_mem_row0 = shadow_mem[0];
wire [15:0] shadow_mem_row1 = shadow_mem[1];
wire [15:0] shadow_mem_row2 = shadow_mem[2];
wire [15:0] shadow_mem_row3 = shadow_mem[3];
wire [15:0] shadow_mem_row4 = shadow_mem[4];
wire [15:0] shadow_mem_row5 = shadow_mem[5];
wire [15:0] shadow_mem_row6 = shadow_mem[6];
wire [15:0] shadow_mem_row7 = shadow_mem[7];
wire [15:0] shadow_mem_row8 = shadow_mem[8];
wire [15:0] shadow_mem_row9 = shadow_mem[9];
wire [15:0] shadow_mem_row10 = shadow_mem[10];
wire [15:0] shadow_mem_row11 = shadow_mem[11];
wire [15:0] shadow_mem_row12 = shadow_mem[12];
wire [15:0] shadow_mem_row13 = shadow_mem[13];
wire [15:0] shadow_mem_row14 = shadow_mem[14];
wire [15:0] shadow_mem_row15 = shadow_mem[15];
wire [15:0] shadow_mem_row16 = shadow_mem[16];
wire [15:0] shadow_mem_row17 = shadow_mem[17];
wire [15:0] shadow_mem_row18 = shadow_mem[18];
wire [15:0] shadow_mem_row19 = shadow_mem[19];
wire [15:0] shadow_mem_row20 = shadow_mem[20];
wire [15:0] shadow_mem_row21 = shadow_mem[21];
wire [15:0] shadow_mem_row22 = shadow_mem[22];
wire [15:0] shadow_mem_row23 = shadow_mem[23];
wire [15:0] shadow_mem_row24 = shadow_mem[24];
wire [15:0] shadow_mem_row25 = shadow_mem[25];
wire [15:0] shadow_mem_row26 = shadow_mem[26];
wire [15:0] shadow_mem_row27 = shadow_mem[27];
wire [15:0] shadow_mem_row28 = shadow_mem[28];
wire [15:0] shadow_mem_row29 = shadow_mem[29];
wire [15:0] shadow_mem_row30 = shadow_mem[30];
wire [15:0] shadow_mem_row31 = shadow_mem[31];
wire [15:0] shadow_mem_row32 = shadow_mem[32];
wire [15:0] shadow_mem_row33 = shadow_mem[33];
wire [15:0] shadow_mem_row34 = shadow_mem[34];
wire [15:0] shadow_mem_row35 = shadow_mem[35];
wire [15:0] shadow_mem_row36 = shadow_mem[36];
wire [15:0] shadow_mem_row37 = shadow_mem[37];
wire [15:0] shadow_mem_row38 = shadow_mem[38];
wire [15:0] shadow_mem_row39 = shadow_mem[39];
wire [15:0] shadow_mem_row40 = shadow_mem[40];
wire [15:0] shadow_mem_row41 = shadow_mem[41];
wire [15:0] shadow_mem_row42 = shadow_mem[42];
wire [15:0] shadow_mem_row43 = shadow_mem[43];
wire [15:0] shadow_mem_row44 = shadow_mem[44];
wire [15:0] shadow_mem_row45 = shadow_mem[45];
wire [15:0] shadow_mem_row46 = shadow_mem[46];
wire [15:0] shadow_mem_row47 = shadow_mem[47];
wire [15:0] shadow_mem_row48 = shadow_mem[48];
wire [15:0] shadow_mem_row49 = shadow_mem[49];
wire [15:0] shadow_mem_row50 = shadow_mem[50];
wire [15:0] shadow_mem_row51 = shadow_mem[51];
wire [15:0] shadow_mem_row52 = shadow_mem[52];
wire [15:0] shadow_mem_row53 = shadow_mem[53];
wire [15:0] shadow_mem_row54 = shadow_mem[54];
wire [15:0] shadow_mem_row55 = shadow_mem[55];
wire [15:0] shadow_mem_row56 = shadow_mem[56];
wire [15:0] shadow_mem_row57 = shadow_mem[57];
wire [15:0] shadow_mem_row58 = shadow_mem[58];
wire [15:0] shadow_mem_row59 = shadow_mem[59];
wire [15:0] shadow_mem_row60 = shadow_mem[60];
wire [15:0] shadow_mem_row61 = shadow_mem[61];
wire [15:0] shadow_mem_row62 = shadow_mem[62];
wire [15:0] shadow_mem_row63 = shadow_mem[63];
wire [15:0] shadow_mem_row64 = shadow_mem[64];
wire [15:0] shadow_mem_row65 = shadow_mem[65];
wire [15:0] shadow_mem_row66 = shadow_mem[66];
wire [15:0] shadow_mem_row67 = shadow_mem[67];
wire [15:0] shadow_mem_row68 = shadow_mem[68];
wire [15:0] shadow_mem_row69 = shadow_mem[69];
wire [15:0] shadow_mem_row70 = shadow_mem[70];
wire [15:0] shadow_mem_row71 = shadow_mem[71];
wire [15:0] shadow_mem_row72 = shadow_mem[72];
wire [15:0] shadow_mem_row73 = shadow_mem[73];
wire [15:0] shadow_mem_row74 = shadow_mem[74];
wire [15:0] shadow_mem_row75 = shadow_mem[75];
wire [15:0] shadow_mem_row76 = shadow_mem[76];
wire [15:0] shadow_mem_row77 = shadow_mem[77];
wire [15:0] shadow_mem_row78 = shadow_mem[78];
wire [15:0] shadow_mem_row79 = shadow_mem[79];
wire [15:0] shadow_mem_row80 = shadow_mem[80];
wire [15:0] shadow_mem_row81 = shadow_mem[81];
wire [15:0] shadow_mem_row82 = shadow_mem[82];
wire [15:0] shadow_mem_row83 = shadow_mem[83];
wire [15:0] shadow_mem_row84 = shadow_mem[84];
wire [15:0] shadow_mem_row85 = shadow_mem[85];
wire [15:0] shadow_mem_row86 = shadow_mem[86];
wire [15:0] shadow_mem_row87 = shadow_mem[87];
wire [15:0] shadow_mem_row88 = shadow_mem[88];
wire [15:0] shadow_mem_row89 = shadow_mem[89];
wire [15:0] shadow_mem_row90 = shadow_mem[90];
wire [15:0] shadow_mem_row91 = shadow_mem[91];
wire [15:0] shadow_mem_row92 = shadow_mem[92];
wire [15:0] shadow_mem_row93 = shadow_mem[93];
wire [15:0] shadow_mem_row94 = shadow_mem[94];
wire [15:0] shadow_mem_row95 = shadow_mem[95];
wire [15:0] shadow_mem_row96 = shadow_mem[96];
wire [15:0] shadow_mem_row97 = shadow_mem[97];
wire [15:0] shadow_mem_row98 = shadow_mem[98];
wire [15:0] shadow_mem_row99 = shadow_mem[99];
wire [15:0] shadow_mem_row100 = shadow_mem[100];
wire [15:0] shadow_mem_row101 = shadow_mem[101];
wire [15:0] shadow_mem_row102 = shadow_mem[102];
wire [15:0] shadow_mem_row103 = shadow_mem[103];
wire [15:0] shadow_mem_row104 = shadow_mem[104];
wire [15:0] shadow_mem_row105 = shadow_mem[105];
wire [15:0] shadow_mem_row106 = shadow_mem[106];
wire [15:0] shadow_mem_row107 = shadow_mem[107];
wire [15:0] shadow_mem_row108 = shadow_mem[108];
wire [15:0] shadow_mem_row109 = shadow_mem[109];
wire [15:0] shadow_mem_row110 = shadow_mem[110];
wire [15:0] shadow_mem_row111 = shadow_mem[111];
wire [15:0] shadow_mem_row112 = shadow_mem[112];
wire [15:0] shadow_mem_row113 = shadow_mem[113];
wire [15:0] shadow_mem_row114 = shadow_mem[114];
wire [15:0] shadow_mem_row115 = shadow_mem[115];
wire [15:0] shadow_mem_row116 = shadow_mem[116];
wire [15:0] shadow_mem_row117 = shadow_mem[117];
wire [15:0] shadow_mem_row118 = shadow_mem[118];
wire [15:0] shadow_mem_row119 = shadow_mem[119];
wire [15:0] shadow_mem_row120 = shadow_mem[120];
wire [15:0] shadow_mem_row121 = shadow_mem[121];
wire [15:0] shadow_mem_row122 = shadow_mem[122];
wire [15:0] shadow_mem_row123 = shadow_mem[123];
wire [15:0] shadow_mem_row124 = shadow_mem[124];
wire [15:0] shadow_mem_row125 = shadow_mem[125];
wire [15:0] shadow_mem_row126 = shadow_mem[126];
wire [15:0] shadow_mem_row127 = shadow_mem[127];
wire [15:0] shadow_mem_row128 = shadow_mem[128];
wire [15:0] shadow_mem_row129 = shadow_mem[129];
wire [15:0] shadow_mem_row130 = shadow_mem[130];
wire [15:0] shadow_mem_row131 = shadow_mem[131];
wire [15:0] shadow_mem_row132 = shadow_mem[132];
wire [15:0] shadow_mem_row133 = shadow_mem[133];
wire [15:0] shadow_mem_row134 = shadow_mem[134];
wire [15:0] shadow_mem_row135 = shadow_mem[135];
wire [15:0] shadow_mem_row136 = shadow_mem[136];
wire [15:0] shadow_mem_row137 = shadow_mem[137];
wire [15:0] shadow_mem_row138 = shadow_mem[138];
wire [15:0] shadow_mem_row139 = shadow_mem[139];
wire [15:0] shadow_mem_row140 = shadow_mem[140];
wire [15:0] shadow_mem_row141 = shadow_mem[141];
wire [15:0] shadow_mem_row142 = shadow_mem[142];
wire [15:0] shadow_mem_row143 = shadow_mem[143];
wire [15:0] shadow_mem_row144 = shadow_mem[144];
wire [15:0] shadow_mem_row145 = shadow_mem[145];
wire [15:0] shadow_mem_row146 = shadow_mem[146];
wire [15:0] shadow_mem_row147 = shadow_mem[147];
wire [15:0] shadow_mem_row148 = shadow_mem[148];
wire [15:0] shadow_mem_row149 = shadow_mem[149];
wire [15:0] shadow_mem_row150 = shadow_mem[150];
wire [15:0] shadow_mem_row151 = shadow_mem[151];
wire [15:0] shadow_mem_row152 = shadow_mem[152];
wire [15:0] shadow_mem_row153 = shadow_mem[153];
wire [15:0] shadow_mem_row154 = shadow_mem[154];
wire [15:0] shadow_mem_row155 = shadow_mem[155];
wire [15:0] shadow_mem_row156 = shadow_mem[156];
wire [15:0] shadow_mem_row157 = shadow_mem[157];
wire [15:0] shadow_mem_row158 = shadow_mem[158];
wire [15:0] shadow_mem_row159 = shadow_mem[159];
`endif

task init_mem_val;
  input [7:0] row;
  input [15:0] data;
  begin
    shadow_mem[row] = data;
    shadow_written[row] = 1'b1;
  end
endtask

task init_mem_commit;
integer row;
begin

// initializing RAMPDP_160X16_GL_M2_D2
for (row = 0; row < 160; row = row + 1)
 if (shadow_written[row]) r_nv_ram_rwsp_160x16.ram_Inst_160X16.mem_write(row - 0, shadow_mem[row][15:0]);

shadow_written = 'b0;
end
endtask
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS
task do_write; //(wa, we, di);
   input  [7:0] wa;
   input   we;
   input  [15:0] di;
   reg    [15:0] d;
   begin
      d = probe_mem_val(wa);
      d = (we ? di : d);
      init_mem_val(wa,d);
   end
endtask

`endif
`endif


`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS

`ifndef MEM_REG_NAME 
 `define MEM_REG_NAME MX.mem
`endif

function [15:0] probe_mem_val;
input [7:0] row;
reg [15:0] data;
begin

// probing RAMPDP_160X16_GL_M2_D2
 if (row >=  0 &&  row < 160) data[15:0] = r_nv_ram_rwsp_160x16.ram_Inst_160X16.mem_read(row - 0);
    probe_mem_val = data;

end
endfunction
`endif
`endif

`ifndef SYNTHESIS
`ifndef NO_CLEAR_MEM_TASK
`ifndef NO_INIT_MEM_VAL_TASKS
reg disable_clear_mem = 0;
task clear_mem;
integer i;
begin
  if (!disable_clear_mem) 
  begin
    for (i = 0; i < 160; i = i + 1)
      begin
        init_mem_val(i, 'bx);
      end
    init_mem_commit();
  end
end
endtask
`endif
`endif
`endif

`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_ZERO_TASK
`ifndef NO_INIT_MEM_VAL_TASKS
task init_mem_zero;
integer i;
begin
 for (i = 0; i < 160; i = i + 1)
   begin
     init_mem_val(i, 'b0);
   end
 init_mem_commit();
end
endtask
`endif
`endif
`endif

`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS
`ifndef NO_INIT_MEM_FROM_FILE_TASK
task init_mem_from_file;
input string init_file;
integer i;
begin

 $readmemh(init_file,shadow_mem);
 for (i = 0; i < 160; i = i + 1)
   begin

     shadow_written[i] = 1'b1;

   end
 init_mem_commit();

end
endtask
`endif
`endif
`endif

`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_RANDOM_TASK
`ifndef NO_INIT_MEM_VAL_TASKS
RANDFUNC rf0 ();

task init_mem_random;
reg [15:0] random_num;
integer i;
begin
 for (i = 0; i < 160; i = i + 1)
   begin
     random_num = {rf0.rollpli(0,32'hffffffff)};
     init_mem_val(i, random_num);
   end
 init_mem_commit();
end
endtask
`endif
`endif
`endif

`ifndef SYNTHESIS
`ifndef NO_FLIP_TASKS
`ifndef NO_INIT_MEM_VAL_TASKS

RANDFUNC rflip ();

task random_flip;
integer random_num;
integer row;
integer bitnum;
begin
  random_num = rflip.rollpli(0, 2560);
  row = random_num / 16;
  bitnum = random_num % 16;
  target_flip(row, bitnum);
end
endtask

task target_flip;
input [7:0] row;
input [15:0] bitnum;
reg [15:0] data;
begin
  if(!$test$plusargs("no_display_target_flips"))
    $display("%m: flipping row %d bit %d at time %t", row, bitnum, $time);

  data = probe_mem_val(row);
  data[bitnum] = ~data[bitnum];
  init_mem_val(row, data);
  init_mem_commit();
end
endtask

`endif
`endif
`endif

// The main module is done
endmodule

//********************************************************************************

