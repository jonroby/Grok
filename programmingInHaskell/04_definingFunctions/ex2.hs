-- Define a function third :: [a] -> a that returns a third element in the list
-- that contains at least this many elements using:
--   a) head and tail
--   b) list indexing !!,
--   c) pattern matching

third1 :: [a] -> a
third1 xs = head (tail (tail xs))

third2 :: [a] -> a
third2 xs = xs !! 2

third3 :: [a] -> a
third3 (_:_:x3:_) = x3
