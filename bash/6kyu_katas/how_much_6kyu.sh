#!/bin/bash
## First version - poor algorithm (simply takes too much time)
howmuch() {
    a="${1}";b="${2}"
    low=$((a<b?a:b))
    high=$((a<b?b:a))
    for ((i=low; i<=high; i++)); do
        val_b=$(bc <<< "scale=1;($i-2)/7")
        val_c=$(bc <<< "scale=1;($i-1)/9")
        if [[ $val_b =~ \.0$ && $val_c =~ \.0$ ]]; then
            string+="[M: ${i} B: ${val_b%.*} C: ${val_c%.*}]"
        else
            continue
        fi
    done
    echo "$string"
}
## BC invokation simply costs too much lol 
howmuch() {
    a="${1}";b="${2}"
    # Tests to find out higher/lower value
    low=$((a<b?a:b))
    high=$((a<b?b:a))
    for ((i=low; i<=high; i++)); do
        val_b=$(( (i-2)%7 == 0 ))
        val_c=$(( (i-1)%9 == 0 ))
        # If modulo, then we reached the proper amount. Now I can safely divide 
        if (($val_b && $val_c)); then
            b=$(( (i-2)/7 ))
            c=$(( (i-1)/9 ))
            string+="[M: ${i} B: ${b} C: ${c}]"
        fi
    done
    echo "$string"
}
howmuch "$1" "$2"