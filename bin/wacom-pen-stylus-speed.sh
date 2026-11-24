#!/bin/bash

#
# Just a quick hack so I don't have to find the IDs manually
# every time I plug my Wacom tablet to run the commands with
# the proper IDs (which often changes depending on what is
# plugged).
#
# Call the script with 1.3 or 1.5 for the deceleration.
#

function get_pen_stylus_id () {
	xinput list \
		| grep -i 'pen stylus' \
		| sed -n 's/.*id=\([0-9]\+\).*/\1/p'
}

# Pass the ID of the device.
function get_deceleration () {
	xinput list-props "$1" \
		| grep 'Adaptive Deceleration' \
		| sed -n 's/.*Adaptive Deceleration (\([0-9]\+\).*/\1/p'
}

pen_stylus_id=$(get_pen_stylus_id)
pen_stylus_deceleration_id=$(get_deceleration $pen_stylus_id)

xinput list | grep -i 'pen stylus'
xinput list-props $pen_stylus_id | grep 'Adaptive Deceleration'

set -x
xinput set-prop $pen_stylus_id $pen_stylus_deceleration_id $1
