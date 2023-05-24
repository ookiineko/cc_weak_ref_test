#include <stdio.h>

void my_weak_func() {
	printf("PASSED\n");
}

int main() {
	my_weak_func();

	return 0;
}
