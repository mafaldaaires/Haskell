{-
Enunciado:
Exemplo maior: um jogo de adivinha
-> o computador escolhe um número secreto entre 1 e 1000 
-> o jogador vai fazer tentativas de advinhar
-> para cada tentativa o computador diz se é alto ou baixo 
-> a pontuação final é o número de tentativas

Decompor em duas partes:
main: escolhe o número secreto e inicia o jogo
jogo: função recursiva que executa a sequência de perguntas e respostas do jogo

-}
--Função main:
module Main where

-- biblioteca para números pseudo-aleatórios
import System.Random (randomRIO)

-- ponto de entrada do programa
main :: IO ()
main = do
    num <- randomRIO (1,1000)  -- escolher um número
    jogo num 1                 -- começar o jogo; contagem = 1


--Função jogo:
-- função para interações do jogo
jogo :: Int -> Int -> IO ()
jogo num cont  = do
-- argumentos: número secreto e contador de tentativas
    putStrLn "Tentativa? "
    str <- getLine
    let tent = read str  -- converte String -> Int
        if tent>num then
            do putStrLn "Demasiado alto!"
                jogo num (cont+1)
        else if tent<num then
            do putStrLn "Demasiado baixo!"
                jogo num (cont+1)
        else do putStr "Acertou em "
            putStrLn (show cont ++ " tentativas")