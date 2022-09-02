#!/bin/bash
: ' 
year=$1
echo "$(( (year + 99) / 100 ))"

(($1%100)) && echo $(($1/100+1)) || echo $(($1/100))

year=$1
century=$(($year / 100))
if [ $(($year % 100)) -eq 0 ]
then
  echo $century
else
  echo $(($century + 1))
fi
'
year=$1
length="${#year}"
prefix="${year:0:$length-2}"
echo "Length: $length"
echo "Prefix: $prefix"
if [ "${year:$length-2}" == "00" ]; then 
  echo "$prefix"
elif [ $length -lt 4 ]; then
  echo "1"
else 
  echo $((${prefix} + 1))
fi 