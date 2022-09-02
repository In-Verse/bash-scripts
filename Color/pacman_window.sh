#!/bin/bash 
# Quick test for pacman.sh
PACMAN_FILE="/home/$USER/ilovecandy"

draw_pacman() {
	# Source pacman
	. pacman.sh
	if [ -f $PACMAN_FILE ]; then
		NUM_LINES=$(wc -l $PACMAN_FILE | cut -d " " -f 1)
		num=1
		while [ $num -ne $NUM_LINES ]; do
			pacman=$(sed "${num}q;d" ${PACMAN_FILE}) 
			let num++
			tput cup 22 # want to use width, height and length :0 
        		echo -e "$pacman"
			sleep 0.1
		done
	else
		echo "You need a pacman file!"
		exit 1
	fi
}

pacman=
redraw() {
	clear
	draw_pacman
}

trap redraw WINCH
#trap draw_pacman SIGINT # Better way to do this, no? SIGUSR?

redraw
while true; do
     :
done
