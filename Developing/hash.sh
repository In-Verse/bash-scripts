#!/bin/bash
# Hash or associative array example 

# Declare/initialize it 
declare -A favorites
favorites[fruit]=banana
favorites[bird]=owl 

# Declare with assignment
#declare -A aarray =( [HDD]=Samsung [Monitor]=Dell [Keyboard]=A4Tech )

# Access it 
# ${hash[key]}
echo ${favorites[fruit]}

# Print keys with loop 
# fruit
# bird
for key in "${!favorites[@]}"; do echo $key ; done 

# Print keys with parameter expansion, ! used to read keys
# fruit bird
echo "${!favorites[@]}" 

# Print values with loop
# banana
# owl 
for value in "${favorites[@]}"; do echo $value ; done 

# Print values in parameter expansion 
# banana owl 
echo "${favorites[@]}"

# Print keys and values 
for key in "${!favorites[@]}"; do echo "$key => ${favorites[$key]}"; done

# Finding missing index
if [ ${favorites[bird]+_} ] # conditional statement
    then echo "Found"
    else echo "Not found"
fi

# Remove hash with unset 