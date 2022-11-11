#!/bin/bash
: '
https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991/train/shell

The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. 
Put together these modified chunks and return the result as a string.
'
function rotate() {
    # Function rotates the string to the left by one position
    # Eg. 123456 -> 234561
    string="$1"
    new_str="${string:1}${string: 0:1}"
    echo "$new_str"
}
# rotate "1234567"
function reverse() {
    # Simply reverse 
    string="$1"
    new_str=$(rev <<< "$string")
    echo "$new_str"
}
#reverse "123456"
revrot () {
    # Necessary checks
    [[ "$2" -le 0 || -z "$2" || "$2" -gt "${#1}" ]] && { echo ""; exit 1; }
    # Getting those chunks 
    # Get that chunk, proceed it, delete from original string
    chunks=$( bc <<< "scale=1; (${#1} / ${2})+0.5; scale=0" );chunks=${chunks%%.*} # Calculate chunks and rid of that .
    for ((i=0; i<$chunks; i++ )); do
        chunk="${1:$i*${2}:${2}}"
        (( ${#chunk} < "${2}" )) && { break; } # ignore the last chunk
        calc_str=$(sed -E "s!([0-9])!\1\*\1+!g" <<< $chunk )
        if (( (${calc_str%+}) % 2 == 0 )); then
            result_str=$result_str$(reverse $chunk)
        else
            result_str=${result_str}$(rotate $chunk)
        fi
    done
    echo $result_str

}
revrot "$1" "$2"
