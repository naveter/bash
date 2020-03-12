#!/bin/bash

# run command in background
 ls &
 pid=$!
 wait $pid
 echo Process $pid finished.

#To convert a folder of images from JPG to PNG in parallel:

for f in *.jpg
do
  convert $f ${f%.jpg}.png &
done
wait
echo All images have been converted.

 echo *.txt        # prints names of all text files
 echo *.{jpg,jpeg} # prints names of all JPEG files

echo {0,1}{0,1}{0,1}    # prints 000 001 010 011 100 101 110 111

 for f in *.sh
 do
   echo ${f%.c} $f
 done

