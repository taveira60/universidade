zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = [] 
zip' _ [] = []
zip' (h:t) (hs:ts) = (h,hs) : zip' t ts 

preCrescente' :: Ord a => [a] -> [a]
preCrescente' [] = []
preCrescente' [x] = [x] 
preCrescente' (h:s:t) |h <= s = h : preCrescente' (s:t)
                      |otherwise = [h]

--amplitude :: [Int] -> Int

type Mat a = [[a]]

soma :: Num a => Mat a -> Mat a -> Mat a
soma [] [] = []
soma (linha1:t) (linha1':t') = zipWith (+) linha1 linha1' : soma t t'

type Nome = String
type Telefone = Integer
data Agenda = Vazia | Nodo (Nome, [Telefone]) Agenda Agend

import Data.List (intercalate)

instance Show Agenda where
    show Vazia = ""
    show (Node (Nome,Telefone) l r ) = show l ++ nome ++ " " ++ intercalate "/" (map show Telefone) ++ "\n" ++ show r
