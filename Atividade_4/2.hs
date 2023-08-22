absoluto :: Int -> Int
absoluto x | (x >= 0) = x
           | otherwise = -x

main = do
    print (absoluto 10)
    print (absoluto (-10))