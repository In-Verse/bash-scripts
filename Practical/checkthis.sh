#!/bin/bash
# Just to see if it can read

while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
	echo "User $f1 has $f7 shell and has $f6 directory"
done < /etc/passwd
