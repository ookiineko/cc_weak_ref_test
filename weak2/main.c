#include <stdio.h>

__attribute__((weak)) void my_weak_func();

int main() {
	if (my_weak_func)
		my_weak_func();
	else {
		printf("FAILED\n");

		return 1;
	}

	return 0;
}
