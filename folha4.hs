{-
4.1
algarismos :: Int -> [Int]
algarismos x = reverse (algarismosRev x)

algarismosRev :: Int -> [Int] 
algarismosRev 0 = [] --condição necessária para terminar o "ciclo"
algarismosRev x = x`mod`10 : algarismosRev (x`div`10)

4.2
toBits :: Int -> [Int]
toBits n = reverse (toBitsRev n)

toBitsRev :: Int -> [Int]
toBitsRev 0 = []
toBitsRev n = n`mod`2 : toBitsRev (n`div`2)

4.3
fromBits :: [Int] -> Int
fromBits [] = 0
fromBits (x:xs) = x*2^(length xs) + fromBits xs

4.4
mdc :: (Integer, Integer) -> Integer
mdc (a,b)   | b == 0 = a
            | otherwise = mdc (b,a`mod`b)

                ou  

mdc :: Integer -> Integer -> Integer
mdc a b     | b == 0 = a
            | otherwise = mdc b (a`mod`b)

4.5
a)
insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x:xs) | n <= x = (n:x:xs)
                | n > x = (x: insert n xs)

b)
insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x:xs) | n <= x = (n:x:xs)
                | n > x = (x: insert n xs)

sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = insert x (sort xs)

4.6
a)
minimum :: Ord a => [a] -> a
minimum (x:y:xs)| x <= y = minimum (y:xs)
                | x > y = minimum (x:xs)

b)
delete :: Eq a => a -> [a] -> [a]
delete n [] = []
delete n (x:xs) | x == n = xs
                | otherwise = x:(delete n xs)

c)
minimo :: Ord a => [a] -> a
minimo [x] = x
minimo (x:xs)   | x <= minimo xs = x
                | x > minimo xs = minimo xs

delete :: Eq a => a -> [a] -> [a]
delete n [] = []
delete n (x:xs) | x == n = xs
                | otherwise = x:(delete n xs)

ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort xs = (minimo xs : ssort(delete (minimo xs) xs))

4.7
a)
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y = x : (merge xs (y:ys))
                    | x > y = y : (merge (x:xs) ys)

b)
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y = x : (merge xs (y:ys))
                    | x > y = y : (merge (x:xs) ys)

metades :: [a] -> ([a],[a])
metades xs = (take n xs, drop n xs)
        where 
            n = length xs `div` 2

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort (metade1 xs)) (msort (metade2 xs))
    where
        tamanho = length xs `div` 2
        metade1 xs = take tamanho xs
        metade2 xs = drop tamanho xs

4.8
a)
addPolly :: [Int] -> [Int] -> [Int]
addPolly [] [] = []
addPolly xs [] = xs
addPolly [] ys = ys
addPolly (x:xs) (y:ys) = (x+y):addPolly xs ys

b)
addPolly :: [Int] -> [Int] -> [Int]
addPolly [] [] = []
addPolly xs [] = xs
addPolly [] ys = ys
addPolly (x:xs) (y:ys) = (x+y):addPolly xs ys

multPoly :: [Int] -> [Int] -> [Int]
multPoly [] [] = []
multPoly [] ys = []
multPoly xs [] = []
multPoly (x:xs) (y:ys) = x*y: restantes
    where
        restantes = addPolly (addPolly resto1 resto2) resto3
        resto1 = [x*p | p <- ys]
        resto2 = [y*q | q <- xs]
        resto3 = 0 : multPoly xs ys
-}