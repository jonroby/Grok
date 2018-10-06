-- 5. The library function init removes the last element from a non-empty list;
-- for example, init [1,2,3,4,5] = [1,2,3,4]. Show how init could similarly be
-- defined in two different ways.

init1 xs = take (length xs - 1) xs
init2 xs = reverse (drop 1 (reverse xs))
