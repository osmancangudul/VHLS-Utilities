#pragma once

#include <ap_int.h>

#define TEST_DELAY


#ifdef TEST_DELAY
#define DELAY_COUNTER 500L
#else

#define DELAY_COUNTER 500000L
#endif

