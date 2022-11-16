#!/bin/bash
: '
https://www.codewars.com/kata/563b662a59afc2b5120000c6/train/shell
'
nbYear() {
    beginning_pop="$1";increase="$3";desired_number="$4"
    percent=$(bc <<< "scale=4; $2 / 100")
    current_num="$beginning_pop";years=0
    while (( $desired_number > $current_num )); do
        current_num=$(bc <<< "scale=0; $current_num + ($current_num * $percent) + $increase")
        (( years = $years + 1 ))
        current_num=${current_num%%.*}
    done
    echo $years
}
#1500, 5, 100, 5000
nbYear 1500 5 100 5000