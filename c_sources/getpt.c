#include <fcntl.h>
#include <stdio.h>

int		main(void)
{
	int		win_ptr;

	win_ptr = open("/dev/ptmx", O_RDWR | O_NOCTTY);
	printf("%d", win_ptr);
	return (0);
}
