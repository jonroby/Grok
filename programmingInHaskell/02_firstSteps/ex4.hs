-- 4. The library function last selects the last element of a non-empty list;
-- for example, last [1,2,3,4,5] = 5. Show how the function last could be
-- defined in terms of the other functions introduced in this chapter? Can you
-- think of another definition?

last1 xs = sum (drop (length xs - 1) xs)
last2 xs = xs !! (length xs - 1)
