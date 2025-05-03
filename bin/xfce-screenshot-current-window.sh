#!/bin/bash

if ! command -v 1&> /dev/null xfce4-screenshooter
then
	printf '!!! Please install gnome-screenshooter !!!\n' 2>&1
	exit 1
fi

if ! command -v 1&> /dev/null magick
then
	printf '!!! Please install imagemagick !!!\n' 2>&1
	exit 1
fi

imgorig=/tmp/imgorig.g.png
imgshad=/tmp/imgshad.g.png

xfce4-screenshooter --window --clipboard --save "$imgorig" && (
	magick "$imgorig" \
		\( +clone -background black -shadow 8x8+0+0 \) \
		+swap \
		-bordercolor none \
		-border 0 \
		-background none \
		-layers merge \
		+repage \
		"$imgshad"

	xclip -selection clipboard \
		-target image/png \
		-in "$imgshad"

	rm "$imgorig" "$imgshad"
)
