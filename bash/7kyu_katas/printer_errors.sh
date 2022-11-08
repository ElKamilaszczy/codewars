#!/bin/bash -x
# https://www.codewars.com/kata/56541980fa08ab47a0000040/train/shell
: '
When letter outside a-m - record as an error
'
printerError() {
    local word="$1"
    truncated_word=$(sed 's/[^a-m]//g' <<< "$word")
    echo "$(( ${#word} - ${#truncated_word}))/${#word}"
}
# Other way
printerError() {
    local word="$1"
    truncated_word=$(grep -oe [^a-m] <<< "amendo" | wc -l)
    # also
    truncated_word=${1//[a-m]/}
    echo "${#truncated_word}/${#word}"
}
printerError $1