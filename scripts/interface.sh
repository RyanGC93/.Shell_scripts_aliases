# overlooks the different settings
function commands(){
	echo "What Launcher Would you like to use?"
	echo "Select one option using up/down keys and enter to confirm:"
	echo
	
	options=("Code Templates" "Sequelize" "Fzf Launcher" "Git Launcher" "UI Settings" "Tmux Launcher" "Other Utilities")
	
	select_option "${options[@]}"
	choice=$?
	value=${options[$choice]}
	if [ $value = 'Code Templates' ]
		then
		template
		
	fi
	if [ $value = 'Sequelize' ]
		then
		sequelizelauncher
		
	fi	
	if [ $value = 'Fzf Launcher' ]
		then
		fzflauncher
		
	fi
	if [ $value = 'Git Launcher' ]
		then
		gitlauncher
		
	fi	
	if [ $value = 'UI Settings' ]
		then
		ui_settings
		
	fi	
	if [ $value = 'Tmux Launcher' ]
		then
		tmuxlauncher
		
	fi	
	if [ $value = 'Other Utilities' ]
		then
		rename
		
	fi	
	
	
		
}

function ui_settings(){
	echo "Select one option using up/down keys and enter to confirm:"
	echo
	
	options=("Change PS1 Name" "Launch Tmux" "three")
	
	select_option "${options[@]}"
	choice=$?
	value=${options[$choice]}
	if [ $value = 'Change PS1 Name' ]
		then
		rename
		
	fi
	if [ $option = 'Launch Tmux' ]
		then
		tmuxlauncher		
	fi	
	
}


