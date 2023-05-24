#include <stdio.h>
#include <stdlib.h>

__attribute__((weak)) void my_weak_func() {
	printf("FAILED\n");
	exit(1);
}

int main() {
	my_weak_func();

	return 0;
}
