#!/bin/bash

#get date from target
#targetDate= stat -f "%d" $(Pathtotar )
targetcomp=back.tar.gz
target=back.tar
depend_list=$(cat direct_list.txt)

if (test -e $targetcomp); then #if the target is zipped already
    gunzip $targetcomp
fi
if !(test -e $target); then #if target doesn't exist
   touch $target
   echo "creating new archive"
fi

for i in $depend_list
do
    echo $i
#do search in all directories
    #dirs=$(#ls -d)
    g="$i.snar"
    tar --create --file=archive.*.tar --listed-incremental=$i.snar $i.tar
    tar uvf $target $i

done

#gzip $target #finally compress the final