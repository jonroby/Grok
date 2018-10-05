-- 1. Give another possible calculation for the result of double (double 2).

-- double (double 2)   { apply inner double }
-- double (2 + 2)      { apply outer double }
-- (2 + 2) + (2 + 2)   { apply + }
-- > 8
