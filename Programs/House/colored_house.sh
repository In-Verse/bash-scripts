#!/bin/bash
## Purpose: Create a home with ANSI escape character codes
## Usage: colored_house.sh
## Notes: 
##  - Needs a "house" file
##  - ~ is where the home is
##  - Colors will vary with terminals

# ANSI color codes 
DOOR="\e[8;41m"
BRICKS="\e[8;43m"
ROOF="\e[8;45m"
WINDOW="\e[;8;44m"
FRAME="\e[;8;40m"
GRASS="\e[8;42m"
CLOUD="\e[8;47m"
SKY="\e[8;46m"
RESET="\e[0m"

# Used to (1) show pic correctly and (2) pad the sky enough
TERMINAL_WIDTH=$(tput cols)

translate_line () {
	translated_line=
	string="$1"
	stringlength=${#string}
	linediff=$(( $TERMINAL_WIDTH - $stringlength ))
	#echo ${#string}
	#echo $linediff
	for (( i=0; i< $stringlength ; i++)); do
		char="${string:$i:1}"
		translatedcolor=$SKY
		if [[ $char =~ '(' ]]; then
			translatedcolor=$CLOUD
		fi
		if [[ $char =~ '#' ]]; then
			translatedcolor=$WINDOW
		fi
		if [[ $char =~ '-' ]]; then
			translatedcolor=$GRASS
		fi
		if [[ $char =~ 'x' ]]; then
			translatedcolor=$BRICKS
		fi
		if [[ $char =~ '+' ]]; then
			translatedcolor=$DOOR
		fi
		if [[ $char =~ '/' ]]; then
			translatedcolor=$ROOF
		fi
		if [[ $char =~ '|' ]]; then
			translatedcolor=$FRAME
		fi
		translated_line+="${translatedcolor}${char}${RESET}"
	done
	for (( i=0; i< $linediff ; i++)); do
		translated_line+="${SKY} "
	done	
	translated_line+="${RESET}"
	echo "$translated_line"
}

# Only translate lines if the cols is 85 or greater
# Note: Don't care about rows (will still be scrollable to see the picture)
if (( $TERMINAL_WIDTH < 85 )); then
	echo -e "Current $TERMINAL_WIDTH not supported.\nUse a width of at least 85 cols"
else
	# A more complicated delimiter
	while IFS="" read -r p || [ -n "$p" ]; do
		#printf '%s\n' "$p"
		#echo "$p"
		n=$(translate_line "$p")
		echo -e $n
	done < house
fi