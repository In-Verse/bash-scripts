#!/bin/bash

AssignMe(){
	ME="Kerouac"
}
AssignMe
echo "I am $ME" # What does this print?
# I am Kerouac
# Though ME is in the function, we can still access it outside of it