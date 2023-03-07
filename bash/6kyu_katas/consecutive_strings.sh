#!/bin/bash 
# https://www.codewars.com/kata/56a5d994ac971f1ac500003e/train/shell
longestConsec() {
    numOfElems="$2"
    # Load the string into the array
    arr=(${1// / })
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