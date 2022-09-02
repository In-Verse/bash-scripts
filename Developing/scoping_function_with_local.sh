#!/bin/bash

AssignMe(){
	local ME="Kerouac"
}
AssignMe
echo "I am $ME" # What does this print?
# I am
# Note: local keyword is not POSIX compliant