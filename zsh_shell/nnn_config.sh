#!/usr/bin/env bash

#_________________________
	#NNN SETTINGS
#_________________________
n(){

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"


    nnn "$@" -e

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


export NNN_sel=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPENER=$HOME/.config/nnn/plugins
export NNN_BMS='h:~;a:~/appAcademy;r:~/appAcademy/resourceNavigation;d:/mnt/c/USers/ryang/Downloads;s:~/.bash_scriptsAndAliases/'
export NNN_PLUG='f:finder;o:fzopen;c:_code $nnn;p:preview-tui;v:_nvim $nnn;'
# z:_zips $nnn;u:_unzip $nnn;m:_glow $nnn

#_________________________
	#NNN Optional SETTINGS
#_________________________

    # # Block nesting of nnn in subshells
    # if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        # echo "nnn is already running"
        # return
    # fi



    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    
    
    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef
    
    
    # if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
        # # Remove option --tab for new window
        # tmux split-window -h "micro \"$*\""
    # else
        # # tmux session running
        # tmux split-window -h "micro \"$*\""
    # fi