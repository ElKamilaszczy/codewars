#!/bin/bash
: '
https://www.codewars.com/kata/51c89385ee245d7ddf000001/train/shell
'
padto5digits() {
    printf "Value is %05d" "$1\n"
    num="00000${1}"
    # echo "Value is ${num: -5}"
}
padto5digits "$1"