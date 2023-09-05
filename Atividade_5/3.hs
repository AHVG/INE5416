
menor :: [Int] -> Int -> Int
menor x y | (x == []) = y
menor (x:resto) y | (x > y) = menor resto y
menor (x:resto) y | otherwise = menor resto x 

interfaceMenor :: [Int] -> Int
interfaceMenor x | (x == []) = 0
interfaceMenor (x:resto) | otherwise = menor resto x

main = do
    print ( interfaceMenor [])
    print ( interfaceMenor [1, 2, 4, 6, 7] )
    print ( interfaceMenor [6, 4, 2, -1] )

