# https://www.codewars.com/kata/52b757663a95b11b3d00062d/train/python

def to_weird_case(words):
    # Separate each word into the array
    arr_of_weird_words = []
    for word in words.split(' '):
        new_word = ''.join(list(map(lambda number: word[number].upper() if number % 2 == 0 else word[number].lower(), range(len(word)))))
        arr_of_weird_words.append(new_word)
    return ' '.join(arr_of_weird_words)
print(to_weird_case('hsdfhsdf shdfsfeafh'))