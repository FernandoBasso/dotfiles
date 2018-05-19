#!/usr/bin/env bash

# When we create a session, a new window with index 0 is automatically
# created. We just rename it and keep adding the other ones.
# Also: http://unix.stackexchange.com/questions/75711/tmux-not-respecting-disabled-control-flow
#tmux new-session -d -s rails 'title rails-development; stty -ixon; vim'
tmux new-session -d -s rails
tmux rename-window 'VIM' \; send-keys $'cd ~/CPASoftwares/cpalander && rvmprompt\nvim\n'
#tmux new-window -t rails:1 -n 'VIM'
tmux new-window -t rails:1 -n 'server' \; send-keys $'cd ~/CPASoftwares/cpalander && rvmprompt\n'
tmux new-window -t rails:2 -n 'irb' \; send-keys $'cd ~/CPASoftwares/cpalander && rvmprompt\nirb\n'
tmux new-window -t rails:3 -n 'psql' \; send-keys $'cd ~/CPASoftwares/cpalander && rvmprompt\n'
tmux new-window -t rails:4 -n 'shell-1' \; send-keys $'cd ~/CPASoftwares/cpalander && rvmprompt\n'
tmux new-window -t rails:5 -n 'shell-2' \; send-keys $'cd ~/CPASoftwares/cpalander && rvmprompt\n'
tmux new-window -t rails:6 -n 'shell-3' \; send-keys $'cd ~/CPASoftwares/cpalander && rvmprompt\n'

tmux select-window -t rails:0
tmux -2 attach-session -t rails

