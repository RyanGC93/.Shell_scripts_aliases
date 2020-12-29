#!/usr/bin/env bash

#==========UTILITY==========
## python server
alias pysrv="python3 -m http.server"
# psql >>> Login to psql
alias psql="psql -h localhost"

#==========BASIC==========
# random that havent been organized
alias ex="explorer.exe ."
alias vs="code ."
alias ..="cd .."
alias clr="clear"
alias open="xdg-open"
## Cat but better
alias bat="batcat"

#history commands
alias hh='hstr'
alias hf='hstr --favorites'
# delzone >>> removes all of the zone identifiers
alias delZone="find  -type f -iname \*.Identifier -delete"

#==========Navigation==========
alias resources="cd ~/appAcademy/resourceNavigation && git pull && gs && l"
alias aaProbs="cd && cd appAcademy/problemsWithSolution/appAcademyProblems && git pull && gs && ls"
alias aaNotes="cd && cd appAcademy/classNotes && git pull && gs && ls"
alias appdir="cd && code /home/ryan/appAcademy/READ.md"
## edit bash scripts and aliases
alias vssh="l ~/.bash_scriptsAndAliases"
# Downloads
alias dwnDir="l /mnt/c/Users/ryang/Downloads/"
#==========NOT USED==========
# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=blacksea -f console256 -g'