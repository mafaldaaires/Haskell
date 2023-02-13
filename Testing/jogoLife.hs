import Data.Char
import Data.List

type Pos = (Int,Int) -- coluna, linha
type Cells = [Pos] -- lista de coordenadas

width, height :: Int
width = 80
height = 24

isAlive, isEmpty :: Cells -> Pos -> Bool
isAlive xs x = elem x xs    
-- elem verifica se p existe em ps : se existir é True, se não existir é False
isEmpty ps p = not (isAlive ps p)  
-- isEmpty é a negação de isAlive

--obter as 8 posições vizinhas de (x,y)
neighbs :: Pos -> [Pos]
neighbs (x,y)  =  map wrap [(x-1,y-1), (x,y-1),
                            (x+1,y-1), (x-1,y),
                            (x+1,y)  , (x-1,y+1),
                            (x,y+1)  , (x+1,y+1)]

--wrap verifica se a posição está dentro das coordenadas
wrap :: Pos -> Pos
wrap (x,y) =  ((x-1) `mod` width + 1,
               (y-1) `mod` height + 1)
               
-- contar (length) as células vivas (filter (isAlive ps) neighbs) entre as posições vizinhas de uma coordenada
liveneighbs :: Cells -> Pos -> Int
liveneighbs xs = length . filter (isAlive xs) . neighbs

-- nova geração depende apenas da geração atual
-- nova geração são as sobreviventes e os nascimentos
nextgen :: Cells -> Cells
nextgen xs = survivors xs ++ births xs

-- as células com 2 ou 3 vizinhos
survivors :: Cells -> Cells
survivors xs = [x | x<-xs, elem (liveneighbs xs x) [2,3]]

-- nascem novas células
-- nas posições vazias com 3 vizinhos
births :: Cells -> Cells
births xs =  [x | x <-      nub (concat (map neighbs xs)),
{-nas posições vazias-}     isEmpty xs x,
{-com 3 vizinhos vivos-}    liveneighbs xs x == 3]

