#!/bin/bash
# This funtion WORKS #
function meeting(){
    # Separate and sort each
    #IFS=';'
    arr=($(echo "${uppercased}" | tr ';' '\n' | sort -t ':' -k2,2 -k1,1))
    echo ${arr[@]}
    for i in ${arr[@]}; do
        whole="$(echo $i | cut -d ':' -f2), $(echo $i | cut -d ':' -f1)"
         echo $whole" w"
        newArr+=("($whole)")
    done
    echo ${newArr[@]} | sed -E 's/ //g' | sed 's/,/, /g'
}
uppercased="${1^^}"
meeting "$uppercased"
x="some:text:hehexd:co"
cut -d ':' -f1-3 <<<"$x"


tr ';:' '\n ' <<< "${1^^}" | awk '{ printf "(%s, %s)\n", $2, $1 }' | sort | tr -d '\n'

