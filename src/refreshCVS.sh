#!/bin/bash

# This program use for refresh CVS and IVY
# personal repositoriy from original
# All data from personal repo wil be deleted!

ROOT=/home/bass/tmp
CVSORIG=cvs
CVSTO=

case "$1" in 
    dima|ilya)
        CVSTO=$1
        ;;
    *)
        echo "USAGE: refreshCVS.sh dima|ilya" 
        exit 1
        ;;
esac

if [ -z "$CVSTO" ]; then
    echo "CVSTO is empty!"
    exit 1
fi

if [ -d "$ROOT"/"$CVSTO" ]
then
    echo "Remove diretory $ROOT/$CVSTO"
    rm -dfR "$ROOT"/"$CVSTO"
fi

echo "Starting copy $ROOT/$CVSORIG to $ROOT/$CVSTO"
cp -r "$ROOT"/"$CVSORIG" "$ROOT"/"$CVSTO" && echo "Copy finished"










