#!/bin/bash
shopt -s extglob
: '
https://www.codewars.com/kata/59f44c7bd4b36946fd000052/train/shell

s="uuaaaxbbbbyyhwawiwjjjwwxym"
hist(s) => "u  2     **\rw  5     *****\rx  2     **"

u, w, x, z are letters reserverd for errors.
'
genDots () {
    stars=""
    for ((i=1; i<="$1"; i++)); do
        stars=${stars}"*"
    done
    echo "$stars"
}
hist () {
    # Sort and count specified letters
    data=$(sed 's/[^uwxz]//gi' <<< "$1" | grep -o . | sort -k1d | uniq -c)
    # Since the output is somewhat different (contains whitespaces) we need to drop them.
    while IFS='\n \t' read line; do
        # Since read trims IFS characters, need to specify them
        echo -ne "${line##*[[:space:]]} ${line%[[:space:]]*} $(genDots ${line%[[:space:]]*})\r"
    done <<< $data
}
txt="pwaemuqxdmwqbqrjbeosjnejqorxdozsxnrgpgqkeihqwybzyymqeazfkyiucesxwutgszbenzvgxibxrlvmzihcb"
hist $txt
