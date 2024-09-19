#!/bin/bash
## Purpose: Print out "RAINBOW" in rainbow colors!
## Usage: echo_rainbow.sh

# Define the color code
RED="\033[0;31m"
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
RESET="\033[0m"

# Print the rainbow text
echo -e "${RED}R${YELLOW}A${GREEN}I${CYAN}N${BLUE}B${PURPLE}O${RED}W${RESET}"