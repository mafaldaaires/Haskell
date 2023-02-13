import Distribution.Simple.Utils (xargs)
{-
3.1
divprop :: Integer -> [Integer]
divprop n = [i | i <- [1..n-1], n`mod`i == 0]

3.2
divprop :: Integer -> [Integer]
divprop n = [i | i <- [1..n-1], n`mod`i == 0]

perfeitos :: Integer -> [Integer]
perfeitos n = [i | i <- [1..n], sum(divprop i) == i]

3.3
pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2+y^2 == z^2]

3.4
No ex 3.1, a função divprop tinha de calcular a lista de divisores próprios de um inteiro positivo (inferiores ao número dado): i <- [1..n-1]
No ex 3.4, temos de ter em conta o numero dado, porque o numero dado tem de ser divisivel por 1 e pelo numero dado: i <- [1..n].

divprop :: Integer -> [Integer]
divprop n = [i | i <- [1..n], n`mod`i == 0]

primo :: Integer -> Bool
primo n = divprop n == [1,n] 

3.5
binom :: Integer -> Integer -> Integer
binom n k = (product [1..n]) `div` (product [1..k] * product [1..n-k])

pascal :: Integer -> [[Integer]]
pascal x = [[binom n k | k <- [0..n]] | n <- [0..x]]

NO TERMINAL
> pascal 2 
[[1],[1,1],[1,2,1]]  <=> [[binom 0 0], [binom 1 0, binom 1 1], [binom 2 0, binom 2 1, binom 2 2]]

3.6
import Data.Char (chr, ord)

-- Converte letras em inteiros 0..25 e vice-versa
letraInt :: Char -> Int
letraInt c = ord c - ord 'A'

intLetra :: Int -> Char
intLetra n = chr (n + ord 'A')

maiúscula :: Char -> Bool
maiúscula x = x>='A' && x<='Z'

-- Efectuar um deslocamento de k posições
desloca :: Int -> Char -> Char
desloca k x | maiúscula x = intLetra ((letraInt x + k)`mod`26)
            | otherwise   = x

-- Repetir o deslocamento para toda a cadeia de caracteres.
cifrar :: Int -> String -> String
cifrar k xs = [desloca k x | x<-xs]

3.7
a)
myand :: [Bool] -> Bool
myand [] = True
myand (False:xs) = False
myand (True:xs) = myand xs

b)
myor :: [Bool] -> Bool
myor [] = False
myor (True:xs) = True
myor (False:xs) = myor xs

c)


d)
myreplicate :: Int -> a -> [a]
myreplicate n x | n <= 0 = []
                | otherwise = x : myreplicate (n-1) x

e)


f)
myelem :: Eq a => a -> [a] -> Bool
myelem n [] = False
myelem n (x:xs) | n == x = True
                | otherwise = myelem n xs

3.9
import Data.Char (isLower, isUpper, isNumber)

myor :: [Bool] -> Bool
myor [] = False
myor (True:xs) = True
myor (False:xs) = myor xs

forte :: String -> Bool
forte x | (maiuscula x && minuscula x && numero x && length x >= 8) = True
        | otherwise = False

maiuscula :: String -> Bool
maiuscula caracter = myor[x >= 'A' && x <= 'Z'| x <- caracter]

minuscula :: String -> Bool
minuscula caracter = myor[x >= 'a' && x <= 'z' | x <- caracter]

numero :: String -> Bool
numero caracter = myor[x >='0' && x <= '9' | x <- caracter]

3.10
a)
divprop :: Integer -> [Integer]
divprop n = [i | i <- [1..n], n`mod`i == 0]

mindiv :: Int -> Int
mindiv x    

x é o input
n é o output
n = p * q
se p >= sqrt n entao q <= sqrt n => n <= sqrt x

-}