#!/bin/bash
# Traditional way 
function sumsParts() {
    # Divide the string into each element 
    local val="${1}"; sum=0
    nums=(${val// / })
    for ((i=0; i<${#nums[@]}; i++)); do
        for ((j=i; j<${#nums[@]}; j++)); do
            (( sum+=${nums[j]} ))
        done
        string+="$sum "
        sum=0
    done
    echo "${string}0"
}
# Funnier way and surely faster, but... not fast enough :D
function sumsParts() {
    # Divide the string into each element 
    local arg="${1}"; modified_arg=$(sed 's/ / + /g' <<< "${1}")
    #echo $modified_arg
    local how_much=$(wc -w <<< "${1}")
    echo $how_much
    for ((i=0; i<how_much; i++)); do
        (( sum=modified_arg ))
        string+="$sum "
        modified_arg=${modified_arg#*+ }
    done
    echo "${string}0"
}
# Even faster - simply instead of doing all over maths on every element subtract previous element
function sumsParts() {
    # Trick with adding '+' so I can easily add all elements in one go
    local arg="${1}"; modified_arg=$(sed 's/ / + /g' <<< "${1}")
    # Trick to separate each element with brace expansion
    nums=(${arg// / })
    # cCse when we pass no params 
    if [[ -z $modified_arg ]]; then 
        echo 0
        exit 0
    fi
    # Due to my modification I can safely do my overall calculation before a loop and concatenate
    (( sum=modified_arg ))
    string+="$sum "
    # In a loop I simply subtract previous element from overall sum while keeping overall sum and going till the last element
    for ((i=1; i<${#nums[@]}; i++)); do
        ((sum-=${nums[i-1]}))
        string+="$sum "
    done
    echo "${string}0"
}
sumsParts "$1"
