
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $coutputgroup]
add_wave /apatb_clock_generator_top/AESL_inst_clock_generator/slow_clock_signal -into $return_group -radix hex
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_clock_generator_top/AESL_inst_clock_generator/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_clock_generator_top/AESL_inst_clock_generator/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_clock_generator_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_clock_generator_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_clock_generator_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_clock_generator_top/LENGTH_slow_clock_signal -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(wire) -into $tbcoutputgroup]
add_wave /apatb_clock_generator_top/slow_clock_signal -into $tb_return_group -radix hex
save_wave_config clock_generator.wcfg
run all

