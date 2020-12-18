#!/usr/bin/env bash

# Downloads
alias dwnDir="l /mnt/c/Users/ryang/Downloads/"


## Cat but better
alias bat="batcat"

# launches nano with mouse
alias nn="nano -m"

# removes all of the zone identifiers
alias delZone="find  -type f -iname \*.Identifier -delete"

# Navigation
alias resources="cd ~/appAcademy/resourceNavigation && git pull && gs && l"
alias aaProbs="cd && cd appAcademy/problemsWithSolution/appAcademyProblems && git pull && gs && ls"
alias aaNotes="cd && cd appAcademy/classNotes && git pull && gs && ls"
alias appdir="cd && code /home/ryan/appAcademy/READ.md"

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

## edit bash scripts and aliases

alias vssh="l ~/.bash_scriptsAndAliases"


## python server
alias pysrv="python3 -m http.server"

# Login to psql
alias psql="psql -h localhost"