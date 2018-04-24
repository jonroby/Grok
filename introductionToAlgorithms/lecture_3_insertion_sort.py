'''
pg. 18

Insertion-Sort(A)
for j = 2 to A.length
  key = A[j]
  // Insert A[j] into the sorted sequence A[1..j-1]
  i = j - 1
  while i > 0 and A[i] > key
    A[i+1] = A[i]
    i = i - 1
  A[i+1] = key
'''

# 14:00
def insertion_sort(arr):
    for j, key in enumerate(arr):
        i = j - 1
        while (i >= 0) and (arr[i] > key):
            arr[i+1] = arr[i]
            i = i - 1
        arr[i+1] = key
    return arr

print(insertion_sort([5,2,4,6,1,3]))


