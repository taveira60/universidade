tails'::[a]->[[a]]
tails' [] = [[]]
tails' (h:t) = (h:t): tails' t

isPrefixof':: Eq a => [a] -> [a] -> Bool
isPrefixof' [] _ = True
isPrefixof' [x] [y] = x == y 
isPrefixof' (h:t) (h':t') | h==h' = isPrefixof' t t'
                          |otherwise = False


type Mat a = [[a]] 

exemplo =[[1,2,3],[0,4,5],[0,0,6]]

zerolinha :: (Num a, Eq a) => [a] -> Int
zerolinha [] = 0
zerolinha (h:t) | h == 0 = 1 + zerolinha t
                | otherwise = zerolinha t

zeros :: (Num a, Eq a) => Mat a -> Int
zeros [] = 0
zeros (l:t) = zerolinha l + zeros t

addMat :: Num a => Mat a -> Mat a -> Mat a
addMat [] [] = []
addMat m1 m2 = zipWith (zipWith (+)) m1 m2

data Avaliacao = NaoVi
                | Pontos Int -- pontuacao entre 1 e 5
    deriving (Eq)
type Filme = String
type FilmesAval = [(Filme, [Avaliacao])]

instance Ord Avaliacao where
    compare NaoVi NaoVi = EQ
    compare NaoVi _ = LT
    compare _ NaoVi = GT
    compare (Pontos i) (Pontos j) = compare i j


data RTree a = R a [RTree a]

