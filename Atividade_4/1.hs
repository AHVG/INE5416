potencia :: Int -> Int -> Int
potencia x y = x^y

main = do
    strNum <- getLine
    let n1 = (read strNum :: Int)
    strNum <- getLine
    let n2 = (read strNum :: Int)
    print (potencia n1 n2)