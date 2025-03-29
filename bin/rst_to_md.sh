#!/usr/bin/env bash

#
# Converts all .rst files in the current directory to .md.
#
# Requires pandoc.
#

for f in *.rst
do
  pandoc \
		--verbose \
    --standalone \
    --from=rst \
    "$f" \
    --to=gfm \
    --wrap=none \
    --output="${f%.*}.md"
done
