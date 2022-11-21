#!/bin/bash
: '
https://www.codewars.com/kata/59d727d40e8c9dd2dd00009f/train/shell
'
: '
AWK would do here such a good job (BEGIN / END blocks, as well as processing)
'
# First way - simple iterative logic (and slow)
balance() {

    balance=$(echo "$1" | head -n 1 | sed "s/[^.[:digit:]]//g"); currBalance="$balance"
    otherLines=$(echo "$1" | tail -n +2)
    amounts=()
    printf "Original Balance: %.2f\n" "$balance"
    while IFS=$'\n' read -a wholeArr; do
        [[ -z ${wholeArr[0]} ]] && continue # In case of empty line
        while IFS=" " read num category amount; do
            # Sanitarize those inputs
            num=$(sed "s/[^[:digit:]]//g" <<< "$num")
            category=$(sed "s/[^A-Za-z .[:digit:]]//g" <<< "$category")
            amount=$(sed "s/[^.[:digit:]]//g" <<< "$amount")
            # Make sure we leave correct format (two digits at the end)
            currBalance=$(bc <<< "scale=4; $currBalance - $amount")
            amounts+=($amount)
            printf "$num $category %.2f Balance %.2f\n" "$amount" "$currBalance"
        done <<< "${wholeArr[0]}"
    done <<< "$otherLines"
    # Calculate total expense 
    addition=$(sed "s/ /+/g" <<< "${amounts[*]}")
    totalExpense=$(bc <<< "scale=2; $balance - $currBalance")
    averageExpense=$(bc <<< "scale=3; ($addition) / ${#amounts[@]}")
    # Round accordingly
    if [[ ${averageExpense: -1} =~ [0-4] ]]; then
        averageExpense=$(bc <<< "scale=2; $averageExpense / 1")
    else
        averageExpense=$(bc <<< "scale=2; ($averageExpense + 0.005) / 1")
    fi
    printf "Total expense %.2f\n" "$totalExpense"
    echo "Average expense $averageExpense"
}
balance "$1"