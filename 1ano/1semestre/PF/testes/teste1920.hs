{-1. Apresente uma defini¸c˜ao recursiva de cada uma das seguintes fun¸c˜oes (pr´e-definidas) sobre listas:
(a) intersect :: Eq a => [a] -> [a] -> [a] que retorna a lista resultante de remover da primeira
lista os elementos que n˜ao pertencem `a segunda. Por exemplo, intersect [1,1,2,3,4] [1,3,5]
corresponde a [1,1,3].-}

intersect' :: Eq a => [a] -> [a] -> [a]
intersect' [] _ = []
intersect' (h:t) l |h `elem` l = h : intersect' t l
                   |otherwise =intersect' t l 

{-b) tails :: [a] -> [[a]] que calcula a lista dos sufixos de uma lista. Por exemplo, tails [1,2,3]
corresponde a [[1,2,3],[2,3],[3],[]]-}
tails' :: [a] -> [[a]]
tails' [] = [[]]
tails' (h:t) = (h:t) : tails' t  

{-2. Para armazenar conjuntos de n´umeros inteiros, optou-se pelo
uso de sequˆencias de intervalos.
Assim, por exemplo, o conjunto {1, 2, 3, 4, 7, 8, 19, 21, 22, 23}
poderia ser representado por
[(1,4),(7,8),(19,19),(21,23)].-}
type ConjInt = [Intervalo]
type Intervalo = (Int,Int)
{-a) Defina uma fun¸c˜ao elems :: ConjInt -> [Int] que, dado um conjunto, d´a como resultado a lista
dos elementos desse conjunto.-}
elems :: ConjInt -> [Int]
elems [] = []
elems ((a,b):t) | a <= b = a: elems ((a+1,b):t)
                | otherwise = elems t

{-b) Defina uma fun¸c˜ao geraconj :: [Int] -> ConjInt que recebe uma lista de inteiros, ordenada por
ordem crescente e sem repeti¸c˜oes, e gera um conjunto. Por exemplo, geraconj [1,2,3,4,7,8,19,21,22,23] = [(1,4),(7,8),(19,19),(21,23)].-}
geraconj :: [Int] -> ConjInt
geraconj [] = []
geraconj (x:xs) = geraconjAux xs (x, x)

geraconjAux :: [Int] -> Intervalo -> ConjInt
geraconjAux [] intervalo = [intervalo]
geraconjAux (x:xs) (a, b)
    | x == b + 1 = geraconjAux xs (a, x)  -- Extende o intervalo atual
    | otherwise  = (a, b) : geraconjAux xs (x, x)  -- Inicia um novo intervalo

{-3. Para armazenar uma agenda de contactos telef´onicos
e de correio electr´onico definiram-se os seguintes tipos
de dados.
N˜ao existem nomes repetidos na agenda e para cada
nome existe uma lista de contactos.-}
data Contacto = Casa Integer
            | Trab Integer
            | Tlm Integer
            | Email String
    deriving (Show)
type Nome = String
type Agenda = [(Nome, [Contacto])]
{-(a) Defina a fun¸c˜ao acrescEmail :: Nome -> String -> Agenda -> Agenda que, dado um nome,
um email e uma agenda, acrescenta essa informa¸c˜ao `a agenda.-}
acrescEmail :: Nome -> String -> Agenda -> Agenda
acrescEmail nome email [] = [(nome,[Email email])]
acrescEmail nome email ((n,c):t) |n == nome = (n,Email email:c):t
                                 |otherwise = acrescEmail nome email t
{-b) Defina a função verEmails :: Nome -> Agenda -> Maybe [String] que, dado um nome e uma agenda, retorna a lista dos emails associados a esse nome. Se esse nome não existir na agenda a função deve retornar Nothing.-} 
verEmails :: Nome -> Agenda -> Maybe [String]
verEmails nome [] = Nothing
verEmails nome ((n,c):t) |nome == n = Just(soEmail c)
                         |otherwise = verEmails nome t

soEmail :: [Contacto] -> [String]
soEmail [] = []
soEmail (Email c:t) = c:soEmail t
soEmail (_:t)= soEmail t

{-(c) Defina a fun¸c˜ao consulta :: [Contacto] -> ([Integer],[String]) que, dada lista de contac-
tos, retorna o par com a lista de n´umeros de telefone (tanto telefones fixos como telem´oveis) e a
lista de emails, dessa lista. Implemente a fun¸c˜ao de modo a fazer uma ´unica travessia da lista de
contactos.-}
consulta :: [Contacto] -> ([Integer],[String])
consulta = 
    foldr (\c (tlfs,emails)->
    case c of
        Tlm n -> (n:tlfs,emails)
        Casa n -> (n:tlfs,emails)
        Trab n -> (n:tlfs,emails)
        Email e -> (tlfs,e:emails)
        )([],[])

{-d) Defina a função consultaIO :: Agenda -> IO () que, dada uma agenda, lê do teclado o nome que pretende consultar e apresenta no ecrã os contactos associados a esse nome na agenda.-}




--4. Relembre o tipo RTree a definido nas aulas.
data RTree a = R a [RTree a] deriving (Show, Eq)
{-(a) Defina a fun¸c˜ao paths :: RTree a -> [[a]] que dada uma destas ´arvores calcula todos os camin-
hos desde a ra´ız at´e `as folhas. Por exemplo, paths (R 1 [R 2 [], R 3 [R 4 [R 5 [], R 6 []]],
R 7 []]) deve corresponder `a lista [[1,2],[1,3,4,5],[1,3,4,6],[1,7]].-}
paths :: RTree a -> [[a]]
paths (R a []) = [[a]]
paths (R a t)= map (a:) $ concatMap paths t 

{-b) Defina a função unpaths :: Eq a => [[a]] -> RTree a, inversa da anterior, tal que unpaths (paths t) == t, para qualquer árvore t :: Eq a => RTree a.-}