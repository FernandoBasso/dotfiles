#!/usr/bin/env bash

shopt -s nullglob
imgs=(*.jpg)

if [[ "${#imgs}" == 0 ]] ; then
    printf 'No images to optimize.\n'
    exit 1
fi

for img in *.jpg ; do

    # Create a name for the optimized file.
    tmpfile="${img%.*}.optim.jpg"

    # Print file size of non-optimized image.
    du -h "$img"

    # Do the actual optimization.
    convert "$img" -sampling-factor 4:2:0 -strip -quality 80 -interlace JPEG -colorspace sRGB "$tmpfile"

    # Print file size of the optimized image.
    du -h "$tmpfile"

    # Remove original, larger file.
    rm -v "$img"
    #mv "$img" "${img%.*}".bkp.jpg

    # Rename optim file the the name of the original file.
    mv -v $tmpfile $img
done

