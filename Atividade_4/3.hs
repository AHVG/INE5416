area :: Float -> Float -> Float
area b a = (b * a) / 2.0


main = do
    strBase <- getLine
    let base = (read strBase :: Float)
    strAltura <- getLine
    let altura = (read strAltura :: Float)
    print (area base altura)