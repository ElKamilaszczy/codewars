#!/bin/bash
: '
https://www.codewars.com/kata/56f3a1e899b386da78000732/train/shell
Write a function partlist that gives all the ways to divide a list (an array) of at least two elements into two non-empty parts.
'
partlist() {
    # Count number of delims #
    # Sanitarize output - drop any spaces from the beginning and the end which could 
    sentence=$(sed -Ee "s/^[[:space:]]//; s/[[:space:]]$//" <<< "$1")
    length=$(sed -Ee "s/[^[:space:]]//g" <<< "$sentence" | awk '{print length'})
    whole_sentence=""
    for ((i=1; i<=length; i++)); do
        sent=$(sed -E "s/ /,/$i" <<< "$sentence")
        whole_sentence=$whole_sentence"("$sent")"
    done
    echo $whole_sentence
}
partlist "I whish I hadn't come"
#partlist "$1"
