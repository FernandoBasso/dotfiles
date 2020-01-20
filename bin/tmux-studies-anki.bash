#!/usr/bin/env bash

# Place where I manipulate files when I an studying my Anki cards
# and need to run quick snippets of code to assert my knowledge of
# the things I am committing to the long-term memory.
dir="${HOME}/Public/tempstudyfiles"
ses='anki-studies'

if [ ! -d "$dir" ] ; then
    mkdir --parent "$dir"
    cd "$dir"
fi

# \033 is \e, which is ESC.
# \007 is \a, which is BEL.
#echo -en '\033]2;Anki Studies!\007'
#printf '\e]2;%s\a' 'Anki Studies!'

tmux new-session -d -s "$ses" -c "$dir"
tmux rename-window 'vim' \; send-keys $'vim vtemp.txt\n'
tmux new-window -t "${ses}:2" -n 'emacs' -c "$dir" \; send-keys $'emacs -nw etemp.txt\n'
tmux new-window -t "${ses}:3" -n 'shell-1' -c "$dir"

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "${ses}"

