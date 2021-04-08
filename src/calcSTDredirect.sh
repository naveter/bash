#!/bin/bash

let RESULT1=$1+$2
echo $1+$2=$RESULT1 ' -> # let RESULT1=$1+$2'
declare -i RESULT2
RESULT2=$1+$2
echo $1+$2=$RESULT2 ' -> # declare -i RESULT2; RESULT2=$1+$2'
echo $1+$2=$(($1 + $2)) ' -> # $(($1 + $2))'

let foo
(( foo = 3 )) # Sets foo to 3 with spaces
unset foo


# There are two formats for arithmetic expansion: $[ expression ]
# and $(( expression #)) its your choice which you use
echo 4 + 5 = $((4 + 5))
echo 7 - 7 = $[ 7 - 7 ]

echo -e "Please enter username: \c"
read -p 'Username: ' uservar

echo $uservar

# get floating point number
floating_point_number=3.3446
echo $floating_point_number

# round floating point number with bash
for bash_rounded_number in $(printf %.2f 3,3446); do
    echo "Rounded number with bash:" $bash_rounded_number
done

#sequention in for
for i in $( seq 1 10 ); do printf "%03d\t" "$i"; done

# STDERR and STDOUT into the same out
# 2> STDERR_STDOUT 1>&2
# &> STDERR_STDOUT
# >& STDERR_STDOUT



