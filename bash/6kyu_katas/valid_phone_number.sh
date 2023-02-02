#!/bin/bash
: '
https://www.codewars.com/kata/525f47c79f2f25a4db000025/train/shell 

Write a function that accepts a string, and returns true if it is in the form of a phone number.
Assume that any integer from 0-9 in any of the spots will produce a valid phone number.

Only worry about the following format:
(123) 456-7890 (don''t forget the space after the close parentheses)

'
function checkPhoneNumber() {
    local phone="$1"
    local regex='^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$'
    # Key note - specifying that regexp in if statement doesnt work.
    [[ $phone =~ $regex ]] && echo True || echo False
}
function checkPhoneNumber2() {
    local phone="$1"
    local regex='^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$'
    if grep -qEe "\([0-9]{3}\) [0-9]{3}-[0-9]{4}$" <<< "$phone"; then
        echo True
    else
        echo False
    fi
}
checkPhoneNumber "(232) 456-3425"