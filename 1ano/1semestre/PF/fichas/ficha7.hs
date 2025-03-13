data RTree a = R a [RTree a]



arvore = R 6 [R 4 [R 7 [R 1 [],
                        R 3 []],
                   R 9 []],
              R 3 [R 12 []],
              R 6 [],
              R 11 []]


soma :: Num a => RTree a -> a 
soma (R e []) = e
soma (R e es) = e + sum (map soma es)

altura :: RTree a -> Int
altura (R e []) = 1
altura (R e es) = 1 + maximum (map altura es)