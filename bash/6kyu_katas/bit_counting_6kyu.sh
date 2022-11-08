#!/bin/bash -x
# Check the lowest power of 2 for input 
input=${1}; i=0; bitCount=0
while ((input >= 2 ** i)); do
    ((i++))
done
#echo $i
# Using simple '&' to perform check for existence of 1 as a bit 
for ((j=0; j<i; j++)); do
    echo $input", "$((2 ** j))
    (((input & 2 ** j) != 0)) && ((bitCount++))
done
echo $bitCount
# Simple way
# obase (output base) as a representation of a number within defined base (in our example - binary)
echo "obase=2;$1" | bc | grep -o 1 | wc -l