inverte :: [t] -> [t]
inverte [] = []
inverte (x:resto) | otherwise = inverte resto ++ [x] 

main = do
    print (inverte [1,2,3,4,5,6,7,8,9,10])
