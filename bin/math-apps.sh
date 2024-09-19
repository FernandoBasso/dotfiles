#!/usr/bin/env bash

dir="$HOME/Cloud/pCloud/SRC-Studies/Handwritten-Notes/Math"

gnome-calculator &

thunar "$dir" &

terminator \
  --title 'MATH REPL' \
  --profile default \
	--working-directory ~/Public \
  --geometry=440x480-0-0
	# -e 'node -i'
	# -e 'stack ghci'

