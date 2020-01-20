#!/usr/bin/env bash

usage() {
    printf "\nUsage: ${0##*/} path session\n\n"
    printf "    path:    a path like \`~/projs/foo\`\n"
    printf "    session: a name for the session tmux will create\n"
}
if (($# < 2)); then
    usage
    exit 1
fi

dir="$1"
ses="$2"

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

tmux new-window -t "${ses}:3" -n ssh -c "$dir"

tmux new-window -t "${ses}:4" -n git -c "$dir" \; \
    send-keys 'git status' C-m

tmux new-window -t "${ses}:5" -n shell -c "$dir"

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "$ses"




# 15:58:27          geirha | and error messages should got to stderr, so printf >&2
# 15:58:49             emg | also, do you want to indicate error when bailing out? if so you shouldn't
#                          | exit 0 which means success
