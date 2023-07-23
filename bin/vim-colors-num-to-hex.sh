#!/usr/bin/bash

#
# • https://vi.stackexchange.com/a/9755/15803
#

for i in {0..255} ; do
	printf "\x1b[38;5;${i}mcolour${i}\n"
done
