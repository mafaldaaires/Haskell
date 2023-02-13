{-
5.1
divisores n = filter (\d -> mod n d == 0) [1..n]

5.3
a)
Nota que
f [] = Z
f (x:xs) = x ⊕ f xs

mysum :: [a] -> [a] -> [a]
mysum xs ys = foldr (:) ys xs

> mysum [3,4,5] [1,2]
foldr (:) [1,2] [3,4,5]      (Z = [1,2])
foldr [1,2] (3:4:5:[])
foldr (3:4:5:[1,2])
[3,4,5,1,2]

5.4
fromBits :: [Int] -> Int
fromBits (x:xs) = foldl (+) 0 list
        where
            f1 :: [Int] -> [Int]
            f1 [] = []
            f1 (x:xs) = x*(2^(length xs)) : (f1 xs)
            list = f1 (x:xs)

5.5
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c] 
zipWith' f xs ys = [f x y | (x, y) <- zip xs ys]

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f [] [] = []
zipWith f xs [] = xs
zipWith f [] ys = ys
zipWith f (x:xs) (y:ys) 

5.6
isort :: Ord a => [a] -> [a]
isort (x:xs) = foldr insert [] (x:xs)
    where 
        insert :: Ord a => a -> [a] -> [a]
        insert n [] = [n]
        insert n (x:xs) | n <= x = (n:x:xs)
                        | n > x = (x: insert n xs)

> isort [4,6,1,2,5,9]
insert 4:(insert 6:(insert 1:(insert 2:(insert 5:(insert 9:([]))))))
(4:(insert 6:(insert 1:(insert 2:(insert 5:(insert 9:([]))))))
(1:2:4:5:6:(insert 9:([])))
(1:2:4:5:6:9:[])
[1,2,3,5,6,9]

5.9

-}
{-
aproxPi1 :: []
aproxPi1 :: cycle (num)
    num = cycle [4,-4]
    denom = primos (nat)
        where
-}
            naturais :: [Integer]
            naturais = [1..]

            primos :: [Integer]
            primos (naturais) = [x | x<-naturais, x`mod`n ==0, n <- [1,x]]
