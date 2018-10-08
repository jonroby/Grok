-- 3. What are the types of the following functions?

second :: [a] -> a
second xs = head (tail xs)

swap :: (t1, t) -> (t, t1)
swap (x,y) = (y,x)

pair :: t1 -> t -> (t1, t)
pair x y = (x,y)

double :: Num a => a -> a
double x = x*2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (t -> t) -> t -> t
twice f x = f (f x)
