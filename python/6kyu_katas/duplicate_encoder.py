# https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/python
from collections import Counter
def duplicate_encode(word):
    letters = [key for key, val in filter(lambda keyVal: keyVal[1] > 1 ,Counter(word.lower()).items())]
    modifiedWord=''
    for letter in word:
        if letter.lower() in letters:
            modifiedWord+=')'
        else:
            modifiedWord+='('
    return modifiedWord
# Superior:
def duplicate_encode(word):
    return ''.join(['(' if word.lower().count(letter) > 1 else ')' for letter in word.lower() ])
print(duplicate_encode('wordd'))