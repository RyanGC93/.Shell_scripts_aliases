

function gitsub(){
	echo "Select one option using up/down keys and enter to confirm:"
	echo
		options=("List Nested submodule" "Add submodule")
		
		select_option "${options[@]}"
		choice=$?
		value=${options[$choice]}
	echo $value
	if [ $choice -eq 0 ]
		then
		git submodule status --recursive
	
	fi
	if [ $choice -eq 1 ]
		then
		echo "git submodule add <URL>"
		read answer
		git submodule add $answer
		
	fi
}