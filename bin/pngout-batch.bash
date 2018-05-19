#/usr/bin/env bash

#set -x

#
# Port of Nic Jansma's pngout-batch.cmd (windows) script to bash.
#
# http://nicj.net/pngoutbatch-optimize-your-pngs-by-running-pngout-multiple-times/
# https://gist.github.com/nicjansma/2706660
#

numPasses=5

if [[ -z $1 ]] ; then
    echo 'No image provided...'
    exit -1
fi

if [ $# -eq 2 ] ; then
    echo 'two'
    numPasses=$2
fi

img=$1

origSize=$(stat -c%s "$img") # in bytes
curSize=$origSize

for bytes in 0 128 192 256 512 1024 2048 4096 8192 ; do

    blockSize=$bytes
    echo "Blocksize: $bytes"

    for pass in $(seq 1 $numPasses) ; do

        pngout -b$blockSize -r $img > /dev/null

        # Check savings for each iteration.
        thisSize=$(stat -c%s "$img")

        savings=$(($curSize - $thisSize))

        if [[ $savings > 0 ]] ; then
            echo "Pass #${pass}: saved ${savings}"
        else
            echo "Pass #${pass}: no savings..."
        fi

        curSize=$thisSize
    done
done

echo "origSize: $origSize"
echo "finalSize: $curSize"
echo "Saved total of " $(($origSize - $curSize)) " bytes."

