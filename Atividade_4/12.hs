mdc :: Int -> Int -> Int -> Int
mdc a b c | (b == 0 && c == 0) = a
mdc a b c | (c == 0) = mdc b (a `mod` b) 0
mdc a b c | otherwise = mdc a c (b `mod` c)


main :: IO()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO Int
    c <- readLn :: IO Int
    
    print (mdc a b c) 