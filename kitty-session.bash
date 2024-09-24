#!/usr/bin/env bash

##
# Creates a kitty session with a few appropriately named
# tabs and windows.
#
# NOTE: Run this script from INSIDE kitty from the directory
# where this file is located.
#
# USAGE:
#
#   $ cd /path/to/this/devhowto/directory
#   $ bash ./kitty-session.bash
##

if [[ "$TERM" != xterm-kitty ]] ; then
	cat 1>&2 <<-'EOF'

!! NOTE !!

This script can only be used from Kitty terminal emulator.'

Bailing out...
	EOF

	exit 1
fi

win_title='λ DOTFILES λ'
work_dir="$PWD"

kitty @ launch \
  --type=tab \
  --cwd "$work_dir" \
  --tab-title NVIM \
  --title "$win_title"

kitty @ launch \
  --type=tab \
  --cwd "$work_dir" \
  --tab-title SHELL \
  --title "$win_title"

kitty @ launch \
	--type=window \
	--cwd "$work_dir" \
	--title "$win_title"

##
# Focus the shell tab on the right pane and run ‘git status’
# on it.
#
kitty @ focus-tab -m title:shell
kitty @ send-text -m num:1 'git status\n'

##
# Then close the first (original) tab/window that was open just
# so that we could launch the layout session.
kitty @ close-tab -m index:0

#
# vim: set tw=72:
#
