# https://www.codewars.com/kata/5208f99aee097e6552000148/train/python
# Break camelCase with space
import re
def solution(s: str):
    resultWord=""
    for letter in s:
        if ord(letter) >= 65 and ord(letter) <= 90:
            resultWord += f" {letter}"
        else:
            resultWord += letter
    return resultWord
def solution(s):
    return re.sub(r'([A-Z])', r' \1', s)