{-
2.1
classifica :: Int -> String
classifica a    | (a <= 9) = "reprovado"
                | (a >= 10 && a <= 12) = "suficiente"
                | (a >= 13 && a <= 15) = "bom"
                | (a >= 16 && a <= 18) = "muito bom"
                | (a >= 19 && a <= 20) = "muito bom com distinção"

classifica :: Int -> String
classifica a = if a <= 9 then "reprovado" else
                if (a <=12) then "suficiente" else
                    if (a <= 15) then "bom" else
                        if (a <= 18) then "muito bom" else "muito bom com distinção"

2.2
classifica :: Float -> Float -> String
classifica peso altura  | massa < 18.5 = "baixo peso"
                        | massa >= 18.5 && massa < 25 = "peso normal"
                        | massa >= 25 && massa < 30 = "excesso de peso"
                        | massa >= 30 = "obsesidade"
                            where massa = peso / altura^2
2.3
a)
max3 :: Int -> Int -> Int -> Int
max3 a b c  | (a >= b) && (a >= c) = a
            | (b >= c) && (b > a) = b
            | (c > a) && (c > b) = c

min3 :: Int -> Int -> Int -> Int
min3 a b c  | (a <= b) && (a <= c) = a
            | (b <= c) && (b < a) = b
            | (c < a) && (c < b) = c
b)
max3 :: Int -> Int -> Int -> Int
max3 a b c = if (a >= max b c) then a else max b c

min3 :: Int -> Int -> Int -> Int
min3 a b c = if (a <= min b c) then a else min b c

2.4
xor' :: Bool -> Bool -> Bool
xor' False True = True
xor' True False = True
xor' _ _ = False

2.5
c/padrões
safetail :: [a] -> [a]
safetail [] = []
safetail xs = tail xs

c/equações com guardas
safetail :: [a] -> [a]
safetail xs | length xs == 0 = []
            | otherwise = tail xs

c/condicionais
safetail :: [a] -> [a]
safetail xs = if (length xs == 0) then [] else tail xs

2.6
a)
curta :: [a] -> Bool
curta xs    | length xs == 0 = True
            | length xs == 1 = True
            | length xs == 2 = True
            | otherwise = False

b)
curta :: [a] -> Bool
curta [] = True
curta [_] = True
curta [_,_] = True
curta _ = False

2.7
a)
mediana :: Int -> Int -> Int -> Int
mediana a b c   | a >= b && b >= c || c >= b && b >= a = b
                | a >= c && c >= b || b >= c && c >= a = c
                | c >= a && a >= b || b >= a && a >= c = a

b)
max3 :: Int -> Int -> Int -> Int
max3 a b c = if (a >= max b c) then a else max b c

min3 :: Int -> Int -> Int -> Int
min3 a b c = if (a <= min b c) then a else min b c

mediana :: Int -> Int -> Int -> Int
mediana a b c = (a+b+c) - max3 a b c - min3 a b c

Tipo mais geral: Int
-}