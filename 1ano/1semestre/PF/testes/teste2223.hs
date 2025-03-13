--1 Apresente uma defini¸c˜ao recursiva da fun¸c˜ao unlines :: [String] -> String que junta 
--todas as strings da lista numa s´o, separando-as pelo caracter ’\n’.

unline :: [String] -> String
unline [] = []
unline [x] = x
unline (h:t) = h ++ "\n" ++ unline t
 
--2 O formato csv (comma separated values) serve para descrever tabelas de uma forma textual:
--cada linha da tabela corresponde a uma linha do texto, enquanto que os elementos de cada linha
--se encontram separados por v´ırgulas.
--a)onsidere o tipo type Mat = [[Int]] para representar matrizes e a seguinte defini¸c˜ao da
--fun¸c˜ao stringToMat que converte strings desse formato em matrizes:

--stringToMat :: String -> Mat
--stringToMat s = map stringToVector (lines s)
--Apresente a defini¸c˜ao da fun¸c˜ao stringToVector e indique explicitamente o seu tipo.
type Mat = [[Int]] 



--3. Considere o seguinte tipo de dados para representar uma lista em que os elementos podem ser
--acrescentados `a esquerda (Esq) ou `a direita (Dir) da lista. Nula representa a lista vazia.
data Lista a =  Esq a (Lista a) 
               | Dir (Lista a) a 
               | Nula

--(a) Defina a fun¸c˜ao semUltimo :: Lista a -> Lista a que recebe uma Lista n˜ao vazia e
--devolve a Lista sem o seu elemento mais `a direita.
semUltimo :: Lista a -> Lista a
semUltimo Nula = Nula
semUltimo Dir (a)

--(b) Defina Lista como instˆancia da classe Show de forma a que a lista Esq 1 (Dir (Dir (Esq
--9 Nula) 3) 4) seja apresentada como [1, 9, 3, 4].