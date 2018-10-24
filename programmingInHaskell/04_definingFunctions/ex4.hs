or :: Bool  -> Bool -> Bool
or True True = True
or True False = True
or False True = True
or False False = False

or2 :: Bool -> Bool -> Bool
or2 False False = False
or2 _ _ = True

or3 :: Bool -> Bool -> Bool
or3 False b = b
or3 True _ = True

or4 :: Bool -> Bool -> Bool
or4 b c | b == c = b
        | otherwise = True
