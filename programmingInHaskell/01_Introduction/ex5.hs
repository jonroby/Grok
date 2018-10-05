-- 5. What would be the effect of replacing < = by < in the original definitionof qsort? Hint: consider the example qsort [2,2,3,1,1].

-- It eliminates duplicates

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a < x]
    larger  = [b | b <- xs, b > x]
