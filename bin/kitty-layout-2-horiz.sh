#!/usr/bin/env bash

script_dir="$(
	cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd
)"

##
# ‘exit 1’ if not running this inside kitty.
#
source "$script_dir/kitty-helpers/kitty-if-not.sh"

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
# $ bash kitty-layout-2-horiz.sh DOTFILES ~/Projects/dotfiles
#
# $ bash kitty-layout-2-horiz.sh '' ~/Public/shell-studies
#
win_title='λ H4CK1N9 λ' work_dir=~/Public

##
# If passed, let's set the custom window title.
#
if [[ -n "$1" ]]; then
	win_title="$1"
fi

if [[ -n "$2" ]]; then
	work_dir="$2"
fi

##
# A single OS window with two horizontal (side by side) panes.
#
kitty @ launch --cwd "$work_dir" --title "$win_title" \
	--type=tab

kitty @ launch --cwd "$work_dir" --title "$win_title"

##
# Then close the first (original) tab/window that was open
# just so that we could launch the layout. This relies on my
# kitty setup which sets a new kitty window with the default
# title of “λ Always Be Awesome! λ”.
#
#
# kitty @ close-tab -m title:'λ Always Be Awesome! λ'

#
# vim: set tw=72:
#
