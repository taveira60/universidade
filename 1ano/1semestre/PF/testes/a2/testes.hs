type MSet a = [(a,Int)]
uniaoMSet :: Eq a => MSet a -> MSet a -> MSet a
uniaoMSet [] l =l
uniaoMSet l [] = l
uniaoMSet ((h,t):ts) list =  uniaoMSet ts (uniaoaux (h,t) list)


uniaoaux :: Eq a => (a,Int) -> MSet a -> MSet a
uniaoaux h [] = [h]
uniaoaux (h,t) ((h',t'):rl) |h==h' = (h,t+t'):rl
                            |otherwise = (h',t') : uniaoaux (h,t) rl

main :: IO ()
main = do
    let mset1 = [('a', 2), ('b', 3), ('c', 1)]
    let mset2 = [('b', 1), ('c', 2), ('d', 4)]
    let result = uniaoMSet mset1 mset2
    print result  -- Esperado: [('a', 2), ('b', 4), ('c', 3), ('d', 4)]