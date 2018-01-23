identityInt : Int -> Int
identityInt x = x

identityString : String -> String
identityString x = x

identityBool : Bool -> Bool
identityBool x = x

-- Rather than writing an identity function for every type, you can write it
-- with a variable, ty, in place of the concrete types above.

identity : ty -> ty
identity x = x

-- Note that variables like ty, are assumed to be variables and not type
-- variables. With dependent types, variables in types don't necessarily
-- stand only for types.
