type Rainhas = [Int]

ataque :: (Int,Int) -> (Int,Int) -> Bool
ataque (x,y) (x',y')
    = -- x==x'        -- sempre False (Programa vai gerar uma só rainha por coluna)
      y==y' ||        -- linha igual
      x-y == x'-y' || -- diagonal 1 igual
      x+y == x'+y'    -- diagonal 2 igual

rainhas :: Int -> [Rainhas]
rainhas 0 = [[]]
rainhas n | n > 0 = [ ys ++ [y] | ys<-rainhas (n-1), y<-[1..8], y`valida`ys]

valida :: Int -> Rainhas -> Bool
valida y ys = all (not . ataque (x,y)) (zip [1..] ys)
    where 
        x = 1+length ys     -- coluna da nova rainha