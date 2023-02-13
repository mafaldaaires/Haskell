module Stack (Stack,
              empty,
              isEmpty,
              pop,
              push,
              top
             ) where

data Stack a = Stk [a]

empty :: Stack a
empty = Stk []

push :: a -> Stack a -> Stack a
push x (Stk xs) = Stk (x:xs)

pop :: Stack a -> Stack a
pop (Stk (x:xs)) =  Stk xs
pop _  = error "Stack.pop: empty stack"

top :: Stack a -> a
top (Stk (x:xs)) = x
top _  = error "Stack.top: empty stack"

isEmpty :: Stack a -> Bool
isEmpty (Stk []) = True
isEmpty _        = False
{-
--8.1
--import Stack

parentAux :: String -> Stack Char -> Bool
parentAux [] stk = isEmpty stk
parentAux (x:xs) stk
    | x == '(' = parentAux xs (push '(' stk)
    | x == ')' = not(isEmpty stk) && top stk == '(' && parentAux xs (pop stk)
    | x == '[' = parentAux xs (push '[' stk)
    | x == ']' = not(isEmpty stk) && top stk == '[' && parentAux xs (pop stk)
    | x == '{' = parentAux xs (push '{' stk)
    | x == '}' = not(isEmpty stk) && top stk == '{' && parentAux xs (pop stk)
    | otherwise = parentAux xs stk

parent :: [Char] -> Bool
parent str = parentAux str empty
-}
--8.2
--import Stack

calcularAux :: [String] -> Stack Integer -> Integer
calcularAux [] stk = top stk
calcularAux (x:xs) stk
    | x == "*" = calcularAux xs (push(n1*n2) stk2)
    | x == "-" = calcularAux xs (push(n1-n2) stk2)
    | x == "+" = calcularAux xs (push(n1+n2) stk2)
    | x == "/" = calcularAux xs (push(div n1 n2) stk2)
    | otherwise = calcularAux xs (push (read x) stk2)
    where   
        n1 = top(pop stk)
        n2 = top stk
        stk2 = pop(pop stk)


calcular :: String -> Integer
calcular "0" = 0
calcular str = calcularAux (words str) empty