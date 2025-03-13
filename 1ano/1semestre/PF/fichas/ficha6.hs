
data BTree a = Empty
    | Node a (BTree a) (BTree a)
    deriving Show


arvore = (Node 5 (Node 2 (Node 1 Empty
                                 Empty) 
                         (Node 3 Empty 
                                 Empty)) 
                 (Node 9 (Node 7 (Node 6 Empty 
                                         Empty) 
                                 (Node 8 Empty 
                                         Empty)) 
                         Empty))

{-a) altura :: BTree a -> Int que calcula a altura da árvore.-}
altura :: BTree a -> Int
altura Empty = 0
altura (Node e l r) = 1+ max (altura l) (altura r)

{-b) contaNodos :: BTree a -> Int que calcula o número de nodos da árvore.-}
contaNodos :: BTree a -> Int
contaNodos Empty = 0
contaNodos (Node e l r) = 1 + contaNodos l + contaNodos r

{-folhas :: BTree a -> Int que calcula o número de folhas (i.e., nodos sem descendentes) da árvore.-}
folhas :: BTree a -> Int
folhas Empty = 0
folhas (Node _ Empty Empty)=1
folhas (Node e l r)= folhas l + folhas r

{-d) prune :: Int -> BTree a -> BTree a que remove de uma árvore todos os elementos a partir de uma determinada profundidade.-}
prune :: Int -> BTree a -> BTree a
prune _ Empty = Empty
prune 0 _ = Empty
prune x (Node e l r) = Node e (prune (x-1) l) (prune (x-1) r)

--
path :: [Bool] -> BTree a -> [a]
path [] _ = []
path (h:t) (Node e l r) |h == False = e:path t l
                        |otherwise = e:path t r

mirror :: BTree a -> BTree a
mirror Empty = Empty
mirror (Node e l r )= (Node e (mirror r)(mirror l))

{-(g) zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c que gener-
aliza a fun¸c˜ao zipWith para ´arvores bin´arias.-}

zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c
zipWithBT f _ Empty =Empty
zipWithBT f Empty _ = Empty
zipWithBT f (Node e l r) (Node es ls rs) = (Node (f e es) (zipWithBT f l ls) (zipWithBT f r rs) ) 

minimo :: Ord a => BTree a -> a
minimo (Node e Empty _) = e
minimo (Node e l r) = minimo l
 
semMinimo :: Ord a => BTree a -> BTree a
semMinimo (Node _ Empty r) = r
semMinimo (Node e l r ) = (Node e(semMinimo l) r )

minSmin :: Ord a => BTree a -> (a,BTree a)
minSmin (Node e Empty r)=(e,r)
minSmin (Node e l r) = (a,Node e b r)
        where 
        (a,b)= minSmin l
