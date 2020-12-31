
# ======================================================
#             Handles = tmuxifier

# =======================================================
testeres(){
	echo '
	================================================
	'
}


tmuxifierTest(){
	echo "What's the name of the repo?"
	echo "tmuxifier commands:"
		echo
			options=(
				'load-session '
				'load-window'
				'list '
				'list-sessions'
				'list-windows '
				'new-session'
				'new-window'
				'edit-session '
				'edit-window'
			)
			select_option "${options[@]}"
			choice=$?
		value=${options[$choice]}
			command="tmuxifier $choice"

		echo "$choice"

		eval $choice
		if [ $choice -eq 0 ]
			then 
				echo "this"
		fi
		if [ $choice -eq 1 ]
			then 
				bool="false"
		fi
		if [ $choice -eq 2 ]
			then 
				bool="true"
		fi
		if [ $choice -eq 3 ]
			then 
				bool="false"
		fi
		if [ $choice -eq 4 ]
			then 
				bool="true"
		fi
		if [ $choice -eq 5 ]
			then 
				bool="false"
		fi
		if [ $choice -eq 6 ]
			then 
				bool="true"
		fi
		if [ $choice -eq 7 ]
			then 
				bool="false"
		fi
		if [ $choice -eq 8 ]
			then 
				bool="true"
		fi
}

# ======================================================
#             Handles = tmux

# =======================================================

