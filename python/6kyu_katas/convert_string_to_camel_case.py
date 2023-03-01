# https://www.codewars.com/kata/517abf86da9663f1d2000003/train/python
import re
def to_camel_case(text):
    """
    Function converts -/_ delimited words into camel case:
    Example: the-stealth_warrior -> theStealthWarrior
    """
    pattern = re.compile(r'[_-](\w)')
    words = re.split(r'[-_]', text)
    if words == []:
        return []
    print(''.join([words[0]] + [word.capitalize() for word in words[1:]]))
to_camel_case("the-stealth_warrion_numero-1")
