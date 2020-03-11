#!/bin/bash

function fact {
  result=1
  n=$1
  while [ "$n" -ge 1 ]
  do
    result=$(expr $n \* $result)
    n=$(expr $n - 1)
  done
  echo $result
}
#Or, with the expression notation:

function facter {
  result=1
  n=$1
  while (( n >= 1 ))
  do
    (( result = n * result ))
    (( n = n - 1 ))
  done
  echo $result
}
#Or, with declared integer variables:

factered () {
  declare -i result
  declare -i n

  n=$1
  result=1

  while (( n >= 1 ))
  do
    result=n*result
    n=n-1
  done

  echo $result
}