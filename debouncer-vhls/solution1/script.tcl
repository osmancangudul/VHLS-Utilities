############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project debouncer-vhls
set_top debouncer
add_files debouncer.cpp
add_files debouncer.h
add_files -tb debouncer-tb.cpp
add_files -tb debouncer-tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7s100fgga676-2}
create_clock -period 10 -name default
config_cosim -tool xsim -trace_level all -wave_debug
#source "./debouncer-vhls/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -trace_level all
export_design -format ip_catalog
