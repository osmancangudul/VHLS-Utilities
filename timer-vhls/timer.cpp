#include "timer.h"



typedef enum{
	idle,
	running
} timer_state_type;

void timer(ap_uint<N> n, bool start, bool &end){
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=n
#pragma HLS INTERFACE mode=ap_none port=end

//-----------State Variables Definition-----------
	static timer_state_type state = idle;
	static unsigned long long int timer_variable = 0;

	timer_state_type next_state;
	unsigned long long int next_timer_variable;

//--------Temporary Output Definition---------
	bool end_local;


//----------Switch Case For States------------

	switch(state){

	case idle:
		if (start == 1){
			next_state = running;
			end_local = 0;
			next_timer_variable = 0;
		} else {
			next_state = idle;
			end_local = 0;
			next_timer_variable = 0;
		}
		break;

	case running:
		if(timer_variable == n-1) {
			next_state = idle;
			end_local = 1;
			next_timer_variable = 0;
		} else {
			next_timer_variable = timer_variable+1;
			next_state = running;
			end_local = 0;
		}
		break;

	default:
		next_state = idle;
		break;

	}

	state = next_state;
	timer_variable = next_timer_variable;
	end = end_local;


}
