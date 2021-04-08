#!/bin/bash

#Declare array with 4 elements
ARRAY=( 'Debian Linux' 'Redhat Linux' Ubuntu Linux )
# get number of elements in the array
ELEMENTS=${#ARRAY[@]}

# echo each element in array
# for loop
for (( i=0;i<$ELEMENTS;i++)); do
    echo ${ARRAY[${i}]}
done

foo[0]="one"
foo[1]="two"
echo ${foo[1]}  # prints "two"

array=(a b c)
echo $array       # prints a
echo ${array[@]}  # prints a b c
echo ${array[*]}  # prints a b c

foo=(a b c)
bar=("${foo[@]}")
echo ${bar[1]}    # prints b

 echo $10     # prints the first argument, followed by 0
 echo ${10}   # prints the tenth argument

directory="../res"

# bash check if directory exists
if [ -d $directory ]; then
	echo "Directory $directory exists"
else
	echo "Directory does not exists"
fi

# read data from file

# Declare array
declare -a ARRAY
# Link filedescriptor 10 with stdin
exec 10<&0
# stdin replaced with a file supplied as a first argument
exec < ../res/readFile.txt
let count=0

while read LINE; do

    ARRAY[$count]=$LINE
    ((count++))
done

echo Number of elements: ${#ARRAY[@]}
# echo array's content
echo ${ARRAY[@]}
# restore stdin from filedescriptor 10
# and close filedescriptor 10
exec 0<&10 <&-
