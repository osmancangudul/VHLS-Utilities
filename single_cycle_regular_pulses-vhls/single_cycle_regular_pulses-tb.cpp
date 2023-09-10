#include "single_cycle_regular_pulses-tb.h"
#include <iostream>

int main(){
	int status = 0;

	bool periodic_pulse_local;
	std::cout << std::endl << std::endl;

	for(int i = 0; i < 100 ; i++){
		single_cycle_regular_pulses(periodic_pulse_local);
		std::cout << periodic_pulse_local;
	}

	std::cout << std::endl << std::endl;

	return status;
}
