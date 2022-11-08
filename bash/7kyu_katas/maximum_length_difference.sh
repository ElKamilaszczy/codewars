#!/bin/bash
: '
# input : 2 strings with substrings separated by `,`
# output: number as a string
https:/www.codewars.com/kata/5663f5305102699bad000056/train/shell

a1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
a2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
mxdiflg(a1, a2) --> 13
'
# We get 2 long strings
accum () {
    [[ -z "${1}" || -z "${2}" ]] && { return -1; } # Check for emptiness
    # Process first arg
    tr ',' '\n' | awk '{ print length }' | sort -n
}
accum "$1" "$2"