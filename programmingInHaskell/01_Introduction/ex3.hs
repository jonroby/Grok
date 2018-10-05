-- 3. Define a function product that produces the product of a list of
-- numbers, and show using your definition that product [2,3,4] = 24.

product' [] = 1
product' (x:xs) = x * product' xs

-- product' [2,3,7,10] = 420 (use this test case for ghci)

-- ghci provides warning:
--   Pattern match is redundant
--     In an equation for ‘product'’: product' [2, 3, 7, 10] =
-- why?
  
