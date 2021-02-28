if [[ "$TERM" != xterm-kitty ]] ; then
	cat 1>&2 <<-'EOF'
	  !! NOTE !!'

	  This script can only be used from Kitty terminal emulator.'
	  Bailing out...'
	EOF

	exit 1
fi
