
#   Synopsys DC synthesis for NV_nvdla top wrapper
#   #===================================================================
#
# 1) Your home/project layout
   set HOME    "/home/cegrad/lpuli012"          
   set RTL_DIR "${HOME}/CS220_Project/rtl"
#
#   # 2) Make a reports folder
   set REPORT_DIR "${HOME}/CS220_Project/syn/reports"
   file mkdir $REPORT_DIR

# 3) Point to your standard‐cell DB
   set_app_var link_path      "/usr/local/synopsys/pdk/SAED32_EDK/lib/stdcell_rvt/db_ccs/saed32rvt_tt0p78v25c.db"
   set_app_var target_library "/usr/local/synopsys/pdk/SAED32_EDK/lib/stdcell_rvt/db_ccs/saed32rvt_tt0p78v25c.db"

# 4) Power grid nets
   set dc_allow_rtl_pg true
   set mw_logic1_net   "VDD"
   set mw_logic0_net   "VSS"

# 5) Top‐level name
   set DESIGN_NAME "NV_nvdla"

# 6) Read in RTL (including the ports file and any subdirs)
   set_app_var search_path $RTL_DIR
   # If you have .sv files, change -format to {verilog sverilog}
   analyze -format verilog [glob -nocomplain $RTL_DIR/*.v]
   analyze -format verilog [glob -nocomplain $RTL_DIR/*/*.v]

# 7) Elaborate & link
   elaborate $DESIGN_NAME
   link

# 8) Clock constraint on the core clock
   create_clock -name dla_core_clk -period 0.900 [get_ports "dla_core_clk"]
   set_dont_touch_network [get_clocks "dla_core_clk"]

# 9) I/O delays (100 ps max)
   set ios [get_ports -filter {direction != "inout" && name != "dla_core_clk"}]
   foreach p $ios {
     if {[lindex [get_port $p direction] 0] == "input"} {
         set_input_delay 0.1 -max -rise -clock [get_clocks "dla_core_clk"] $p
         set_input_delay 0.1 -max -fall -clock [get_clocks "dla_core_clk"] $p
     } else {
         set_output_delay 0.1 -max -rise -clock [get_clocks "dla_core_clk"] $p
         set_output_delay 0.1 -max -fall -clock [get_clocks "dla_core_clk"] $p
       }
    }

# 10) Clock uncertainty
    set_clock_uncertainty 0.2 -setup [get_clocks "dla_core_clk"]
    set_clock_uncertainty 0.2 -hold  [get_clocks "dla_core_clk"]

# 11) General QoR knobs
    set_max_fanout 100 [get_designs "*"]
    set_fix_multiple_port_nets -all -buffer_constants

# 12) Synthesis
    compile_ultra -incremental

# 13) Tidy up names/hierarchy
    change_names -rules verilog -hierarchy

# 14) Export
    write -format ddc     -output "${DESIGN_NAME}_synthesized.ddc"
    write -format verilog -output "${DESIGN_NAME}_synthesized.v"
    write_sdc -nosplit    "${DESIGN_NAME}_const.sdc"

# 15) Reports
   report_timing    -max_paths 20   > ${REPORT_DIR}/${DESIGN_NAME}_timing.log
   report_qor                         > ${REPORT_DIR}/${DESIGN_NAME}_qor.log
   report_area      -hierarchy       > ${REPORT_DIR}/${DESIGN_NAME}_area.log
   report_power     -hierarchy       > ${REPORT_DIR}/${DESIGN_NAME}_power.log
   report_reference -hierarchy       > ${REPORT_DIR}/${DESIGN_NAME}_reference.log

   exit

