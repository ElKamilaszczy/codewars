#!/bin/bash
: '
Find prime number (obviously must be greater than 10). Output only those who are in range (but must fulfill backwards requirement)
'
backwardsPrime() {
    start="${1}"; end="${2}"; primestr=""
    (( start <= 10 || ${#start} == 0 )) && { echo ""; exit; }
    # pierwiastek dla danej wartosci i ponizej ich iterowac by sprawdzic, czy jest prime, czy nie. 
    for ((i=start; i<=end; i++)); do
        val=${i}; val_rev=$(rev <<< "${i}")
        if [[ $val == $val_rev ]]; then continue; fi
        for ((j=0; j<2; j++)); do
            if (( j == 1 )); then val=$(rev <<< "${i}"); fi
            sqrt_val=$(bc <<< "sqrt(${val}) + 1")
            for ((k=2;k<=sqrt_val;k++)); do
                if ((val % k == 0)); then
                    is_prime=0
                    break 2
                fi
            done
            # Num is prime
            if (( j == 1 )); then
                primestr+=${i}" "
                break
            fi
        done
    
    done
    echo $primestr
}
backwardsPrime $1 $2

# Performance improvement
backwardsPrime() {
    start="${1}"; end="${2}"; primestr=""
    (( start <= 10 || ${#start} == 0 )) && { echo ""; exit; }
    # Budowa całego stringu
    for ((i=start; i<=end; i++)); do
        wholeStr+=${i}" "
    done 
    # pierwiastek dla danej wartosci i ponizej ich iterowac by sprawdzic, czy jest prime, czy nie. 
    for ((i=start; i<=end; i++)); do
        val=${i}; val_rev=$(rev <<< "${i}")
        if [[ $val == $val_rev ]]; then continue; fi
        if [[ ! $wholeStr =~ $i ]]; then continue; fi
        for ((j=0; j<2; j++)); do
            if (( j == 1 )); then val=$val_rev; fi
            sqrt_val=$(bc <<< "sqrt(${val}) + 1")
            for ((k=2;k<=sqrt_val;k++)); do
                if ((val % k == 0)); then
                    is_prime=0
                    break 2
                fi
            done
            # Num is prime
            if (( j == 1 )); then
                primestr+=${i}" "$val" "
                wholeStr=$(sed "s/$i//g; s/$val//g" <<< "${wholeStr}")
                break
            fi
        done
    
    done
    echo -e "\n"$primestr"\n cos"
}