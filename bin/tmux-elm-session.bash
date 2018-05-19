#!/usr/bin/env bash

dir="${1:-$PWD}"
ses="${2:-ELM}"

if [[ ! -d "$dir" ]] ; then
    printf >&2 "Directory \`%s\` not found.\n" "$dir"
    printf >&2 "The project “%s” doesn't seem to be on this machine.\n" "$ses"
    printf >&2 "Bailing out..."
    exit 1
fi


tmux new-session -d -s "$ses" -c "$dir" \; rename-window 'vim'

tmux new-window -t "${ses}:2" -n emacs -c "$dir"

tmux new-window -t "${ses}:3" -n elm-reactor -c "$dir"

tmux new-window -t "${ses}:4" -n elm-repl -c "$dir"

tmux new-window -t "${ses}:5" -n git -c "$dir" \; \
    send-keys 'git status' C-m

tmux new-window -t "${ses}:6" -n shell -c "$dir"

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "$ses"

