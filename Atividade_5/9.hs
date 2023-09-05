mapear :: (t -> y) -> [t] -> [y]
mapear _ [] = []
mapear f (x:resto) = f (x) : mapear f resto

main = do
    print (mapear (\x -> x * 2) [1,2,3,4,5,6,7])
    print (mapear (\x -> x + 10) [-10,0,10,20,30,40])
