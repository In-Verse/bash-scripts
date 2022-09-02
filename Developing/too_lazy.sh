#!/bin/bash
# What if you don't want to even use the '-n'

echo "Regular tail"
tail -n 2 <(echo "second\nfirst\n")

echo -e "\nMaking 'tail' function\n"
tail() {
	command tail -n 2
}

echo "Lazy tail"
tail <(echo "second\nfirst\n")
echo "Done"
