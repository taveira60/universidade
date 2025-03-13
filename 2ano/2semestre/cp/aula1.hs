--1 
length' :: [a] -> Int
length' [] = 0
length' (h:t) = 1 + length' t

reverse' :: [a]-> [a]
reverse' [] = []
reverse' (h:t) = reverse' t ++ [h]

map' :: (a->b)->[a]->[b]
map' f [] = []
map' f (h:t) = f h : map' f t

filter' :: (a->Bool) -> [a] -> [a]
filter' f [] = []
filter' f (h:t) = if (f h) then h:filter' f t else filter' f t

filter'' :: (a->Bool) -> [a] -> [a]
filter'' f [] = []
filter'' f (h:t) = x ++ filter' f t
        where x = if f h then [h] else []

forldr :: (a->b->b)->b->[a]->b
forldr f i [] = i
forldr f i (h:t) = f h (forldr f i t)

uncurry :: (a->b->c) -> (a,b) -> c
uncurry g (x,y) = g x y 

curry :: ((a,b)->c) -> a -> b -> c
curry g x y = g(x,y)

flip :: (a-> b -> c) -> b -> a -> c
flip f x y = f y x