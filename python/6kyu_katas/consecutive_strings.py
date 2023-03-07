# https://www.codewars.com/kata/56a5d994ac971f1ac500003e/train/python

import itertools as it
def longest_consec(strarr, k):
    if not strarr or k < 0 or k > len(strarr):
        return ""
    combinedWords = []
    for i in range(0, len(strarr) - k + 1):
        combinedWords.append(''.join(strarr[i:i+k]))
    return sorted(combinedWords, key = len, reverse = True)[0]


print(longest_consec([], 4))
