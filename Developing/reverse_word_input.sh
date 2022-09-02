: 'Reversed Words 
result=
for word in $1; do
  result="$word $result"
done
echo $result

for i in $(echo $1); do echo $i; done | tac | tr '\n' ' ' && echo

echo $1 | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }'

echo $(printf '%s\n' $1 | tac)
'

wordarr=(${1})

len=${#wordarr[@]}
index=$len
for (( i=0; i<$len; i++ )); do 
  index=$((index - 1))
  echo -n "${wordarr[$index]} " 
done 