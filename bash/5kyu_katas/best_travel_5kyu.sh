#!/bin/bash
chooseBestSum () {
    # your code
    dist="${1}"; how_many="${2}"; ls="${3}" 
    #OLDIFS=$IFS;
    #IFS=$'\n'
    ordered_towns=($(tr ',' '\n' <<< "${ls}" | sort -nr))
    #IDS=$OLDIFS
    echo "${#ordered_towns[@]}"
    for ((i=0; i<${#ordered_towns[@]}-how_many; i++)); do
        echo 1
    done
}
chooseBestSum "$1" "$2" "$3"