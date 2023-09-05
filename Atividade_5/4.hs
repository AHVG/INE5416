
menor :: [Int] -> Int -> Int
menor x y | (x == []) = y
menor (x:resto) y | (x > y) = menor resto y
menor (x:resto) y | otherwise = menor resto x 

interfaceMenor :: [Int] -> Int
interfaceMenor x | (x == []) = 0
interfaceMenor (x:resto) | otherwise = menor resto x

maior :: [Int] -> Int -> Int
maior x y | (x == []) = y
maior (x:resto) y | (x > y) = maior resto x
maior (x:resto) y | otherwise = maior resto y


interfaceMaior :: [Int] -> Int
interfaceMaior x | (x == []) = 0
interfaceMaior (x:resto) | otherwise = maior resto x

diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor x = interfaceMaior x - interfaceMenor x

main = do
    print ( diferencaMaiorMenor [1, 2, 3, 4, 5, 8, 2, -1] )
