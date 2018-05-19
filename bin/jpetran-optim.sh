#!/usr/bin/env bash

for img in *.jpg ; do
    tmpfile="${img%.*}.optim.jpg"
    du -h "$img"
    jpegtran -copy none -optimize -quality 85 -outfile "$tmpfile" "$img"
    du -h "$tmpfile"
    rm -v "$img"
    mv -v $tmpfile $img
done

