#!/usr/bin/env bash


dir="$HOME/develop/mysite/source"
ses="mysite"

if [[ ! -d "$dir" ]] ; then
    printf >&2 "Directory \`%s\` not found.\n" "$dir"
    printf >&2 "The project “%s” doesn't seem to be on this machine.\n" "$ses"
    printf >&2 "Bailing out..."
    exit 1
fi


# NOTE: base-index is set to 1 (relevant for the window numbers in commands).

tmux new-session -d -s "$ses" -c "$dir" \; rename-window 'vim' \; \
    send-keys vim C-m

# php -S takes a host name, without the protocol:// part.
tmux new-window -t "${ses}:2" -n emacs -c "$dir" \; \
    send-keys 'emacs -nw' C-m

tmux new-window -t "${ses}:3" -n server -c "$dir" \; \
    send-keys 'bundle exec jekyll serve --drafts --baseurl "" --port 4000' C-m

tmux new-window -t "${ses}:4" -n git -c "$dir" \; \
    send-keys 'git status' C-m

tmux new-window -t "${ses}:5" -n shell -c "$dir"

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "$ses"


