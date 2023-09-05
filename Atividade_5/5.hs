busca :: [Int] -> Int -> Bool
busca x _ | (x == []) = False
busca (x:_) y | (x == y) = True
busca (x:resto) y | otherwise = busca resto y

main = do
    print ( busca [1, 2, 3, 4, 5] 4 )
    print ( busca [6, -10, 29, 100] 1 )
    print ( busca [] 10 )

