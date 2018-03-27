#!/bin/bash
# For emojis! We assume U1F and incrment.
# The range is U+1F600..U+1F64F
# Reference perl -C -e 'print chr 0x0965'
# 1F600 to 1F917
# 1F914 to 1F924
# 1F612 to 1F632
# 1F641 to 1F621
# 1F637 to 1F927
# 1F607 to 1F913
# 1F63A to 1F63E
# 128512 to 128767
#
#
# 128512 to 128591
# Unfortunately, I cannot find a better way to churn out emojis

emojiprint () {
	count=$1
	max=$2
	while (( "$count" <= "$max" ))
	do
		hex=$(printf "%X" ${count})
		#for property in {0,5,7,8}
		#do
			echo ${hex}
			echo -en "\e[${property};39m\U${hex} \e[0m \t"
		count=$(( $count + 1))
	done
#	done
		echo
}

# Some ranges to print; there might be repeats
emojiprint 128000 128317
emojiprint 128329 128359
emojiprint 128405 128406
emojiprint 128465 128467
emojiprint 128512 128591
emojiprint 128640 128709
emojiprint 128715 128748
