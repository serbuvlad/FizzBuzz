MKSHELL=$PLAN9/bin/rc

CC=gcc
LD=gcc
CFLAGS=-I.
LDFLAGS=-no-pie

FILES=fizzbuzz.o fizzbuzz_amd64.o
HEADERS=fizzbuzz.h
TESTFILES=test.o

all:V: lib test

test: lib $TESTFILES $HEADERS
	$LD -o test $LDFLAGS $TESTFILES libfizzbuzz.a


lib:V: libfizzbuzz.a

libfizzbuzz.a: $FILES $HEADERS
	ar rs libfizzbuzz.a $FILES

%.o: %.c
	$CC -c $CFLAGS $stem.c

%.o: %.S
	$CC -c $CFLAGS $stem.S

unmk:V: clean
	rc -c 'if (test -e libfizzbuzz.a) rm libfizzbuzz.a; true'
	rc -c 'if (test -e test) rm test; true'

clean:V:
	rc -c 'for (i in $FILES $TESTFILES) if (test -e $i) rm $i; true'
