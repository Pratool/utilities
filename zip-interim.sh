#!/bin/bash
# One-off script to find all files that are not itself and put them in zip files
# of increments of 1000 GiB.

set -x

tarfiles=
x=0
c=0
pids=
while read p
do
    file=$(echo -n $p | cut -f 1 -d ' ')
    size=$(echo -n $p | cut -f 2 -d ' ')
    x=$(( $x + $size ))
    tarfiles="$tarfiles $file"
    if [ $((x > 1000*1000*1000)) = 1 ]
    then
        zip "pics$c.zip" $tarfiles &
        pids="$pids $!"
        x=0
        tarfiles=
        c=$((c + 1))
    fi
done <<< $(find -type f \! -name 'zip-interim.sh' -printf '%p %s\n')

echo $pids

wait $pids
