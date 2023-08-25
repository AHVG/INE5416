mdc :: Int -> Int -> Int
mdc a b | (b == 0) = a
mdc a b | otherwise = mdc b (a `mod` b)

mmc :: Int -> Int -> Int
mmc x y | (mdc x y == 1) = x * y
mmc x y | otherwise = (mdc x y) * (mmc (div x (mdc x y)) (div y (mdc x y)))

mmcOtimizado :: Int -> Int -> Int
mmcOtimizado x y = div (x * y) (mdc x y)

main :: IO()
main = do
    x <- readLn :: IO Int
    y <- readLn :: IO Int
    
    print (mmcOtimizado x y) 