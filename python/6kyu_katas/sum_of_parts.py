# https://www.codewars.com/kata/5ce399e0047a45001c853c2b/train/python

# This one didn't make it in time

def parts_sum(ls):
    lst = [sum(ls[num:]) for num in range(len(ls))]
    lst.append(0)
    return lst

# This one did the trick - counts sum only once, not each time.
def parts_sum(ls):
    arr = [sum(ls)]
    for num in range(0, len(arr)):
        arr.append(arr[num] - ls[num])
    return arr