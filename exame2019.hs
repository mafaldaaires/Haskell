--1)
--a) [[1,2],[],[3,4],[5]]
--b) [5] (lista final : [[1,2],[3,4],[5]])
--c) 2
--d) [16,20,24,28,32]
--e) x<-[1,2,3,4], y<-[2,3,4]
--[(3,2),(5,6),(7,12)]..
--f) [[2,8],[4,6],[]]
--g) [(x,y)| (x,y) <- zip [0..6] [6..0]]
[(x,y)| x <- [0..6], y <- [6..0]]
--h) 1*3 + 3*1 + 1*5 + 5*0 + 0*4 + 4 = 15..
--i) [(Char, String)]
--j) f :: Eq a => [a] -> a..
--k) ig :: Eq a => [a] -> Bool
--l) fix :: Eq a => [a] -> [a]..



--2)
--a)
pitagoricos :: Int -> Int -> Int -> Bool 
pitagoricos a b c | (a*a)+(b*b) == (c*c) = True 
                  | otherwise = False

--b)
hipotenusa :: Float -> Float -> Float 
hipotenusa a b = sqrt((a*a) + (b*b))

--3)
--a)
diferentes1 :: Eq a => [a] -> [a]
diferentes1 [] = []
diferentes1 [x] = []
diferentes1 (x:y:ys) | x == y = diferentes1 (y:ys)
                     | otherwise = x: diferentes1 (y:ys)

--b)
diferentes2 :: Eq a => [a] -> [a]
diferentes2 (x:xs) = [x | (x,y) <- zip xs (tail xs), x/=y]

--4)
zip3' :: [a] -> [b] -> [c] -> [(a,b,c)]
zip3' a b c = [(x,y,z) | (x,(y,z)) <- zip a(zip b c)]

--5)
partir :: Eq a => a -> [a] -> ([a],[a])
partir _ [] = ([],[])
partir x (y:ys) | x == y = ([],y:ys)
                | otherwise = (y:ys1, ys2)
                where (ys1, ys2) = partir x ys
