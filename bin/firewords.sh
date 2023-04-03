#!/bin/bash

#
# Merges all the perdict.data in firefox profiles (including
# dev edition) from ~/.mozilla.
#
# Reload the page or restart Firefox for new words to take
# effect on a given page.
#

persdict_files=($(find ~/.mozilla -iname persdict.dat))
date="$(date +'%Y-%m-%d-%M-%S')"

##
# Add all words from all persdict.dat into a single file.
#
for file in "${persdict_files[@]}"
do
  cp "$file" "${file}-${date}.bkp"

  cat "$file" >> ./words.txt
done

##
# Sort and dedup the entries.
#
cat ./words.txt | sort | uniq > ./persdict.txt

##
# Copy the sorted and deduped resulting file as persdict.dat
# in each of the profile directries where the original dict
# files were found in the first place.
#
for file in "${persdict_files[@]}"
do
  cp -v ./persdict.txt "$file"
  wc -l "$file"
done
