#!/bin/bash
# Try all strings! Should work for 8/16 colors
# By thyme

16Colors () {
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
		for back in {40..47} {100..107}
		do
			for fore in {30..37} {90..97}
					do
						echo -en "\t \e[${property};${fore};${back}m$1\e[0m"
						#enable below if you want to see values
						#echo -ne "\t \e[${property};${fore};${back}m${property};${fore};${back}m\e[0m"
					done
					echo -e "\n"
			done

		done }

16Colors String
