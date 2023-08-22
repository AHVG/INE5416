maior :: Int -> Int -> Int -> Int
maior a b c | (a >= b && a >= c) = a
maior a b c | (b >= c) = b
maior a b c | otherwise = c

main :: IO()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO Int
    c <- readLn :: IO Int

    print( maior a b c )