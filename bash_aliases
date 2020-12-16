# Downloads
alias dwnDir="cd && cd /mnt/c/Users/ryang/Downloads/"
alias dwndir="echo 'copy>> cp -RT ' && echo '/mnt/c/Users/ryang/Downloads/' && ls /mnt/c/Users/ryang/Downloads/"

## better man pages
alias man="TERMINFO=~/.terminfo TERM=mostlike LESS=C PAGER=less man"

## Cat but better
alias bat="batcat"

# launches nano with mouse
alias nn="nano -m"

# removes all of the zone identifiers
alias delZone="find  -type f -iname \*.Identifier -delete"

# Navigation
alias resources="cd ~/appAcademy/resourceNavigation && git pull && gs && ls"
alias aaProbs="cd && cd appAcademy/problemsWithSolution/appAcademyProblems && git pull && gs && ls"
alias aaNotes="cd && cd appAcademy/classNotes && git pull && gs && ls"
alias appdir="cd && code /home/ryan/appAcademy/READ.md"


# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'


## edit bash scripts and aliases
alias vsal="micro ~/.bash_scriptsAndAliases/bash_aliases"
alias vssh="micro ~/.bash_scriptsAndAliases/bash_scripts"



## python server
alias pysrv="python3 -m http.server"

# Login to psql
alias psql="psql -h localhost"