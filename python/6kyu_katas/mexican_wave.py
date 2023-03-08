# https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/python

def wave(people):
    lstOfWords = []
    letterPos = 0
    for num, person in enumerate(people):
        if person.isalpha():
            lstOfWords.append(people[0:letterPos] + person.upper() + people[letterPos+1:])
        letterPos += 1
    return lstOfWords
# Superior
def wave(people):
    return [people[0:num] + people[num].upper() + people[num+1:] for num in range(len(people)) if people[num].isalpha()]
print(wave('  hello and die  '))