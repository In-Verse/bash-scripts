#!/bin/bash

# 10/18/17
# Getting started
# Add different fruit
# Add colorschemes
# Play with Pacman and his coloring (maybe gradient)
# Substitute unicode
# ellipses: U+2026
# Random fruit isn't so random; change

newpac ()
{
	lines=`tput cols`
	pad="\u0020"
	fruit="\u25CB"
	#fruit="\u2B58"
	(( lines = lines - 9 ))

	i=1
	# Even fruit
	string="\u0020"
	while [[ $i -le $lines ]]
	do
		if [ $((i%2)) -eq 0 ]
		then
			if [ $((i%4)) -eq 0 ]
			then
				string="${string}$fruit"
				((i = i + 1))
			else
				string="${string}$pad"
				((i = i + 1))
			fi
		else
			string="${string}$pad"
			((i = i + 1))
		fi
	done
	echo $string > /home/$USER/ilovecandy_temp
}

newpac

# These are the opening and closing brackets
# openingbracket is ${#progress[@]} - 1
# endingbracket is ${#progress[@]}
# Actually, I dont want to deal with ranges and indexing complexity of arrays
# I'll just echo the brackets before and after the string join

#progress=("${progress[@]}" "[" "]")


function percentage(){
	percent=$1
	total=$2
	percent=$(( 100 * index / total + (1000 * index / total % 10 >= 5 ? 1 : 0) ))
	if [ "$percent" -lt 10 ]; then
		echo "  $percent%"
	else
		echo " $percent%"
	fi
}

# From stack overflow
function join_array(){
	local IFS="$1"; shift; echo -e "$*\c";
}
# Make progress bar more accurate

function finished_pacman(){

	#pacman_lower="c"
	#pacman_upper="C"

	INPUT=/home/$USER/ilovecandy_temp
	filecontent=( `fold -w 6 $INPUT `)
	progress=()
	for t in "${filecontent[@]}"; do
		progress=("${progress[@]}" "$t")
	done

	pacman_lower="\e[1;5;93mc"
	pacman_upper="\e[1;5;93mC"
	clear="\e[0m"
	index=1
	(( total = ${#progress[@]} - 3 ))

	#percentage=((100*$index/$total))
	progress[1]=$pacman_lower

	(( arraylength=${#progress[@]} - 2 ))
	(( length=${#progress[@]} - 5 ))

	until [ "$index" -gt "$length" ]; do
		if [ $(( $index % 2)) -eq -0 ]; then
			pacman=$pacman_upper
		else
			pacman=$pacman_lower
		fi
		index=$((index + $RANDOM % 9))
		for i in `seq 1 $index`; do
			#progress[i]="\u2026" #ellipse
			#progress[i]="\u301c" #wave dash
			progress[i]="\u2010" #normal dash
			#progress[i]="\u30a0" #katakana double hyphen
			#progress[i]="\ufe63" #small hyphen minus
			#progress[i]="\u3030" #wavy dash
			#progress[i]="\u2E17" #double oblique hyphen
		done
		progress[$index]=$clear$pacman$clear
		#echo ${progress[@]}
		echo -e "[\c"
		join_array "" ${progress[@]}
		echo -e "]\c"
		percentage index ${#progress[@]}
	done
}

finished_pacman > /home/$USER/ilovecandy
