#!usr/bin/bash
#=========================
#=========================
#	GIT `Scripts`
#=========================
#=========================

#=========================
#	GIT ALIAS/SCRIPTS
#=========================



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
	curl -H "Authorization: token ${TOKEN}" "https://api.github.com/repos/${GH_USER}/${gitBase}/collaborators/${answer}" -X PUT -d '{"permission":"admin"}'	
	echo "⚡⚡⚡⚡⚡⚡⚡NEW COLLAB⚡⚡⚡⚡⚡⚡⚡"
	echo "⚡⚡⚡⚡⚡⚡⚡$answer⚡⚡⚡⚡⚡⚡⚡"
}
#=========================
#	GIT ALIAS/SCRIPTS
#=========================

function autocm(){
		echo "Start or Stop:"
			echo
				options=("Start" "Stop" )
				select_option "${options[@]}"
				choice=$?
			value=${options[$choice]}
			echo "$value"
			if [ $value = 'Start' ]
				then 
					cmCycle='start'
					echo "How long to Automatically push to gh?"
					read answer
					echo "What would you like your commit messages be?"
					read commitmessage
			fi
			if [ $value = 'Stop' ]
				then 
					cmCycle="stop"
					kill -9 $autocm_pid
					return
			fi

	while [ $cmCycle = 'start' ]
	do
	  sleep $answer
	  git add -A && git commit -m '${commitmessage}' && git push
	done &
	echo "$!"
	autocm_pid=$!
}

# gsho >>> shows git origin
alias gsho="git remote show origin"
alias update="git add -A && git commit -m 'update' && git push && clear"
# gc >>> Clones and changes into directory
function gc(){
	git clone -q "$1" && cd "$(basename "$1" .git)"
}


# removes git origin and replaces it with argumentw
# ex; ghomv git@github.com:RyanGC93/blah.git
# ghmov >>> remove origin and adds new ad pushes it to new origin
function ghomv(){
      git remote remove origin
      echo "What's the new remote name?"
	  read originName
      git remote add origin $originName
      # git push --set-upstream origin main
      git push --set-upstream origin master
}
#==========BASIC==========
#This is the git aliases
alias co="git checkout"
alias br="git branch"
alias ci="git commit"
alias gi="git init"

alias gps="git push"
alias gpl="git pull"
alias gdf="git diff"
alias gs="git status"

alias glog="git log --oneline"
alias gpso="git push -u origin master"

alias gr="git reset"
alias gm="git merge"
alias grb="git rebase"
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
		clear 
	    echo "make local git directory?"
	    echo "if not there an option to change remote to created repo"
		echo
			options=("yes" "no" )
			select_option "${options[@]}"
			choice=$?
		value=${options[$choice]}
		echo "$value"
		if [ $value = 'yes' ]
            then 
                mkdir $repoName && cd $repoName         
		          git init
		          touch README.md
		          echo "# $repoName" >> README.md
		          git add -A
		          git commit -m 'first commit'
		          git remote add origin git@github.com:${GH_USER}/$repoName.git
		          currentBranch=$(git rev-parse --abbrev-ref HEAD)
		          git push --set-upstream origin $currentBranch
		          echo "Git Hub Repo Set Up Called: $repoName"
                #   sleep 5s &

				  return
                  
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
                    git remote add origin git@github.com:${GH_USER}/${repoName}.git
                    currentBranch=$(git rev-parse --abbrev-ref HEAD)
		            git push --set-upstream origin $currentBranch
		            clear
		            echo "⚡⚡⚡⚡⚡⚡⚡Origin Changed⚡⚡⚡⚡⚡⚡⚡"
		            
                    git config --get remote.origin.url
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


function gitDelete(){
  echo "what is the name of the repo you want to delete"
  read repoName
  curl \
    -X DELETE \
    -H "Authorization token ${TOKEN}" \
    https://api.github.com/repos/${GH_USER}/${repoName}
}

function gitFollow(){
	echo "Name of User you would like to follow"
	read answer
	curl \
	-H "Authorization: token ${TOKEN}" \
	https://api.github.com/user/following/${answer}
}


