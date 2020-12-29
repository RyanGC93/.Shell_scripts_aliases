#!usr/bin/bash
#=========================
#	GIT ALIAS/SCRIPTS
#=========================



# gsho >>> shows git origin
alias gsho="git remote show origin"
alias update="git add -A && git commit -m 'update' && git push && clear"
# gc >>> Clones and changes into directory
function gc(){
	git clone "$1" && cd "$(basename "$1" .git)"
}

# creates a newbranch
function newbranch(){
      git branch $1
      git branch
      git checkout
      touch branchInfo
      git push --set-upstream origin develop
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

