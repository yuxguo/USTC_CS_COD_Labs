set_property SRC_FILE_INFO {cfile:d:/gyx_uni/2_spring/cod/lab/lab4/lab4/lab4.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../../../lab4.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
