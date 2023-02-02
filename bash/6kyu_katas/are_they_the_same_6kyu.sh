#!/bin/bash -x


comp() {
    # Check for emptiness
    [[ -z "$1" && -z "$2" ]] && { echo "true"; exit 0; }
    [[ -z "$1" || -z "$2" ]] && { echo "false"; exit -1; }
    IFS=" " read -a first_arr <<< "$1"; read -a second_arr <<< "$2"
    IFS=$'\n' first_arr=($(sort -n <<< "${first_arr[*]}")); second_arr=($(sort -n <<< "${second_arr[*]}"))
    (( ${#first_arr[@]} ))
    unset IFS
    #echo ${second_arr[@]}
    # Or first_arr=(${1// / })
    for ((i=0; i<${#first_arr[@]}; i++)); do
       # (( ${first_arr[$i]} ** 2 == ${second_arr[$i]} )) && { continue; } || { echo "false"; exit -1; }
        if (( ${first_arr[$i]} ** 2 != ${second_arr[$i]} )); then
            echo "false"
            exit -1
        fi
    done
    echo "true"



}
comp "121 144 19 161 19 144 19 11" "231 14641 20736 361 25921 361 20736 361"