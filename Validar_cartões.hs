passaLista :: Integer -> [Integer]
passaLista 0 = []
passaLista x = passaLista (div x 10) ++ [x`mod`10]

duplica :: [Integer] -> [Integer]
duplica [] = []
duplica (x:y:xs) | length (x:y:xs) `mod` 2 == 0 = (x*2: y: duplica xs)
duplica (x:y:z:xs) = (x: y*2: z: duplica xs)
                

somaAlg :: [Integer] -> Integer 
somaAlg [] = 0
somaAlg (x:xs) | (x>9) = ((x`div`10) + (x`mod`10) + somaAlg(xs))
               | (x<=9) = x + somaAlg(xs)

validar :: Integer -> Bool 
validar x | (somaAlg(duplica(passaLista x))) `mod` 10 == 0 = True 
          | otherwise = False

