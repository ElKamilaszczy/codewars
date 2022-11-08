#!/bin/bash
: '
Odd or Even? Determine that!
https://www.codewars.com/kata/619f200fd0ff91000eaf4a08/train/shell
Given a number N, determine if the sum of N consecutive numbers is odd or even.

If the sum is definitely an odd number, return Odd.
If the sum is definitely an even number, return Even.
If the sum can be either odd or even ( depending on which first number you choose ), return Either.
So basically if there is half Odd and half Even, then:
    - if those nums are Odd - then we know that the number will be even
    - it those nums are Even - surely number will be odd (sum)
If we will receive odd number of elems, then we cannot determine
'
odd_or_even() {
    if (( ${1} % 2 == 1 )); then
        echo "Either"
        return
    else
        if (( $((${1} / 2 )) % 2 == 0 )); then
            echo "Even"
            return
        else
            echo "Odd"
            return
        fi
    fi
}

odd_or_even "$@"