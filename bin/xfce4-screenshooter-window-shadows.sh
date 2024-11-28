#!/usr/bin/env bash

#
# Uses xfce4-screenshooter to take a screenshot of the current
# window and them add some shadows with imagemagic.
#

imgorig=/tmp/imgorig.png
imgshad=/tmp/imgshad.png

xfce4-screenshooter --clipboard --window && (
	xclip \
		-selection clipboard \
		-target image/png \
		-out > "$imgorig"

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
