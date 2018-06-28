#include <stdio.h>
#include <unistd.h>

int main(void) {
	int i = 0;
	while (i < 20) {
		printf("%i\n", i);
		sleep(1);
		i++;
	}
	return 0;
}
