#!/bin/bash
: '
https://www.codewars.com/kata/586d6cefbcc21eed7a001155/train/shell
For a given string s find the character c (or C) with longest consecutive repetition and return:
c,l
where l (or L) is the length of the repetition. If there are two or more characters with the same l return the first in order of appearance.
For empty string return:
,0
'
longestConsRepetition() {
    [[ -z "$1" ]] && { echo ",0"; exit -1; }
    pair=$(grep -o "." <<< "$1" | uniq --count | sed "s/^[[:space:]]*//g" | sort -s --key=1nr | head -n 1) # -s in 'sort' does the trick: -s, --stable - stabilize sort by disabling last-resort comparison
    sed -E "s/([0-9]*) ([[:print:]]*)/\2,\1/" <<< "$pair"

}
longestConsRepetition "$1"