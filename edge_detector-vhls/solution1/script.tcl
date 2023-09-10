############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project edge_detector-vhls
set_top edge_detector
add_files edge_detector-vhls/edge_detector.cpp
add_files edge_detector-vhls/edge_detector.h
add_files -tb edge_detector-vhls/edge_detector-tb.cpp
add_files -tb edge_detector-vhls/edge_detector-tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7s100fgga676-2}
create_clock -period 10 -name default
#source "./edge_detector-vhls/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
