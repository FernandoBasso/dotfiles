#!/usr/bin/env bash

#
# Join all input lines into one single line.
#
sed -e :a -e '$!N; s/\n/ /; ta' <<<"$1"

