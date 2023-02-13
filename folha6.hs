module Folha6 where

--6.2
main :: IO()
main =  do
        str <- getContents
        let pal = words str
        let lin = lines str
        putStr (show(length(lin)) ++ "\n" ++ show(length(pal)) ++ "\n" ++ show(length(str)))

ou

main :: IO()
main =  do
        ficheiro <- getContents
        print(show(length(lines(ficheiro))) ++ "\n" ++ show(length(words(ficheiro))) ++ "\n" ++ show(length(ficheiro)))

--6.3
--Inverter uma lista
inverte :: [String] -> [String]
inverte [] = []
inverte (x:xs) = reverse x : inverte xs

--IO action para ler uma lista
print' :: [String] -> IO ()
print' [] = return ()
print' (x:xs) = do
                putStrLn x
                print' xs

--IO action para imprimir o inverso das linhas da entrada padrão
main :: IO()
main =  do
        texto <- getContents
        print' (inverte(lines(texto)))

--6.4
--cifra de cesar

--ord :: Char -> Int
--chr :: Int -> Char

import Data.Char

letraInt :: Char -> Int
letraInt x = ord x - ord `A`

intLetra :: Int -> Char
intLetra x = chr (x + ord`A`)

rot13 :: [String] -> [String]
rot13 (x:xs)| not(isLetter x) = x : rot13 xs
            | otherwise = intLetra (mod (letraInt x + k) 26)

main :: IO()
main = do
    x <- getContents
    print(map rot13 x)