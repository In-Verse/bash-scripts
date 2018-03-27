#!/bin/bash
# Try all strings! Should work for 256 colors
# Note: Not all possible combinations because you can combine multiple properties; ex. italics + bold
# By thyme



256Colors () {
	count=0
	plist=(
		 'normal'
		 'bold'
		 'dim'
		 'underline'
		 'blink'
		 'reverse'
		 'hidden'
		   )
	for property in {0,1,2,4,5,7,8}
	do
		echo -e "This is property \e[${property};39m${plist[count]}\e[0m, which is \e[1;39m${property}. \e[0m\n"
		count=$(( $count + 1))
		for switch in {38,48}
		do
			for color in {0..255}
					do
						echo -en "\t \e[${property};${switch};5;${color}m$1\e[0m"
						#enable below if you want to see values
						#echo -ne "\t \e[${property};${switch};5${color}m${switch};5;${color}\e[0m"
					done
					echo -e "\n"
			done

		done }

256Colors String
