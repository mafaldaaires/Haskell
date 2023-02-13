{-
1.1
a. incr (triplo 3) = incr (3*3) = incr 9 = 9 + 1 = 10
c. boasVindas "Linguagem" ++ "Haskell" = "Olá, " ++ "Linguagem" ++ "!" ++ "Haskell"
                                       = "Olá, Linguagem!" ++ "Haskell"
                                       = "Olá, Linguagem!Haskell"
d. boasVindas ("Linguagem" ++ "Haskell") = "Olá, " ++ ("Linguagem" ++ "Haskell") ++ "!"
                                         = "Olá, Linguagem Haskell!"
e. boasVindas (boasVindas "Haskell") = boasVindas ("Olá, " ++ "Haskell" ++ "!")
                                     = boasVindas ("Olá, Haskell!")
                                     = "Olá, " ++ "Olá, Haskell!" ++ "!"
                                     = "Olá, Olá, Haskell!!"

1.2
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c    |(a < b+c) && (b < a+c) && (c < a+b) = True
                        |otherwise = False

1.3
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt (s*(s-a)*(s-b)*(s-c))
                where s = (a+b+c)/2

1.4
metades :: [a] -> ([a],[a])
metades xs = (take b xs, drop b xs)
        where b = length xs `div` 2

1.5
a)
last [a] -> a
last xs = reverse (head xs)
last xs = reverse (take (length xs - 1) xs)

b)
init = reverse (tail xs)
init = take (length xs - 1) xs

1.6
a)
binom :: Integer -> Integer -> Integer
binom n k = (product [1..n]) `div` (product [1..k] * product [1..n-k])

b)
binom' :: Integer -> Integer -> Integer
binom' n k  | (k < n-k) = product [(n-k+1)..n] `div` product [1..k]
            | (k >= n-k) = product [(k+1)..n] `div` product [1..(n-k)]
-}