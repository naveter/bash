#!/bin/bash

# The variable $? holds the "exit status" of the previously executed process.
#An exit status of 0 indicates the process "succeeded" without error.

 true
 echo $?   # prints 0

  foo="I'm a cat."
 echo ${foo/cat/dog}  # prints "I'm a dog."
 echo ${foo//cat/dog}  # prints "I'm a dog, and she's a dog."
 foo="I like meatballs."
 echo ${foo/balls}       # prints I like meat.
  minipath="/usr/bin:/bin:/sbin"
 echo ${minipath#/usr}           # prints /bin:/bin:/sbin
 echo ${minipath#*/bin}          # prints :/bin:/sbin
 echo ${minipath##*/bin}         # prints :/sbin

 # This is because ${#ARRAY} is the same as ${#ARRAY[0]}, which counts the number of characters in the first element, a.
ARRAY=(a b c)
 echo ${#ARRAY[@]}      # prints 3

  string="I'm a fan of dogs."
 echo ${string:6:3}           # prints fan

 array=(a b c d e f g h i j)
 echo ${array[@]:3:2}         # prints d e

  unset foo
 unset bar

 echo ${foo-abc}   # prints abc
 echo ${bar:-xyz}  # prints xyz

 foo=""
 bar=""

 echo ${foo-123}   # prints nothing
 echo ${bar:-456}  # prints 456

  unset cache
 echo ${cache:=1024}   # prints 1024
 echo $cache           # prints 1024

 # ${1?failure: no arguments} # crashes the program if no first argument

 foo=bar
 bar=42
 echo ${!foo}  # eval by var name, prints $bar, which is 42

 #This happens because "$*" combines all arguments into a single string, while "$@" requotes the individual arguments.
 arr=("a b"  " c d    e")
 echo ${arr[*]}            # prints a b c d e
 echo ${arr[@]}            # prints a b c d e
 echo "${arr[*]}"          # prints a b  c d    e
 echo "${arr[@]}"          # prints a b  c d    e

 (( x = 3 + 12 )); echo $x    # prints 15
 (( x = 3 * 12 )); echo $x    # prints 36
#If you want the result of an arithmetic expression without assigning it, you can use $((expression)):
 echo $(( 3 + 12 ))   # prints 15
 echo $(( 3 * 12 ))   # prints 36

#The form declare -i variable creates an explicit integer variable:
 declare -i number
 number=2+4*10
 echo $number        # prints 42

 # writes the date and the user to the log:
 echo $(date) $(whoami) >> log






echo -e "Hi, please type the word: \c "
read  word
echo "The word you entered is: $word"
echo -e "Can you please enter two words? "
read word1 word2
echo "Here is your input: \"$word1\" \"$word2\""
echo -e "How do you feel about bash scripting? "
# read command now stores a reply into the default build-in variable $REPLY
read
echo "You said $REPLY, I'm glad to hear that! "
echo -e "What are your favorite colours ? "
# -a makes read command to read into an array
read -a colours
echo "My favorite colours are also ${colours[0]}, ${colours[1]} and ${colours[2]}:-)"

 # sort two files in parallel:
# sort words > sorted-words &        # launch background process
# p1=$!
# sort -n numbers > sorted-numbers & # launch background process
# p2=$!
# wait $p1
# wait $p2
# echo Both files have been sort


# exec < file # STDIN has become file
# exec > file # STDOUT has become file
#You may wish to save STDIN and STDOUT to restore them later:
#
# exec 7<&0 # saved STDIN as channel 7
# exec 6>&1 # saved STDOUT as channel 6
#If you want to log all output from a segment of a script, you can combine these together:
#
# exec 6>&1       # saved STDOUT as channel 6
# exec > LOGFILE  # all further output goes to LOGFILE
#
# exec 1>&6       # restores STDOUT; output to console again