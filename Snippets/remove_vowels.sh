#!/bin/bash
## Purpose: Remove vowels from a string
## Usage: remove_vowels.sh
## TODO:
##  - Add user input

string="What are you, a Windows user?"
stringarr=("${string}")
new=""
for (( i=0; i<${#stringarr[@]}; i++ )); do
  if [ ${#stringarr[i]} -eq 1 ]; then 
    echo "${stringarr[$i]}"
    stringarr[$i]+=""
    echo "${stringarr[$i]}"
  fi
  new+="${stringarr[i]//[aeiouAEIOU]} " 
done

echo "$new"