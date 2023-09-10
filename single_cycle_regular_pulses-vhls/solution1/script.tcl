############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project single_cycle_regular_pulses-vhls
set_top single_cycle_regular_pulses
add_files single_cycle_regular_pulses-vhls/single_cycle_regular_pulses.cpp
add_files single_cycle_regular_pulses-vhls/single_cycle_regular_pulses.h
add_files -tb single_cycle_regular_pulses-vhls/single_cycle_regular_pulses-tb.cpp
add_files -tb single_cycle_regular_pulses-vhls/single_cycle_regular_pulses-tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7s100fgga676-2}
create_clock -period 10 -name default
#source "./single_cycle_regular_pulses-vhls/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
