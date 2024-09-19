#!/bin/bash
## Purpose: Have fun with tail command
## Usage: too_lazy_tail.sh

# What if you don't want to even use the '-n'?

echo -e "REGULAR TAIL\n"
tail -n 2 <(echo -e "second\nfirst\n")

# Redefining tail
echo "LAZY TAIL"
tail() {
	command tail -n 2
}

tail <(echo -e "second\nfirst\n")
# Should not complete
echo "Done"