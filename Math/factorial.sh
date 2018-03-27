#!/bin/bash

echo "Enter number: "
read number
fact=1
while [ $number -ne 0]
do
		fact=$(expr $fact \* $num)
		num=$(expr $a -1)
done
echo $fact 