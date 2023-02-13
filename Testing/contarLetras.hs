contarLetras :: String -> Int
contarLetras txt = length [c | c<-txt, c>='A' && c<='Z']  
-- No terminal, e importante escrever a palavra (txt) em maiusculas.
-- Caso queiramos contar as letras da palavra com minusculas, no programa modificamos (length [c | c<-txt, c>='a' && c<='Z'] )
-- Caso queiramos contar as letras da palavra com maiusculas e minusculas (em qualquer lugar da palavra), no programa modificamos (length [c | c<-txt, c>='A' && c<='z'] )