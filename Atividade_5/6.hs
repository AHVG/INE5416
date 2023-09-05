ocorrencias :: [Int] -> Int -> Int
ocorrencias x _ | (x == []) = 0
ocorrencias (x:resto) y | (x == y) = 1 + ocorrencias resto y
ocorrencias (x:resto) y | otherwise = ocorrencias resto y

main = do
    print ( ocorrencias [1,2,3,4,1,6,7,1,10] 1 )

