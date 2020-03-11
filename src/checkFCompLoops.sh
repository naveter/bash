#!/bin/bash
# declare integers
NUM1=2
NUM2=1
if   [ $NUM1 -eq $NUM2 ]; then
	echo "Both Values are equal"
elif [ $NUM1 -gt $NUM2 ]; then
	echo "NUM1 is greater then NUM2"
else
	echo "NUM2 is greater then NUM1"
fi

# -eq -lt - for numbers
# = for strings
# -n s1	string s1 is not empty
#-z s1	string s1 is empty

# bash for loop
for f in $( ls ../ ); do
	echo $f
done

# from cmd like single line
for f in $( ls ../ ); do echo $f; done

DIR="."
# Controlling a loop with bash read command by redirecting STDOUT as a STDIN to while loop
find $DIR -type f | while read file; do
    if [[ "$file" = *r* ]]; then
        # substitute r with "_" character and print it
        echo $file | tr 'r' '_'
    fi;
done

COUNT=0
# bash until loop
until [ $COUNT -gt 5 ]; do
        echo Value of count is: $COUNT
        let COUNT=COUNT+1
done

#-b filename	Block special file
#-c filename	Special character file
#-d directoryname	Check for directory existence
#-e filename	Check for file existence
#-f filename	Check for regular file existence not a directory
#-G filename	Check if file exists and is owned by effective group ID.
#-g filename	true if file exists and is set-group-id.
#-k filename	Sticky bit
#-L filename	Symbolic link
#-O filename	True if file exists and is owned by the effective user id.
#-r filename	Check if file is a readable
#-S filename	Check if file is socket
#-s filename	Check if file is nonzero size
#-u filename	Check if file set-ser-id bit is set
#-w filename	Check if file is writable
#-x filename	Check if file is executable