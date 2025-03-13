replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' x y = y : replicate' (x-1) y

intersect :: Eq a => [a] -> [a] -> [a]
intersect [] _ = []
intersect (h:t) l |h `elem` l = h :intersect t l
                  |otherwise = intersect t l


data LTree a = Tip a | Fork (LTree a) (LTree a)
data FTree a b = Leaf a | No b (FTree a b) (FTree a b)

conv :: LTree Int -> FTree Int Int
