#!/bin/bash
address=${1}
n=${2}
max_even=$((2 * n))
# For all values this equation will be in place:
echo $((max_even - address + 1))
