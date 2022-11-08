#!/bin/bash
#  $1 = BBAR 150,CDXE 515,BKWR 250,BTSQ 890,DRTY 600
#  $2 = A,B,C,D
# expected: (A : 0) - (B : 1290) - (C : 515) - (D : 600) 
stock_list () {
    [[ -z ${1} ]] && { echo ""; exit; }
    OLDIFS=$IFS
    IFS=$'\n'
    books=($(tr ',' '\n' <<< "${1}"));categories=($(tr ',' '\n' <<< "${2}"))
    declare -A assocArr=()
    declare -A results=()
    for i in ${books[@]}; do
        indx=${i:0:1}
        val=$(bc <<< "${i#* }")
        (( assocArr[$indx] += ${val:-0}))
        #echo ${i:0:1}" "${i#* }
    done
    # echo ${assocArr[@]}
    # echo ${!assocArr[@]}
    # echo ${categories[@]}
    for i in ${categories[@]}; do
        (( results[$i] = ${assocArr[$i]:-0}  ))
        x=" - ("${i}" : "${results[$i]}")"
        str+=$(tr -d '\n' <<< "$x")
    done
    IFS=$OLDIFS
    echo ${str:3}
}
stock_list "$1" "$2"
val=060
echo "$val"