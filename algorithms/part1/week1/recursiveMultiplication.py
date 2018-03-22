import math

def len_num(n):
    return len(str(n))

def split_num(num):
    half = len(num)/2
    first_half = num[:half]
    second_half = num[half:]
    return first_half, second_half

def karatsuba(xStr, yStr):
    x = int(xStr)
    y = int(yStr)

    if len(xStr) > len(yStr):
        d = len(xStr) - len(yStr)
        yStr = d * "0" + yStr
    elif len(xStr) < len(yStr):
        d = len(yStr) - len(xStr)
        xStr = d * "0" + xStr

    if len(xStr) == 1:
        return x * y
    else:
        half = len(xStr) // 2

        a, b = split_num(xStr)
        c, d = split_num(yStr)

        p = int(a) + int(b)
        q = int(c) + int(d)

        ac = karatsuba(a, c)
        bd = karatsuba(b, d)

        ab = str(int(a) + int(b))
        cd = str(int(c) + int(d))
        pq = karatsuba(ab, cd)

        adbc = pq - ac - bd
        print(len(xStr))
        print(len(xStr))
        return 10 ** (2*half) * int(ac) + (10 ** (half)) * adbc + int(bd)

num1 = '3141592653589793238462643383279502884197169399375105820974944592'
num2 = '2718281828459045235360287471352662497757247093699959574966967627'

print(karatsuba(num1, num2))

# my answer
# 8539652321660695315202603130310992554579528418968890179230024159442296667485399006284988744293910347704837917291879029689263184
