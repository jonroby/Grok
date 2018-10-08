-- 2. Write down the definitions that have the following types; it does not
-- matter what the definitions actually do as long as they are type correct.

bools :: [Bool]
bools = [True, False]

nums :: [[Int]]
nums = [[1..10]]

add :: Int -> Int -> Int -> Int
add x y z = x + y + z

copy :: a -> (a, a)
copy x = (x, x)

apply :: (a -> b) -> a -> b
apply f a = f a
