#!/bin/bash
# Associative array DOES NOT guarantee the order
declare -A states=(
    ['AZ']='Arizona' ['CA']='California' ['ID']='Idaho' ['IN']='Indiana' ['MA']='Massachusetts' ['OK']='Oklahoma' ['PA']='Pennsylvania' ['VA']='Virginia'
)
# Sort this so it will be easier later. Associative array cannot be sorted
declare -a onlyStates=( 'Arizona' 'California' 'Idaho' 'Indiana' 'Massachusetts' 'Oklahoma' 'Pennsylvania' 'Virginia')
IFS=$'\n' declare -a sortedStates=($(sort <<< "${onlyStates[*]}"))
byState() {
    result=$(while IFS=$'\n' read line; do
        addrFromLine=${line: -2}
        printf "%s\n" "${line: -2} ${states[$addrFromLine]} ${line: 0: -2}${states[$addrFromLine]}"
    done <<< $1)
    # Return output - remove commas, cut from the third field, then sort
    for state in ${sortedStates[@]}; do
        if grep -wq "$state" <<< "$result"; then
            printf " %s\n" $state
            dt=$(grep -Ew "${state}$" <<< "$result" | sed "s/,//g" | cut -d" " -f 3- | sort )
            sed "s/^/\.\.\.\. /g" <<< $dt
        fi
    done
}
txt="John Daggett, 341 King Road, Plymouth MA
Alice Ford, 22 East Broadway, Richmond VA
Orville Thomas, 11345 Oak Bridge Road, Tulsa OK
Terry Kalkas, 402 Lans Road, Beaver Falls PA
Eric Adams, 20 Post Road, Sudbury MA
Hubert Sims, 328A Brook Road, Roanoke MA
Amy Wilde, 334 Bayshore Pkwy, Mountain View CA
Sal Carpenter, 73 6th Street, Boston MA
"
byState "$txt"