#!/usr/bin/env bash

#_________________________
	#NNN SETTINGS
#_________________________
l()
{
    # # Block nesting of nnn in subshells
    # if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        # echo "nnn is already running"
        # return
    # fi
    export NNN_PLUG='f:finder;o:fzopen;d:diffs;z:_zip $nnn;u:_unzip $nnn;z:_zip $nnn'

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@" -e

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

alias la="l -H"

# if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    # # Remove option --tab for new window
    # tmux split-window -h "micro \"$*\""
# else
    # # tmux session running
    # tmux split-window -h "micro \"$*\""
# fi

export NNN_OPENER=nuke
export NNN_BMS='h:~;.:~/dotfiles;D:~/Documents;d:/mnt/c/USers/ryang/Downloads'