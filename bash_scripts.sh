#!/usr/bin/bash
function zip(){
	zip -r $1.zip $1
}


# Kills a specific port
function killport(){ 

sudo kill -9 $(sudo fuser -n tcp $1 2> /dev/null);

}


# Clones and changes into directory
function gc(){
	git clone "$1" && cd "$(basename "$1" .git)"
}

## opens localhost on the given port
function lh(){
	xdg-open http://localhost:$1
}

## web
function web(){
	xdg-open http://www.$1.com
}
function test(){
	echo "$@"	
	echo "==============================="
	echo "$*"
	
}

# Suppress the output stream
quiet="&>/dev/null"

# add, commit with message, push to repo and clr terminal
# ex; cm this is my message sentence for my commit
function cm(){
		git add -A
		echo "What's the commit message"
		read commitName
		git commit -m "$commitName"
		sleep 5s
		clear
      # git add -A && git commit -m "$1" && git push && clear
}

# creates a newbranch
function newbranch(){
      git branch $1
      git branch
      git checkout
      touch branchInfo
      git push --set-upstream origin develop
}

## googles 

google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "http://www.google.com/search?q=$search"
}

# curls into current directory unzip file, deletes zip, opens unzipped folder
function unzips() {
		unzip $1 &
		rm -rf $1 &
		
}

function newrepo2(){
	curl -i -H "Authorization: token 318928b02f5b38f8c2264848a7ce972b5a22a8d3" \
	    -d '{ \
	        "name": "$1", \
	        "auto_init": true, \
	        "private": false, \
	      }' \
	    https://api.github.com/user/repos
}


function newrepo (){
      curl -u 'RyanGC93' https://api.github.com/user/repos -d "{\"name\":\"$1\", \"private\": true}"

      git init;
      touch README.md
      echo "# $1" >> README.md
      touch .gitignore
      echo "node-modules/" >> .gitignore
      echo "node-modules/" >> .gitignore
      git add -A
      git commit -m 'first commit'
      git branch -M main
      git remote add origin git@github.com:RyanGC93/$1.git;
      # git push origin main
      git push --set-upstream origin main

      echo "Git Hub Repo Set Up Called: $1"
}


# removes git origin and replaces it with argumentw
# ex; ghomv git@github.com:RyanGC93/blah.git
# >>> remove origin and adds new ad pushes it to new origin
function ghomv(){
      git remote remove origin
      git remote add origin $1
      # git push --set-upstream origin main
      git push --set-upstream origin master
}

# Upgrades the apt, use with sudo
function aptUpgrade(){
	echo -e "\n$(date "+%d-%m-%Y --- %T") --- Starting work\n"
	apt-get update
	apt-get -y upgrade
	apt-get -y autoremove
	apt-get autoclean
	echo -e "\n$(date "+%T") \t Script Terminated"
}