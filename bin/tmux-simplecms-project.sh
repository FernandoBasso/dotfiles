#!/usr/bin/env bash

function usage() {
    printf '%s\n' "USAGE: ${0##*/} THEME (dark1, light1)"
    printf '%s\n' 'EXAMPLES:'
    printf '\t%s %s\n' "${0##*/}" 'dark1'
    printf '\t%s %s\n' "${0##*/}" 'light1'
}

dir="$HOME/develop/VBSMidia/1newprojs/simplecms"
ses="simplecms"

cd "$dir"

theme=dark1
if (( $# > 0 )) ; then
    theme="$1"
fi

if [[ "$theme" == light1 ]] ; then
    config_file="$HOME/.dotfiles/FILES/tmux-light1.conf"
else
    config_file="$HOME/.dotfiles/FILES/tmux.conf"
fi

tmux -f "$config_file" new-session -d -s "$ses" -c "$dir" \; rename-window 'vim' \; \
    send-keys 'vim' C-m

tmux new-window -t "${ses}:2" -n serve -c "$dir" \; \
    send-keys 'php artisan serve' C-m

tmux new-window -t "${ses}:3" -n mix -c "$dir" \; \
    send-keys 'npm run watch' C-m

tmux new-window -t "${ses}:4" -n tinker -c "$dir" \; \
    send-keys 'php artisan tinker' C-m

tmux new-window -t "${ses}:5" -n sqldev -c "$dir" \; \
    send-keys 'mysql -u devel -p1234 -D simplecms_devel --auto-rehash;' C-m

tmux new-window -t "${ses}:6" -n git -c "$dir" \; \
    send-keys 'git status' C-m

tmux new-window -t "${ses}:7" -n shell -c "$dir"

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "$ses"

