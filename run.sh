#!/bin/bash

#get date from target
#targetDate= stat -f "%d" $(Pathtotar )
target_dir=$(cat target_dir.txt)

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
    
    name_base_t="${i##*/}"
    gg=$name_base_t[0-9]*.tar*
    #dirs=$(#ls -d)
    num=$(ls $gg | wc -l)
        
    tar --create --file=$name_base_t$num.tar --listed-incremental=$name_base_t.snar $i
    
    gzip $name_base_t$num.tar

done

#gzip $target #finally compress the final