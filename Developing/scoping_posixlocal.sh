# IRC greybot on Freenode #bash with posixlocal 
f()
{
    if [ "$_called_f" ]
    then
	# use variables as local
        x=test1
        y=test2
        echo $x $y
    else
	# can use more variables here
        _called_f=X x= y= command eval '{ typeset +x x y; } 2>/dev/null; f "$@"'
    fi
}
# if you call x or y after this, they aren't the same as the function!

