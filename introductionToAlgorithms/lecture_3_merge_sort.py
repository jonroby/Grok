'''
pg. 31

Merge(A, p, q, r)
  n1 = q - p + 1
  n2 = r - q
  let L[1..n1 + 1] and R[1..n2+1] be new arrays
  for i = 1 to n1
    L[i] = A[p+i-1]
  for j = 1 to n2
    R[j] = A[q+j]
  L[n1+1] = infinity
  R[n2+1] = infinity
  i = 1
  j = 1
  for k = p to r
    if L[i] <= R[j]
      A[k] = L[i]
      i = i+1
    else A[k] = R[j]
      j = j+1
'''

# 25:00

def merge_sort(arr):
    if len(arr) > 1:
        mid = len(arr) // 2
        left = arr[:mid]
        right = arr[mid:]
        merge_sort(left)
        merge_sort(right)

        i = 0
        j = 0
        k = 0

        while i < len(left) and j < len(right):
            if left[i] <= right[j]:
                arr[k] = left[i]
                i += 1
            elif left[i] > right[j]:
                arr[k] = right[j]
                j += 1
            k += 1

        if i == len(left):
            while j < len(right):
                arr[k] = right[j]
                i += 1
                j += 1
        elif j == len(right):
            while i < len(left):
                arr[k] = left[i]
                i += 1
                k += 1
    print(arr)

merge_sort([5,2,4,6,1,3])
