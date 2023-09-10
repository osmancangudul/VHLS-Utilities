#include "debouncer.h"

typedef enum {
	transfer, delay
} debouncer_states_type;

void debouncer(bool sw, bool &out) {
#pragma HLS INTERFACE mode=ap_none port=sw
#pragma HLS INTERFACE mode=ap_none port=out
#pragma HLS INTERFACE mode=ap_ctrl_none port=return

//-------------State Static Definitions----------

	static debouncer_states_type state = transfer;
	static unsigned long long int counter = DELAY_COUNTER;

	static bool previous_sw = 0;

//------------Temporary Outputs----------------
	unsigned long long int next_counter;
	debouncer_states_type next_state;
	bool out_tmp = 0;

	switch (state) {
	case transfer:
		if(previous_sw != sw){
			next_state = delay;
		} else {
			next_state = transfer;
		}
		next_counter = DELAY_COUNTER;
		out_tmp = sw;
		break;
	case delay:
		if(counter == 0){
			next_state = transfer;
			next_counter = DELAY_COUNTER;
		} else {
			next_counter = counter - 1;
			next_state = delay;
		}
		out_tmp = previous_sw;
		break;
	default:
		next_state = delay;
		break;

	}

//------------ Update the States and Variables-------------
	previous_sw = out_tmp;
	state = next_state;
	counter = next_counter;
	out = out_tmp;

}
