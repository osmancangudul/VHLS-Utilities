############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project clock_generator-vhls
set_top clock_generator
add_files clock_generator.cpp
add_files clock_generator.h
add_files -tb clock_generator-tb.cpp
add_files -tb clock_generator-tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7s100fgga676-2}
create_clock -period 10 -name default
config_cosim -tool xsim -trace_level all -wave_debug
config_rtl -reset all
source "./clock_generator-vhls/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -trace_level all
export_design -format ip_catalog
