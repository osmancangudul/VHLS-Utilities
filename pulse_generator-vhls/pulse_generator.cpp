
typedef enum{
	W1,
	W0
} pulse_gen_state_type;

void pulse_generator(bool input, bool &pulse){
#pragma HLS INTERFACE mode=ap_none port=pulse
#pragma HLS INTERFACE mode=ap_none port=input
#pragma HLS INTERFACE mode=ap_ctrl_none port=return

	static pulse_gen_state_type state = W1;
	pulse_gen_state_type next_state;


	bool next_pulse;

	switch (state) {
		case W1:
			if(input == 1){
				next_state = W0;
				next_pulse = 1;
			} else {
				next_state = W1;
				next_pulse = 0;
			}
			break;
		case W0:
			if(input == W0){
				next_state = W0;
				next_pulse = 0;
			} else {
				next_state = W1;
				next_pulse = 0;
			}
			break;
		default:
			break;
	}

	state = next_state;
	pulse = next_pulse;
}
