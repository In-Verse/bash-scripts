#!/bin/bash
## Purpose: Show how scope works in bash with a function and the local keyword
## Usage: scoping_function_with_local.sh
## Notes: 
##  - local keyword is not POSIX compliant

AssignMe(){
	local ME="Kerouac"
}
AssignMe
echo "I am $ME" # What does this print?
# I am