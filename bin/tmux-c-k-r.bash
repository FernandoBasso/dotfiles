#!/usr/bin/env bash

dir="${HOME}/Dropbox/studies/c/k-r"
ses='c-k-r'

if [ ! -d "$dir" ] ; then
    echo "Directory \`$dir\` not found."
    echo "The project “$ses” doesn't seem to be on this machine."
    echo "Bailing out..."
    exit 0
fi


# NOTE: base-index is set to 1 (relevant for the window numbers in commands).

tmux new-session -d -s "$ses" -c "$dir" \; rename-window 'vim' \; \
    send-keys 'vim main.c' C-m

# php -S takes a host name, without the protocol:// part.
tmux new-window -t "${ses}:2" -n 'emacs' -c "$dir" \; \
    send-keys 'emacs -nw c-k-r-notes.org' C-m

tmux new-window -t "${ses}:3" -n 'gcc' -c "$dir"

# With LC_COLLATE=C we list dot files first.
tmux new-window -t "${ses}:4" -n 'shell' -c "$dir" \; \
    send-keys 'LC_COLLATE=C \ls --color=auto --format=long --human-readable --almost-all --classify' C-m

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "${ses}"



