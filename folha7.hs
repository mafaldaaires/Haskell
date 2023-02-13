--7.1
import Data.List (nub)
data Prop =     Const Bool
                | Var Char
                | Neg Prop
                | Conj Prop Prop
                | Disj Prop Prop 
                | Impl Prop Prop
                deriving(Eq, Show)

type Assoc k v = [(k,v)]

type Atrib = Assoc Char Bool

find :: Eq k => k -> Assoc k v -> v
find k assocs = head [v | (k',v)<-assocs, k == k']

--valor lógico entre Atrib e Prop
valor :: Atrib -> Prop -> Bool
valor s (Const b) = b
valor s (Var x) = find x s
valor s (Neg n) = not(valor s n)
valor s (Conj x k) = valor s x && valor s k
valor s (Disj x n) = valor s x || valor s n
valor s (Impl m n) = not (valor s m) || valor s n

--tabela de verdade
bits :: Int -> [[Bool]]
bits 0 = [[]]
bits n = [b : bs | bs <- bits(n-1), b <-[False,True]]

--Junto os argumentos da função Prop numa lista
vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x) = [x]
vars (Neg p) = vars p
vars(Conj p q) = vars p ++ vars q
vars (Disj p q) = vars p ++ vars q
vars (Impl p q) = vars p ++ vars q

atribs :: Prop -> [Atrib]
atribs p = map (zip vs) (bits (length vs))
     where vs = nub (vars p)

--atribs (Conj (Var 'a') (Var 'b'))
--[[('a',False),('b',False)],[('a',True),('b',False)],[('a',False),('b',True)],[('a',True),('b',True)]]

tautologia :: Prop -> Bool
tautologia p = and[valor s p | s <- atribs p]

satisfaz :: Prop -> Bool
satisfaz p = or[valor s p | s <- atribs p]

import Data.Char(~)
data Prop =     Const Bool
                | Var Char
                | Neg Prop
                | Conj Prop Prop
                | Disj Prop Prop 
                | Impl Prop Prop
                deriving(Eq, Show)

showProp :: Prop -> String
showProp p  |p == Const Bool = show(Bool)
            |p == Var Char = show(Char)
            |p == Neg Prop = show(~(Prop))
            |p == Conj Prop Prop = show(Prop && Prop)
            |p == Disj Prop Prop = show(Prop || Prop)
            |p == Impl Prop Prop = show((~(Prop))&&(Prop))
