#!/usr/bin/env bash

# When we create a session, a new window with index 0 is automatically
# created. We just rename it and keep adding the other ones.
# Also: http://unix.stackexchange.com/questions/75711/tmux-not-respecting-disabled-control-flow
#tmux new-session -d -s rails 'title rails-development; stty -ixon; vim'
tmux new-session -d -s rails

# For some reason, send-keys does nothing here, not even an error is displayed.
tmux rename-window 'VIM' \; send-keys $'rvmprompt\nvim\n'
#tmux new-window -t rails:1 -n 'VIM'
tmux new-window -t rails:1 -n 'irb' \; send-keys $'rvmprompt\nirb\n'
tmux new-window -t rails:2 -n 'rails server' \; send-keys $'rvmprompt\n'
tmux new-window -t rails:3 -n 'psql' \; send-keys $'rvmprompt\n'
tmux new-window -t rails:4 -n 'shell' \; send-keys $'rvmprompt\n'

tmux select-window -t rails:0

# That is why we select rails:0 and send-keys here.
tmux send-keys $'rvmprompt\nvim\n'
tmux -2 attach-session -t rails

