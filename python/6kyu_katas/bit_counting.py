# https://www.codewars.com/kata/526571aae218b8ee490006f4/train/python
"""
Return number of binary 1s for the value
"""
def bit_counting(n):
    # Convert value to the binary and to str.
    binVal = bin(n)
    return sum([int(num) for num in binVal if num == '1'])

# Superior: bin(n).count('1')
print(bit_counting(12))