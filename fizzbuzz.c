#ifndef __x86_64__

#include <setjmp.h>
#include <stdio.h>

#include <fizzbuzz.h>

void fizzbuzz(unsigned n)
{
	unsigned i;
	jmp_buf env;

	for (i = 1; i <= n; ++i) {
		if (i % 3 == 0) {
			printf("Fizz");
			if (setjmp(env))
				goto cont;
		} else {
			if (setjmp(env))
				goto nr;
		}

		if (i % 5 == 0)
			printf("Buzz");
		else
			longjmp(env, 1);

cont:
		printf("\n");
	}

	return;

nr:
	printf("%d", i);
	goto cont;
}	

#endif

