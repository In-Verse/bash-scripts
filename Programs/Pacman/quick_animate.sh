#!/bin/bash
# Quick test for pacman.sh
PACMAN_FILE="/home/$USER/ilovecandy"

NUM=1
. pacman.sh # generate a new pacman
if [ -f $PACMAN_FILE ]; then
	NUM_LINES=$(wc -l $PACMAN_FILE | cut -d " " -f 1)
	num=1
	until [ $num -gt $NUM_LINES ]; do
		sed "${num}q;d" $PACMAN_FILE
		sleep 0.1
		let num=num+1
	done
fi
