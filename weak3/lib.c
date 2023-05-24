#include <stdio.h>
#include <stdlib.h>

__attribute__((weak)) void my_weak_func() {
	printf("FAILED\n");

	exit(1);
}
