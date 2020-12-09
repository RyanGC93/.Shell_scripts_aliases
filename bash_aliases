# Goes to downloadFolder
alias dwnDir="cd && cd /mnt/c/Users/ryang/Downloads/"

# launches nano with mouse
alias nn="nano -m"

# removes all of the zone identifiers
alias delZone="find  -type f -iname \*.Identifier -delete"

alias resources="cd ~/appAcademy/resourceNavigation"
alias aaProbs="cd && cd appAcademy/problemsWithSolution/appAcademyProblems && git pull && gs && ls"
# && git pull and git push && clr
alias aaNotes="cd && cd appAcademy/classNotes && git pull && gs && ls"

alias psql="psql -h localhost"


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
alias gc="git clone"
alias gr="git reset"
alias gm="git merge"
alias grb="git rebase"

alias gsho="git remote show origin"
alias update="git add -A && git commit -m 'update' && git push && clear"



# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# random that havent been organized
alias ex="explorer.exe ."
alias vs="code ."
alias ..="cd .."
alias clr="clear"
alias open="xdg-open"

## edit bash scripts and aliases
alias vsal="micro ~/.bash_scriptsAndAliases/bash_aliases"
alias vssh="micro ~/.bash_scriptsAndAliases/bash_scripts"

alias appdir="cd && code /home/ryan/appAcademy/READ.md"

 
## alias for download
alias dwndir="echo 'copy>> cp -RT ' && echo '/mnt/c/Users/ryang/Downloads/' && ls /mnt/c/Users/ryang/Downloads/"

## python server
alias pysrv="python3 -m http.server"
