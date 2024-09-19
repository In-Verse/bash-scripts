#!/bin/bash
## Purpose: Get directory size
## Usage: directory_size.sh

while true; do 
    read -rp "Enter directory: " directory
    if [[ -d "$directory" ]]; then 
        break
    else 
        echo "Please enter a valid directory."
    fi
done
du -sh "$directory"