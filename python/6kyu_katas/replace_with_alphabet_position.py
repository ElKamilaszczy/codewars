
# https://www.codewars.com/kata/546f922b54af40e1e90001da/train/python

from string import ascii_lowercase
import re
def alphabet_position(text):
    letter_nums = []
    for letter in text:
        lowered_letter = letter.lower()
        if not lowered_letter in ascii_lowercase:
            continue
        letter_nums.append(str(ord(lowered_letter) - 96))
    return " ".join(letter_nums)

## Other way 
def alphabet_position(text):
    num_letter = {letter: str(num) for num, letter in enumerate(ascii_lowercase, start = 1)}
    text = re.sub(r'[^a-z]', '', text, flags=re.IGNORECASE)
    mapObj = map(lambda letter: num_letter[letter.lower()], list(text))
    return " ".join(list(mapObj))

print(alphabet_position(' Hello summmoner welcome back XD'))