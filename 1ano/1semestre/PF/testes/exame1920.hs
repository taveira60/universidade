{-1. Apresente uma defini¸c˜ao recursiva das seguintes fun¸c˜oes (pr´e-definidas) sobre listas:
(a) inits:: [a] -> [[a]] que calcula a lista dos prefixos de uma lista. Por exemplo, inits [11,21,13]
corresponde a [[],[11],[11,21],[11,21,13]]-}
inits:: [a] -> [[a]]
inits [] = [[]]
inits l = inits (init l) ++ [l]
{-(b) isPrefixOf:: Eq a => [a] -> [a] -> Bool que testa se uma lista ´e prefixo de outra. Por ex-
emplo, isPrefixOf [10,20] [10,20,30] corresponde a True enquanto que isPrefixOf [10,30]
[10,20,30] corresponde a False.-}
isPrefixOf:: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf (h:t) (hs:ts) |h == hs = isPrefixOf t ts
                         |otherwise = False

{-2. Considere o seguinte tipo para
representar ´arvores bin´arias.-}
data BTree a = Empty
            | Node a (BTree a) (BTree a)
    deriving Show
{-(a) Defina a fun¸c˜ao folhas :: BTree a -> Int, que calcula o n´umero de folhas (i.e., nodos sem de-
scendentes) da ´arvore.-}
folhas :: BTree a -> Int
folhas (Node e Empty Empty) = 1
folhas (Node e l r)= (folhas l) + (folhas r)

{-(b) Defina a fun¸c˜ao path :: [Bool] -> BTree a -> [a], que dado um caminho (False corresponde
a esquerda e True a direita) e uma ´arvore, d´a a lista com a informa¸c˜ao dos nodos por onde esse
caminho passa.-}
path :: [Bool] -> BTree a -> [a]
path [] _ = []
path (h:t) (Node e l r) | h == True = e: path t r 
                        |otherwise = e:path t l 

{-3. Uma representa¸c˜ao poss´ıvel de polim´omios ´e pela sequˆencia dos
coeficientes - tˆem que se armazenar tamb´em os coeficientes nulos
pois ser´a a posi¸c˜ao do coeficiente na lista que dar´a o grau do
mon´omio.
A representa¸c˜ao do polin´omio 2 x5 − 5 x3 ser´a ent˜ao [0,0,0,-5,0,2], que corresponde ao polin´omio
0 x0 + 0 x1 + 0 x2 − 5 x3 + 0 x4 + 2 x5. Nas quest˜oes que se seguem, use sempre que poss´ıvel, fun¸c˜oes de
ordem superior.
(a) Defina a opera¸c˜ao valor :: Polinomio -> Float -> Float que calcula o valor do polin´omio para
um dado x.-}
type Polinomio = [Coeficiente]
type Coeficiente = Float


{-4. Considere a seguinte defini¸c˜ao para representar matrizes: type Mat a = [[a]].
ex = [[1,4,3,2,5], [6,7,8,9,0], [3,5,4,9,1]] representa a matriz abaixo desenhada.
(a) Defina a fun¸c˜ao quebraLinha :: [Int] -> [a] -> [[a]] que recebe uma lista de inteiros s e
uma linha l, e produz a lista de segmentos cont´ıguos de l de comprimento indicado em s. Por
exemplo, quebraLinha [2,3] [1,4,3,2,5] == [[1,4],[3,2,5]].-}
type Mat a = [[a]]
ex = [[1,4,3,2,5], [6,7,8,9,0], [3,5,4,9,1]]
quebraLinha :: [Int] -> [a] -> [[a]]
quebraLinha [] _ = []
quebraLinha (h:t) l = take h l :quebraLinha t (drop h l)

{-Defina a fun¸c˜ao fragmenta :: [Int] -> [Int] -> Mat a -> [Mat a]
que recebe duas lista de inteiros (com a parti¸c˜ao das linhas e das colunas) e
uma matriz, e produz a lista de (sub)-matrizes de acordo com essa parti¸c˜ao.-}
fragmenta :: [Int] -> [Int] -> Mat a -> [Mat a]
