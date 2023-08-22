ehTriangulo :: Float -> Float -> Float -> Bool
ehTriangulo a b c | (a + b > c && a + c > b && c + b > a) = True
ehTriangulo a b c | otherwise = False

main = do
    strLado <- getLine
    let l1 = (read strLado :: Float)
    strLado <- getLine
    let l2 = (read strLado :: Float)
    strLado <- getLine
    let l3 = (read strLado :: Float)
    print (ehTriangulo l1 l2 l3)