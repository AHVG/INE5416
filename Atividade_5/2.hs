

soma :: Num a => [a] -> a 
soma [] = 0
soma (x:resto) = x + soma resto

tamanho :: [Int] -> Int
tamanho [] = 0
tamanho (x:resto) = 1 + tamanho resto

media :: [Int] -> Float
media x | (x == []) = 0.0
media x | otherwise = fromIntegral (soma x) / fromIntegral (tamanho x)

main = do
    print (media [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] )
