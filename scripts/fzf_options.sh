function fzflauncher(){
	echo "Select one option using up/down keys and enter to confirm:"
	echo
		options=("Preview to the Side" "kill processes" "find files and launch in VS Code")
		
		select_option "${options[@]}"
		choice=$?
		value=${options[$choice]}
	echo $value
	if [ '$value' = 'Preview to the Side' ];
		then
			fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
	fi	

	if [ '$value' = 'find files and launch in VS Code'];
		then
			fzf --print0 -e | xargs -0 -r code

	fi	
	if [ '$value' = 'kill processes'];
		then
		ps aux | fzf -m | awk '{print $2}' | xargs kill

	fi	
	

	echo "done"
}