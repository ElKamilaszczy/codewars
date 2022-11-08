#!/bin/bash
: '
Input: "45 Holy Grail Al. Niagara Town ZP 32918,320 Main Al. Bern AE 56215,14 Gordon Park Atlanta RE 13200,
100 Pussy Cat Rd. Chicago EX 34345,2 Gordon St. Atlanta RE 13222,5 Gordon Road Atlanta RE 13001,
2200 Tokyo Av. Tedmondville SW 43198,67 Paris St. Abbeville AA 45522,11 Surta Avenue Goodville GG 30655,
2222 Tokyo Av. Tedmondville SW 43198,670 Paris St. Abbeville AA 45522,114 Surta Avenue Goodville GG 30655,
2 Holy Grail Street Niagara Town ZP 32908,3 Main Rd. Bern AE 56210,77 Gordon St. Atlanta RE 13000,
100 Pussy Cat Rd. Chicago OH 13201"
Find for specified ${2} and return in a formatted way:
Output in a following manner: AA 45522:Paris St. Abbeville,Paris St. Abbeville/67,670
'
travel() {
    # Neccessary manipulation to separato for each line while using IFS and load into array for easier manipulation
    OLDIFS=$IFS
    IFS=$'\n'
    data_arr=($(echo "$1" | tr ',' '\n' | grep -w "$2" | sed 's/ [A-Z]* [0-9]*$//g'))
    IFS=$OLDIFS
    for ((i=0; i<${#data_arr[@]}; i++)); do
        #echo ${data_arr[i]}
        addresses+="${data_arr[i]#* },"
        numbers+="${data_arr[i]%% *},"
    done
    # No need to condition for empty - brace expansion will deal with that #
    list="${2}:${addresses%,*}/${numbers%,*}"
    echo $list
}
ad="45 Holy Grail Al. Niagara Town ZP 32918,320 Main Al. Bern AE 56215,14 Gordon Park Atlanta RE 13200,
100 Pussy Cat Rd. Chicago EX 34345,2 Gordon St. Atlanta RE 13222,5 Gordon Road Atlanta RE 13001,
2200 Tokyo Av. Tedmondville SW 43198,67 Paris St. Abbeville AA 45522,11 Surta Avenue Goodville GG 30655,
2222 Tokyo Av. Tedmondville SW 43198,670 Paris St. Abbeville AA 45522,114 Surta Avenue Goodville GG 30655,
2 Holy Grail Street Niagara Town ZP 32908,3 Main Rd. Bern AE 56210,77 Gordon St. Atlanta RE 13000,
100 Pussy Cat Rd. Chicago OH 13201"
# invoke 
travel "$ad" "AA 45522"