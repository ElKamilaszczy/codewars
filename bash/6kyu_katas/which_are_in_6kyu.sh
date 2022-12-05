#!/bin/bash
: '
https://www.codewars.com/kata/550554fd08b86f84fe000a58/train/shell
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: In some languages r must be without duplicates.
'
inArray() {
    [[ -z "$2" ]] && { echo ""; exit -1; }
    read -ra words <<< "$1"
    inWords=()
    for word in ${words[@]}; do
        if grep -Eq "$word" <<< "$2"; then
            inWords+=("$word")
        fi
    done <<< "$1"
    IFS=$'\n' sortedWords=$(sort <<< "${inWords[*]}" | uniq); unset IFS
    sed "s/ /,/g" <<< ${sortedWords[*]}
}

inArray "$1" "$2"