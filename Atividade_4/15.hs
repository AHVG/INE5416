mdc :: Int -> Int -> Int
mdc a b | (b == 0) = a
mdc a b | otherwise = mdc b (a `mod` b)

ehCoprimo :: Int -> Int -> Bool
ehCoprimo x y = mdc x y == 1

totienteEuler :: Int -> Int -> Int
totienteEuler n i | (i == 1) = 1
totienteEuler n i | (ehCoprimo n i) = 1 + totienteEuler n (i - 1)
totienteEuler n i | otherwise = totienteEuler n (i - 1)

totienteEulerInterface :: Int -> Int
totienteEulerInterface n | (n <= 1) = 0
totienteEulerInterface n | otherwise = totienteEuler n (n - 1)

main :: IO()
main = do
    n <- readLn :: IO Int
    
    print (totienteEulerInterface n) 