#!/bin/bash 
nbDig() {
    n="${1}";d="${2}"
    for ((i=0; i<=n; i++)); do
        (( val=i**2 ))
        [[ $val =~ $d ]] && { string+=$val; }
    done
    cnt=$(sed "s/[^$d]//g" <<< "$string")
    echo ${#cnt}
}
nbDig "$1" "$2"
