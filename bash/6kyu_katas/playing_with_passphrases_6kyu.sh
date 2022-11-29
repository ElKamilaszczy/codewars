#!/bin/bash
: '
https://www.codewars.com/kata/559536379512a64472000053/train/shell

Instructions:
choose a text in capital letters including or not digits and non alphabetic characters,

1. shift each letter by a given number but the transformed letter must be a letter (circular shift),
2. replace each digit by its complement to 9,
3. keep such as non alphabetic and non digit characters,
4. downcase each letter in odd position, upcase each letter in even position (the first character is in position 0),
5. reverse the whole result.
'
playPass() {
    wholeWord=""
    for ((i=0; i<${#1}; i++)); do
        single=${1:$i:1}
        case "$single" in
            [0-9])  
                (( single==9?(single=0):(single=9-single) ))
                wholeWord=${wholeWord}${single}
                ;;
            [A-Z]) 
                # Find letter in the alphabet, shift it and check whether position is odd or even
                # Get the numeric presentation of the letter, shift it and convert back
                printf -v num "%d" "'$single"
                (( num+$2>90 ? (num=65 + (num + $2) % 90 - 1): (num=num+$2) ))
                printf -v letter "\\$(printf '%03o' "$num")" # This is how to get character back
                if (( i%2 != 0 )); then
                    letter=${letter~}
                fi
                wholeWord=${wholeWord}${letter}
                ;;
            *) 
                # Do not do anything in other cases
                wholeWord=${wholeWord}${single} 
                ;;
        esac
    done
    wholeWord=$(rev <<< "$wholeWord")
    echo $wholeWord
}
txt="I LOVE YOU!!!"
num=1
playPass "$txt" "$num"