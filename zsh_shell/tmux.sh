alias tmux_window="tmuxifier load-window fdfd"

function tmuxlauncher(){
	echo "Select one option using up/down keys and enter to confirm:"
	echo
		options=("New Tmux Session" "Kill Server" "Show Commands"  "Attach to Current Session" "Launch 3 Pane Split")
		
		select_option "${options[@]}"
		choice=$?
		value=${options[$choice]}
	echo $value
	if [ $choice -eq 0 ]
		then
			echo "What is the Tmux session name?"
			read tmuxName
			tmux new-session -s $tmuxName
	
	fi
	if [ $choice -eq 1 ]
		then
			tmux kill-server
	
	fi
		if [ $choice -eq 2 ]
		then
			echo -e $tmuxCommands
	
	fi


	if [ $choice -eq 3 ]
		then
			echo "What TMUX Session Would You like to Join?"
			tmux list-sessions
			read tmuxName
			tmux attach-session -s $tmuxName
	
	fi
		if [ $choice -eq 4 ]
		then

			tmuxifier load-window fdfd
	
	fi


}



tmuxCommands="
\n Command line
\n tmux new -s {session_name} -n {name} - create new session and specify window name
\n tmux {attach|a|at} -t {session_name} - attach to session
\n tmux ls - list sessions
\n tmux kill-session -t {session_name} - kill session
\n Misc
\n Prefix ? - help
\n Prefix d - detach
\n Prefix t - big clock
\n Command mode
\n Prefix : - command mode
\n new-window -n {name} {command} - create new window and execute command
\n Sessions
\n :new - new session
\n Prefix s - list sessions
\n Prefix $ - name session
\n Prefix ( - previous session
\n Prefix ) - next session
\n Prefix L - last session
\n Window
\n Prefix c - create new window
\n Prefix , - rename window
\n Prefix n - next window
\n Prefix p - previous window
\n Prefix {n} - go to window n
\n Prefix f - find window by name
\n Prefix w - list windows
\n Prefix & - kill window
\n Panes
\n Prefix % split panes by vertical (see tmux-pain-control)
\n Prefix \" split panes by horizontal (see tmux-pain-control)
\n Prefix o - cycle through the panes
\n Prefix {arrow key} - navigate to specific pane (see tmux-pain-control)
\n Prefix space - cycle thought layouts
\n Prefix x - close pane
\n Prefix q - show panes numbers
\n Prefix z - switch to whole window mode and back
\n Prefix { - move the current pane left (see tmux-pain-control)
\n Prefix } - move the current pane right (see tmux-pain-control)
\n :setw synchronize-panes - toggle panes synchronization
\n "