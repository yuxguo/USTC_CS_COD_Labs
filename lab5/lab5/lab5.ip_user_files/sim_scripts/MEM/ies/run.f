-makelib ies_lib/xil_defaultlib -sv \
  "D:/xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/dist_mem_gen_v8_0_12 \
  "../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../lab5.srcs/sources_1/ip/MEM/sim/MEM.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

