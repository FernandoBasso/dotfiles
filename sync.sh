#!/usr/bin/env bash

#
# Simply switch to <this repo> root directory and run:
#
#   $ bash sync.sh
#

dir_script="$(cd "$(dirname "$0")" && pwd -P)"

##
# This functio symblinks config files to their respective expected
# locations under the user's $HOME directory.
#
symblink_files () {
	while read -r file ; do
		mkdir -pv "$(dirname "$HOME/$file")"

		if [ ! -L "$file" ]; then
			if [ -e "$HOME/$file" ]; then
				printf '%s\n' "[SKIP]: ~/$file exists and is NOT a symblink..."
			else
				printf '%s\n' "[SYMB]: ~/$file is bing symblinked"
				ln -sv "$dir_script/$file" "$HOME/$file"
			fi
		fi
	done < ./MANIFEST-LINUX.txt
}

symblink_files

#
# vim: set tabstop=2 softtabstop=2 shiftwidth=2:
#
