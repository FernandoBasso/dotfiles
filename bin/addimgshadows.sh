#!/bin/bash

##
# Takes an screenshot with ‘flameshot’, adds a drop shadow
# with ‘imagemagick’ (‘convert’ command) and copies it to
# the clipboard.
#
# Open xfce4-keyboard-settings, select the Application
# Shortcuts tab, add the full path to this script as
# the command, and bind it to your preferred key.
#
# If you need to take a screenshot of a popup or something
# that requires that you hover over something, or hit
# ‘Ctrl+Space’ on an editor to display intellisense, etc.,
# which would disappear if you would hit a key like
# ‘PrintScreen’ on the keyboard, you can run this from the
# command line and make use of ‘sleep’ so you can perform the
# action and just wait for the sleep timeout:
#
# $ sleep 7 && flameshot gui && addimgshadows.sh
##

if ! command -v 1&> /dev/null flameshot
then
	printf '!!! Please install flameshot !!!\n' 2>&1
	exit 1
fi

if ! command -v 1&> /dev/null convert
then
	printf '!!! Please install imagemagick !!!\n' 2>&1
	exit 1
fi

imgorig=/tmp/imgorig.png
imgshad=/tmp/imgshad.png

flameshot gui && (
	xclip \
		-selection clipboard \
		-target image/png \
		-out > "$imgorig"

	convert "$imgorig" \
		\( +clone -background black -shadow 12x10+0+2 \) \
		+swap \
		-bordercolor none \
		-border 10 \
		-background none \
		-layers merge \
		+repage \
		"$imgshad"

	xclip -selection clipboard \
		-target image/png \
		-in "$imgshad"

	rm "$imgorig" "$imgshad"
)
