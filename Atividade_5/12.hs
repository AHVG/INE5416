apagar :: Int -> [t] -> [t]
apagar _ [] = []
apagar n x | (n == 0) = x
apagar n (x:resto) = apagar (n - 1) resto

main = do
    print (apagar 3 [1,2,3,4,5,6,7])

