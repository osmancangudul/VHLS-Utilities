#include "timer-tb.h"
#include <iostream>

int main() {
	int status = 0;

	ap_uint<N>  n = 0;
	bool start;
	bool end;

	int counter = 0;
	n = 20;
	start = 0;
	for(int i = 0; i < 20; i++){
		timer(n, start,end);
		std::cout << "start = " << start << " end = " << end << std::endl;
	}

	start = 1;
	timer(n, start,end);
	std::cout << " start = " << start << " end = " << end << " counter = " << counter++ << std::endl;
	for(int i = 0; i < 20; i++){
		start = 0;
		timer(n, start,end);
		std::cout << "start = " << start << " end = " << end << " counter = " << counter++ << std::endl;
	}

	if (n != counter -1) {
		status = -1;
	}

	if(status == 0){
		std::cout << "Test Passed " << std::endl;
	} else {
		std::cout << "Test Failed " << std::endl;
	}

	return status;
}
