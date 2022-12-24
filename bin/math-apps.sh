#!/usr/bin/env bash

dir="$HOME/Cloud/pCloud/Handwritten-Notes/Math/Algebra 1"

gnome-calculator &

thunar "$dir" &

terminator \
  --title 'MATH REPL' \
  --profile GruvboxLight \
	--working-directory ~/Public \
  --geometry=400x500-0-0 \
	-e 'deno repl'
	# -e 'stack ghci'

