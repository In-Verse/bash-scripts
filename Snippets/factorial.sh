#!/bin/bash
## Purpose: Do a factorial in the shell
## Usage: factorial.sh 
## TODO:
##  - Test if the argument is a number with regex ^[0-9]*$

read -rp "Enter a number: " number_given
number=$number_given
factorial=1

# Check if non-negative
if [ "$number" -lt 0 ]; then 
	echo "Factorial can't be done for negative numbers"
	exit 1 
fi

# Calculate factorial using a while loop
while [ "$number" -gt 0 ]; do
		factorial=$((factorial * number))
		number=$((number -1))
done

echo "The factorial of $number_given is $factorial"