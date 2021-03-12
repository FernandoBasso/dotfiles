#!/bin/bash

#
# To be used as a .desktop application launcher wrapper in order for
# gvim to understand that we do have Node installed. Also works if
# launched from gmrun or a similar “run dialog”.
#

if ! command -v node > /dev/null; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
fi

exec gvim -f "$@"

##
# https://lists.gnu.org/archive/html/help-bash/2021-03/msg00018.html
##
