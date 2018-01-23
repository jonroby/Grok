-- function name / function type
double : Int -> Int -- type declaration
double x = x + x    -- function definition
-- left side / right side

-- evaluation order if double (double 15):
-- First, the inner double 15 is rewritten as 15 + 15
-- 15 + 15 is rewritten as 30
-- double 30 is rewritten as 30 + 30
-- 30 + 30 is rewritten as 60.
