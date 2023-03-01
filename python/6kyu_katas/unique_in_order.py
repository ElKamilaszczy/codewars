# https://www.codewars.com/kata/54e6533c92449cc251001667/train/python
"""
Return sequence with distinct values while preserving the original order
So the problem - replace repeating occurences with the first one.
"""
import re
def unique_in_order(sequence):
    if sequence == () or sequence == [] or sequence == "":
        return []
    returnedList = []
    # Append the first elem of the index:
    returnedList.append(sequence[0])
    for index in range(1, len(sequence)):
        # if the current element does not equal latest from the outcome list
        if sequence[index] != returnedList[-1]:
            returnedList.append(sequence[index])
    return returnedList
print(unique_in_order('AAAAABBDDC11212'))