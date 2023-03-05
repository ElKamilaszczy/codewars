#https://www.codewars.com/kata/52597aa56021e91c93000cb0/train/python

# Move all the zeros to the end while preserving original order of elements.
def move_zeros(lst):
    return [num for num in lst if num != 0] + [0] * lst.count(0)
print(move_zeros([1,9,0,220,1,0,0,9]))