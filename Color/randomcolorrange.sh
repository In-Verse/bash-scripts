#!/bin/bash
# Try all strings! Should work for 8/16 colors
# By thyme

funwheel () {
	for i in {0..3000}
	do
		for switch in 48
			do
				color=$((RANDOM%255))
				for i in {1..3}
			do
				echo -en "\e[8;${switch};5;$((color+$i))mx\e[0m"
			done
		done
	done
}

funwheel
