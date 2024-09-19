#!/bin/bash
## Purpose: Colorfully animate some text with 8-bit colors
## Usage: animate_color_text.sh

# Define the color codes
RED="\033[0;31m"
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
RESET="\033[0m"

text="All the 8-bit colors you love!"
# 0-6
COLORS=($RED $YELLOW $GREEN $CYAN $BLUE $PURPLE $RESET)

while true; do
  echo -en "\r${RESET}$text"
  index=$((RANDOM % 7))
  RESET=${COLORS[$index]}

  sleep 0.3
  echo -en "\r$text"
  sleep 0.3
done