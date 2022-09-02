function remove_zeros ()
{
    reversed=$1 
    index=0
    for ((a=1; a <= ${#reversed}; a++)); do
        if [ "${reversed:0:1}" -eq 0 ]; then # remove beginning zeroes 
            reversed="${reversed:1:${#reversed}}"
        else 
            break 
        fi 
        ((index++))
    done
}

echo "$1"
reversed=$(echo $1 | rev)
remove_zeros "$reversed"
echo $reversed 
