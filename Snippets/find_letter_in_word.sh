#!/bin/bash
## Purpose: Find a letter in a word
## Usage: find_letter_in_word.sh

# User prompt for the word (todo: sentence)
while true; do 
    read -rp "Enter word to search: " search_word
    if [[ $search_word =~ ^[a-zA-Z]*$ ]]; then 
        break
    else 
        echo "Invalid input. Please enter a word"
    fi
done

# User prompt for letter
while true; do 
    read -rp "Enter letter to find: " search_letter
    if ( (( ${#search_letter} == 1 )) && [[ $search_letter =~ [a-zA-Z] ]] ); then 
        break
    else 
        echo "Invalid letter. Please enter a letter (a-z)"
    fi
done

# Look into the word for the search letter and append to our array
found_letter_locations=()
for (( i=0; i<${#search_word}; i++)); do 
    if [[ ${search_word:i:1} == "$search_letter" ]]; then 
        found_letter_locations+=("$i")
    fi
done

# Check if there are any 'a's in the word
if [ ${#found_letter_locations[@]} -eq 0 ]; then
    echo "No '$search_letter' found in the word."
else
    echo "'${search_letter}' found in '${search_word}':" "${found_letter_locations[@]}"
fi