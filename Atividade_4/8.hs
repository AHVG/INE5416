delta :: Float -> Float -> Float -> Float
delta a b c = b^2 - 4.0 * a * c

baskhara :: Float -> Float -> Float -> Maybe (Float, Float)
baskhara x y z | (delta x y z >= 0) = Just(((-y) + sqrt (delta x y z)) / 2 * x, ((-y) - sqrt (delta x y z)) / 2 * x)
baskhara x y z | otherwise = Nothing

main :: IO ()
main = do
    a <- readLn :: IO Float
    b <- readLn :: IO Float
    c <- readLn :: IO Float
    
    case baskhara a b c of
        Just (x1, x2) -> do
            putStrLn ("x1: " ++ show x1)
            putStrLn ("x2: " ++ show x2)
        Nothing ->
            putStrLn "Delta < 0"