myconcat :: [[a]] -> [a]
myconcat listas = [valor | lista <- listas, valor <- lista]