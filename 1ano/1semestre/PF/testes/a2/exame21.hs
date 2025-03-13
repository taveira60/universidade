replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' x y = y : replicate' (x-1) y

intersect' :: Eq a => [a] -> [a] -> [a]
intersect' [] _ = []
intersect' (h:t) l | h `elem` l = h: intersect' t l
                   |otherwise = intersect' t l

data LTree a = Tip a | Fork (LTree a) (LTree a)
data FTree a b = Leaf a | No b (FTree a b) (FTree a b)

conv :: LTree Int -> FTree Int Int
conv = snd . convaux

convaux :: LTree Int -> (Int,FTree Int Int)
convaux (Tip x) = (x, Leaf x)
convaux (Fork l r) = (s, No s ll rr)
    where (sl, ll) = convaux l
          (sr, rr) = convaux r 
          s = sl + sr

type Mat a = [[a]]

triSup :: (Eq a, Num a) => Mat a -> Bool
triSup = all(all(== 0). uncurry take) . zip [0..]



data SReais = AA Double Double | FF Double Double
            | AF Double Double | FA Double Double
            | Uniao SReais SReais

instance Show SReais where
    show (AA x y) = "]" ++ show x ++ "," ++ show y ++ "["
    show (FF x y) = "[" ++ show x ++ "," ++ show y ++ "]"
    show (AF x y) = "]" ++ show x ++ "," ++ show y ++ "]"
    show (FA x y) = "[" ++ show x ++ "," ++ show y ++ "["
    show (Uniao a b) = "(" ++ show a ++ " U " ++ show b ++ ")" 

tira :: Double -> SReais -> SReais
tira x (AA a b) | x > a && x < b = (Uniao (AA a x) (AA x b))
                | otherwise = (AA a b)
tira x (FF a b) | x > a && x < b = (Uniao (FA a x) (AF x b))
                | x == a = (AF a b)
                | x == b = (FA a b)
                | otherwise = (FF a b)
tira x (AF a b) | x > a && x < b = (Uniao (AA a x) (AF a b))
                | x == b = (AA a b)
                | otherwise = (AF a b)
tira x (FA a b) | x > a && x < b = (Uniao (FA a x) (AA x b))
                | x == a = (AA a b)
                |otherwise = (FA a b)
tira x (Uniao a b) = Uniao (tira x a) (tira x b)

func :: Float -> [(Float,Float)] -> [Float]
func _ [] = []
func x ((a,b):t) | x > a = b : func x t
                 | otherwise = func x t

subseqSum :: [Int] -> Int -> Bool
subseqSum [] _ = False
subseqSum l x = any ((==x).sum) (inits l) || subseqSum (tail l) x