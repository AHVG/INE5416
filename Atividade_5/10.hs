filtrar :: (t -> Bool) -> [t] -> [t]
filtrar _ [] = []
filtrar f (x:resto) | (f x == True) = x : filtrar f resto
filtrar f (x:resto) | otherwise = filtrar f resto

main = do
    print (filtrar (\x -> x > 10) [1,2,3, 10, 11, 12, -8, -5, 100, 20])
