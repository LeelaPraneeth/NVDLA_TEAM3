 Set project root
 set proj_dir "/home/cegrad/lpuli012/CS220_Project/"
#
 # Set RTL path and libraries
 set_app_var search_path "$proj_dir/rtl"
 set_app_var link_path "/usr/local/synopsys/pdk/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75v125c.db"
 set_app_var target_library "/usr/local/synopsys/pdk/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75v125c.db"
#
 # Design top module
 set DESIGN_NAME "NV_nvdla"
#
# # Read RTL
 foreach file [glob -nocomplain $proj_dir/hw/outdir/*.v] {
     analyze -format verilog $file
     }
#
#     # Elaborate
     elaborate $DESIGN_NAME
#
#     # Link design
     link
#
#     # Create clock (100 MHz → 10ns)
     create_clock -name clk -period 10 [get_ports dla_core_clk]
     set_dont_touch_network [get_ports dla_reset_rstn]
#
#     # Compile
     compile_ultra -no_autoungroup

#     # Write netlist
     write -format verilog -hierarchy -output "$proj_dir/syn/nvdla_top_synth.v"
#
#     # Reports
     file mkdir "$proj_dir/syn/report"
     report_timing > "$proj_dir/syn/report/timing.rpt"
     report_area > "$proj_dir/syn/report/area.rpt"
     report_power > "$proj_dir/syn/report/power.rpt"