function gitSearch(){
  clear
  echo "Search Returns ssh_url, html_url, name"
	echo "Would you Like to search All repos Or a specific one?"
	echo
	options=(
		"All"
		"Specific"
	)
	select_option "${options[@]}"
	choice=$?
	value=${options[$choice]}

	if [ "$choice" -eq 1 ]
		then
		echo "Whats the name of repo?"
    read answer
      curl \
  -H "Authorization: token ${TOKEN}" \
  https://api.github.com/user/repos/${answer}


	fi
	if [ $choice -eq 0 ]
		then
        echo "What visiblity do you want to search"
        echo "Input: all, private, or public"
        read visibility
        echo "How would you like to sort"
        echo "Input: created, updated, pushed, or full_name"
        read sorter
        echo "How Many results would you like (max 100)?"
        read pages
        queries="per_page=${pages}&sort=${sorter}&visibility=${visibility}"
        curl -H "Authorization: token ${TOKEN}" https://api.github.com/user/repos?${queries} |npx jq '.[].name + "                " + .[].ssh_url' 
	fi
}




function gitlauncher(){
	echo "What would you like to do"
	echo
	options=(
		"Add A colloborator"
		"Git Branching"
		"Commits"
		"New Repos"
		"View History"
		"Search User Repos"
		"Delete A repo --still in development"
		"Follow a user --still in development"
		"Interval auto comment"
	)
	select_option "${options[@]}"
	choiz=$?
	value=${options[$choice]}
	echo $choiz
	if [ $choiz -eq 0 ];
		then
		ghcollab
	fi
	if [ $choiz -eq 1 ];
		then
		gitbranch
	fi
	if [ $choiz -eq 2 ];
		then
		cm
	fi
	if [ $choiz -eq 3 ];
		then
		newrepo
	fi
	if [ $choiz -eq 4 ];
		then
		tig
	fi
	if [ $choiz -eq 5  ];
		then
		gitSearch
	fi
	if [ $choiz -eq 6  ];
		then
		gitDelete
	fi
	if [ $choiz -eq 7  ];
		then
		gitFollow
	fi
	if [ $choiz -eq  8 ];
		then
		autocm
	fi
}


function gitbranch(){
	echo "Select one option using up/down keys and enter to confirm:"
	echo
	
	options=(
		"List branches (the asterisk denotes the current branch)"
		"List all branches (local and remote)"
		"Create a new branch"
		"Delete a branch"
		"Delete a remote branch"
		"Create a new branch and switch to it"
		"Clone a remote branch and switch to it"
		"Rename a local branch"
		"Switch to a branch"
		"Switch to the branch last checked out"
		"Discard changes to a file"
		"Merge a branch into the active branch"
		"Merge a branch into a target branch"
		"Stash changes in a dirty working directory"
	)
	
	select_option "${options[@]}"
	choice=$?
	value=${options[$choice]}
	echo $choice
	if [ $choice -eq 0 ]
		then
		git branch 
	fi
	if [ $choice -eq 1 ]
		then
		git branch -a      
		
	fi
	if [ $choice -eq 2 ]
		then
		echo "Branch Name ?"
		read branchName
		action="git branch ${branchName}"
		eval $action
		
	fi
	if [ $choice -eq 3 ]
		then
		git branch -a
		echo "Branch Name ?"
		read branchName
		action="git branch -d ${branchName}"
		eval $action
		
	fi
	if [ $choice -eq 4 ]
		then
		git branch -a
		echo "Branch Name ?"
		read branchName
		action="git push origin --delete ${branchName}"
		eval $action
		
	fi
	if [ $choice -eq 5 ]
		then
		git branch
		echo "Branch Name ?"
		read branchName
		action="git checkout -b ${branchName}"
		eval $action
		
	fi
	if [ $choice -eq 6 ]
		then
		echo "Branch Name ?"
		read branchName
		action="git checkout -b ${branchName}origin/${branchName}"
		eval $action
		
	fi
	if [ $choice -eq 7 ]
		then
	# 	git branch
		echo "Old Branch Name ?"
	# 	read oldBranch
	# 	echo "new Branch Name ?"
	# 	read newBranch
	# 	action="git branch -m ${oldBranch} ${newBranch}"
	# 	eval $action
		
	fi
	if [ $choice -eq 8 ]
		then
		git branch		
		echo "Branch Name ?"
		read branchName
		action="git checkout ${branchName}"
		eval $action
	
	fi
	if [ $choice -eq 9 ]
		then

		git checkout -
	fi
	if [ $choice -eq 10 ]
		then
		echo "File Name ?"
		read fileName
		action="git checkout -- ${fileName}"
		eval $action

		
	fi
	if [ $choice -eq 11 ]
		then
		git branch
		echo "Branch Name ?"
		read branchName
		action="git merge ${branchName}"
		eval $action
		
	fi
	if [ $choice -eq 12 ]
		then
		git branch
		echo "Search Branch Name ?"
		read sourceBranch
		echo "Target Branch Name ?"
		read targetBranch
		action="git merge ${branchName}"
		eval $action
		
	fi
	if [ $choice -eq 13 ]
		then
		git stash
		
	fi


}

