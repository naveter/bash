#!/bin/bash

echo "Hello, today is $(date +%Y.%m.%d)"
# tar -czf myhome_directory.tar.gz /home/linuxconfig

VAR="global variable"
function bash {
    local VAR="local variable"
    echo $VAR
}
echo $VAR
bash && echo $VAR

args=("$@") #add args to array
echo ${args[0]} ${args[1]} ${args[2]} ' -> args=("$@"); echo ${args[0]} ${args[1]} ${args[2]}'

echo $@ ' -> echo $@' #use $@ to print out all arguments at once
echo Number of arguments passed: $# ' -> echo Number of arguments passed: $#'

# execute
echo `uname -o` && uname -o

# bash trap command
trap bashtrap SIGINT
# bash clear screen command
clear
# bash trap function is executed when CTRL-C is pressed:
# bash prints message => Executing bash trap subrutine !
bashtrap()
{
    echo "CTRL+C Detected !...executing bash trap !"
}
# for loop from 1/10 to 10/10
for a in `seq 1 10`; do
    echo "$a/10 to Exit."
    sleep 1;
done
echo "Exit Bash Trap Example!!!"





