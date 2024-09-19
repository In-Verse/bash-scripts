#!/bin/bash
## Purpose: Use a string and replace the characters with colors
## Usage: colored_line.sh
## Notes:
##  - Play around with the raw_string for different colors

raw_string='___^^^^____^^^^^_^^^^^^_^^^^^^^____^'

# ANSI color codes
RED="\e[31;8;41m"
GREEN="\e[32;8;42m"
RESET="\e[0m"

for (( i=0; i<${#raw_string}; i++)); do
	char="${raw_string:$i:1}"
	translatedcolor=
	if [[ $char =~ '_' ]]; then
		translatedcolor=$RED
	fi
	if [[ $char =~ '^' ]]; then
		translatedcolor=$GREEN
	fi
	echo -en "${translatedcolor}${char}${RESET}"
done
echo
