-- This type states that seqn maps a list of IO actions that produce results
-- of some type a to a single IO action that produces a list of such results
seqn :: [IO a] -> IO [a]
seqn [] = return []
seqn (act:acts) = do x <- act
                     xs <- seqn acts
                     return (x:xs)

