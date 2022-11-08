#/bin/bash 
function IPValidation () {

    ipaddr="$1"
    # Validate input for the first time
    [[ "$ipaddr" =~ [^0-9\.] ]] && { echo "False"; exit 1; } 
    IFS=. read -a arr <<< "$ipaddr"
    (( ${#arr[@]} != 4 )) && { echo "False"; exit 1; } 
    for oct in ${arr[@]}; do
        if  [[ $oct =~ ^0 ]] || (( ${oct} < 1 || ${oct} > 255 )); then
            echo 'False'
            exit 1
        fi
    done
    echo 'True'
    exit 0
}
IPValidation "1.2.043.23"