# https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/python
"""
Pangram - uses every single character at least once
"""
# First solution
from string import ascii_lowercase
from collections import Counter
import re
def is_pangram(s):
    # Drop all non word characters
    pattern = re.compile(r'[^a-z]', re.IGNORECASE)
    cleansed_word = re.sub(pattern, '', s.lower())
    counted = Counter(cleansed_word)
    new_word = ''.join(sorted(list(counted.keys())))
    if new_word == ascii_lowercase:
        return True
    return False

# Better alternative
def is_pangram(s):
    pattern = re.compile(r'[^a-z]', re.IGNORECASE)
    cleansed_word = re.sub(pattern, '', s.lower())
    for letter in ascii_lowercase:
        if letter not in cleansed_word.lower():
            return False
    return True

# Or even bether - using set operator: return set(string.ascii_lowercase).issubset(s.lower())
print(is_pangram("The quick, brown fox jumps over the LAzy dog!"))