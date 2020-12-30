#!/usr/bin/bash
#________________________________________
# Script/Alias Options
#________________________________________
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
	echo "How much time to wait"
	read answer
	echo "What command to execute"
	read com
	while :
	do
		sleep $answer
		eval $com
	done &
	pid=$! &
	echo $pid
}

# bashReload >>> reloads bash
function bashReload(){
	clear
	. ~/.bashrc
}

function shh(){
	# if [ $# > 0 ]
	# then
		# echo "Does not allow for arguments"
	# else
		sleep 3s
		clear
	# fi
}




# killport [portNumber] >>> kill specific port
function killport(){ 
sudo kill -9 $(sudo fuser -n tcp $1 2> /dev/null);
}

# lh [port][path] >>> opens localhost on the given port
function lh(){
	xdg-open http://localhost:$1
}

# web [domain] >>> opens domain 
function web(){
	xdg-open http://www.$1.com
}

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