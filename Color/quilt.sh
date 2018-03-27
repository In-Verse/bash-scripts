#!/bin/bash
# Try all strings! Should work for 8/16 colors
# By thyme

funwheel () {
	count=0
	not=1
#	while (( "$count" -ne "$not" ))i
	for i in {0..3000}
	do
		for switch in {38,48}
			do
				color=$((RANDOM%255))
				move=$((RANDOM%10))
				for i in ${move}
				do
					echo -en "\e[8;${switch};5;${move}m$#\e[0m"
				done
			done
done
}

funwheel
