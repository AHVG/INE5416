mdc :: Int -> Int -> Int
mdc a b | (b == 0) = a
mdc a b | otherwise = mdc b (a `mod` b)

mmc :: Int -> Int -> Int
mmc x y = div (x * y) (mdc x y)

ehDivisivel :: Int -> Int -> Bool
ehDivisivel x y | (mmc x y == x) = True
ehDivisivel x y | otherwise = False

main :: IO()
main = do
    x <- readLn :: IO Int
    y <- readLn :: IO Int
    
    print (ehDivisivel x y) 
