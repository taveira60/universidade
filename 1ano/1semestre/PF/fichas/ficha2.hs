{-2) Defina recursivamente as seguintes funções sobre listas: a) dobros ::
[Float] -> [Float] que recebe uma lista e produz a lista em que cada elemento é
o dobro do valor correspondente na lista de entrada.-}
dobros :: [Float] -> [Float]
dobros [] = []
dobros (h:t) = h*2 :dobros t
{-numOcorre :: Char -> String -> Int que calcula o número de vezes que um
caracter ocorre numa string.-}
numOcorre :: Char -> String -> Int
numOcorre _ [] = 0
numOcorre x (h:t) | x == h = 1 + numOcorre x t
                  |otherwise = numOcorre x t

positivos :: [Int] -> Bool
positivos [x] = x>0
positivos (h:t) |h > 0 = positivos t
                |otherwise = False

soPos :: [Int] -> [Int]
soPos [] = []
soPos (h:t) | h<0 = soPos t
            |otherwise =h:soPos t 

somaNeg :: [Int] -> Int
somaNeg [] = 0
somaNeg (h:t) | h < 0 = h+ somaNeg t
              |otherwise = somaNeg t 

tresUlt :: [a] -> [a]
tresUlt [] = []
tresUlt (h:t) | length t < 3 = (h:t)
              | otherwise = tresUlt t 

segundos :: [(a,b)] -> [b]
segundos [] = []
segundos ((x,y):t) = y :segundos t 

nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros x [(a,b)]= x==a
nosPrimeiros x ((a,b):t) | x/=a = nosPrimeiros x t
                         | otherwise = False

sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos []=(0,0,0)
sumTriplos ((a,b,c):t) = (a+ra,b+rb,c+rc)
            where (ra,rb,rc) = sumTriplos t

--4

type Polinomio = [Monomio]
type Monomio = (Float,Int)

conta :: Int -> Polinomio -> Int
conta _ [] = 0
conta x ((n,g):t) | x == g =1 + conta x t
                  |otherwise = conta x t 

grau :: Polinomio -> Int
grau [] = 0
grau ((n,g):t) |g > grau t = g
               |otherwise = grau t

selgrau :: Int -> Polinomio -> Polinomio
selgrau _ [] = []
selgrau x ((n,g):t) | x == g = (n,g): selgrau x t
                    | otherwise =selgrau x t

deriv :: Polinomio -> Polinomio
deriv [] = []
deriv ((n,g):t) | g > 0 = (n*g,g-1):deriv t
                | otherwise = deriv t

calcula :: Float -> Polinomio -> Float
