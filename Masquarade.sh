#!/bin/bash


#Check For Args

if [ $# -eq 0 ] || [ -z "$1" ]
	then
		echo Useage: ./Namechange.sh [Flags/-h/-d/-n] [New HostName Goes Here]
		exit 1
	fi

#Check OS

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux
		
		echo Sorry we dont support $unameOut yet :/
		exit 1

		;;

    Darwin*)    machine=Mac
			
		if [ "$EUID" -ne 0 ]
			then
				echo This script needs sudo to run, it might ask you for a password.
		fi
		;;

    CYGWIN*)    machine=Cygwin
				echo Good luck with windows bro
		;;

    MINGW*)     machine=MinGw
				echo Sorry we dont support $unameOut yet :/
                exit 1
		;;

    *)          machine="UNKNOWN:${unameOut}"
				echo Sorry your computer is $unameOut to us :/
				exit 1
		;;
esac

# TODO: Write a Linux Compatible function Get it to take multiple flags
 

#Print a Banner function cause of vainity

print_banner () {
cat << "EOF"
╔╦╗┌─┐┌─┐┌─┐ ┬ ┬┌─┐┬─┐┌─┐┌┬┐┌─┐
║║║├─┤└─┐│─┼┐│ │├─┤├┬┘├─┤ ││├┤ 
╩ ╩┴ ┴└─┘└─┘└└─┘┴ ┴┴└─┴ ┴─┴┘└─┘

   
EOF
}

print_help () {

cat << "EOF"


	MASQUERADE helps you change your MAC address and HostName

	
	useage: ./Masquarade [flags] [arguements]


	Currently only works on OSX workig on a more agnostic script

	This was origionally wrtten just as a quick way to change my host name for luls

	Keep it Lulzy


	-h or --help 

			Does this

	-r

			Will let you replace your mac address with a random one

	-d

			Displays current active interface information

	-n [New Hostname Here]

			Allows you to input a new hostname for your computer


EOF
}


# A function to Check the active interface TODO: Check for pcregrep dependency/Detect VPN/Check for Broadcast


display_net_info () {


	IFACE="$(ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+')"

	CURMAC="$(ifconfig $IFACE | grep ether)"

	echo Active Hostname:"$(hostname)"		
			
	echo Active Interface: $IFACE
		
	echo MAC Addr: $CURMAC 	
			
}

#Generate a Random Mac Address

random_mac () {

	NEWMAC=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
	
	
	IFACE="$(ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+')"

	CURMAC="$(ifconfig $IFACE | grep ether)"

	while true; do
	

	read -p "Would you like to replace your current mac :$CURMAC with this random mac: $NEWMAC" yn
	case $yn in
		[Yy]* ) echo Ok...$NEWMAC it is...
				if [ ! -f ./back2mac.txt ] 
					then
					touch back2mac.txt
				fi
				echo "$(date +"%m-%d-%y-%T") - $CURMAC" >> back2mac.txt
				sudo ifconfig $IFACE ether $NEWMAC
				echo "This look about right?"
				display_net_info
			exit 0
			 ;;
		[Nn]* ) echo Ok Your mac remains $CURMAC
			exit 0
			;;

		* ) echo "Please answer yes or no."
			;;
	esac
done
	
}

Hostname_ch () {

	# \\TODO// DEBUG THIS LOGIC ...too sleepy right now

if [ $# -eq 0 ] || [ -z "$2" ] 
	then
		echo You can change your hostname with : ./Masquarade -n [New Name Here]
		exit 0
fi




NEWNAME=$2

	while true; do
	

	read -p "Would you like to replace your hostname : $(hostname) with $NEWNAME" yn
	case $yn in
		[Yy]* ) echo Ok...$NEWNAME it is...
				if [ ! -f ./back2mac.txt ] 
					then
					touch back2mac.txt
				fi
				echo "$(date +"%m-%d-%y-%T") - $(hostname)" >> back2mac.txt
				sudo scutil --set HostName $NEWNAME
				sudo scutil --set LocalHostName $NEWNAME
				sudo scutil --set ComputerName $NEWNAME
				dscacheutil -flushcache
				echo "This look about right?"
				display_net_info
			exit 0
			 ;;
		[Nn]* ) echo Ok Your mac remains $CURMAC
			exit 0
			;;

		* ) echo "Please answer yes or no."
			;;
	esac
done




}



#Print the Banner....for vainity

print_banner

#Check for flags, TODO: Write a better help file, and whats a man page anyways?


	case "$1" in
		-h|--help)
			echo Help you say??? Im not doing just that

			print_help

			exit 0
			;;
		-d)
			display_net_info
			exit 0
			;;
		-r)	
			random_mac
			exit 0			
			;;
		-n)
			
			Hostname_ch
			exit 0
			;;

		*)
			;;
	esac




	
