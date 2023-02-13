--foldr
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z []     = z
foldr f z (x:xs) = f x (foldr f z xs)

--exemplo
sum [1,2,3,4] =
    = foldr (+) 0 [1,2,3,4]
    = foldr (+) 0 (1:(2:(3:(4:[]))))
    = 1+(2+(3+(4+0)))
    = 10

--foldl
foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f z []     = z
foldl f z (x:xs) = foldl f (f z x) xs

--relação entre foldr e foldl
--Se f for associativa e z for o elemento neutro, entao foldr f z e foldl f z dão o mesmo resultado
foldl (+) 0 [1,2,3,4] =
    = (((0+1)+2)+3)+4 
    = 10
foldr (+) 0 [1,2,3,4] =
    = 1+(2+(3+(4+0)))
    = 10