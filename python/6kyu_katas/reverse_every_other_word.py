# Reverse every other word in the string
"""
Reverse every other word in a given string, then return the string. Throw away any leading or trailing whitespace, while ensuring there is exactly one space between each word. Punctuation marks should be treated as if they are a part of the word in this kata.
"""
import re
def reverse_alternate(s):
    words = re.sub(r"\s+", ' ', s).strip()
    # Reverse every other word
    listOfWords = words.split(' ')
    words = ' '.join(map(lambda tuple: tuple[1][::-1] if tuple[0] %2 == 1 else tuple[1],[(key, value) for key, value in enumerate(listOfWords)]))
    return words
# Superior: return " ".join(y[::-1] if x%2 else y for x,y in enumerate(string.split()))
print(reverse_alternate("   This       is a  test...   X   D "))