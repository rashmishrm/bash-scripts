#!/bin/sh

#This script replicates files in given folder and changes date as it replicates 
FOLDER=$1

cd $FOLDER
i=0
for f in *
do

  for a in `seq 1 2`
  do
    b=$a"d"
    folderdt=$(date +%Y/%m/%d -d "2017/01/01 + $a day")
    foldernm=$(date +%Y%m%d -d "20170101 + $a day")
    #below is for mac
    #folderdt=$(date -j -v +$b -f "%Y/%m/%d" "2017/01/01" +%Y/%m/%d)
    #foldernm=$(date -j -v +$b -f "%Y%m%d" "20170101" +%Y%m%d)


    filename="log$foldernm$i""cp"

    cp  "$f" "$filename"
    final1=$(echo $folderdt | sed -e "s/\//;/g")
    final2=$(echo $final1 | sed -e "s/;/\\\\\//g")
    older='2017\/06\/[0-9][0-9]'
    #folderdt='2017\/06\/18'
    sed -i -e "s/${older}/${final2}/g" "$filename"

  done
i=$((i+1));
done

rm -rf *-e
