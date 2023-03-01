# https://www.codewars.com/kata/57eb8fcdf670e99d9b000272/train/python
"""
You need to return the highest scoring word as a string. (a = 1, b = 2...)

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.
"""
import string
def high(x):
    split_words = str(x).split(sep = ' ')
    valued_words = [sum([ord(letter) - 96 for letter in word]) for word in split_words]
    print(valued_words)
    words_values = dict(zip(split_words, valued_words))
    for word, value in words_values:
        if value == max(words_values.values()):
            return word
# Way better: max(x.split(), key=lambda k: sum(ord(c) - 96 for c in k)) # Here for each split word we associate sum of ascii values and sort by it. Max returns first. 
high('hehex xd')