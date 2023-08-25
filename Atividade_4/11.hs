mdc :: Int -> Int -> Int
mdc a b | (b == 0) = a
mdc a b | otherwise = mdc b (a `mod` b)


main :: IO()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO Int
    print (mdc a b) 