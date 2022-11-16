#!/bin/bash
: '
You are given two arrays a1 and a2 of strings. 
Each string is composed with letters from a to z. 
Let x be any string in the first array and y be any string in the second array.

Find max(abs(length(x) - length(y)))

# input : 2 strings with substrings separated by `,`
# output: number as a string
https:/www.codewars.com/kata/5663f5305102699bad000056/train/shell

a1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
a2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
mxdiflg(a1, a2) --> 13
'
# We get 2 long strings
accum () {
    [[ -z "${1}" || -z "${2}" ]] && { exit -1; } # Check for emptiness
    # Load into arrays
    first_arr=($(echo "$1" | tr ',' '\n'  | awk '{ print length }' | sort -n))
    second_arr=($(echo "$2" | tr ',' '\n' | awk '{ print length }' | sort -n))
    # Results
    (( first_result = ${first_arr[-1]} - ${second_arr[0]}, second_result = ${second_arr[-1]} - ${first_arr[0]}))
    if (( first_result > second_result )); then
        echo $first_result
    else 
        echo $second_result
    fi
}
accum "$1" "$2"