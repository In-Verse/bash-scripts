#!/bin/bash
## Purpose: Print a user entered string without spaces (need quotes because of IFS)
## Usage: string_without_spaces.sh "the brown fox jumps over the lazy dog"
## TODO:
##  - Test if any arguments were given
##  - If multiple arguments, then concatenate them all together

string="$1"
echo "${string// }"