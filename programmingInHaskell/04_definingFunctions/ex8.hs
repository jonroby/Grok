-- 8. Define a function luhnDouble :: Int -> Int that doubles a digit and
-- subtracts 9 if the result is greater than 9. Then using luhnDouble, define
-- a function luhn :: Int -> Int -> Int -> Int Bool that decides if a 4 digit
-- bank card number is valid.

-- luhnDouble :: Int -> Int
-- luhnDouble x = let doubled = x * 2 in
--   doubled > 9 | doubled - 9
--               | otherwise = doubled

luhnDouble x
  | doubled > 9 = doubled - 9
  | otherwise = doubled
  where doubled = x * 2

luhn w x y z = (sum ([luhnDouble w, x, luhnDouble y, z])) `mod` 10 == 0
