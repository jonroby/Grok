-- 3. Consider the function safetail :: [a] -> [a] that behaves in the same
-- way as tail except that it maps the empty list to itself rather than
-- producing and error. Using tail and the function null :: [a] -> Bool that
-- decides if a list is empty or not, define safetail using:
--   a) conditional expression
--   b) guarded equations
--   c) pattern matching

safetail1 :: [a] -> [a]
safetail1 lst = if null lst then [] else tail lst

safetail2 :: [a] -> [a]
safetail2 lst | null lst  = []
              | otherwise = (tail lst)

safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 lst = tail lst
