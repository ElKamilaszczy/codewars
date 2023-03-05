# https://www.codewars.com/kata/5375f921003bf62192000746/train/python

import re
def abbreviate(s):
    pattern = re.compile(r"([A-Z]+|[^A-Z])", re.IGNORECASE)
    elements = re.findall(pattern, s)
    lstOfModified = []
    for element in elements:
        if len(element) > 3 and element.isalpha():
            lstOfModified.append(element[0] + str(len(element[1:-1])) + element[-1])
        else:
            lstOfModified.append(element)
    return ''.join(lstOfModified)
print(abbreviate("Internationalization-with fancyo stuff!"))

