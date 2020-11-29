
# launches nano with mouse
alias nn="nano -m"

# removes all of the zone identifiers
alias delZone="find . -type f -iname \*.Identifier -delete"

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


# alias cm="git add -A && git commit -m"
# alias save="git add -A && git commit -m 'SAVEPOINT'"

#force delete the current directory and all its contents
alias REMOVE="rm -rf"
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# random that havent been organized
alias ex="explorer.exe ."
alias vs="code ."
alias ..="cd .."
alias ...="cd"
alias clr="clear"
alias open="xdg-open"
alias openlinks="xdg-open https://docs.google.com/document/d/1Us3tJqnwukSBWPJp2NQQlDV0ojef26oLDl1jeAlBvU4/edit"


# adds html,js,css structure with barebone structure
alias html="cp -RT /home/ryan/templates/html ."
#adds notes structure
# alias notes="cp -RT /home/ryan/templates/fileStrucureTemplates/wkNotes ."
# go to current week
alias vsal="cd && code /home/ryan/.bash_scriptsAndAliases/bash_aliases"
## get resources
alias vssh="cd && code /home/ryan/.bash_scriptsAndAliases/bash_scripts"

alias appdir="cd && code /home/ryan/appAcademy/READ.md"

 
## alias for download
alias dwndir="echo 'copy>> cp -RT ' && echo '/mnt/c/Users/ryang/Downloads/' && ls /mnt/c/Users/ryang/Downloads/"

alias links="echo 'https://progress.appacademy.io/me ' && echo 'https://open.appacademy.io/'"
# potential aliases

alias pysrv="python3 -m http.server"


#to add add aliases you should touch .bash_aliases in your root
# to do>>> touch .bash_aliases

#to have a seperate file for aliases.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases

# this should be in your .bashrc file by default but add if not
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi
