#!/bin/bash
: '''
https://www.codewars.com/kata/56a5d994ac971f1ac500003e/train/shell

You are given an array(list) strarr of strings and an integer k. 
Your task is to return the first longest string consisting of k consecutive strings taken in the array.
'''
longestConsec() {
    numOfElems="$2"
    # Load the string into the array using substring substitution
    arr=(${1// / }) # This isnt necessary. This will also work: arr=(${1}) since IFS.
    (( ${#arr} == 0 || $numOfElems > ${#arr[@]} || $numOfElems <= 0 )) && { exit -1; }
    longestWord=
    currentWord=
    for ((i=0;i<${#arr[@]}; i++)); do
        # currentWord=${arr[i]}
        for ((j=$i;j<$i+$numOfElems; j++)); do
            currentWord=${currentWord}${arr[j]}
        done
        if ((${#currentWord} > ${#longestWord})); then
            longestWord=$currentWord
        fi
        currentWord=
    done
    echo $longestWord
}
longestConsec "$1" $2