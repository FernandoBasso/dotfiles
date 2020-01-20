#!/usr/bin/env bash

function usage () {
  cat <<EOF

Usage:

  ${0##*/} -h, --help
    Show this help text and exit.

  ${0##*/} [WORKING-DIRECTORY] [SESSION-NAME]
    Start tmux in WORKING-DIRECTORY with session named SESSION-NAME

EOF

  exit 0
}

case "$1" in
  -h|--help)
    usage
    ;;
esac

dir="${1:-$HOME/Projects/proghowto}"
ses="${2:-proghowto}"

tmux -f ~/Projects/dotfiles/tmux/themes/tmux-light.conf \
  new-session -d -s "$ses" -c "$dir" \; \
  rename-window 'vim' \; \
  send-keys 'vim -c "colorscheme mylight1" -c "AirlineTheme xtermlight"'

tmux split-window -h -c "$dir" \; split-window -v -c "$dir"

tmux new-window -t "${ses}:2" -n '0dev' -c "$dir/0dev"
tmux split-window -h -c "$dir/0dev"
tmux split-window -v -c "$dir/0dev"

tmux new-window -t "${ses}:3" -n 'git' -c "$dir"

tmux new-window -t "${ses}:3" -n 'man' \; split-window -h

tmux select-window -t "${ses}:1"
tmux -2 attach-session -t "${ses}"

# vim: set softtabstop=2 shiftwidth=2:

