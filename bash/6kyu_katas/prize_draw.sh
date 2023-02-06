#!/bin/bash

: '
https://www.codewars.com/kata/5616868c81a0f281e500005c/train/shell

Each letter of a firstname has a value which is its rank in the English alphabet. A and a have rank 1, B and b rank 2 and so on.
The length of the firstname is added to the sum of these ranks hence a number som.
An array of random weights is linked to the firstnames and each som is multiplied by its corresponding weight to get what they call a winning number.
'
function rank () {
    # First load all the data into arrays
    IFS=',' read -ra participants <<< "$1"
    IFS=',' read -ra weights <<< "$2"

    # Basic checks
    basicChecks "$1" "${#participants[@]}" "$3"

    # Create list consisting of names and points into a single string
    iter=0; participantsWithPoints=()
    for participant in "${participants[@]}"; do
        sum=0
        for ((i=0;i<${#participant}; i++)); do
            participantChar="${participant:$i:1}"
            printf -v value "%d" "'${participantChar,}"
            (( sum = sum + (value - 96) ))
        done
        (( sum = (sum + ${#participant}) * ${weights[$iter]} ))
        (( iter++ ))
        participantsWithPoints+=("${participant},${sum}")
    done
    IFS=$'\n'; sort -t ',' --key=2nr --key=1 <<< "${participantsWithPoints[*]}" | sed -n "${3}p" | cut -d, -f1 ; unset IFS
    # Sort the list by points descending and by name ascending

}
function basicChecks () {
    [[ -z "$1" ]] && { echo "No participants"; exit -1; }
    (( "${3}" > "${2}" )) && { echo "Not enough participants"; exit -1; }
}
participants="Addison,Jayden,Sofia,Michael,Andrew,Lily,Benjamin"
weights="4,2,1,4,3,1,2"
rank=4
rank "$participants" "$weights" "$rank"