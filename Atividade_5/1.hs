somarElementos :: Num a => [a] -> a 
somarElementos [] = 0
somarElementos (x:resto) = x + somarElementos resto

main = do
    print ( somarElementos [1, 2, 3, 4, 5, 6, 7] ) 


