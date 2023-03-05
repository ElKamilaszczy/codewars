# https://www.codewars.com/kata/5848565e273af816fb000449/train/python
# First letter converted to its ASCII code, second one switched with the last one from the word

def encrypt_this(text):
    separated_words = text.split(' ')
    result_tab = []
    for word in separated_words:
        if len(word) == 0:
            return ""
        elif len(word) == 1:
            result_tab.append(str(ord(word[0])))
        elif len(word) == 2:
            result_tab.append(str(ord(word[0])) + word[-1])
        elif len(word) == 3:
            result_tab.append(str(ord(word[0])) + word[-1] + word[1])
        else:
            result_tab.append(str(ord(word[0])) + word[-1] + word[2:-1] + word[1])
    return ' '.join(result_tab)

def encrypt_this(text):
    if text == "":
        return ""
    separated_words = text.split(' ')
    result_tab = []
    for word in separated_words:
        wordToAppend = str(ord(word[0]))
        if len(word) == 2:
            wordToAppend += word[-1]
        elif len(word) == 3:
            wordToAppend += word[-1] + word[1]
        elif len(word) >= 4:
            wordToAppend += word[-1] + word[2:-1] + word[1]
        result_tab.append(wordToAppend)
    return ' '.join(result_tab)


print(encrypt_this("A wise old owl lived in an oak"))