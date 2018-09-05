import time

n = int(input())


def myF(x):
    if x == 0:
        return 1
    else:
        return x * myF(x-1)


print(time.time())
print(myF(n))
print(time.time())
