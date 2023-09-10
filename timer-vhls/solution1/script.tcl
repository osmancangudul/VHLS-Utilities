############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project timer-vhls
set_top timer-vhls
add_files timer-vhls/timer.cpp
add_files timer-vhls/timer.h
add_files -tb timer-vhls/timer-tb.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb timer-vhls/timer-tb.h -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7s100-fgga676-2}
create_clock -period 10 -name default
#source "./timer-vhls/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
