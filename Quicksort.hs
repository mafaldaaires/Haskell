{-
Quicksort
O algoritmo Quicksort para ordenação de uma lista pode ser especificado de forma recursiva.
LISTA É VAZIA: já está ordenada
LISTA NÃO É VAZIA: seja x o primeiro valor e xs os restantes
                        1. ordenamos os valores de xs que são menores ou iguais a x
                        2. ordenamos os valores de xs que são maiores do que x
                        3. concatenamos os resultados com x no meio
-}

qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = qsort menores ++ [x] ++ qsort maiores
        where   menores = [y | y <- xs, y <= x]
                maiores = [y | y <- xs, y > x]
        