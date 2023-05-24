#include <stdio.h>

__attribute__((weak)) void my_weak_func() {
	printf("PASSED\n");
}
