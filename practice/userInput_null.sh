#!/bin/bash
val(){
    echo $1
    echo $0
    validchars="$(echo $1 | sed -e 's/[^ ,.[:alnum:]]//g')"
    if [ "$validchars" = "$1" ] ; then
        return 0
    else
        return 1
    fi
}
/bin/echo -n "Enter input: "
read input
if ! val "$input" ; then
    echo "Please enter only letters and numbers." >&2
    exit 1
else
    echo "Input is valid."
fi
exit 0