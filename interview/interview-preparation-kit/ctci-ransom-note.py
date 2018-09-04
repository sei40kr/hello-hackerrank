#!/bin/python3

A = ord('a')
Z = ord('z')


def countLetters(text):
    counts = [0] * (Z - A + 1)

    for char in sorted(list(text.lower())):
        if 'a' <= char <= 'z':
            counts[ord(char) - A] += 1

    return counts


# Complete the checkMagazine function below.
def checkMagazine(magazine, note):
    words = sorted([word.lower() for word in magazine])
    stack = sorted([word.lower() for word in note])
    stack.reverse()

    for word in words:
        if stack[-1] == word:
            if len(stack) == 1:
                print("Yes")
                return
            else:
                stack.pop()

    print("No")


if __name__ == '__main__':
    mn = input().split()

    m = int(mn[0])

    n = int(mn[1])

    magazine = input().rstrip().split()

    note = input().rstrip().split()

    checkMagazine(magazine, note)
