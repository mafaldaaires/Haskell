--9.12

--Caso Base
t = Folha

Vamos provar listarAcc Folha xs = listar Folha ++ xs 

listarAcc Folha xs =
= listar Folha ++ xs 
{listar Folha = []}
= [] ++ xs 
= xs

--Caso Indutivo
Hipotese de Indução...
listarAcc esq xs = listar esq ++ xs 
listarAcc dir ys = listar dir ++ ys

Tese...
listarAcc (No x esq dir) xs = listar (No x esq dir) ++ xs

listarAcc (No x esq dir) xs=
= listar (No x esq dir) ++ xs 
{listar (No x esq dir) == listar esq ++ [x] ++ listar dir}
= (listar esq ++ [x] ++ listar dir) ++ xs
= listar (No x esq dir) ++ xs


listarAcc :: Arv a -> [a] -> [a]
listarAcc [] xs = xs 
listarAcc (No x esq dir) xs = listarAcc esq ([x] : listarAcc dir xs)