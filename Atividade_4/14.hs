mdc :: Int -> Int -> Int
mdc a b | (b == 0) = a
mdc a b | otherwise = mdc b (a `mod` b)

ehCoprimo :: Int -> Int -> Bool
ehCoprimo x y = mdc x y == 1

main :: IO()
main = do
    x <- readLn :: IO Int
    y <- readLn :: IO Int
    
    print (ehCoprimo x y) 