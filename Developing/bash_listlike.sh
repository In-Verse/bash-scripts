#/bin/bash
# Goal: print 1,2,3
# Use different ways in bash

echo "Separated Values:"
for i in 1 2 3; do
    echo "$i"
done

echo "Parameter expansion:"
listVar="1 2 3"
for i in $listVar; do
    echo "$i"
for i in $list; do
    echo $i
done

echo "Loop over with quotation"
for i in "$list"; do
    echo $i
done

echo -e "---\nARRAY SECTION\n---"
array=("1" "2" "3")
echo "Using @ treats each element as a separate quoted word rather than a single quoted word containing every element"
for i in "${array[@]}"; do   # The quotes are necessary her
    echo "$i"
done

echo "Loop over array without quotations"
for i in ${array[@]}; do
    echo $i
done