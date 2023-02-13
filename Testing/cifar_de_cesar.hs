--Cifra de César

import Data.Char

--converter letra para inteiro 0..25
letraInt :: Char -> Int
letraInt x = ord x - ord `A`

--converter inteiro 0..25 para letra
intLetra :: Int -> Char
intLetra n = chr (n + ord `A`)

maiuscula :: Char -> Bool
maiuscula x = x >=`A` && x <= `Z`

--deslocar k posições no alfabeto as letras maiúsculas
deslocar :: Int -> Char -> Char
deslocar k x 
        | maiuscula x = intLetra ((letInt x + k)`mod`26)
        | otherwise = x

--aplicação da função deslocar a cada caracter da cadeia dada (xs)
cifrar :: Int -> String -> String
cifrar k xs = [deslocar k x | x <- xs]

--No terminal
> cifrar 3 "HASKELL IS COOL"
"KDVNHOO LV FRRO"

--para descodificar uma mensagem cifrada com cifrar k usamos cifrar (-k)
> cifrar (-3) "KDVNHOO LV FRRO"
"HASKELL IS COOL"