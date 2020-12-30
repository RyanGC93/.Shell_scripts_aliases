#!usr/bin/bash
#=========================
#	GIT ALIAS/SCRIPTS
#=========================

#__________REQUIREMENTS_________
# Add in your shell launcher ie bashrc
# export GH_USER="<git hub user name>"
# export TOKEN="<git hub api token>"
# [github generate token link](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token#creating-a-token)


#====================================
	 #Creates an Options Selector
#====================================
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
function select_option {

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = $ESC[A ]]; then echo up;    fi
                         if [[ $key = $ESC[B ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "$opt"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}
#====================================
	 # Add collaborator
#====================================
     
# Adds a collabortor
function ghcollab(){
	gitBase=$(basename $(git remote get-url origin) .git)

	echo $gitBase
	echo "Whats git username of collaborator"
	read answer
	clear
	echo $answer

	echo "Authorization: token ${TOKEN}" "https://api.github.com/repos/${GH_USER}/${gitBase}/collaborators/${answer}"
	curl -H "Authorization: token ${TOKEN}" "https://api.github.com/repos/${GH_USER}/${gitBase}/collaborators/${answer}" -X PUT -d '{"permission":"admin"}'	
	echo "⚡⚡⚡⚡⚡⚡⚡NEW COLLAB⚡⚡⚡⚡⚡⚡⚡"
	echo "⚡⚡⚡⚡⚡⚡⚡$answer⚡⚡⚡⚡⚡⚡⚡"
}

#====================================
	 # Creates a new repo
#====================================

function newrepo(){
	echo "What's the name of the repo?"
	read repoName
	echo "Public or Private:"
		echo
			options=("public" "private" )
			select_option "${options[@]}"
			choice=$?
		value=${options[$choice]}
		echo "$value"
		if [ $value = 'public' ]
			then 
				bool="false"
		fi
		if [ $value = 'private' ]
			then 
				bool="true"
		fi

	# Creates github repo    
		curl -i -H "Authorization: token ${TOKEN}" https://api.github.com/user/repos -d "{\"name\":\"${repoName}\", \"private\": ${bool}}"
	    echo "make local git directory?"
		echo
			options=("yes" "no" )
			select_option "${options[@]}"
			choice=$?
		value=${options[$choice]}
		echo "$value"
		if [ $value = 'yes' ]
            then 
                mkdir $repoName && cd $repoName         
		          git init;
		          touch README.md
		          echo "# $repoName" >> README.md
		          touch .gitignore
		          echo "node-modules/" >> .gitignore
		          echo "node-modules/" >> .gitignore
		          git add -A
		          git commit -m 'first commit'
		          git remote add origin git@github.com:${GH_USER}/$repoName.git;
		          currentBranch=$(git rev-parse --abbrev-ref HEAD)
		          git push --set-upstream origin $currentBranch
		          echo "Git Hub Repo Set Up Called: $repoName"
                  exit
        fi

			echo "remote directory called ${repoName} created"
			echo "Would you like to remove original origin and push to new?"
			echo
				options=("yes" "no" )
				select_option "${options[@]}"
				choice=$?
				originValue=${options[$choice]}
				echo $originvalue
				if [ $originValue = 'yes' ]; then
                    git remote remove origin
                    git remote add origin git@github/com:${GH_USER}/${repoName}.git
                    currentBranch=$(git rev-parse --abbrev-ref HEAD)
		            git push --set-upstream origin $currentBranch
		            echo "⚡⚡⚡⚡⚡⚡⚡Origin Changed⚡⚡⚡⚡⚡⚡⚡"
                    git remote show origin
                else
                    echo "please god"
                fi	
}

#====================================
	 # git add commit and pushes in one comm
#====================================

# cm [message] >>> git adds all, commits [message], pushes
# in one command
function cm(){
		git add -A
		echo "What's the commit message"
		read commitName
		git commit -m "$commitName"
		git push
		clear
}