#!/usr/bin/bash
#________________________________________
# Script/Alias Options
#________________________________________



function Utilities(){
	echo "What Launcher Would you like to use?"
	echo "Select one option using up/down keys and enter to confirm:"
	echo
	
	options=("Google" "AutoCm" "Reload Bash" "Open Local Host")
	
	select_option "${options[@]}"
	choice=$?
	value=${options[$choice]}
	if [ $value = 'Code Templates' ]
		then
		template
		
	fi
	if [ $value = 'AutoCm' ]
		then
		cycle
		
	fi	
	if [ $value = 'Google' ]
		then
		fzflauncher
		
	fi
	if [ $value = 'Reload Bash' ]
		then
		bashReload
	fi	
	if [ $value = 'Open Local Host' ]
		then
		lh
	fi	
}

# zips [folder] >>> zips folder
function zips(){
	a=$1
	b=${a::-1}
	zip -r $b.zip $1
	# sleep 2s
	# clear
}

# cycle given time and command

function cycle(){
		echo "Start or Stop:"
			echo
				options=("Start" "Stop" )
				select_option "${options[@]}"
				choice=$?
			value=${options[$choice]}
			echo "$value"
			if [ $value = 'Start' ]
				then
					echo "How much time to wait"
					read answer
					echo "What command to execute"
					read com
					while :
					do
						sleep $answer
						eval $com
					done &
			fi
			if [ $value = 'Stop' ]
				then 
					kill -9 $cycle_pid
					return
			fi
			cycle_pid=$!
			echo $cycle_pid
}



# bashReload >>> reloads bash
function bashReload(){
	clear
	. ~/.bashrc
}

# killport [portNumber] >>> kill specific port
# function killport(){
# sudo kill -9 $(sudo fuser -n tcp $1 2> /dev/null);
# }

# lh [port][path] >>> opens localhost on the given port
function lh(){\
	echo "Whats the local host path?"
	read answer
	xdg-open http://localhost:${answer}
}

# web [domain] >>> opens domain 
# function web(){
	# xdg-open http://www.$1.com
# }

# google [search term] >>> google searches
google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "http://www.google.com/search?q=$search"
}

# unzips [zipFolder] >>> unzips and del .zip
function unzips() {
		unzip $1 &
		rm -rf $1 &
}

# sudo aptUpgrade >>> upgrades all apt
function aptUpgrade(){
	echo -e "\n$(date "+%d-%m-%Y --- %T") --- Starting work\n"
	apt-get update
	apt-get -y upgrade
	apt-get -y autoremove
	apt-get autoclean
	echo -e "\n$(date "+%T") \t Script Terminated"
}