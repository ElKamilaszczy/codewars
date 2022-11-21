#!/bin/bash
: '
https://www.codewars.com/kata/5700c9acc1555755be00027e/train/shell

Input:
- a string strng
- an array of strings arr
Output of function contain_all_rots(strng, arr) (or containAllRots or contain-all-rots):
    - a boolean true if all rotations of strng are included in arr
    - false otherwise
'
containAllRots() {
    rotationsRequired="${#1}"; str="${1}"; lenstr="${#str}"
    for ((i=0; i<$lenstr; i++)); do
        # Perform rotation of the word
        rotationStr=${str:$i:$lenstr-$i}${str:0:$i}
        if echo "$2" | grep -wq "$rotationStr"; then
            continue
        else
            echo "false"
            exit 1
        fi
    done
    echo "true"
}
containAllRots "$1" "$2"
