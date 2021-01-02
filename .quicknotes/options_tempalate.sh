function testoptions(){
	echo "Select one option using up/down keys and enter to confirm:"

function tmuxlauncher(){
	echo "Select one option using up/down keys and enter to confirm:"
	echo
	
	options=("one" "two" "three")
	
	select_option "${options[@]}"
	choice=$?
	value=${options[$choice]}
	
	if [$option -eq 0]
		then
		
	fi
		if [$option = '<option>']
		then
		
	fi
	
}