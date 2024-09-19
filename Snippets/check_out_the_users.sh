#!/bin/bash
## Purpose: Process the /etc/passwd user account information
## Usage: check_out_the_users.sh

# IFS is reading : as a delimiter and we're assigning the fields to variables
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
	echo "User $f1 has $f7 shell and has $f6 directory"
done < /etc/passwd