doubleInt : Int -> Int
doubleInt x = x + x

doubleNat : Nat -> Nat
doubleNat x = x + x

doubleInteger : Integer -> Integer
doubleInteger x = x + x

-- There's a pattern here:

double : ty -> ty
double x = x + x

--------------------------------------------------------------------------------
-- Generics.idr:13:12-16:
--    |
-- 13 | double x = x + x
--    |            ~~~~~
-- When checking right hand side of double with expected type
--         ty
--
-- ty is not a numeric type
--------------------------------------------------------------------------------

-- But this will be rejected, because you can only use arithmetic operations
-- on numeric types, so you need to constrain ty so that it only stands for
-- numeric types.

-- double : Num ty => ty -> ty
-- double x = x + x
