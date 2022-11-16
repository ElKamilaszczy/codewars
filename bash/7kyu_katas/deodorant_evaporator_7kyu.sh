#!/bin/bash
: '
https://www.codewars.com/kata/5506b230a11c0aeab3000c1f/train/shell
'
# This version is correct one, but tests time out :(
evaporator() {
    percentage="$2"; threshold="$3"; content=100; days=0
    while (( $(bc <<< "$content > $threshold") )); do
        content=$(bc <<< "scale=4; $content - ($content * ($percentage / 100))")
        (( days++ ))
    done
    echo $days
}
evaporator "$1" "$2" "$3"