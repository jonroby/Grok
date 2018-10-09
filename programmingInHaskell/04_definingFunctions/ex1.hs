-- 1. Using library functions, define a function
-- :: [a] -> ([a], [a]) that splits an even lengthed list into two halves.

halve xs =
  let split = (length xs `div` 2)
  in ((take split xs), (drop split xs))

