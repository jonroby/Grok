-- 5. Without using any other library functions or operators, show how the
-- meaning of the following pattern matching definition for logical conjunction
-- && can be formalized using conditional expressions.

and' x y = if (x == True)
  then if y == True then True else False
  else False
