#!/bin/bash

line=aaaab
if [[ $line =~ [[:space:]]*?(a)b ]]
then
    echo $line
fi

# coproc [NAME] command [redirections]
# find . -type f -name '*.html' -print | parallel gzip

while IFS= read -r x; do
		echo $x
done < ../res/readFile.txt | grep 1883

for f in $( ls *Co* ); do echo $f; done

echo a{d,c,b}e #ade ace abe
# mkdir /usr/local/src/bash/{old,new,dist,bugs}

string=01234567890abcdefgh
echo ${string:7:5}

# [n]<&word    is used to duplicate input file descriptors
# &>word  redirect stderr with stdout
# [n]<&digit-   moves the file descriptor digit to file descriptor n
# [n]>&digit-    backwards
# [n]<>word    opens for reading and writing





