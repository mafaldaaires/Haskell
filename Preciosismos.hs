dialogo :: Int -> Int -> Int -> Int -> (String, String)
dialogo h1 m1 h2 m2 | (minuto == 1)          = ("Passou apenas " ++ show(minuto) ++ " minuto!"  ,"De facto!")
                    | (minuto < 59)          = ("Passaram apenas " ++ show(minuto) ++ " minutos!" ,"De facto!" )
                    | (minuto == 60)         = ("Passaram apenas " ++ show(minuto) ++ " minutos!" ,"Queres dizer, " ++ show(h) ++ (" hora?!"))
                    | (minuto == 61)         = ("Passaram apenas " ++ show (minuto) ++ " minutos!" ,"Queres dizer, " ++ show(h) ++ " hora e " ++ show(min) ++ " minuto?!")
                    | (h == 1) && (m > 1)    = ("Passaram apenas " ++ show (minuto) ++ " minutos!" ,"Queres dizer, " ++ show(h) ++ " hora e " ++ show(min) ++ " minutos?!")
                    | (m == 0) && (h > 1)    = ("Passaram apenas " ++ show (minuto) ++ " minutos!" ,"Queres dizer, " ++ show(h) ++ " horas?!")
                    | (min == 1) and (h > 1) = ("Passaram apenas " ++ show (minuto) ++ " minutos!" ,"Queres dizer, " ++ show(h) ++ " horas e " ++ show(min) ++ " minuto?!")
                    | (min > 1) and (h > 1)  = ("Passaram apenas " ++ show (minuto) ++ " minutos!" ,"Queres dizer, " ++ show(h) ++ " horas e " ++ show(min) ++ " minutos?!")

    where
        minuto = (60*h2-m2) - (60*h1+m1)
        h = div minuto 60
        min = mod minuto 60