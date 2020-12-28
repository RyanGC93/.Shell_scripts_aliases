# This Directory Contains Bash Scripts and Aliases


function bashHelp(){
	echo "Available shell Commands"
	echo "Press 1 for basic, 2 for custom, 3 for git, 4 for common"
	read answer
	if [ $answer -eq 1 ]
		then
		clear
		echo "Basic commands are..."
		c /home/ryan/.bash_scriptsAndAliases/basicBash_AlSh.sh
		fi
	if [ $answer -eq 2 ]
		then
		clear
		echo "Custom commands are..."
		c /home/ryan/.bash_scriptsAndAliases/custom_scripts.sh
		fi
	if [ $answer -eq 3 ]
		then
		clear
		echo "Git commands are..."
		c /home/ryan/.bash_scriptsAndAliases/git_AlSh.sh
		fi
	if [ $answer -eq 4 ]
		then
		clear
		echo "Git commands are..."
		echo "
		glow [markdown file] >>> terminal markdown viewer
		git open >>> opens git repo in browser
		pysrv >>> creates a python server
		delzone >>> removes all of the zone identifiers
		zips [folder] >>> zips folder
		killport [portNumber] >>> kill specific port
		sudo aptUpgrade >>> upgrades all apt
		ghmov >>> remove origin and adds new ad pushes it to new origin
		unzips [zipFolder] >>> unzips and del .zip
		google [search term] >>> google searches
		cm [message] >>> git adds all, commits [message], pushes
		gc >>> Clones and changes into directory
		lh [port][path] >>> opens localhost on the given port
		"
		fi
}