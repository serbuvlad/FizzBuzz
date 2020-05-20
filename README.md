FizzBuzz
========

This is FizzBuzz, as implemented by me. The C version is a hack. If you know
amd64 assembly you are encouraged to read to read that verion instead, as it's
much cleaner.

Building
--------

To build you need the Plan9Port utilites, (specifically, `mk` and `rc`), `gcc`,
`ar` and `test` (aka `[`).  To build just run `mk`. You will get a static
library (`libfizzbuzz.a`), a header file (`fizzbuzz.h`) and a `test` binary,
which prints FizzBuzz up to 100. To clean build residue (`.o` files) run
`mk clean`. To remove build products run `mk unmk`.

