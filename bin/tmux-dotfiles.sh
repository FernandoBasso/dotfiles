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

dir="${1:-$HOME/Projects/dotfiles}"
ses="${2:-dotfiles}"

tmux -f ~/Projects/dotfiles/tmux/themes/tmux-light.conf \
  new-session -d -s "$ses" -c "$dir" \; \
  rename-window 'vim' \; \
  send-keys 'vimlight'

tmux new-window -t "${ses}:2" -n 'git' -c "$dir" \; \
  send-keys 'git status' C-j

tmux select-window -t "${ses}:2"
tmux -2 attach-session -t "${ses}"

# vim: set softtabstop=2 shiftwidth=2:

