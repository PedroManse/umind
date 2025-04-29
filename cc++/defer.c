#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

#define defer(DefId) ;\
	auto void def_##DefId(void*); \
	void *var_##DefId __attribute__( (__cleanup__(def_##DefId)) ) = NULL; \
	void def_##DefId (void *_)

int main(void) {
	int file = open("ax", O_RDONLY);
	int file2 = open("bx", O_CREAT|O_WRONLY);

	if (file < 0) {
		printf("Can't open file\n");
		return file;
	}
	defer(close_file) {
		printf("close one\n");
		close(file);
		printf("Closed file: %d\n", file);
	}

	if (file2 < 0) {
		printf("Can't open file2\n");
		return file2;
	}
	defer(close_file_two) {
		printf("close two\n");
		close(file2);
		printf("Closed file: %d\n", file2);
	}

	char buf[100];
	int rd = read(file, buf, sizeof buf);
	write(file2, buf, rd);
	printf("Opened file: %d\n", file);

	return 0;
}
