#!/bin/bash
: '
https://www.codewars.com/kata/554e4a2f232cdd87d9000038/train/shell
Complementary DNA
In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G". You function receives one side of the DNA (string, except for Haskell); you need to return the other complementary side. DNA strand is never empty or there is no DNA at all (again, except for Haskell).
'
tr 'ATCG' 'TAGC' <<< "${1}"