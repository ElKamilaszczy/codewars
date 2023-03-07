# https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/python

import collections as c
def duplicate_count(text):
    collection = c.Counter(text.lower())
    z = len([(key, val) for (key, val) in collection.items() if val > 1])
    return z