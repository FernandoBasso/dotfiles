#!/usr/bin/env bash

##
# Helper script to send keys (a command line) to all windows and panes
# of the current session.
#
# Credits where it is due:
# https://scripter.co/command-to-every-pane-window-session-in-tmux/
#
# ⚠️  WARN ⚠️ : If there is a program such vim or emacs running on a pane
# or window, the keys will be sent to that window to, messing things up.
# So, make sure you have only shells running on each window or pane
# before using this script. In the future, I'll try to detect that we
# only have a shell running on each target before sending keys to them.
#
# My use case is basically running `nvm use` (because I have lots of
# Node, TypeScript and other JS related stuff which run on different
# versions) or `clear`. Very simple stuff.
#
# EXAMPLE USAGE:
#
#   $ tmux-send-keys.sh echo hello
#   $ tmux-send-keys.sh nvm use
#   $ tmux-send-keys.sh clear
#
# 🔥️ DANGER 🔥️: Note that sending commands to multiple shells is
# inherently dangerous. Terminator, Tilix and possible other programs
# allow sending commands to multiple running shells and the danger looms
# with all of them. Imagine if you do `pacman -S <some package> or `git
# commit -m 'foo' in all available shells‽ So, please DO BE CAREFUL!
##

tmux list-panes -s -F '#{session_name}:#{window_index}.#{pane_index}' \
  | xargs -I PANE tmux send-keys -t PANE "$*" C-j


# vim: set tw=72:

