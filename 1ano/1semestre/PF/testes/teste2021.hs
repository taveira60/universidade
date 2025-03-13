import Data.List (delete)
--1
(\\\) :: Eq a => [a] -> [a] -> [a]
(\\\) l [] = l
(\\\) [] _ = []
(\\\) l (h:t) = (\\\) (delete h l) t

--2
type MSet a = [(a,Int)]
removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet _ [] = []
removeMSet x ((a,c):t) | x == a = if c<=1 then  t else (a,c-1): t
                       |otherwise =(a,c) : removeMSet x t

calcula :: MSet a -> ([a],Int)
calcula = foldr (\(a,c)(elems,total)->(a:elems,c+total)) ([],0)

--3
partes :: String -> Char -> [String]
partes "" _ = []
partes s delim =
    case span (/= delim) s of
        ("", rest) ->partes (tail rest) delim
        (part,"") -> [part]
        (part,rest) ->part : partes (tail rest) delim

--4


data BTree a = Empty | Node a (BTree a) (BTree a)        

a1 = Node 5 (Node 3 Empty Empty)
            (Node 7 Empty (Node 9 Empty Empty))

remove :: Ord a => a -> BTree a -> BTree a
remove _ Empty = Empty
remove x (Node e l r)|x<e =Node e (remove x l) r
                     |x>e =Node e l (remove x r)
                     |otherwise =
                        case (l,r) of
                            (Empty,r)->r 
                            (l,Empty)->l 
                            (l,r)-> let (min,sMin) = minSMin r in Node min l sMin

minSMin :: BTree a -> (a, BTree a)
minSMin (Node e Empty r) =(e,r)
minSMin (Node e l r) = let (min,sMin)= minSMin l in (min, Node e sMin r) 

instance Show a => Show (BTree a) where
    show :: Show a=> BTree a -> String
    show Empty = "+"
    show (Node e l r)= "(" ++ show l ++"<-" ++ show e ++ "->" ++ show r++")"

--5
{-sortOn :: Ord b => (a -> b) -> [a] -> [a]
sortOn _ [] = []
sortOn f (h:t) = sortOn f smaller ++ [h] ++ sortOn f larger
        where pivot = f h
              (smaller, larger) = foldr (\x (s,l) -> if f x > pivot then (x:s,l) else (s,x:l)) ([],[]) t in-}

--6
data FileSystem = File Nome | Dir Nome [FileSystem]
type Nome = String

fs1 = Dir "usr" [Dir "xxx" [File "abc.txt", File "readme", Dir "PF" [File "exemplo.hs"]],
    Dir "yyy" [], Dir "zzz" [Dir "tmp" [], File "teste.c"] ]

fichs :: FileSystem -> [Nome]
fichs (File nome) = [nome]
fichs (Dir _ files) = concatMap fichs files

