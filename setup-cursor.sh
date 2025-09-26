#!/usr/bin/env bash

echo '=============================='
echo '===== Setting up Cursor ======'
echo '=============================='
echo "bash --------: $BASH_VERSION"
echo "bash path ---: $(which bash)"

if [[ "$(uname)" == "Darwin" ]]
then
	ln -svf \
		~/source/dotfiles/Cursor/User/keybindings.json \
	  ~/Library/Application\ Support/Cursor/User/keybindings.json

	ln -svf \
		~/source/dotfiles/Cursor/User/settings.json \
	  ~/Library/Application\ Support/Cursor/User/settings.json
else
	echo Linux
	echo TODO Cursor setup
fi
