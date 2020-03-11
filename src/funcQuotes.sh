#!/bin/bash

# BASH FUNCTIONS CAN BE DECLARED IN ANY ORDER
function function_B {
        echo Function B.
}
function function_A {
        echo $1
}
function function_D {
        echo Function D.
}
function function_C {
        echo $1
}
# FUNCTION CALLS
# Pass parameter to function A
function_A "some param"
function_B
# Pass parameter to function C
function_C "next param"
function_D

# bash select
select word in "linux" "bash" "scripting" "tutorial"
do
  echo "The word you have selected is: $word"
  # Break, otherwise endless loop
  break
done

# single and double quotes
BASH_VAR="Bash Script"
echo $BASH_VAR

# meta characters special meaning in bash is suppressed when  using single quotes
echo '$BASH_VAR  "$BASH_VAR"'

# in double quotes no supres \` and $
echo "It's $BASH_VAR  and \"$BASH_VAR\" using backticks: `date`"

echo $'web: www.linuxconfig.org\nemail: web\x40linuxconfigorg'


