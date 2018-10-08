-- 5. Why is not feasible in general for function types to be instances of the
-- Eq class? When is it feasible? Hint: two functions of the same type are
-- equal if they always return equal results for equal arguments.

-- Suppose there are two functions, f1 and f2, that are of type Num a => a -> a.
-- There are two potential ways to check the equality of the function.

-- First, you could check whether the syntax is the same. Unfortunately, this won't work because there could be differences in spacing or worse, implementation, for both functions that are actually doing the same operation. Example:
-- (x * x) and (square x).

-- Second, you can't test actual inputs because there are an infinite number
-- of inputs and humans don't have an infinite amount of time to wait for their
-- type checking to finish. 

-- After checking online, it appears the problem is undecidable.
