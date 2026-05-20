#!/usr/bin/env bash

script_dir="$(
	cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd
	)"

##
# ‘exit 1’ if not running this inside kitty.
#
#source "$script_dir/kitty-helpers/kitty-if-not.sh"

##
# A script to remote-control kitty and set some windows and tabs to a
# FRONT-END DEVEL setup for vim, jest, server and a split window for
# shell commands and/or man pages.
#

##
# Default title and working directory if not passed. I'll keep this
# simple for now. To pass a working directory, the tittle has to be
# passed to. First param is always the title, second param is always the
# working directory. To use the default title and still be able to pass
# the directory as the second parameter, pass '' as the first param
#
# Examples:
#
# $ bash kitty-dev-fe.sh MY-FRONTEND-APP \
#   ~/work/purescript-apps/todoapp
#
# $ bash kitty-def-fe.sh '' \
#   ~/work/react-apps/blog
#
#
win_title='λ SmarterContact λ' work_dir=~/work

##
# If passed, let's set the custom window title.
#
if [[ -n "$1" ]]; then
	win_title="$1"
fi

if [[ -n "$2" ]]; then
	work_dir="$2"
fi

backend="$work_dir/sc-new-service"
frontend="$work_dir/sc-web-app"

kitty @ launch --cwd "$frontend" --title "$win_title" \
	--type=tab --tab-title nvim-FE

kitty @ launch --cwd "$backend" --title "$win_title" \
	--type=tab --tab-title nvim-BE

kitty @ launch --cwd "$backend" --title "$win_title" \
	--type=tab --tab-title DOCKER

kitty @ launch --cwd "$backend" --title "$win_title" \
	--type=tab --tab-title 'BE & FE'

kitty @ launch --cwd "$frontend" --title "$win_title"

kitty @ launch --cwd "$workd_dir" --title "$win_title" \
	--type=tab --tab-title 'SHELL'

##
# Opens a new tab, and then another kitty window on the right.
#
# kitty @ launch --cwd "$work_dir" --title "$win_title" \
#   --type=tab --tab-title shell
#
# kitty @ launch --cwd "$work_dir" --title "$win_title"

##
# Focus the shell on the right tab and run ‘git status’ on it.
# Run ‘git status’ on the right shell window (num 1) and
# then focus that tab at window num 0.
#
kitty @ focus-tab -m title:DOCKER
kitty @ send-text -m num:1 'ls\n'

kitty @ focus-window -m num:0

#
# vim: set tw=72:
#
