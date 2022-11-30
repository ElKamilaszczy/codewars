#!/bin/bash
: '
https://www.codewars.com/kata/58069e4cf3c13ef3a6000168/shell
Reverse the number. 
'
reversed=$(rev <<< "$1")
sed "s/^[0]*//g" <<< "$reversed"
# Or way better. BC
# rev <<< "$1" | bc