fi :: Int -> Int
fi n | (n == 1 || n == 2) = 1
fi n | otherwise = (fi (n - 1) + fi (n - 2))

main = do
    strTermo <- getLine
    let termo = (read strTermo :: Int)
    print (fi termo)