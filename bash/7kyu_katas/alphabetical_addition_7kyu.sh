#!/bin/bash
: '
https://www.codewars.com/kata/5d50e3914861a500121e1958/train/shell

Add letters to one letter
run_shell(args: ['abc']) = "f"
run_shell(args: ['ab']) = "c"
run_shell(args: ['z']) = "z"
run_shell(args: ['za']) = "a"
run_shell(args: ['ycb']) = "d" # notice the letters overflowing
run_shell(args: ['']) = "z"
'
declare -a letters=({a..z}) # a b c d e f g ...
addletters() {
    [[ -z "$1" || ! "$1" =~ ^[[:lower:]]+$ ]] && { echo 'z'; exit -1; }
    inputLetters=($(grep -o . <<< "$1"))
    sum=0
    for letter in ${inputLetters[@]}; do
        # Get the number of that letter
        for index in ${!letters[@]}; do
            if [[ "${letters[$index]}" == "$letter" ]]; then
                (( sum = sum + ($index + 1) ))
                break
            fi
        done
    done
    # Normalize output
    (( sum = sum % 26 ))
    echo ${letters[$sum - 1]}
}
addletters "$1"