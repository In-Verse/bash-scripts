#!/bin/bash
## Purpose: Animate a loading-like bar
## Usage: animate_bar.sh

# Define the frames
first="|\ \ \ \ \ \ \ \ \ \ \ \ \ |"
second="| \ \ \ \ \ \ \ \ \ \ \ \ \|"

# Infinite loop
while true; do
  printf "%s\r" "$first"
  sleep 0.2
  printf "%s\r" "$second"
  sleep 0.2
done