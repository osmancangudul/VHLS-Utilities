#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("sw", 1, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("out_r", 1, hls_out, 1, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "debouncer";
