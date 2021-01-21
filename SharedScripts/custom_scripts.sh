
# Google
google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "http://www.google.com/search?q=$search"
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
# lh [port][path] >>> opens localhost on the given port
function lh(){\
	xdg-open http://localhost:$1
}

# unzips [zipFolder] >>> unzips and del .zip
function unzips() {
		unzip $1 &
		rm -rf $1 &
}